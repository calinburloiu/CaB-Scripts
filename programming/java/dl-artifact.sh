#!/usr/bin/env bash

USAGE=$"$(cat <<EOF 
Usage: $0 <groupId> <artifactId> <version> [repoUrl]
Download an artifact to the local Maven2 repository.
EOF
)"

if [ $# -lt 3 ]; then
    echo "$USAGE" >&2
    exit 1
fi

GROUP_ID=$1
ARTIFACT_ID=$2
VERSION=$3
REPO_URL="http://repo1.maven.org/maven2"
if [ $# -eq 4 ]; then
    REPO_URL="$4"
fi

# Download it.
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -Dartifact=${GROUP_ID}:${ARTIFACT_ID}:${VERSION} -DrepoUrl="$REPO_URL"
