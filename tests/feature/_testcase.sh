#!/usr/bin/env bash

set -e

function test_runner() {
    echo "Testing '${1##*/}'..."
    docker run --rm -t kubernetes-exporter $@ > /dev/null
    echo "Good exit from '${1##*/}'."
}

 export -f test_runner
