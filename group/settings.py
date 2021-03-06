"""
Django settings for group project.

Generated by 'django-admin startproject' using Django 2.2.4.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.2/ref/settings/
"""

import os
from utils.config import *

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'va)b%azv+t-7pb-lit98m@o*a**ji)(*gvd@sfh+qkjrs-7(n0'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# ALLOWED_HOSTS = ['*', '0.0.0.0', '192.168.10.127']
ALLOWED_HOSTS = ['*', ]
# Application definition

INSTALLED_APPS = [
    'jet',
    # 'rangefilter',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'app.apps.AppConfig',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'middle.AuthMiddle'
]

ROOT_URLCONF = 'group.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'group.wsgi.application'

# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '${DataBaseName}',
        'USER': 'root',
        'PASSWORD': '${password}',
        'HOST': '${url}',
        'OPTIONS': {'charset': 'utf8mb4'},
    }
}

# Password validation
# https://docs.djangoproject.com/en/2.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# InternationalizationMEDIA_ROOT
# https://docs.djangoproject.com/en/2.2/topics/i18n/

# ?????????????????????
TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

# ??????False
USE_TZ = False

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')

"""
    ????????????
"""
# ??????????????????????????????
LOG_PATH = os.path.join(BASE_DIR, 'log')
if not os.path.isdir(LOG_PATH):
    os.mkdir(LOG_PATH)

# ????????????
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        # ?????????????????????
        'standard': {
            'format': '[%(asctime)s][%(levelname)s]%(message)s <- %(filename)s:%(lineno)d'
        }
    },

    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'standard'
        },
        'stu_handlers': {
            'level': 'DEBUG',
            # ?????????????????????RotatingFileHandler????????????????????????????????????maxBytes???????????????????????????
            'class': 'logging.handlers.RotatingFileHandler',
            # ??????????????????
            'filename': '%s/log.txt' % LOG_PATH,
            # ????????????????????????????????????
            'formatter': 'standard',
            # ???????????????????????????5M???
            'maxBytes': 1024 * 1024 * 5
        }

    },

    # ????????????logger???????????????????????????
    'loggers': {
        '': {
            'handlers': ['console'],
            'level': 'INFO',
            'propagate': True
        },
        # 'django.db.backends': {
        #     'handlers': ['console'],
        #     'level': 'DEBUG',
        #     'propagate': True
        # }
    }
}
