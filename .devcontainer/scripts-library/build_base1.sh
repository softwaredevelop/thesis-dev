#!/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

buildah bud --no-cache --tag=texlive:thesis_base -f- . << EOF
FROM docker.io/library/debian:stable-slim
COPY texlive1.sh /tmp/scripts-library/
RUN /bin/bash /tmp/scripts-library/texlive1.sh \
    && apt-get clean -y && rm -fr /var/lib/apt/lists/* /tmp/scripts-library
EOF
