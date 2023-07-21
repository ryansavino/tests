#!/bin/bash
#
# Copyright (c) 2022 Intel Corporation
#
# SPDX-License-Identifier: Apache-2.0
#

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

cidir=$(dirname "$0")
source "${cidir}/lib.sh"

main() {
	build_static_artifact_and_install "tdx-tdvf"

	if [ "${KATA_BUILD_CC:-no}" == "yes" ]; then
		sudo ln -sf /opt/kata/share/tdvf /usr/share/tdvf
	fi
}

main "$@"
