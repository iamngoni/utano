from decouple import config
from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-8l*9w(=3+s+y23(wuk@$9kme-#d=%$!h%i+-nt6r#%3d_!v(_h"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["localhost", "127.0.0.1", "192.168.0.175"]
CSRF_TRUSTED_ORIGINS = ["http://127.0.0.1:8000"]

# Application definition

INSTALLED_APPS = [
    "corsheaders",
    "rest_framework",
    "django_rq",
    "django_extensions",
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "users.apps.UsersConfig",
    "auth0.apps.Auth0Config",
    "system.apps.SystemConfig",
    "emails.apps.EmailsConfig",
    "health_institution.apps.HealthInstitutionConfig",
    "staff.apps.StaffConfig",
    "patient.apps.PatientConfig",
    "pos.apps.PosConfig",
    "pharmacy.apps.PharmacyConfig",
]

MIDDLEWARE = [
    "corsheaders.middleware.CorsMiddleware",
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "services.middleware.middleware.RequestLoggerMiddleware",
]

ROOT_URLCONF = "utano.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "utano.wsgi.application"

# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": config("DATABASE_NAME"),
        "USER": config("DATABASE_USER"),
        "PASSWORD": config("DATABASE_PASSWORD"),
        "HOST": config("DATABASE_HOST"),
        "PORT": config("DATABASE_PORT"),
    }
}

# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]

AUTHENTICATION_BACKENDS = ["services.authentication.auth_backend.AuthModelBackend"]

# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "Africa/Harare"

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_ROOT = os.path.join("static")
STATIC_URL = "/static/"

# Media file (Images, Videos, Documents)

MEDIA_ROOT = os.path.join(BASE_DIR, "media")
MEDIA_URL = "/media/"

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

WT_SECRET = config("JWT_SECRET")

CSRF_COOKIE_SECURE = False

REST_FRAMEWORK = {
    "DEFAULT_PAGINATION_CLASS": "rest_framework.pagination.PageNumberPagination",
    "PAGE_SIZE": 4,
    "DEFAULT_AUTHENTICATION_CLASSES": [
        "services.authentication.is_authenticated.IsAPIAuthenticated"
    ],
    "DEFAULT_SCHEMA_CLASS": "rest_framework.schemas.coreapi.AutoSchema",
    "DEFAULT_PERMISSION_CLASSES": [
        "rest_framework.permissions.AllowAny",
    ],
    "DEFAULT_PARSER_CLASSES": [
        "rest_framework.parsers.JSONParser",
        "rest_framework.parsers.FormParser",
        "rest_framework.parsers.MultiPartParser",
    ],
    "DEFAULT_RENDERER_CLASSES": [
        "rest_framework.renderers.JSONRenderer",
        "rest_framework.renderers.BrowsableAPIRenderer",
    ],
    "TEST_REQUEST_DEFAULT_FORMAT": "json",
    "DEFAULT_FILTER_BACKENDS": [
        "django_filters.rest_framework.DjangoFilterBackend",
    ],
    "EXCEPTION_HANDLER": "services.exceptions.handlers.custom_exception_handler",
}

CORS_ALLOWED_ORIGINS = [
    "https://hekima.netlify.app",
    "http://localhost:3000",
    "http://127.0.0.1:3000",
    "https://hekima-next-ts.vercel.app",
    "https://hekima.vercel.app",
]

CORS_ALLOW_CREDENTIALS = True

CORS_ALLOW_METHODS = [
    "DELETE",
    "GET",
    "PATCH",
    "POST",
    "PUT",
]

AUTH_USER_MODEL = "users.User"

APPEND_SLASH = False

CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": config("REDIS_HOST"),
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
            "MAX_ENTRIES": 500,
        },
    },
}

RQ_QUEUES = {
    "auth": {
        "USE_REDIS_CACHE": "default",
    },
    "health_institution": {
        "USE_REDIS_CACHE": "default",
    },
    "users": {
        "USE_REDIS_CACHE": "default",
    },
    "utano": {
        "USE_REDIS_CACHE": "default",
    },
    "pos": {
        "USE_REDIS_CACHE": "default",
    },
    "notifications": {
        "USE_REDIS_CACHE": "default",
    },
}

USER_AGENTS_CACHE = "default"

ORIGIN = config("ORIGIN")

HEALTH_CHECK = {"DISK_USAGE_MAX": 90, "MEMORY_MIN": 100}

SESSION_ENGINE = "django.contrib.sessions.backends.cache"
SESSION_CACHE_ALIAS = "default"

DATA_UPLOAD_MAX_MEMORY_SIZE = 5242880

GRAPH_MODELS = {
    "all_applications": True,
    "group_models": True,
}

AES_SECRET_KEY = config("AES_SECRET")
