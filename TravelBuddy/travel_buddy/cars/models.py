# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class car(models.Model):
    car_id = models.AutoField(primary_key=True)
    car_name = models.CharField(max_length=255, default = '')
    car_from_locations = models.CharField(max_length=255, default = '')
    car_to_locations = models.CharField(max_length=255, default = '')
    car_type_id = models.CharField(max_length=255, default = "")
    car_company_id = models.CharField(max_length=255, default = "")
    car_price = models.CharField(max_length=255, default = "")
    car_image = models.CharField(max_length=255, null = True)
    car_description = models.TextField(default = "")
    car_number = models.CharField(max_length=255, default = "")
    def __str__(self):
        return self.car_name    
