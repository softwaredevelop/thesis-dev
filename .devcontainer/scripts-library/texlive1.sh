#!/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

export DEBIAN_FRONTEND=noninteractive

if [[ -d "/var/lib/apt/lists" && $(ls /var/lib/apt/lists/ | wc -l) -eq 0 ]]; then
  if apt-get update; then
    LISTS_UPDATED=0
  fi
fi

if (("$LISTS_UPDATED" == 0)); then
  package_list="biber \
        chktex \
        cm-super \
        dvidvi \
        dvipng \
        fragmaster \
        git \
        lacheck \
        latexdiff \
        latexmk \
        lcdf-typetools \
        lmodern \
        make \
        psutils \
        purifyeps \
        t1utils \
        tex-gyre \
        texinfo \
        texlive-base \
        texlive-bibtex-extra \
        texlive-binaries \
        texlive-extra-utils \
        texlive-font-utils \
        texlive-fonts-extra \
        texlive-fonts-extra-links \
        texlive-fonts-recommended \
        texlive-formats-extra \
        texlive-lang-english \
        texlive-lang-european \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-luatex \
        texlive-metapost \
        texlive-pictures \
        texlive-plain-generic \
        texlive-pstricks \
        texlive-science \
        texlive-xetex"

  apt-get install --no-install-recommends --assume-yes $package_list

fi
