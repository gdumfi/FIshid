# Generated by Django 5.1.2 on 2024-10-25 15:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fishing', '0003_remove_captain_first_name_remove_captain_last_name_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fishingreport',
            name='total_weight',
        ),
    ]
