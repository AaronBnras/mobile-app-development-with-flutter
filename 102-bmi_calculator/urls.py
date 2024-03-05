from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path("api/v1/calculate_bmi", include("bmi_server.urls")),
    path('admin/', admin.site.urls),
]
