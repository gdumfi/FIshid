from django.db import models

class Captain(models.Model):
    full_name = models.CharField(max_length=100)

    def __str__(self):
        return self.full_name

class Fisherman(models.Model):
    full_name = models.CharField(max_length=255, verbose_name="ФИО")

    def __str__(self):
        return self.full_name

class Ship(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Fish(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class WeatherCondition(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class FishCatch(models.Model):
    fish = models.ForeignKey(Fish, on_delete=models.CASCADE)
    fishing_report = models.ForeignKey('FishingReport', on_delete=models.CASCADE, related_name='fish_catches')
    weight = models.FloatField()

    def __str__(self):
        return f"{self.fish.name}: {self.weight} kg"

class FishingReport(models.Model):
    captain = models.ForeignKey(Captain, on_delete=models.CASCADE)
    fishermen = models.ManyToManyField(Fisherman)
    ship = models.ForeignKey(Ship, on_delete=models.CASCADE)
    weather_conditions = models.ForeignKey(WeatherCondition, on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()

    def __str__(self):
        return f"Report of {self.captain} on {self.ship} ({self.start_date} - {self.end_date})"

