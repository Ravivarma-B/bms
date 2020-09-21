import uuid
from django.utils.translation import ugettext as _
from django.db import models
from languages.models import Language


class Genre(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    name = models.CharField(verbose_name=_("Movie Category"), max_length=250, blank=True, null=True)
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Movie Genre")
        verbose_name_plural = _("Movie Genres")

    def __str__(self):
        return self.name


class Movie(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    name = models.CharField(verbose_name=_("name"), max_length=250, blank=True, null=True)
    genres = models.ManyToManyField(Genre, verbose_name=_("Genres"), blank=True)
    languages = models.ManyToManyField(Language, verbose_name=_("Languages"), blank=True)
    release_date = models.DateField(verbose_name='Release Date')
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Movie")
        verbose_name_plural = _("Movies")

    def __str__(self):
        return self.name

