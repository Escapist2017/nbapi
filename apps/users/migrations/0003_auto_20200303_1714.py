# Generated by Django 2.2 on 2020-03-03 17:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20200223_1210'),
    ]

    operations = [
        migrations.AddField(
            model_name='verifycode',
            name='email',
            field=models.EmailField(default=1, help_text='邮箱', max_length=19, verbose_name='邮箱'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='verifycode',
            name='code',
            field=models.CharField(help_text='验证码', max_length=10, verbose_name='验证码'),
        ),
    ]