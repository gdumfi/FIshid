from flask import Flask, jsonify, request, redirect, url_for, render_template, session
import requests
import logging

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'

API_URL = "http://django-server:8000/api/"

logging.basicConfig(level=logging.DEBUG)

def handle_error(response):
    logging.error(f"Error response: {response.text}")
    return jsonify({"error": response.text}), response.status_code

def is_admin():
    return session.get('role') == 'admin'

@app.route('/')
def index():
    if 'token' not in session:
        return redirect(url_for('login'))
    if is_admin():
        return render_template('index.html')
    else:
        return redirect(url_for('handle_reports'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        response = requests.post(f"{API_URL}token/", json={"username": username, "password": password})

        if response.ok:
            token = response.json().get('access')
            session['token'] = token
            session['username'] = username

            user_info_response = requests.get(f"{API_URL}user_info/", headers={'Authorization': f'Bearer {token}'})
            if user_info_response.ok:
                user_info = user_info_response.json()
                session['role'] = user_info.get('role', 'user')

            return redirect(url_for('handle_reports' if not is_admin() else 'index'))
        else:
            logging.error(f"Login failed: {response.text}")
            return render_template('login.html', error="Login failed")
    return render_template('login.html')

@app.route('/reports', methods=['GET', 'POST'])
def handle_reports():
    if 'token' not in session:
        return redirect(url_for('login'))
    
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}
    
    if request.method == 'POST':
        report_data = request.get_json()

        if not report_data:
            return jsonify({"error": "No data provided"}), 400
        
        response = requests.post(f"{API_URL}reports/", json=report_data, headers=headers)
        
        if response.ok:
            return jsonify({"success": True}), 200
        else:
            logging.error(f"Failed to create report: {response.text}")
            return jsonify({"error": "Failed to create report", "response": response.text}), response.status_code
    
    response = requests.get(f"{API_URL}reports/", headers=headers)
    if response.ok:
        fishermen_response = requests.get(f"{API_URL}fishermen/", headers=headers)
        captains_response = requests.get(f"{API_URL}captains/", headers=headers)
        ships_response = requests.get(f"{API_URL}ships/", headers=headers)
        fish_response = requests.get(f"{API_URL}fish/", headers=headers)
        weather_conditions_response = requests.get(f"{API_URL}weather_conditions/", headers=headers)

        fishermen = fishermen_response.json() if fishermen_response.ok else []
        captains = captains_response.json() if captains_response.ok else []
        ships = ships_response.json() if ships_response.ok else []
        fish = fish_response.json() if fish_response.ok else []
        weather_conditions = weather_conditions_response.json() if weather_conditions_response.ok else []

        if is_admin():
            return render_template('create_report_admin.html', 
                                   reports=response.json(), 
                                   fishermen=fishermen, 
                                   captains=captains, 
                                   ships=ships, 
                                   fish=fish, 
                                   weather_conditions=weather_conditions)
        else:
            return render_template('create_report_user.html', 
                                   reports=response.json(), 
                                   fishermen=fishermen, 
                                   captains=captains, 
                                   ships=ships, 
                                   fish=fish, 
                                   weather_conditions=weather_conditions)
    else:
        return handle_error(response)

@app.route('/report/edit/<int:report_id>', methods=['GET', 'POST'])
def edit_report(report_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    # Получаем информацию об отчете по ID
    report_response = requests.get(f"{API_URL}reports/{report_id}/", headers=headers)

    if report_response.ok:
        report_data = report_response.json()

        if request.method == 'POST':
            # Обработка обновленных данных отчета
            updated_report_data = {
                "captain": request.form['captain'],
                "fishermen": request.form.getlist('fishermen'),
                "ship": request.form['ship'],
                "fish_catches": [
                    {"fish_id": fish_id, "weight": weight} for fish_id, weight in zip(request.form.getlist('fishes'), request.form.getlist('weights'))
                ],
                "start_date": request.form['start_date'],
                "end_date": request.form['end_date'],
                "weather_conditions": request.form['weather_conditions']
            }

            logging.debug(f"Updated report data: {updated_report_data}")  # Отладочное сообщение

            # Отправляем обновленные данные на сервер
            update_response = requests.put(f"{API_URL}reports/{report_id}/", json=updated_report_data, headers=headers)
            if update_response.ok:
                return redirect(url_for('show_reports'))
            else:
                logging.error(f"Failed to update report: {update_response.text}")  # Логируем ошибку
                return handle_error(update_response)

        # Получаем данные для отображения в форме редактирования
        captains_response = requests.get(f"{API_URL}captains/", headers=headers)
        fishermen_response = requests.get(f"{API_URL}fishermen/", headers=headers)
        ships_response = requests.get(f"{API_URL}ships/", headers=headers)
        weather_conditions_response = requests.get(f"{API_URL}weather_conditions/", headers=headers)
        fish_response = requests.get(f"{API_URL}fish/", headers=headers)

        if all(response.ok for response in [captains_response, fishermen_response, ships_response, weather_conditions_response, fish_response]):
            captains_data = {captain['id']: captain for captain in captains_response.json()['results']}
            fishermen_data = {fisherman['id']: fisherman for fisherman in fishermen_response.json()['results']}
            ships_data = {ship['id']: ship for ship in ships_response.json()['results']}
            weather_conditions_data = {condition['id']: condition for condition in weather_conditions_response.json()['results']}
            fish_data = {fish['id']: fish for fish in fish_response.json()['results']}

            return render_template('edit_report.html', 
                                   report=report_data,
                                   captains=captains_data, 
                                   fishermen=fishermen_data,
                                   ships=ships_data,
                                   weather_conditions=weather_conditions_data,
                                   catches=fish_data)
        else:
            return handle_error(captains_response or fishermen_response or ships_response or weather_conditions_response or fish_response)

    else:
        return handle_error(report_response)

@app.route('/report/delete/<int:report_id>', methods=['POST'])
def delete_report(report_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    response = requests.delete(f"{API_URL}reports/{report_id}/", headers=headers)

    if response.ok:
        return redirect(url_for('show_reports'))
    else:
        logging.error(f"Failed to delete report: {response.text}")
        return handle_error(response)

@app.route('/show_reports', methods=['GET'])
def show_reports():
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'} if token else {}

    response = requests.get(f"{API_URL}reports/", headers=headers)

    if response.ok:
        reports_data = response.json()
        logging.debug(f"Reports data: {reports_data}")

        captains_response = requests.get(f"{API_URL}captains/", headers=headers)
        fishermen_response = requests.get(f"{API_URL}fishermen/", headers=headers)
        ships_response = requests.get(f"{API_URL}ships/", headers=headers)
        weather_conditions_response = requests.get(f"{API_URL}weather_conditions/", headers=headers)
        fish_response = requests.get(f"{API_URL}fish/", headers=headers)

        if (
            captains_response.ok and
            fishermen_response.ok and
            ships_response.ok and
            weather_conditions_response.ok and
            fish_response.ok
        ):
            captains_data = {captain['id']: captain['full_name'] for captain in captains_response.json()['results']}
            fishermen_data = {fisherman['id']: fisherman['full_name'] for fisherman in fishermen_response.json()['results']}
            ships_data = {ship['id']: ship['name'] for ship in ships_response.json()['results']}
            weather_conditions_data = {condition['id']: condition['name'] for condition in weather_conditions_response.json()['results']}
            fish_data = {fish['id']: fish['name'] for fish in fish_response.json()['results']}

            return render_template('show_reports.html', reports=reports_data,
                                   captains=captains_data, 
                                   fishermen=fishermen_data,
                                   ships=ships_data,
                                   weather_conditions=weather_conditions_data,
                                   catches=fish_data)
        else:
            logging.error("Ошибка при получении данных о капитанах, рыбаках, кораблях или условиях погоды.")
            return handle_error(captains_response or fishermen_response or ships_response or weather_conditions_response)

    else:
        logging.error("Ошибка при получении отчетов.")
        return handle_error(response)

@app.route('/report/<int:report_id>', methods=['GET'])
def report_detail(report_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'} if token else {}

    # Получаем детальную информацию об отчете по его ID
    response = requests.get(f"{API_URL}reports/{report_id}/", headers=headers)

    if response.ok:
        report_data = response.json()
        
        # Получаем имена капитана и рыбаков
        captain_name = get_captain_name(report_data['captain'], headers)
        fishermen_names = [get_fisherman_name(fisherman_id, headers) for fisherman_id in report_data['fishermen']]
        ship_name = get_ship_name(report_data['ship'], headers)
        weather_condition_name = get_weather_condition_name(report_data['weather_conditions'], headers)

        # Обработка уловов и подсчет общего веса
        catches = []
        total_weight = 0
        for catch in report_data['fish_catches']:
            fish_name = get_fish_name(catch['fish']['id'], headers)
            catches.append({
                'name': fish_name,
                'weight': catch['weight']
            })
            total_weight += catch['weight']  # Суммируем вес улова

        return render_template('report_detail.html', report=report_data,
                               captain_name=captain_name,
                               fishermen=fishermen_names,
                               ship_name=ship_name,
                               weather_condition=weather_condition_name,
                               catches=catches,
                               total_weight=total_weight)  # Передаем общий вес в шаблон
    else:
        return handle_error(response)

# Функции для получения имен
def get_captain_name(captain_id, headers):
    response = requests.get(f"{API_URL}captains/{captain_id}/", headers=headers)
    return response.json()['full_name'] if response.ok else "Неизвестный капитан"

def get_fisherman_name(fisherman_id, headers):
    response = requests.get(f"{API_URL}fishermen/{fisherman_id}/", headers=headers)
    return response.json()['full_name'] if response.ok else "Неизвестный рыбак"

def get_ship_name(ship_id, headers):
    response = requests.get(f"{API_URL}ships/{ship_id}/", headers=headers)
    return response.json()['name'] if response.ok else "Неизвестный корабль"

def get_weather_condition_name(condition_id, headers):
    response = requests.get(f"{API_URL}weather_conditions/{condition_id}/", headers=headers)
    return response.json()['name'] if response.ok else "Неизвестные условия погоды"

def get_fish_name(fish_id, headers):
    logging.debug(f"Получаем название рыбы с ID: {fish_id}")  # Отладочное сообщение
    response = requests.get(f"{API_URL}fish/{fish_id}/", headers=headers)
    if response.ok:
        return response.json().get('name', "Неизвестная рыба")
    else:
        logging.error(f"Ошибка при получении рыбы: {response.text}")
        return "Неизвестная рыба"

@app.route('/add_captain', methods=['GET', 'POST'])
def add_captain():
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'} if token else {}

    if request.method == 'POST':
        # Создание нового капитана
        captain_data = {
            "full_name": request.form['full_name']
        }
        response = requests.post(f"{API_URL}captains/", json=captain_data, headers=headers)

        if response.ok:
            return redirect(url_for('add_captain'))  # Перенаправление на ту же страницу после добавления
        else:
            return handle_error(response)

    # Получаем список капитанов
    response = requests.get(f"{API_URL}captains/", headers=headers)
    if response.ok:
        return render_template('add_captain.html', captains=response.json())
    else:
        return handle_error(response)

@app.route('/captain/edit/<int:captain_id>', methods=['GET', 'POST'])
def edit_captain(captain_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    if request.method == 'POST':
        captain_data = {
            "full_name": request.form['captain_name']
        }
        response = requests.put(f"{API_URL}captains/{captain_id}/", json=captain_data, headers=headers)

        if response.ok:
            return redirect(url_for('add_captain'))
        else:
            return handle_error(response)

    captain_response = requests.get(f"{API_URL}captains/{captain_id}/", headers=headers)
    if captain_response.ok:
        captain_data = captain_response.json()
        return render_template('edit_captain.html', captain=captain_data)
    else:
        return handle_error(captain_response)

@app.route('/captain/delete/<int:captain_id>', methods=['POST'])
def delete_captain(captain_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    response = requests.delete(f"{API_URL}captains/{captain_id}/", headers=headers)

    if response.ok:
        return redirect(url_for('add_captain'))
    else:
        return handle_error(response)


# Эндпоинт для добавления нового рыбака
@app.route('/add_fisherman', methods=['POST'])
def add_fisherman():
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'} if token else {}

    fisherman_data = {
        "full_name": request.form['full_name']
    }
    response = requests.post(f"{API_URL}fishermen/", json=fisherman_data, headers=headers)

    if response.ok:
        return redirect(url_for('get_fishermen'))
    else:
        return handle_error(response)

# Эндпоинт для получения списка рыбаков
@app.route('/fishermen', methods=['GET', 'POST'])
def get_fishermen():
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'} if token else {}

    if request.method == 'POST':
        # Создание нового рыбака
        fisherman_data = {
            "full_name": request.form['full_name']
        }
        response = requests.post(f"{API_URL}fishermen/", json=fisherman_data, headers=headers)

        if response.ok:
            return redirect(url_for('get_fishermen'))
        else:
            return handle_error(response)

    logging.debug(f"Headers for fishermen request: {headers}")
    response = requests.get(f"{API_URL}fishermen/", headers=headers)
    logging.debug(f"Response from fishermen request: {response.text}")

    # Получение капитанов
    captains_response = requests.get(f"{API_URL}captains/", headers=headers)
    if response.ok and captains_response.ok:
        return render_template('fishermen.html', fishermen=response.json(), captains=captains_response.json())
    else:
        return handle_error(response or captains_response)

# Эндпоинт для редактирования рыбака
@app.route('/fisherman/edit/<int:fisherman_id>', methods=['GET', 'POST'])
def edit_fisherman(fisherman_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    if request.method == 'POST':
        fisherman_data = {
            "full_name": request.form['full_name']
        }
        response = requests.put(f"{API_URL}fishermen/{fisherman_id}/", json=fisherman_data, headers=headers)

        if response.ok:
            return redirect(url_for('get_fishermen'))
        else:
            return handle_error(response)

    # Получаем информацию о рыболове
    fisherman_response = requests.get(f"{API_URL}fishermen/{fisherman_id}/", headers=headers)
    if fisherman_response.ok:
        fisherman_data = fisherman_response.json()
        return render_template('edit_fisherman.html', fisherman=fisherman_data)
    else:
        return handle_error(fisherman_response)


# Эндпоинт для удаления рыбака
@app.route('/fisherman/delete/<int:fisherman_id>', methods=['POST'])
def delete_fisherman(fisherman_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    response = requests.delete(f"{API_URL}fishermen/{fisherman_id}/", headers=headers)

    if response.ok:
        return redirect(url_for('get_fishermen'))
    else:
        return handle_error(response)


@app.route('/fisherman/<int:fisherman_id>', methods=['GET'])
def fisherman_reports(fisherman_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'} if token else {}

    # Получаем все отчеты
    response = requests.get(f"{API_URL}reports/", headers=headers)

    if response.ok:
        reports_data = response.json()
        # Фильтруем отчеты по ID рыболова
        fisherman_reports = [report for report in reports_data['results'] if fisherman_id in report['fishermen']]

        return render_template('fisherman_reports.html', fisherman_id=fisherman_id, reports=fisherman_reports)
    else:
        return handle_error(response)

@app.route('/captain/<int:captain_id>', methods=['GET'])
def captain_reports(captain_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'} if token else {}

    # Получаем все отчеты
    response = requests.get(f"{API_URL}reports/", headers=headers)

    if response.ok:
        reports_data = response.json()
        # Фильтруем отчеты по ID капитана
        captain_reports = [report for report in reports_data['results'] if report['captain'] == captain_id]

        return render_template('captain_reports.html.html', captain_id=captain_id, reports=captain_reports)
    else:
        return handle_error(response)


@app.route('/add_data', methods=['GET', 'POST'])
def add_data():
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'} if token else {}

    if request.method == 'POST':
        # Обработка добавления нового корабля, рыбы или условия погоды
        if request.form.get('type') == 'ship':
            ship_data = {
                "name": request.form['name']
            }
            response = requests.post(f"{API_URL}ships/", json=ship_data, headers=headers)
        elif request.form.get('type') == 'fish':
            fish_data = {
                "name": request.form['name']
            }
            response = requests.post(f"{API_URL}fish/", json=fish_data, headers=headers)
        elif request.form.get('type') == 'weather_condition':
            weather_data = {
                "name": request.form['name']
            }
            response = requests.post(f"{API_URL}weather_conditions/", json=weather_data, headers=headers)

        if response.ok:
            return redirect(url_for('add_data'))  # Перенаправление на ту же страницу после добавления
        else:
            return handle_error(response)

    # Запрос данных для отображения
    ships_response = requests.get(f"{API_URL}ships/", headers=headers)
    fish_response = requests.get(f"{API_URL}fish/", headers=headers)
    weather_conditions_response = requests.get(f"{API_URL}weather_conditions/", headers=headers)

    if (
        ships_response.ok and
        fish_response.ok and
        weather_conditions_response.ok
    ):
        ships_data = ships_response.json()['results']
        fish_data = fish_response.json()['results']
        weather_conditions_data = weather_conditions_response.json()['results']

        return render_template('add_data.html', ships=ships_data, fish=fish_data, weather_conditions=weather_conditions_data)
    else:
        return handle_error(ships_response or fish_response or weather_conditions_response)

# Эндпоинт для редактирования корабля
@app.route('/ship/edit/<int:ship_id>', methods=['GET', 'POST'])
def edit_ship(ship_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    if request.method == 'POST':
        ship_data = {
            "name": request.form['ship_name']
        }
        response = requests.put(f"{API_URL}ships/{ship_id}/", json=ship_data, headers=headers)

        if response.ok:
            return redirect(url_for('add_data'))
        else:
            return handle_error(response)

    # Получаем информацию о корабле
    ship_response = requests.get(f"{API_URL}ships/{ship_id}/", headers=headers)
    if ship_response.ok:
        ship_data = ship_response.json()
        return render_template('edit_ship.html', ship=ship_data)
    else:
        return handle_error(ship_response)

# Эндпоинт для удаления корабля
@app.route('/ship/delete/<int:ship_id>', methods=['POST'])
def delete_ship(ship_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    response = requests.delete(f"{API_URL}ships/{ship_id}/", headers=headers)

    if response.ok:
        return redirect(url_for('add_data'))
    else:
        return handle_error(response)

# Аналогично для рыб
@app.route('/fish/edit/<int:fish_id>', methods=['GET', 'POST'])
def edit_fish(fish_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    if request.method == 'POST':
        fish_data = {
            "name": request.form['fish_name']
        }
        response = requests.put(f"{API_URL}fish/{fish_id}/", json=fish_data, headers=headers)

        if response.ok:
            return redirect(url_for('add_data'))
        else:
            return handle_error(response)

    fish_response = requests.get(f"{API_URL}fish/{fish_id}/", headers=headers)
    if fish_response.ok:
        fish_data = fish_response.json()
        return render_template('edit_fish.html', fish=fish_data)
    else:
        return handle_error(fish_response)

@app.route('/fish/delete/<int:fish_id>', methods=['POST'])
def delete_fish(fish_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    response = requests.delete(f"{API_URL}fish/{fish_id}/", headers=headers)

    if response.ok:
        return redirect(url_for('add_data'))
    else:
        return handle_error(response)

@app.route('/fish/delete/<int:fish_id>', methods=['POST'])
def delete_fish_with_error(fish_id):
    # Нарочно убираем получение токена из сессии, чтобы возникла ошибка
    token = None  # Плохая практика, токен не будет найден
    headers = {'Authorization': f'Bearer {token}'}  # Здесь будет None, что вызовет ошибку

    response = requests.delete(f"{API_URL}fish/{fish_id}/", headers=headers)

    if response.ok:
        return redirect(url_for('add_data'))
    else:
        # Плохое сообщение об ошибке, не обрабатывается корректно
        return "Something went wrong", 500

# Аналогично для погодных условий
@app.route('/weather_condition/edit/<int:condition_id>', methods=['GET', 'POST'])
def edit_weather_condition(condition_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    if request.method == 'POST':
        condition_data = {
            "name": request.form['condition_name']
        }
        response = requests.put(f"{API_URL}weather_conditions/{condition_id}/", json=condition_data, headers=headers)

        if response.ok:
            return redirect(url_for('add_data'))
        else:
            return handle_error(response)

    condition_response = requests.get(f"{API_URL}weather_conditions/{condition_id}/", headers=headers)
    if condition_response.ok:
        condition_data = condition_response.json()
        return render_template('edit_weather_condition.html', condition=condition_data)
    else:
        return handle_error(condition_response)

@app.route('/weather_condition/delete/<int:condition_id>', methods=['POST'])
def delete_weather_condition(condition_id):
    token = session.get('token')
    headers = {'Authorization': f'Bearer {token}'}

    response = requests.delete(f"{API_URL}weather_conditions/{condition_id}/", headers=headers)

    if response.ok:
        return redirect(url_for('add_data'))
    else:
        return handle_error(response)

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

