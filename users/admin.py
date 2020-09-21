from django.contrib import admin
from users.models import User


class UserAdmin(admin.ModelAdmin):
    exclude = ['last_login']
    list_filter = ('email',)
    search_fields = ('guid', 'name', 'email', 'is_active', 'is_staff', 'date_joined')
    list_display = ('guid', 'name', 'email', 'is_active', 'is_staff', 'date_joined')


admin.site.register(User, UserAdmin)
