#!/bin/bash

function LogMessage {
    local timestamp
    timestamp=$(TZ=UTC date "+%Y-%m-%dT%H:%M:%SZ")
    echo "$timestamp $1"
}

LogMessage "hello"

owner=$(echo $GITHUB_WORKFLOW_REF | awk -F/ '{ print $1 }')
repo=$(echo $GITHUB_WORKFLOW_REF | awk -F/ '{ print $2 }')
number=$(echo $GITHUB_WORKFLOW_REF | awk -F/ '{ print $(NF-1) }')

accept="Accept: application/vnd.github+json"
auth="Authorization: Bearer $GITHUB_TOKEN"

curl -L -X PUT -H "$accept" -H "$auth" "https://api.github.com/repos/$owner/$repo/pulls/$number/merge"

LogMessage "world"
