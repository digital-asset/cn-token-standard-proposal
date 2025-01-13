#!/usr/bin/env bash
# Copyright (c) 2025 Digital Asset (Switzerland) GmbH and/or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

# TODO: #586: multi-package support for daml test
# Until we have multi-package test support we prefer to run our test Dars rather than use 'daml test' to
# interpret each Daml package's test source code
find examples -name "*-test*\.dar" | while read testDar
do
  echo "Running tests in $testDar"
  daml script --dar "$testDar" --all --ide-ledger --static-time
done
