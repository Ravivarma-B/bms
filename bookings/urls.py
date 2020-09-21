from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import *
from users.views import *
from cities.views import *
from languages.views import *
from theaters.views import *
from movies.views import *


router = DefaultRouter(trailing_slash=False)
router.register('city', CityViewSet)
router.register('language', LanguageViewSet)
router.register('theater', TheaterViewSet)
router.register('movie', MovieViewSet)

# app_name = 'bookmyshow'

urlpatterns = [
    path('auth/register', CreateUserView.as_view(), name='create'),
    path('auth/login', CreateTokenView.as_view(), name='token'),
    path('booking', CreateBookingView.as_view(), name='token'),
    path('', include(router.urls)),
]