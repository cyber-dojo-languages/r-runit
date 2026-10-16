#!/bin/bash -Eeu

# Appends one test framework to the test_frameworks list the base image
# wrote in /versions.json, keeping any entry an earlier image added. Stops
# the build if the list is not found, rather than record nothing.
add_test_framework()
{
  local -r name="${1}"
  local -r version="${2}"
  local -r entry="{\"name\": \"${name}\", \"version\": \"${version}\"}"
  if grep --quiet '"test_frameworks": \[\]' /versions.json; then
    sed -i "s|\"test_frameworks\": \[\]|\"test_frameworks\": [${entry}]|" /versions.json
  else
    sed -i "/\"test_frameworks\": \[/s|}\]|}, ${entry}]|" /versions.json
  fi
  if ! grep --quiet --fixed-strings "${entry}" /versions.json; then
    echo "Could not add ${name} to /versions.json" >&2
    cat /versions.json >&2
    exit 1
  fi
}

# R is asked rather than apt, so the version is the one a kata loads.
readonly RUNIT_VERSION=$(Rscript --vanilla -e "cat(as.character(packageVersion('RUnit')))")

if [ -z "${RUNIT_VERSION}" ]; then
  echo 'Could not read a version from packageVersion(RUnit)' >&2
  exit 1
fi

add_test_framework RUnit "${RUNIT_VERSION}"
cat /versions.json
