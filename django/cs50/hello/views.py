from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, "hello/index.html")

def abidin(request):
    return HttpResponse("Abidin")

def salam(request, nama):
    return render(request, "hello/salam.html", {
        "nama": nama.capitalize()
        })
