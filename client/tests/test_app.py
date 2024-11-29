import unittest
import logging
from unittest.mock import patch, MagicMock
from app import app
from flask import session

# Настройка логирования
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

class FlaskTestCase(unittest.TestCase):
    
    # Тест для успешного логина
    @patch('requests.post')
    @patch('requests.get')  # Добавляем мокирование для GET-запроса
    def test_login_success(self, mock_get, mock_post):
        logger.info('Starting test_login_success')
        
        # Мокируем успешный ответ от API для получения токена
        mock_response_post = MagicMock()
        mock_response_post.ok = True
        mock_response_post.json.return_value = {'access': 'mock_token'}
        mock_post.return_value = mock_response_post
        logger.debug('Mocked POST response for token: %s', mock_response_post.json.return_value)

        # Мокируем успешный ответ для запроса user_info
        mock_response_get = MagicMock()
        mock_response_get.ok = True
        mock_response_get.json.return_value = {'username': 'admin'}
        mock_get.return_value = mock_response_get
        logger.debug('Mocked GET response for user_info: %s', mock_response_get.json.return_value)
        
        with app.test_client() as client:
            # Посылаем запрос с тестовыми данными
            response = client.post('/login', data={'username': 'admin', 'password': 'password'})
            logger.debug('POST /login response status: %d', response.status_code)
            
            # Проверяем, что редирект происходит после успешного логина
            self.assertEqual(response.status_code, 302)
            
            # Проверяем, что токен сохранен в сессии
            with client.session_transaction() as sess:
                self.assertIn('token', sess)
                logger.debug('Token found in session: %s', sess['token'])
    
    # Тест для неудачного логина
    @patch('requests.post')
    def test_login_failure(self, mock_post):
        logger.info('Starting test_login_failure')
        
        # Мокируем ошибку при логине
        mock_response = MagicMock()
        mock_response.ok = False
        mock_response.text = 'Invalid credentials'
        mock_post.return_value = mock_response
        logger.debug('Mocked POST response: %s', mock_response.text)
        
        with app.test_client() as client:
            response = client.post('/login', data={'username': 'test', 'password': 'wrong_password'})
            logger.debug('POST /login response status: %d', response.status_code)
            
            # Проверяем, что ошибка отображается на странице логина
            self.assertIn(b'Login failed', response.data)
    
    # Тест для добавления капитана
    @patch('requests.post')
    def test_add_captain(self, mock_post):
        logger.info('Starting test_add_captain')
        
        # Мокируем успешный ответ от API для добавления капитана
        mock_response = MagicMock()
        mock_response.ok = True
        mock_post.return_value = mock_response
        logger.debug('Mocked POST response for adding captain: %s', mock_response.ok)
        
        with app.test_client() as client:
            # Посылаем запрос на добавление капитана
            response = client.post('/add_captain', data={'full_name': 'Captain Test'})
            logger.debug('POST /add_captain response status: %d', response.status_code)
            
            # Проверяем, что происходит редирект после добавления капитана
            self.assertEqual(response.status_code, 302)
    
    # Тест для удаления капитана
    @patch('requests.delete')
    def test_delete_captain(self, mock_delete):
        logger.info('Starting test_delete_captain')
        
        # Мокируем успешный ответ от API для удаления капитана
        mock_response = MagicMock()
        mock_response.ok = True
        mock_delete.return_value = mock_response
        logger.debug('Mocked DELETE response for deleting captain: %s', mock_response.ok)
        
        with app.test_client() as client:
            # Посылаем запрос на удаление капитана
            response = client.post('/captain/delete/1')
            logger.debug('POST /captain/delete/1 response status: %d', response.status_code)
            
            # Проверяем, что происходит редирект после удаления капитана
            self.assertEqual(response.status_code, 302)
    
    # Тест для добавления рыбака
    @patch('requests.post')
    def test_add_fisherman(self, mock_post):
        logger.info('Starting test_add_fisherman')
        
        # Мокируем успешный ответ от API для добавления рыбака
        mock_response = MagicMock()
        mock_response.ok = True
        mock_post.return_value = mock_response
        logger.debug('Mocked POST response for adding fisherman: %s', mock_response.ok)
        
        with app.test_client() as client:
            # Посылаем запрос на добавление рыбака
            response = client.post('/add_fisherman', data={'full_name': 'Fisherman Test'})
            logger.debug('POST /add_fisherman response status: %d', response.status_code)
            
            # Проверяем, что происходит редирект после добавления рыбака
            self.assertEqual(response.status_code, 302)
    
    # Тест для удаления рыбака
    @patch('requests.delete')
    def test_delete_fisherman(self, mock_delete):
        logger.info('Starting test_delete_fisherman')
        
        # Мокируем успешный ответ от API для удаления рыбака
        mock_response = MagicMock()
        mock_response.ok = True
        mock_delete.return_value = mock_response
        logger.debug('Mocked DELETE response for deleting fisherman: %s', mock_response.ok)
        
        with app.test_client() as client:
            # Посылаем запрос на удаление рыбака
            response = client.post('/fisherman/delete/1')
            logger.debug('POST /fisherman/delete/1 response status: %d', response.status_code)
            
            # Проверяем, что происходит редирект после удаления рыбака
            self.assertEqual(response.status_code, 302)
    
    # Тест для добавления корабля
    @patch('requests.post')
    def test_add_ship(self, mock_post):
        logger.info('Starting test_add_ship')
        
        # Мокируем успешный ответ от API для добавления корабля
        mock_response = MagicMock()
        mock_response.ok = True
        mock_post.return_value = mock_response
        logger.debug('Mocked POST response for adding ship: %s', mock_response.ok)
        
        with app.test_client() as client:
            # Посылаем запрос на добавление корабля
            response = client.post('/add_data', data={'name': 'Ship Test', 'type': 'ship'})
            logger.debug('POST /add_data response status: %d', response.status_code)
            
            # Проверяем, что происходит редирект после добавления корабля
            self.assertEqual(response.status_code, 302)
    
    # Тест для удаления корабля
    @patch('requests.delete')
    def test_delete_ship(self, mock_delete):
        logger.info('Starting test_delete_ship')
        
        # Мокируем успешный ответ от API для удаления корабля
        mock_response = MagicMock()
        mock_response.ok = True
        mock_delete.return_value = mock_response
        logger.debug('Mocked DELETE response for deleting ship: %s', mock_response.ok)
        
        with app.test_client() as client:
            # Посылаем запрос на удаление корабля
            response = client.post('/ship/delete/1')
            logger.debug('POST /ship/delete/1 response status: %d', response.status_code)
            
            # Проверяем, что происходит редирект после удаления корабля
            self.assertEqual(response.status_code, 302)
    
    # Новый тест для удаления рыбы с ошибкой
    @patch('requests.delete')
    def test_delete_fish_with_error(self, mock_delete):
        logger.info('Starting test_delete_fish_with_error')

        # Мокируем неудачный ответ от API (например, ошибка 401, токен не найден)
        mock_response = MagicMock()
        mock_response.ok = False
        mock_response.status_code = 401  # Ошибка авторизации
        mock_delete.return_value = mock_response
        logger.debug('Mocked DELETE response for deleting fish: %s', mock_response.status_code)

        with app.test_client() as client:
            # Пытаемся отправить запрос на удаление рыбы
            response = client.post('/fish/delete/1')
            logger.debug('POST /fish/delete/1 response status: %d', response.status_code)

            # Проверяем, что функция возвращает неправильный ответ, например, 500
            self.assertEqual(response.status_code, 500)
            self.assertIn(b'Something went wrong', response.data)

if __name__ == '__main__':
    unittest.main()

