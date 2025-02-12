#!/bin/bash
do_app_start(){

  cd ${PROJ_PATH:-}/src/python/tpl-gen-api
  source .venv/bin/activate

  # TODO: parametrize conf
  uvicorn "tpl_gen_api.main:app" --host 0.0.0.0 --port 8080 --reload &

  export EXIT_CODE="0"
}
