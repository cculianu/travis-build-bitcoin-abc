export TRAVIS_BUILD_ID=0001
export MAKEJOBS=-j4
export RUN_TESTS=false
export CHECK_DOC=0
export BOOST_TEST_RANDOM=1$TRAVIS_BUILD_ID
export CCACHE_SIZE=400M
export CCACHE_TEMPDIR=/tmp/.ccache-temp-linux
export CCACHE_COMPRESS=1
export BASE_OUTDIR=$TRAVIS_BUILD_DIR/out
export SDK_URL=https://bitcoincore.org/depends-sources/sdks
export PYTHON_DEBUG=1
export WINEDEBUG=fixme-all
export HOST=x86_64-pc-linux-gnu
export PACKAGES="g++-multilib bc python3-zmq"
export DEP_OPTS="NO_QT=1"
export RUN_TESTS=true
export GOAL="install"
export BITCOIN_CONFIG="--enable-zmq --enable-tsan"
export USE_SHELL="/bin/dash"
#export CFLAGS="-fsanitize=thread -O1 -fno-omit-frame-pointer -fPIE -pie"
#export CXXFLAGS="$CFLAGS"
#export CC="cc"
#export CXX="c++"

