from django.urls import path
from .views import UserInfoView
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from .views import (CaptainListCreateView, CaptainDetailView, FishermanListCreateView, FishermanDetailView,
                    ShipListCreateView, ShipDetailView, FishListCreateView, FishDetailView, 
                    FishingReportListCreateView, FishingReportDetailView, WeatherConditionListCreateView, WeatherConditionDetailView)

urlpatterns = [
    # JWT эндпоинты
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    # Эндпоинты для капитанов
    path('api/captains/', CaptainListCreateView.as_view(), name='captain-list'),
    path('api/captains/<int:pk>/', CaptainDetailView.as_view(), name='captain-detail'),

    # Эндпоинты для рыбаков
    path('api/fishermen/', FishermanListCreateView.as_view(), name='fisherman-list'),
    path('api/fishermen/<int:pk>/', FishermanDetailView.as_view(), name='fisherman-detail'),

    # Эндпоинты для кораблей
    path('api/ships/', ShipListCreateView.as_view(), name='ship-list'),
    path('api/ships/<int:pk>/', ShipDetailView.as_view(), name='ship-detail'),

    # Эндпоинты для рыбы
    path('api/fish/', FishListCreateView.as_view(), name='fish-list'),
    path('api/fish/<int:pk>/', FishDetailView.as_view(), name='fish-detail'),

    # Эндпоинты для отчетов
    path('api/reports/', FishingReportListCreateView.as_view(), name='report-list'),
    path('api/reports/<int:pk>/', FishingReportDetailView.as_view(), name='report-detail'),
    
     # Эндпоинты для условий погоды
    path('api/weather_conditions/', WeatherConditionListCreateView.as_view(), name='weather-condition-list'),
    path('api/weather_conditions/<int:pk>/', WeatherConditionDetailView.as_view(), name='weather-condition-detail'),
    
    path('api/user_info/', UserInfoView.as_view(), name='user_info'),
]

