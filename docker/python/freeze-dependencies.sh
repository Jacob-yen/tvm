#!/bin/bash -eux

# Build base images (one per Python architecture) used in building the remaining TVM docker images.
set -eux

cd "$(dirname "$0")/../.."

# NOTE: working dir inside docker is repo root.
docker/bash.sh -i "${BUILD_TAG}.ci_py_deps:latest" python3 docker/python/freeze_deps.py \
               --ci-constraints=docker/python/ci-constraints.txt \
               --gen-requirements-py=python/gen_requirements.py \
               --template-pyproject-toml=pyproject.toml \
               --output-base=docker/python/build
