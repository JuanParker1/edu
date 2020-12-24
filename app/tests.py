# from django.test import TestCase
import datetime
# Create your tests here.

now=datetime.datetime.now()
date=now.date()
time=now.time()
print(date.year)


# sub=date+time
print(datetime.datetime(date.year,date.month,date.day,time.hour,time.minute))