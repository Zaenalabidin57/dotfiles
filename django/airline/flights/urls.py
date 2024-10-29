from django.urls import path, reverse
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    # path("", views.index, name="index"),
    # path("book/", views.book, name="book"),
    # path("book/<int:flight_id>/", views.bookings, name="bookings"),
    path("<int:flight_id>", views.flight, name="flight"),
    path("<int:flight_id>/book", views.book, name="book"),
]
