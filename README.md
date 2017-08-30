# travis-build-bitcoin-abc

This is only verified to work on Ubuntu 14.04 and Ubuntu 17.04.  

But it may work on any debian system.  YMMV.


Installation Instructions


1. Copy ./travis/ to your home directory (using cp -fpvra travis ~/)
2. Put ~/travis/travis-build.sh in your PATH somehow.

Finally do:

    cd /path/to/bitcoin-abc
    travis-build.sh linux

If it fails, you may need to install some required packages.  See ~/travis/travis-linux.sh under the PACKAGES= line.


You can also run travis-build.sh with one of:

    travis-build.sh linux # linux, no Qt
    travis-build.sh linux-qt # linux with Qt
    
    travis-build.sh linux32 # 32-bit linux
    
    travis-build.sh mingw # Windows 64-bit, no Qt.  Requires tools see PACKAGES in ~/travis/travis-mingw.sh
    travis-build.sh mingw-qt # Windows 64-bit with Qt
    travis-build.sh osx11 # OSX El Capitan, no Qt
    travis-build.sh osx11-qt # OSX El Capitan, with Qt
    
    (and various others.. explore travis/ to see)
    
All builds happen in build/bitcoin-HOSTNAME_STRING

To issue a build with a different arch/config combo, you need to do a *clean*:

    travis-build.sh clean
    
Advanced -- if you are coding and want to not rebuild everything just what changed in src/whatever.cpp be copied to build/bitcoin-HOST/src/whatever.cpp automatically, issue:

    travis-build.sh update

To get osx11 and osx11-qt working you need to be in the Bitcoin-ABC source dir
and do the following -- to symlink the SDK that the bitcoin build system expects:

    cd /path/to/bitcoin-abc
    (cd depends && ln -s ~/travis/MacOSX_SDKs SDKs)

After that symlink is created, and provided you installed the PACKAGES
listed in ~/travis/travis-osx11.sh using apt-get, it should build:

    travis-build.sh osx11
    

Any questions or comments find me, Calin Culianu (NilagTheGrim) either on
slack or via email: calin.culianu@gmail.com


