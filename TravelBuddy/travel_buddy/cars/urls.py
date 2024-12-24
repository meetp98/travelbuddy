from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.cars, name="cars"),
    url(r'^filters/(?P<typeID>\w{0,50})/$', views.car_filter, name="car_filter"),
    url(r'^car-listing$', views.carlisting, name="carlisting"),
    url(r'^book-car$', views.bookcar, name="bookcar"),
    url(r'^cart_listing$', views.cart_listing, name="cart_listing"),
    url(r'^order-listing$', views.orderlisting, name="orderlisting"),
    url(r'^customer-booking$', views.customerbooking, name="customerbooking"),
    url(r'^add$', views.add, name="add"),
    url(r'^car-details/(?P<carId>\w{0,50})/$', views.car_details, name="car_details"),
    url(r'^booking-details/(?P<bookingId>\w{0,50})/$', views.booking_details, name="booking_details"),
    url(r'^update/(?P<carId>\w{0,50})/$', views.update, name="update"),
    url(r'^delete/(?P<prodId>\w{0,50})/$', views.delete, name="delete"),
    url(r'^companylisting$', views.companylisting, name="companylisting"),
    url(r'^addcompany$', views.addcompany, name="addcompany"),
    url(r'^deletecompany/(?P<id>\w{0,50})/$', views.deletecompany, name="deletecompany"),
]
