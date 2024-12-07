from django.contrib.auth.models import AbstractUser
from django.db import models

class CustomUser(AbstractUser):
    ROLE_CHOICES = (
        ('user', 'User'),
        ('admin', 'Administrator'),
    )
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='user')

    def is_admin(self):
        return self.role == 'admin'

