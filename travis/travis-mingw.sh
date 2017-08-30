export MAKEJOBS=-j3
export RUN_TESTS=false
export CHECK_DOC=0
export BOOST_TEST_RANDOM=1$TRAVIS_BUILD_ID
export CCACHE_SIZE=400M
export CCACHE_TEMPDIR=/tmp/.ccache-temp-mingw
export CCACHE_COMPRESS=1
export BASE_OUTDIR=$TRAVIS_BUILD_DIR/out
export SDK_URL=https://bitcoincore.org/depends-sources/sdks
export PYTHON_DEBUG=1
export WINEDEBUG=fixme-all
export HOST=x86_64-w64-mingw32
export DPKG_ADD_ARCH="i386"
export DEP_OPTS="NO_QT=1"
export PACKAGES="python3 nsis g++-mingw-w64-x86-64 wine1.6 bc"
export RUN_TESTS=true
export GOAL="install"
export BITCOIN_CONFIG="--enable-reduce-exports"
export TRAVIS_NOHANG_WORKAROUND=1
