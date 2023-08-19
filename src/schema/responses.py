from typing import List

from pydantic import BaseModel


class RequestMOdel(BaseModel):
    input: str

    class Config:
        from_attributes = True
        extra = "forbid"


class BaseResponse(BaseModel):
    output: str

    class Config:
        json_schema_extra = {
            "example": {
                "output": "আর্জেন্টিনার গোলকিপার মার্তিনেজ এখন ঢাকায়",
            }
        }
