from typing import List, Dict
from pydantic_settings import BaseSettings
from pathlib import Path

class Configs(BaseSettings):
    PROJECT_TITLE: str = "title"
    PROJECT_DESCRIPTION: str = "description."
    PROJECT_VERSION: str = "0.0.1"

    PROJECT_ROUTE: str = "/api_v1"
    API_V1_ROUTE: str = "/api/v1"
    API_V1_CACHE_ROUTE: Path = Path('.') / "src/api/v1/.cache"

    ALLOWED_HOST: str = "*"
    ALLOWED_METHOD: str = "*"
    ALLOWED_HEADERS: str = "*"
    ORIGINS: List = ["*"]
