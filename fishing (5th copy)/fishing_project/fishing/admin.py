from django.contrib import admin
from .models import Captain, Fisherman, Ship, Fish, FishingReport, FishCatch, WeatherCondition

class FishCatchInline(admin.TabularInline):
    model = FishCatch  # Указываем модель, которую будем использовать
    extra = 1  # Количество пустых форм для добавления новых уловов

class FishingReportAdmin(admin.ModelAdmin):
    inlines = [FishCatchInline]  # Включаем FishCatchInline в админку
    list_display = ('captain', 'ship', 'start_date', 'end_date', 'weather_conditions')
    search_fields = ('captain__full_name', 'ship__name')

class WeatherConditionAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')  # Поля, которые будут отображаться в списке
    search_fields = ('name',)  # Поля для поиска в админке

# Регистрируем модели
admin.site.register(Captain)
admin.site.register(Fisherman)
admin.site.register(WeatherCondition)
admin.site.register(Ship)
admin.site.register(Fish)
admin.site.register(FishingReport, FishingReportAdmin)  # Здесь мы используем новый класс админки
admin.site.register(FishCatch)  # Это можно оставить, если хотите редактировать уловы отдельно
