from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from django.contrib import messages
from django.db import connection
from car_pooling_system.utils import getDropDown, dictfetchall
import datetime

# Create your views here.
def index(request):
    cursor = connection.cursor()
    SQL = "SELECT * FROM cars_car, company, type, users_user WHERE user_id = car_vendor_id AND company_id = car_company_id AND type_id = car_type_id"
    cursor.execute(SQL)
    carlist = dictfetchall(cursor)
    context = {
        "carlist": carlist
    }
    return render(request, 'index.html', context)

def about(request):
    return render(request,'about.html')
def contact(request):
    return render(request,'contact.html')