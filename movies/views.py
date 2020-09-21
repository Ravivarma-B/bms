from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from main.permissions import IsAdminOrReadOnly
from rest_framework.decorators import action
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import serializers

from .models import Movie
from .serializers import MovieSerializer
from theaters.models import Theater
from theaters.serializers import TheaterSerializer
from django.utils.translation import ugettext_lazy as _
from datetime import datetime, date


class MovieViewSet(viewsets.ModelViewSet):
    """Manages movies in database"""

    serializer_class = MovieSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly, IsAdminOrReadOnly)
    queryset = Movie.objects.all()

    @action(methods=['get'], detail=True, url_path='theaters')
    def get_shows_by_movie(self, request, pk=None):
        params = request.data
        try:
            selected_date = datetime.strptime(params.get('selected_date'), '%Y-%m-%d') if params.get('selected_date') else date.today()
        except:
            msg = _('Invalid date format')
            raise serializers.ValidationError(msg, code='date format')
        theaters = TheaterSerializer(Theater.objects.filter(screens__movie=pk).distinct(), many=True,
                                     context={'selected_date': selected_date})
        return Response(theaters.data)
