#!/bin/bash
set -eu

username=( brinkab )
image=( docker-texlive )

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )

# sort version numbers with highest first
IFS=$'\n'; versions=( $(echo "${versions[*]}" | sort -rV) ); unset IFS

for version in "${versions[@]}"; do
    echo "Building $username/$image:$version" 
    docker build -t $username/$image:$version $version/
    sleep 60
done

if [ ${#versions[@]} -gt 1 ]; then
    docker tag $username/$image:${versions[0]} $username/$image:latest
fi
