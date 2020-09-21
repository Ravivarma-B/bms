from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from .serializers import BookingCreateSerializer
from .models import Booking
from rest_framework import generics


class CreateBookingView(generics.CreateAPIView):
    """Manages bookings in database"""

    serializer_class = BookingCreateSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly,)
    queryset = Booking.objects.all()

    def perform_create(self, serializer):
        print(self.request.user)
        serializer.save(user=self.request.user)
