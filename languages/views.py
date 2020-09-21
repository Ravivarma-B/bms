from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from main.permissions import IsAdminOrReadOnly
from rest_framework import viewsets

from .models import Language
from .serializers import LanguageSerializer


class LanguageViewSet(viewsets.ModelViewSet):
    """Manages cities in database"""

    serializer_class = LanguageSerializer
    authentication_classes = (TokenAuthentication, IsAdminOrReadOnly,)
    permission_classes = (IsAuthenticated,)
    queryset = Language.objects.all()
