from rest_framework import serializers
import logging
from .models import Captain, Fisherman, Ship, Fish, FishingReport, FishCatch, WeatherCondition
from accounts.models import CustomUser

class UserInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['username', 'role']

class CaptainSerializer(serializers.ModelSerializer):
    class Meta:
        model = Captain
        fields = ['id', 'full_name']  # Укажите необходимые поля

class FishermanSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fisherman
        fields = ['id', 'full_name']  # Укажите необходимые поля

class ShipSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ship
        fields = '__all__'
        
class WeatherConditionSerializer(serializers.ModelSerializer):
    class Meta:
        model = WeatherCondition
        fields = '__all__'

class FishSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fish
        fields = '__all__'

class FishCatchSerializer(serializers.ModelSerializer):
    fish = FishSerializer(read_only=True)
    fish_id = serializers.PrimaryKeyRelatedField(
        queryset=Fish.objects.all(), write_only=True, source='fish'
    )

    class Meta:
        model = FishCatch
        fields = ['fish', 'fish_id', 'weight']
     
class FishingReportSerializer(serializers.ModelSerializer):
    captain = serializers.PrimaryKeyRelatedField(queryset=Captain.objects.all())
    fishermen = serializers.PrimaryKeyRelatedField(many=True, queryset=Fisherman.objects.all())
    ship = serializers.PrimaryKeyRelatedField(queryset=Ship.objects.all())
    weather_conditions = serializers.PrimaryKeyRelatedField(queryset=WeatherCondition.objects.all())
    
    fish_catches = FishCatchSerializer(many=True, required=False)

    class Meta:
        model = FishingReport
        fields = ['id', 'captain', 'fishermen', 'ship', 'fish_catches', 'start_date', 'end_date', 'weather_conditions']

    def create(self, validated_data):
        fish_catches_data = validated_data.pop('fish_catches', [])
        fishermen_data = validated_data.pop('fishermen')

        report = FishingReport.objects.create(**validated_data)
        report.fishermen.set(fishermen_data)

        for catch_data in fish_catches_data:
            FishCatch.objects.create(
                fishing_report=report,
                fish=catch_data['fish'],
                weight=catch_data['weight']
            )

        return report

    def update(self, instance, validated_data):
        fish_catches_data = validated_data.pop('fish_catches', [])
        
        # Обновляем основные поля
        instance.captain = validated_data.get('captain', instance.captain)
        instance.fishermen.set(validated_data.get('fishermen', instance.fishermen.all()))
        instance.ship = validated_data.get('ship', instance.ship)
        instance.start_date = validated_data.get('start_date', instance.start_date)
        instance.end_date = validated_data.get('end_date', instance.end_date)
        instance.weather_conditions = validated_data.get('weather_conditions', instance.weather_conditions)
        instance.save()

        # Обновляем или создаем объекты FishCatch
        instance.fish_catches.all().delete()  # Удаляем старые записи
        for catch_data in fish_catches_data:
            FishCatch.objects.create(
                fishing_report=instance,
                fish=catch_data['fish'],
                weight=catch_data['weight']
            )

        return instance

