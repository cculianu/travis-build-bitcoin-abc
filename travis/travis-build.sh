#!/bin/bash

BITCOIN_SUBDIR=bitcoin-abc

# set this to the dir where all the travis-*.sh scripts live
SCRIPTS_DIR=$HOME/travis

if [ -z "$1" ]; then

	. ${SCRIPTS_DIR}/travis.sh || exit 1
else
	if [ "$1" == "clean" ]; then
		$SCRIPTS_DIR/clean.sh || exit 1
		exit 0
	fi

	if [ "$1" == "update" ]; then
		if [ ! -d "src" ]; then
			echo "src dir not found"
			exit 1
		fi
		bdir=`echo build/${BITCOIN_SUBDIR}-*`
		ct=`echo $bdir | wc -w` 
		if [ "$ct" -ne 1 -o ! -d "$bdir" ]; then
			echo "Build dir '$bdir' not found or too many build dirs."
			exit 1
		fi
		files=`find src -type f \( -name \*.cpp -o -name \*.h \) -print`
		for f in $files; do
			dst="$bdir"/"$f"
			if ! diff -qN $f $dst; then
				cp -fpva $f $dst
			fi
		done
		cd $bdir
		make -j4
		cd -
		exit 0
	fi

	. ${SCRIPTS_DIR}/travis-${1}.sh || exit 1
fi

# First, make sure we're in the right directory!
if [ ! -e autogen.sh ] || [ ! -d depends ]; then
	echo Wrong dir -- you need to be in the bitcoin-abc top level project dir.
	exit 1
fi

# handle OSX SDKs symlink
if [ Z_`echo "$1" | head -c 3` == "Z_osx" ]; then
	if [ ! -h depends/SDKs ]; then
		if [ ! -d "$SCRIPTS_DIR/MacOSX_SDKs" ]; then
			echo MacOSX SDKs not foind! Please install them in the directory "$SCRIPTS_DIR/MacOSX_SDKs"
			exit 1
		fi
		(cd depends && ln -s "$SCRIPTS_DIR"/MacOSX_SDKs SDKs) || exit 1
	fi
fi


MY_BUILD_DIR=`pwd`


# make depends
make $MAKEJOBS -C depends HOST=$HOST $DEP_OPTS || exit 1

OUTDIR=${MY_BUILD_DIR}/depends/out_dir-$HOST

BITCOIN_CONFIG_ALL="--disable-dependency-tracking --prefix=$MY_BUILD_DIR/depends/$HOST --bindir=$OUTDIR/bin --libdir=$OUTDIR/lib"

depends/$HOST/native/bin/ccache --max-size=$CCACHE_SIZE

#autogen..
./autogen.sh || exit 1

(mkdir build && cd build) || exit 1
cd build

../configure --cache-file=config.cache $BITCOIN_CONFIG_ALL $BITCOIN_CONFIG || ( cat config.log && false) || exit 1

make distdir VERSION=$HOST || exit 1

cd ${BITCOIN_SUBDIR}-${HOST} || cd bitcoin-${HOST} || (echo $BITCOIN_SUBDIR not found && exit 1) # fallback to earlier dir

./configure --cache-file=../config.cache $BITCOIN_CONFIG_ALL $BITCOIN_CONFIG || ( cat config.log && false) || exit 1

make $MAKEJOBS $GOAL V=1 || exit 1

export LD_LIBRARY_PATH=$MY_BUILD_DIR/depends/$HOST/lib

make $MAKEJOBS check VERBOSE=1

