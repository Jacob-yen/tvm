#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -euo pipefail
set -x

if [ -z "${TVM_VENV+x}" ]; then
    echo "install script error: must set TVM_VENV to the path to the venv symlink"
    exit 2
fi

cd $(dirname $0)/python
poetry config cache-dir /tmp/poetry-cache
poetry config virtualenvs.path /venv

poetry install --no-root "$@"
VENV_ROOT=$(ls -d1 /venv/apache-tvm-*-py3.7)
ln -s "${VENV_ROOT}" "${TVM_VENV}"
