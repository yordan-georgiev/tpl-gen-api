#!/bin/bash
do_app_stop(){
    do_log "INFO Stopping FastAPI application..."
    
    # Find the process using port 8080 and kill it
    # TODO: parametrize 
    lsof -ti:8080 | xargs kill
    do_log "INFO stopped the FastAPI application..."

    quit_on "killing the connections"

    export EXIT_CODE="0"
}
