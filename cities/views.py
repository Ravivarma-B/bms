from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from main.permissions import IsAdminOrReadOnly
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import action


from .models import City
from .serializes import CitySerializer
from movies.serializers import MovieSerializer
from movies.models import Movie
from theaters.models import Theater, TheaterScreenCategory


class CityViewSet(viewsets.ModelViewSet):
    """Manages cities in database"""

    serializer_class = CitySerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticatedOrReadOnly, IsAdminOrReadOnly)
    queryset = City.objects.all()

    @action(methods=['get'], detail=True, url_path='movie')
    def get_movies_by_city(self, request, pk=None):
        movies = []
        for mve in Theater.objects.filter(city=pk).distinct().values_list('screens__movie').distinct()[0]:
            movie = MovieSerializer(Movie.objects.get(guid=mve))
            if movie.data is not None:
                movies.append(movie.data)
        return Response(movies)
