from django.contrib import admin
from .models import City


class CityAdmin(admin.ModelAdmin):
    list_display = ('city',)
    list_filter = ('city',)
    search_fields = ('city',)


admin.site.register(City, CityAdmin)
