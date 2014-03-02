#!/bin/bash
CURDIR=$PWD
PACKAGE=$CURDIR/PACKAGE
TARGET=$CURDIR/TARGET
OBJ=$CURDIR/OBJ

mkdir $PACKAGE
mkdir $TARGET
mkdir $OBJ

echo "************ zlib-1.2.5 ***************************"
if [ ! -d "$TARGET/zlib-1.2.5" ]; then
	if [ ! -f $PACKAGE/zlib-1.2.5.tar.bz2 ];
	then
		cd $PACKAGE
		wget "http://enterprise-storage-os.googlecode.com/files/zlib-1.2.5.tar.bz2"
		tar xvf zlib-1.2.5.tar.bz2 -C $TARGET
	fi

	cd "$TARGET/zlib-1.2.5"

	echo "***************************************"
	./configure --prefix=$OBJ
	echo "***************************************"
	make 
	echo "***************************************"
	make install
	cd $CURDIR
fi


##  echo "************ openssl-0.9.8n ************************"
##  if [ ! -d "$TARGET/openssl-0.9.8n" ]; then 
##  	if [ ! -f "$PACKAGE/openssl-0.9.8n.tar.gz" ]
##  	then
##  	cd $PACKAGE
##  	  wget "http://www.openssl.org/source/openssl-0.9.8n.tar.gz"
##  	  tar xvf openssl-0.9.8n.tar.gz -C $TARGET
##  	fi
##  
##  	if [ ! -f "$PACKAGE/openssl-0.9.8n-fix_manpages-1.patch.1" ]
##  	then
##  	cd $PACKAGE
##  	  wget "ftp://ftp.yellowdoglinux.com/.1/blfs/conglomeration/openssl/openssl-0.9.8n-fix_manpages-1.patch"
##  	fi
##  
##  	cd "$TARGET/openssl-0.9.8n"
##  	patch -Np1 -i $PACKAGE/openssl-0.9.8n-fix_manpages-1.patch 
##  	./config --prefix=$OBJ
##  	make 
##  	make install
##  	cd $CURDIR
##  fi

echo "************ openssl-1.0.0l.tar.gz ************************"
if [ ! -d "$TARGET/openssl-1.0.0l" ]; then 
	if [ ! -f "$PACKAGE/openssl-1.0.0l.tar.gz" ]
	then
	  cd $PACKAGE
	  wget "http://www.openssl.org/source/openssl-1.0.0l.tar.gz"
	  tar xvf "openssl-1.0.0l.tar.gz" -C $TARGET
	fi

	cd "$TARGET/openssl-1.0.0l"
	./config --prefix=$OBJ shared
	make 
	make install
	cd $CURDIR
fi

echo "************ wvstream-4.6.1 ***********************"
if [ ! -d $TARGET/wvstreams-4.6.1 ]; then
	if [ ! -f "$PACKAGE/wvstreams-4.6.1.tar.gz" ]; then
		cd $PACKAGE
		wget "http://wvstreams.googlecode.com/files/wvstreams-4.6.1.tar.gz"
		tar xvf "wvstreams-4.6.1.tar.gz" -C $TARGET
	fi

	cd $TARGET/wvstreams-4.6.1
	./configure \
	--prefix=$OBJ/ \
	--without-dbus \
	--with-pam=no \
	--with-tcl=no \
	--with-qt=no \
	--disable-testgui \
	LDFLAGS=-L$OBJ/lib/ \
	CFLAGS=-I$OBJ/include/ \
	--with-openssl=$OBJ/ \
	--with-zlib=$OBJ/ \
	--disable-debug

	patch -Np1 -d $TARGET/wvstreams-4.6.1 < $CURDIR/PATCH/wvstreams-4.6.1.patch
	make 
	make install
fi


##  echo "************ wvdial-1.60.3 ***********************"
##  if [ ! -d $TARGET/wvdial-1.60.3 ]; then
##  		cd $PACKAGE
##  		tar xvf "wvdial_1.60.3.tar.gz" -C $TARGET
##  	
##  	cp $CURDIR/PATCH/config.h.in  $TARGET/wvdial-1.60.3/
##  	cp $CURDIR/PATCH/configure    $TARGET/wvdial-1.60.3/
##  	cp $CURDIR/PATCH/configure.ac $TARGET/wvdial-1.60.3/
##  	cp $CURDIR/PATCH/install-sh   $TARGET/wvdial-1.60.3/
##  	cp $CURDIR/PATCH/Makefile.in  $TARGET/wvdial-1.60.3/
##  
##  	cd $TARGET/wvdial-1.60.3/
##  
##  	./configure \
##  	--prefix=$OBJ \
##  	CPPFLAGS=-I$OBJ/include/wvstreams \
##  	LDFLAGS=-L$OBJ/lib
##  	
##  	make 
##  	make install
##  fi

echo "************ wvdial-1.61 ***********************"
if [ ! -d $TARGET/wvdial-1.61 ]; then
	if [ ! -f "$PACKAGE/wvdial-1.61" ]; then
		cd $PACKAGE
		wget "http://wvstreams.googlecode.com/files/wvdial-1.61.tar.gz"
		tar xvf "wvdial-1.61.tar.gz" -C $TARGET
	fi
	
	cp $CURDIR/PATCH/config.h.in  $TARGET/wvdial-1.61/
	cp $CURDIR/PATCH/configure    $TARGET/wvdial-1.61/
	cp $CURDIR/PATCH/configure.ac $TARGET/wvdial-1.61/
	cp $CURDIR/PATCH/install-sh   $TARGET/wvdial-1.61/
	cp $CURDIR/PATCH/Makefile.in  $TARGET/wvdial-1.61/

	cd $TARGET/wvdial-1.61/

	./configure \
	--prefix=$OBJ \
	CPPFLAGS=-I$OBJ/include/wvstreams \
	LDFLAGS=-L$OBJ/lib
	
	make 
	make install
fi

echo "************ ppp-2.4.5 ***********************"
if [ ! -d $TARGET/ppp-2.4.5 ]; then
	if [ ! -f "$PACKAGE/ppp-2.4.5.tar.gz" ]; then
		cd $PACKAGE
		wget "ftp://ftp.samba.org/pub/ppp/ppp-2.4.5.tar.gz"
		tar xvf "ppp-2.4.5.tar.gz" -C $TARGET
	fi
	

	cd $TARGET/ppp-2.4.5/

	./configure \
	--prefix=$OBJ \
	
	make 
	make install
fi
