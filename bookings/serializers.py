from rest_framework import serializers
from .models import Booking, BookingPayment
from theaters.models import BookedTicket, TheaterScreenCategory, Row, Timings
from theaters.serializers import BookedTicketSerializers
from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from users.models import User
from users.serializers import UserSerializer


class BookingPaymentSerializer(serializers.ModelSerializer):

    class Meta:
        model = BookingPayment
        fields = '__all__'


class BookingSerializer(serializers.ModelSerializer):
    ticket = BookingPaymentSerializer(many=False)
    payment = BookingPaymentSerializer(many=False)

    class Meta:
        model = Booking
        fields = '__all__'


class BookingCreateSerializer(serializers.ModelSerializer):

    ticket = BookedTicketSerializers()
    payment = serializers.SerializerMethodField()

    class Meta:
        model = Booking
        fields = '__all__'

    def create(self, validated_data):
        ticket_validated_data = validated_data.pop('ticket')
        ticket = BookedTicket.objects.create(**ticket_validated_data)
        ticket.save()
        booking = Booking.objects.create(ticket=ticket, user=User.objects.get(guid=validated_data.get('user').guid))
        booking.save()
        payment = BookingPayment.objects.create(payment=ticket, price=ticket.category.price)
        payment.save()
        return booking

    def get_payment(self, instance):
        payment = BookingPaymentSerializer(BookingPayment.objects.get(payment=instance.ticket), many=False)
        return payment.data
