from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from .models import car
from django.contrib import messages
from django.db import connection
from car_pooling_system.utils import getDropDown, dictfetchall
import datetime

# Create your views here.
def orderlisting(request):
    cursor = connection.cursor()
    if (request.session.get('user_level_id', None) == 1):
        SQL = "SELECT * FROM users_user, cars_car, company, type, booking WHERE company_id = car_company_id AND type_id = car_type_id AND car_id = booking_car_id AND booking_user_id = user_id"
    else:
        customerID = str(request.session.get('user_id', None))
        SQL = "SELECT * FROM users_user, cars_car, company, type, booking WHERE company_id = car_company_id AND type_id = car_type_id AND car_id = booking_car_id AND booking_user_id = user_id AND user_id = " + customerID
    cursor.execute(SQL)
    orderlist = dictfetchall(cursor)

    context = {
        "orderlist": orderlist
    }

    # Message according Car #
    context['heading'] = "Booking Reports";
    return render(request, 'order-listing.html', context)

# Create your views here.
def customerbooking(request):
    cursor = connection.cursor()
    
    customerID = str(request.session.get('user_id', None))
    SQL = "SELECT * FROM users_user, cars_car, company, type, booking WHERE company_id = car_company_id AND type_id = car_type_id AND car_id = booking_car_id AND booking_user_id = user_id AND car_vendor_id = " + customerID
    cursor.execute(SQL)
    orderlist = dictfetchall(cursor)

    context = {
        "orderlist": orderlist
    }

    # Message according Car #
    context['heading'] = "Booking Reports";
    return render(request, 'order-listing.html', context)

# Create your views here.
def carlisting(request):
    cursor = connection.cursor()
    SQL = "SELECT * FROM cars_car, company, type, users_user WHERE user_id = car_vendor_id AND company_id = car_company_id AND type_id = car_type_id"
    if (request.session.get('user_level_id', None) == 2):
        customerID = str(request.session.get('user_id', None))
        SQL = "SELECT * FROM cars_car, company, type, users_user WHERE user_id = car_vendor_id AND company_id = car_company_id AND type_id = car_type_id AND car_vendor_id = "+customerID

    cursor.execute(SQL)
    carlist = dictfetchall(cursor)

    context = {
        "carlist": carlist
    }

    # Message according Car #
    context['heading'] = "Cars Details";
    return render(request, 'cars-listing.html', context)

    # Create your views here.
def bookcar(request):
    context = {
            "carlist": ""
    }
    if (request.method == "POST"):
        cursor = connection.cursor()
        cursor.execute(
            "SELECT * FROM cars_car, company, type, users_user WHERE user_id = car_vendor_id AND car_from_locations = '"+request.POST['from_location']+"' AND car_to_locations = '"+request.POST['to_location'] +"' AND company_id = car_company_id AND type_id = car_type_id")
        carlist = dictfetchall(cursor)

        context = {
            "carlist": carlist
        }
        if (len(carlist) ==  0):
            context['message'] = "No Car Found for this route !!!"
            context['error'] = True

    # Message according Car #
    context['heading'] = "Cars Details";
    return render(request, 'book-car.html', context)


# Create your views here.
def cart_listing(request):
    orderID = request.session.get('order_id', None);
    cursor = connection.cursor()
    ### Get the Cart Details Listing  ####
    cursor.execute("SELECT *  FROM `cars_car`, `order`, order_item, company, type WHERE car_id =  oi_car_id AND oi_order_id = order_id AND company_id = car_company_id AND type_id = car_type_id AND order_id = "+ str(orderID))
    carlist = dictfetchall(cursor)
    
    ### Get the Total Cart  ####
    cursor.execute("SELECT SUM(oi_total) as totalCartCost  FROM `cars_car`, `order`, order_item, company, type WHERE car_id =  oi_car_id AND oi_order_id = order_id AND company_id = car_company_id AND type_id = car_type_id AND order_id = "+ str(orderID))
    totalCost = dictfetchall(cursor)
    
    context = {
        "carlist": carlist,
        "totalCost":totalCost[0]
    }

    # Message according Car #
    context['heading'] = "Cars Details";
    return render(request, 'carts.html', context)

# Create your views here.
def cars(request):
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM cars_car, company, type, users_user WHERE user_id = car_vendor_id AND company_id = car_company_id AND type_id = car_type_id")
    carlist = dictfetchall(cursor)

    context = {
        "carlist": carlist
    }

    # Message according Car #
    context['heading'] = "Cars Details";
    return render(request, 'cars.html', context)

# Create your views here.
def car_filter(request, typeID):
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM cars_car, company, type WHERE company_id = car_company_id AND type_id = car_type_id AND type_id = "+ str(typeID))
    carlist = dictfetchall(cursor)

    context = {
        "carlist": carlist
    }

    # Message according Car #
    context['heading'] = "Cars Details";
    return render(request, 'cars.html', context)

def update(request, carId):
    cardetails = car.objects.get(car_id=carId)
    context = {
        "fn": "add",
        "procompanylist":getDropDown('company', 'company_id', 'company_name', cardetails.car_company_id, '1'),
        "protypelist":getDropDown('type', 'type_id', 'type_name', cardetails.car_type_id, '1'),
        "cardetails":cardetails
    }
    if (request.method == "POST"):
        try:
            car_image = None
            car_image = cardetails.car_image
            if(request.FILES and request.FILES['car_image']):
                carImage = request.FILES['car_image']
                fs = FileSystemStorage()
                filename = fs.save(carImage.name, carImage)
                car_image = "/uploads/"+str(carImage)

            addCar = car(
            car_id = carId,
            car_name = request.POST['car_name'],
            car_from_locations = request.POST['car_from_locations'],
            car_to_locations = request.POST['car_to_locations'],
            car_type_id = request.POST['car_type_id'],
            car_company_id = request.POST['car_company_id'],
            car_price = request.POST['car_price'],
            car_image = car_image,                  
            car_description = request.POST['car_description'],
            car_number = request.POST['car_number'])
            addCar.save()
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        context["cardetails"] = car.objects.get(car_id = carId)
        messages.add_message(request, messages.INFO, "Car updated succesfully !!!")
        return redirect('carlisting')

    else:
        return render(request,'cars-add.html', context)

def car_details(request, carId):
    if(request.session.get('authenticated', False) == False):
        messages.add_message(request, messages.ERROR, "Login to your account, to book the car !!!")
        return redirect('/users')
    cursor = connection.cursor()
    bookingID = ""
    cursor.execute(
        "SELECT * FROM cars_car, company, type WHERE company_id = car_company_id AND type_id = car_type_id AND car_id = "+carId)
    cardetails = dictfetchall(cursor)

    context = {
        "fn": "add",
        "cardetails":cardetails[0]
    }
    if (request.method == "POST"):
        try:
            customerID = request.session.get('user_id', None)
            bookingDate = datetime.datetime.now().strftime("%I:%M%p on %B %d, %Y")
            cursor = connection.cursor()
            cursor.execute("""
            INSERT INTO `booking`
            SET `booking_user_id` = %s, `booking_name` = %s, `booking_contact` = %s, `booking_email` = %s, `booking_pickup_date` = %s, `booking_drop_date` = %s, `booking_pickup_address` = %s, `booking_drop_address` = %s, `booking_date` = %s, `booking_car_id` = %s
            """, (
                customerID,
                request.POST['booking_name'],
                request.POST['booking_contact'],
                request.POST['booking_email'],
                request.POST['booking_pickup_date'],
                request.POST['booking_drop_date'],
                request.POST['booking_pickup_address'],
                request.POST['booking_drop_address'],
                bookingDate,
                request.POST['booking_car_id']))
            bookingID = cursor.lastrowid    
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        context["cardetails"] = car.objects.get(car_id = carId)
        messages.add_message(request, messages.INFO, "Your booking has been saved. Our executive will call you soon !!!")
        return redirect('/cars/booking-details/'+ str(bookingID))
    else:
        return render(request,'cars-details.html', context)

def booking_details(request, bookingId):
    if(request.session.get('authenticated', False) == False):
        messages.add_message(request, messages.ERROR, "Login to your account, to view booking details !!!")
        return redirect('/users')
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM cars_car, company, type, booking WHERE company_id = car_company_id AND type_id = car_type_id AND car_id = booking_car_id AND booking_id = "+bookingId)
    cardetails = dictfetchall(cursor)

    context = {
        "fn": "add",
        "cardetails":cardetails[0]
    }
    return render(request,'booking-details.html', context)
        
def add(request):
    context = {
        "fn": "add",
        "procompanylist":getDropDown('company', 'company_id', 'company_name',0, '1'),
        "protypelist":getDropDown('type', 'type_id', 'type_name',0, '1'),
        "heading": 'Car add'
    };
    if (request.method == "POST"):
        car_image = None
        customerID = str(request.session.get('user_id', None))
        if(request.FILES and request.FILES['car_image']):
            carImage = request.FILES['car_image']
            fs = FileSystemStorage()
            filename = fs.save(carImage.name, carImage)
            car_image = "/uploads/"+str(carImage)

        cursor = connection.cursor()
        cursor.execute("""
        INSERT INTO `cars_car`
        SET `car_vendor_id` = %s, `car_name` = %s, `car_type_id` = %s, `car_from_locations` = %s, `car_to_locations` = %s, `car_company_id` = %s, `car_price` = %s, `car_image` = %s, `car_description` = %s, `car_number` = %s
        """, (
            customerID,
            request.POST['car_name'],
            request.POST['car_type_id'],
            request.POST['car_from_locations'],
            request.POST['car_to_locations'],
            request.POST['car_company_id'],
            request.POST['car_price'],
            car_image,
            request.POST['car_description'],
            request.POST['car_number']))
       

        return redirect('carlisting')

    else:
        return render(request,'cars-add.html', context)

def delete(request, prodId):
    try:
        deleteCar = car.objects.get(car_id = prodId)
        deleteCar.delete()
    except Exception as e:
        return HttpResponse('Something went wrong. Error Message : '+ str(e))
    messages.add_message(request, messages.INFO, "Car Deleted Successfully !!!")
    return redirect('carlisting')

def companylisting(request):
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM company")
    companylist = dictfetchall(cursor)

    context = {
        "companylist": companylist
    }

    # Message according Car #
    context['heading'] = "Cars Company";
    return render(request, 'viewcompany.html', context)

def deletecompany(request, id):
    cursor = connection.cursor()
    sql = 'DELETE FROM company WHERE company_id=' + id
    cursor.execute(sql)
    return redirect('company')

def addcompany(request):
    context = {
        "fn": "add",
        "heading": 'Add Company'
    };
    if (request.method == "POST"):
        cursor = connection.cursor()
        cursor.execute("""
		   INSERT INTO company
		   SET company_name=%s
		""", (
            request.POST['company_name']))
        return redirect('companylisting')
    return render(request, 'addcompany.html', context)
