# travis-build-bitcoin-abc

This is only verified to work on Ubuntu 14.04 and Ubuntu 17.04.  

But it may work on any debian system.  YMMV.


Installation Instructions


1. Copy ./travis/ to your home directory (using cp -fpvra travis ~/)
2. Put ~/travis/travis-build.sh in your PATH somehow.
3. cd to bitcoin sources dir and run:

    travis-build linux

If it fails, you may need to install some required packages.  See ~/travis/travis-linux.sh under the PACKAGES= line.


You can also run travis-build.sh with one of:

    linux
    linux-qt 
    mingw 
    mingw-qt
    osx11
    osx11-qt

To get osx11 and osx11-qt working you need to be in the Bitcoin-ABC source dir
and do the following:

    (cd depends && ln -s ~/travis/MacOSX_SDKs SDKs)

    After that symlink is created, and provided you installed the PACKAGES
    listed in ~/travis/travis-osx11.sh using apt-get, it should build.

    Any questions or comments find me, Calin Culianu (NilagTheGrim) either on
    slack or via email: calin.culianu@gmail.com


