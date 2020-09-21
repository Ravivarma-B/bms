import uuid
from django.utils.translation import ugettext as _
from django.db import models
from django.contrib.postgres.aggregates import ArrayAgg
from movies.models import Movie
from cities.models import City

SEAT_ARRANGEMENT_ORDER = (
    ('LTR', 'left to right'),
    ('RTL', 'right to left',),
)


class Row(models.Model):
    name = models.CharField(verbose_name="Row Name", max_length=3, unique=True, blank=True, null=True)

    class Meta:
        verbose_name = _("Row")
        verbose_name_plural = _("Rows")

    def __str__(self):
        return self.name


class Timings(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    start = models.TimeField(verbose_name=_("Show Time"))
    end = models.TimeField(verbose_name=_("End Time"))
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Show Timing")
        verbose_name_plural = _("Show Timings")
        unique_together = ('start', 'end',)

    def __str__(self):
        return str(self.start) + ' - ' + str(self.end)


class Category(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    name = models.CharField(verbose_name=_("Category"), max_length=250, blank=True, null=True)
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Category")
        verbose_name_plural = _("Categories")

    def __str__(self):
        return self.name


class Theater(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    name = models.CharField(verbose_name=_("Theater Name"), max_length=250, blank=True, null=True)
    location = models.TextField(verbose_name="Address", blank=False, null=False)
    city = models.ForeignKey(City, verbose_name="City", blank=False, related_name='cities', null=False,
                             on_delete=models.CASCADE)
    pin_code = models.CharField(max_length=6, verbose_name="Pin code", blank=False, null=False)
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Theater")
        verbose_name_plural = _("Theaters")

    def __str__(self):
        return self.name

    @property
    def movie_name(self):
        return 'Movie %s' % self.name


class TheaterScreen(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    theater = models.ForeignKey(Theater, verbose_name=_("Theater"), related_name='screens', blank=True, null=True,
                                on_delete=models.CASCADE)
    name = models.CharField(verbose_name="Screen Name", max_length=6, blank=False, null=False)
    seats_arrangement = models.CharField(max_length=30, null=True, blank=True, choices=SEAT_ARRANGEMENT_ORDER,
                                         help_text="The order in which seats need to be arranged ",
                                         verbose_name="Seat Arrangement Direction")
    max_seats = models.IntegerField(verbose_name="Number of seats in a row", default=20,
                                    help_text="Max number of seats")
    movie = models.ForeignKey(Movie, verbose_name="Movie", related_name='movies', on_delete=models.CASCADE)
    show_timings = models.ManyToManyField(Timings, verbose_name="Show Timings", blank=True)
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Theater Screen")
        verbose_name_plural = _("Theater Screens")

    def __str__(self):
        return '%s - Screen %s' % (self.theater.name, self.name)


class TheaterScreenCategory(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    screen = models.ForeignKey(TheaterScreen, verbose_name=_("Screen"), related_name='categories', blank=True,
                               null=True,
                               on_delete=models.CASCADE)
    category = models.ForeignKey(Category, verbose_name=_("Category"), blank=True, null=True, on_delete=models.CASCADE)
    last_row = models.ForeignKey(Row, verbose_name=_("Rows Up to"), blank=True, null=True, on_delete=models.CASCADE)
    price = models.DecimalField(verbose_name="Ticket Price", default=0, decimal_places=2, max_digits=5)
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Theater Screen Category")
        verbose_name_plural = _("Theater Screen Categories")

    def __str__(self):
        return '%s - Screen %s - %s' % (self.screen.theater.name, self.screen.name, self.category.name)


class TheaterScreenCategoryRowGap(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    category = models.ForeignKey(TheaterScreenCategory, verbose_name=_("Category"), related_name='gaps',
                                 blank=True, null=True, on_delete=models.CASCADE)
    row = models.ForeignKey(Row, verbose_name=_("Row"), blank=True, null=True, on_delete=models.CASCADE)
    seat = models.IntegerField(verbose_name="Seat No", default=0, help_text="Provide seat no to place gaps after it")
    positions = models.IntegerField(verbose_name="Number of gaps", default=0)
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Gap")
        verbose_name_plural = _("Gaps")

    def __str__(self):
        return 'Row %s,  Seat %s, Gaps %s' % (self.row.name, self.seat, self.positions)


class BookedTicket(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    category = models.ForeignKey(TheaterScreenCategory, verbose_name=_("Category"), related_name='booking',
                                 blank=True, null=True, on_delete=models.CASCADE)
    row = models.ForeignKey(Row, verbose_name=_("Row"), blank=True, null=True, on_delete=models.CASCADE)
    seat = models.IntegerField(verbose_name="Seat No")
    show_time = models.ForeignKey(Timings, verbose_name=_("Show Time"), blank=True, null=True, on_delete=models.CASCADE)
    reserved_for = models.DateField(verbose_name="Reserved For")
    booked_on = models.DateTimeField(auto_now_add=True, verbose_name='Booked On')

    class Meta:
        verbose_name = _("Booked Ticket")
        verbose_name_plural = _("Booked Tickets")
