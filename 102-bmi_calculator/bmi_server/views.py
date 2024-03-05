import json
from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

# Create your views here.
@csrf_exempt
def calculate_bmi(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        weight = data.get("weight")
        height = data.get("height")

         # Calculate BMI
        bmi_value = weight / (height * height )

        if bmi_value < 18.5:
           return JsonResponse({'bmi': bmi_value, 'remark': 'underweight'})
        elif bmi_value >= 18.5 and bmi_value < 24.9:
            return JsonResponse({'bmi': bmi_value, 'remark': 'healthy weight'})
        elif bmi_value >= 25 and bmi_value < 29.9:
            return JsonResponse({'bmi': bmi_value, 'remark': 'Overweight'})
        elif bmi_value >= 30 and bmi_value < 34.9:
            return JsonResponse({'bmi': bmi_value, 'remark': 'Obese'})
        elif bmi_value >= 35 and bmi_value < 39.9:
            return JsonResponse({'bmi': bmi_value, 'remark': 'Severely Obese'})
        else:
            return JsonResponse({'bmi': bmi_value, 'remark': 'Morbidly Obese'})
    else:
        return JsonResponse({"error": "Bad Request"})
