from django.utils.translation import ugettext as _
from django.db import models
from theaters.models import BookedTicket
from django.conf import settings


class Booking(models.Model):
    ticket = models.OneToOneField(BookedTicket, verbose_name="Ticket", related_name="ticket", on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, verbose_name=_("User"), blank=True, null=True, on_delete=models.CASCADE)
    reserved = models.BooleanField(verbose_name="Ticket Reserved", default=True)

    class Meta:
        verbose_name = _("Booking")
        verbose_name_plural = _("Bookings")

    def __str__(self):
        return 'Ticket - %s' % self.ticket


class BookingPayment(models.Model):
    payment = models.OneToOneField(BookedTicket, verbose_name="Payment Id", related_name="payment", on_delete=models.CASCADE)
    price = models.DecimalField(verbose_name="Ticket Price", default=0, decimal_places=2, max_digits=5)
    completed = models.BooleanField(verbose_name="Payment status", default=True)

    class Meta:
        verbose_name = _("Booking Payment")
        verbose_name_plural = _("Booking Payments")

    def __str__(self):
        return 'Payment - %s' % self.payment
