from django.contrib import admin
from .models import Movie, Genre


class MovieAdmin(admin.ModelAdmin):
    list_filter = ('name',)
    search_fields = ('guid', 'name', 'release_date', 'created_on')
    list_display = ('guid', 'name', 'release_date', 'created_on')


class GenreAdmin(admin.ModelAdmin):
    list_filter = ('name',)
    search_fields = ('guid', 'name', 'created_on')
    list_display = ('guid', 'name', 'created_on')


admin.site.register(Movie, MovieAdmin)
admin.site.register(Genre, GenreAdmin)