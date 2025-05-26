#!/bin/bash

function LogMessage {
    local timestamp
    timestamp=$(TZ=UTC date "+%Y-%m-%dT%H:%M:%SZ")
    echo "$timestamp $1"
}

LogMessage "hello"
LogMessage "world"
