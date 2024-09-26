#!/bin/bash

SCRIPTS_PATH=${PWD}/scripts

source $SCRIPTS_PATH/env.conf
source $SCRIPTS_PATH/log.sh

function start() {
    cd $JOBS_HOME
    sbt new csgn/spark.g8
    cd ${PWD}
    log_info "Job created at $JOBS_HOME"
}

start
