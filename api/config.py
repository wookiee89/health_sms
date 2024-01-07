import secrets
from typing import Literal
from decouple import config

from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    PROJECT_NAME: str = "Healhty SMS"
    DESCRIPTION: str = (
        "SMS powered tool for storing and retrieving your health-based data."
    )
    VERSION: str = "0.1"
    SECRET_KEY: str = secrets.token_urlsafe(32)
    DATABASE_URI: str = config("DB_URI")

    class Config:
        case_sensitive = True


settings = Settings()


class TestSettings(Settings):
    class Config:
        case_sensitive = True


test_settings = TestSettings()
