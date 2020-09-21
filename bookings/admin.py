from django.contrib import admin
from .models import Booking, BookingPayment


admin.site.register(Booking)
admin.site.register(BookingPayment)
