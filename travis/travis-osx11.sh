export TRAVIS_BUILD_ID=0001
export MAKEJOBS=-j4
export RUN_TESTS=false
export CHECK_DOC=0
export BOOST_TEST_RANDOM=1$TRAVIS_BUILD_ID
export CCACHE_SIZE=400M
export CCACHE_TEMPDIR=/tmp/.ccache-temp-osx11
export CCACHE_COMPRESS=1
export BASE_OUTDIR=$TRAVIS_BUILD_DIR/out
export SDK_URL=https://bitcoincore.org/depends-sources/sdks
export PYTHON_DEBUG=1
export WINEDEBUG=fixme-all
export HOST=x86_64-apple-darwin11
export PACKAGES="cmake imagemagick libcap-dev librsvg2-bin libz-dev libbz2-dev libtiff-tools python-dev"
export DEP_OPTS="NO_QT=1"
export GOAL="install"
export OSX_SDK=10.11
export BITCOIN_CONFIG="--with-gui=no"
#export USE_SHELL="/bin/bash"
export DARWIN_SDK_PATH="/home/calin/scratch/OSXSDK/MacOSX10.11.sdk"

