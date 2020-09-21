from rest_framework import serializers
from .models import Movie, Genre
from languages.serializers import LanguageSerializer


class GenreSerializer(serializers.ModelSerializer):

    class Meta:
        model = Genre
        fields = '__all__'


class MovieSerializer(serializers.ModelSerializer):

    genres = GenreSerializer(many=True)
    languages = LanguageSerializer(many=True)

    class Meta:
        model = Movie
        fields = '__all__'
