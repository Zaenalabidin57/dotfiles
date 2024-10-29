from django.urls import path

from . import views


urlpatterns = [
    path("", views.index, name="index"),
    path("abidin", views.abidin, name="abidin"),
    path("<str:nama>", views.salam, name="salam"),
]
