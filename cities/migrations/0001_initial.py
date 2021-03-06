# Generated by Django 3.1.1 on 2020-09-21 05:58

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('guid', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, unique=True, verbose_name='Guid')),
                ('city', models.CharField(max_length=250, verbose_name='City')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Created On')),
            ],
            options={
                'verbose_name': 'City',
                'verbose_name_plural': 'Cities',
            },
        ),
    ]
