#!/usr/bin/env bash

MASON_NAME=freetype
MASON_VERSION=2.7.1
MASON_LIB_FILE=lib/libfreetype.a
MASON_PKGCONFIG_FILE=lib/pkgconfig/freetype2.pc

. ${MASON_DIR}/mason.sh

function mason_load_source {
    mason_download \
        https://nongnu.askapache.com/freetype/freetype-${MASON_VERSION}.tar.bz2 \
        51abc6f9afd5bbcbdcc0d9ea20b145f0ff1be632

    mason_extract_tar_bz2

    export MASON_BUILD_PATH=${MASON_ROOT}/.build/freetype-${MASON_VERSION}
}

function mason_compile {
    # note CFLAGS overrides defaults (-Wall -g -O2) so we need to add optimization flags back
    export CFLAGS="${CFLAGS} -O3 -DNDEBUG"
    ./configure --prefix=${MASON_PREFIX} \
     --enable-static \
     --disable-shared ${MASON_HOST_ARG} \
     --with-zlib=yes \
     --with-bzip2=no \
     --with-harfbuzz=no \
     --with-png=no \
     --with-quickdraw-toolbox=no \
     --with-quickdraw-carbon=no \
     --with-ats=no \
     --with-fsref=no \
     --with-fsspec=no \

    make -j${MASON_CONCURRENCY}
    make install
}

function mason_ldflags {
    : # We're only using the full path to the archive, which is output in static_libs
}

function mason_cflags {
    echo "-I${MASON_PREFIX}/include/freetype2"
}

function mason_clean {
    make clean
}

mason_run "$@"