from fastapi import FastAPI


app = FastAPI()


@app.get("/")
async def get_status() -> dict[str, str]:
    return {"hello": "world"}
