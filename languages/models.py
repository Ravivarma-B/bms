import re
import uuid
from django.utils.translation import ugettext as _
from django.db import models
from users.models import User


class Language(models.Model):
    guid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True, verbose_name="Guid")
    name = models.CharField(verbose_name=_("name"), max_length=250, blank=True, null=True)
    created_on = models.DateTimeField(auto_now_add=True, verbose_name='Created On')

    class Meta:
        verbose_name = _("Language")
        verbose_name_plural = _("Languages")

    def __str__(self):
        return self.name
