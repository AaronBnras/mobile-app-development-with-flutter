from django.urls import path
from . import views

urlpatterns = [
    path('', views.calculate_bmi, name="calculate_bmi")
]