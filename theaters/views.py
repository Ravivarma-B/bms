from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from main.permissions import IsAdminOrReadOnly
from rest_framework import viewsets

from .models import Theater
from .serializers import TheaterSerializer


class TheaterViewSet(viewsets.ModelViewSet):
    """Manages cities in database"""

    serializer_class = TheaterSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly, IsAdminOrReadOnly)
    queryset = Theater.objects.all()

    def perform_create(self, serializer):
        serializer.save()

    def get_queryset(self):
        return self.queryset
