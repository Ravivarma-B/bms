import uuid
from django.utils.translation import ugettext as _
from django.db import models


class City(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    city = models.CharField(verbose_name=_("City"), max_length=250, blank=False, null=False)
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("City")
        verbose_name_plural = _("Cities")

    def __str__(self):
        return self.city
