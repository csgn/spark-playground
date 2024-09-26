#!/bin/bash

SCRIPTS_PATH=${PWD}/scripts

source $SCRIPTS_PATH/env.conf
source $SCRIPTS_PATH/log.sh

function check_spark_exists() {
    if [ ! -d $SPARK_HOME ]; then
        log_error "$SPARK_HOME is not found."
        exit 1
    else
        log_info "$SPARK_HOME ensured, proceeding."
    fi
}

function submit_job() {
    target_job=$JOBS_HOME/$1/target/scala-$SCALA_VERSION/$1_$SCALA_VERSION-0.0.1.jar
    if [ ! -f ${target_job} ]; then
        log_error "$target_job is not found. Run (sbt package) command on your job."
        exit 1
    fi

    log_info "Submitting spark job at $target_job"
    $SPARK_HOME/bin/spark-submit \
        --deploy-mode client \
        --class $2.$3 \
        $target_job
}

function start() {
    if [ $# -eq 0 ]; then
        usage
        exit 1
    fi

    check_spark_exists

    submit_job $1 $2 $3
}

function usage() {
     echo "Usage: $0 <project_name> <package_name> <object_name>"
}

start $1 $2 $3
