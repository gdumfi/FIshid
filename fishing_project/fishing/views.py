# views.py
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from accounts.models import CustomUser
from .models import Captain, Fisherman, Ship, Fish, FishingReport, WeatherCondition, FishCatch
from .serializers import CaptainSerializer, FishermanSerializer, ShipSerializer, FishSerializer, FishingReportSerializer, WeatherConditionSerializer, UserInfoSerializer

class UserInfoView(APIView):
    permission_classes = [IsAuthenticated]  # Убедитесь, что пользователь аутентифицирован

    def get(self, request):
        user = request.user
        data = {
            'username': user.username,
            'role': user.role,
        }
        return Response(data)

# Представления для капитанов
class CaptainListCreateView(generics.ListCreateAPIView):
    queryset = Captain.objects.all()
    serializer_class = CaptainSerializer
    permission_classes = [IsAuthenticated]

class CaptainDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Captain.objects.all()
    serializer_class = CaptainSerializer
    permission_classes = [IsAuthenticated]

# Представления для рыбаков
class FishermanListCreateView(generics.ListCreateAPIView):
    queryset = Fisherman.objects.all()
    serializer_class = FishermanSerializer
    permission_classes = [IsAuthenticated]

class FishermanDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Fisherman.objects.all()
    serializer_class = FishermanSerializer
    permission_classes = [IsAuthenticated]

# Представления для кораблей
class ShipListCreateView(generics.ListCreateAPIView):
    queryset = Ship.objects.all()
    serializer_class = ShipSerializer
    permission_classes = [IsAuthenticated]

class ShipDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Ship.objects.all()
    serializer_class = ShipSerializer
    permission_classes = [IsAuthenticated]

class WeatherConditionListCreateView(generics.ListCreateAPIView):
    queryset = WeatherCondition.objects.all()
    serializer_class = WeatherConditionSerializer

class WeatherConditionDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = WeatherCondition.objects.all()
    serializer_class = WeatherConditionSerializer

# Представления для рыбы
class FishListCreateView(generics.ListCreateAPIView):
    queryset = Fish.objects.all()
    serializer_class = FishSerializer
    permission_classes = [IsAuthenticated]

class FishDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Fish.objects.all()
    serializer_class = FishSerializer
    permission_classes = [IsAuthenticated]

# Представления для отчетов о рыбалке
class FishingReportListCreateView(generics.ListCreateAPIView):
    queryset = FishingReport.objects.all()
    serializer_class = FishingReportSerializer
    permission_classes = [IsAuthenticated]

class FishingReportDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = FishingReport.objects.all()
    serializer_class = FishingReportSerializer
    permission_classes = [IsAuthenticated]

# Представление для входа
def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('user_reports') if user.is_staff else redirect('admin_reports')
    return render(request, 'login.html')

# Представление для создания отчета
def create_report(request):
    if request.method == 'POST':
        # Извлечение данных из формы
        captain_id = request.POST['captain']
        fishermen_ids = request.POST.getlist('fishermen')
        ship_id = request.POST['ship']
        fish_ids = request.POST.getlist('fishes')
        weights = request.POST.getlist('weights')
        start_date = request.POST['start_date']
        end_date = request.POST['end_date']
        weather_condition_id = request.POST['weather_conditions']
        
        # Создаем отчет о рыбалке
        fishing_report = FishingReport.objects.create(
            captain_id=captain_id,
            ship_id=ship_id,
            start_date=start_date,
            end_date=end_date,
            weather_conditions_id=weather_condition_id
        )

        # Привязываем рыбаков к отчету
        fishing_report.fishermen.set(fishermen_ids)

        # Создаем объекты FishCatch и собираем их ID
        fish_catch_ids = []
        if fish_ids and weights:
            for fish_id, weight in zip(fish_ids, weights):
                fish_catch = FishCatch.objects.create(
                    fishing_report=fishing_report,  # Здесь изменено имя поля
                    fish_id=fish_id,
                    weight=weight
                )
                fish_catch_ids.append(fish_catch.id)
        else:
            print("No fish or weights provided!")

        # Передаем ID созданных FishCatch в отчет
        report_data = {
            "captain": captain_id,
            "fishermen": fishermen_ids,
            "ship": ship_id,
            "fish_catches": fish_catch_ids,  # Передаем список ID
            "start_date": start_date,
            "end_date": end_date,
            "weather_conditions": weather_condition_id
        }

        # Отправка данных в API
        response = requests.post(f"{API_URL}reports/", json=report_data, headers=headers)
        
        if response.ok:
            return redirect(url_for('handle_reports'))
        else:
            logging.error(f"Failed to create report: {response.text}")
            return jsonify({"error": "Failed to create report", "response": response.text}), response.status_code
        
    # Если метод не POST, отобразите форму
    captains = Captain.objects.all()
    fishermen = Fisherman.objects.all()
    ships = Ship.objects.all()
    fishes = Fish.objects.all()
    weather_conditions = WeatherCondition.objects.all()
    
    return render(request, 'reports.html', {
        'captains': captains,
        'fishermen': fishermen,
        'ships': ships,
        'fishes': fishes,
        'weather_conditions': weather_conditions  # Передача списка в шаблон
    })

# Представление для редактирования отчета
def edit_report(request, report_id):
    report = FishingReport.objects.get(id=report_id)
    if request.method == 'POST':
        # Обработка формы редактирования отчета
        pass  # Здесь будет логика обработки и обновления отчета
    captains = Captain.objects.all()
    ships = Ship.objects.all()
    return render(request, 'edit_report.html', {'report': report, 'captains': captains, 'ships': ships})

# Представление для просмотра отчета
def view_report(request, report_id):
    report = FishingReport.objects.get(id=report_id)
    return render(request, 'view_report.html', {'report': report})

# Представление для списка отчетов (админ)
def admin_reports(request):
    reports = FishingReport.objects.all()
    return render(request, 'admin_reports.html', {'reports': reports})

