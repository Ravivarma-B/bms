from rest_framework import serializers
from django.contrib.postgres.aggregates import ArrayAgg
from .models import Category, Timings, Theater, TheaterScreen, TheaterScreenCategory, TheaterScreenCategoryRowGap, \
    Row, BookedTicket
from cities.serializes import CitySerializer
from movies.serializers import MovieSerializer
from django.db import models


class CategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = '__all__'


class RowSerializer(serializers.ModelSerializer):

    class Meta:
        model = Row
        fields = '__all__'


class TimingsSerializer(serializers.ModelSerializer):

    class Meta:
        model = Timings
        fields = '__all__'


class TheaterScreenCategoryRowGapSerializer(serializers.ModelSerializer):

    row = RowSerializer(many=False)

    class Meta:
        model = TheaterScreenCategoryRowGap
        fields = '__all__'
        read_only_fields = ('guid',)
        extra_kwargs = {'category': {'write_only': True}}


class TheaterScreenCategorySerializer(serializers.ModelSerializer):

    category = CategorySerializer(many=False)
    gaps = TheaterScreenCategoryRowGapSerializer(many=True)
    last_row = RowSerializer(many=False)
    seats = serializers.SerializerMethodField()

    class Meta:
        model = TheaterScreenCategory
        fields = '__all__'
        read_only_fields = ('guid',)
        extra_kwargs = {'screen': {'write_only': True}, 'last_row': {'write_only': True}}

    def get_rows(self, instance):
        return Row.objects.filter(id__lte=instance.last_row.id).values()

    def get_seats(self, instance):
        """Return available seats per category"""
        selected_date = self.context.get('selected_date')
        rows = self.get_rows(instance)
        response = {}
        show_timings = TimingsSerializer(instance.screen.show_timings.all(), many=True)
        for show_time in show_timings.data:
            cs = {}
            for row in rows:
                row_id = row.get('id')
                row_name = row.get('name')
                gaps = TheaterScreenCategoryRowGap.objects.filter(category=instance.guid, row=row_id).aggregate(
                        models.Sum('positions'))['positions__sum']
                gaps = 0 if gaps is None else gaps
                seats = instance.screen.max_seats - gaps
                reserved = BookedTicket.objects.filter(category=instance.guid, row=row_id, reserved_for=selected_date) \
                    .aggregate(seats=ArrayAgg('seat'))['seats']
                available = set(list(range(1, seats + 1))).symmetric_difference(set(reserved))
                cs[row_name] = {'seats': seats, 'available': available, 'reserved': reserved}
            response[show_time.get('guid')] = cs
        return response


class TheaterScreenSerializer(serializers.ModelSerializer):

    categories = TheaterScreenCategorySerializer(many=True)
    movie = MovieSerializer(many=False)
    show_timings = TimingsSerializer(many=True)

    class Meta:
        model = TheaterScreen
        fields = '__all__'
        extra_kwargs = {'theater': {'write_only': True}}


class TheaterSerializer(serializers.ModelSerializer):

    screens = TheaterScreenSerializer(many=True)
    city = CitySerializer(many=False)

    class Meta:
        model = Theater
        fields = '__all__'


class BookedTicketSerializers(serializers.ModelSerializer):

    class Meta:
        model = BookedTicket
        fields = '__all__'

    def create(self, validated_data):
        print(validated_data)
        return "jsnd"
