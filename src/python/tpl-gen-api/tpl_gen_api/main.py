from fastapi import FastAPI
import toml

app = FastAPI()

@app.get("/ping")
def ping():
    return {"msg": "pong"}

@app.get("/version")
def version():
    # Load the version from pyproject.toml
    pyproject = toml.load("pyproject.toml")
    version = pyproject['tool']['poetry']['version']
    return {"version": version}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080, reload=True)
