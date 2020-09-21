from django.contrib import admin
from .models import Category, Theater, TheaterScreen, TheaterScreenCategory, TheaterScreenCategoryRowGap, Timings, \
    Row, BookedTicket


class CategoryAdmin(admin.ModelAdmin):
    list_filter = ('name',)
    fl = ('guid', 'name', 'created_on')
    search_fields = fl
    list_display = fl


class TimingAdmin(admin.ModelAdmin):
    fl = ('guid', 'start', 'end', 'created_on')
    list_display = fl


class TheaterAdmin(admin.ModelAdmin):
    list_filter = ('name',)
    fl = ('guid', 'name', 'city', 'created_on')
    search_fields = fl
    list_display = fl


class TheaterScreenAdmin(admin.ModelAdmin):
    fl = ('guid', 'theater', 'name', 'max_seats', 'seats_arrangement', 'created_on')
    list_filter = ('name',)
    search_fields = fl
    list_display = fl


class TheaterScreenCategoryAdmin(admin.ModelAdmin):
    fl = ('guid', 'screen', 'category', 'last_row', 'price', 'created_on')
    list_filter = ('category',)
    search_fields = fl
    list_display = fl


class TheaterScreenCategoryRowGapAdmin(admin.ModelAdmin):
    fl = ('guid', 'row', 'seat', 'positions', 'created_on')
    list_filter = ('row',)
    search_fields = fl
    list_display = fl


admin.site.register(Row)
admin.site.register(BookedTicket)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Timings, TimingAdmin)
admin.site.register(Theater, TheaterAdmin)
admin.site.register(TheaterScreen, TheaterScreenAdmin)
admin.site.register(TheaterScreenCategory, TheaterScreenCategoryAdmin)
admin.site.register(TheaterScreenCategoryRowGap, TheaterScreenCategoryRowGapAdmin)
