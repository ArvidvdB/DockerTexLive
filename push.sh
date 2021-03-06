#!/bin/bash
set -eu

username=( brinkab )
image=( dockertexlive )

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )

# sort version numbers with highest first
IFS=$'\n'; versions=( $(echo "${versions[*]}" | sort -rV) ); unset IFS

for version in "${versions[@]}"; do
    docker push $username/$image:$version
done

if [ ${#versions[@]} -gt 1 ]; then
    docker push $username/$image:latest
fi
