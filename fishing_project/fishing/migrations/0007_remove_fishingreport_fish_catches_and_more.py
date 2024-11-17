# Generated by Django 5.1.2 on 2024-10-25 23:59

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fishing', '0006_alter_fishingreport_weather_conditions'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fishingreport',
            name='fish_catches',
        ),
        migrations.AlterField(
            model_name='fishcatch',
            name='fishing_report',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fish_catches', to='fishing.fishingreport'),
        ),
    ]
