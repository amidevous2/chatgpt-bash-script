#!/bin/bash

set -e
echo $OS
echo $OS_ID
echo $OS_VERSION
echo $OS_MAJOR
echo $OS_MINOR
echo $OS_PATCH
echo $OS_FAMILY
echo $OS_KERNEL
echo $OS_KERNEL_VERSION
echo $OS_ARCH
echo $OS_ENVIRONMENT
echo $BIN_ARCH

SRC="$BUILD/src"
DOWNLOAD="$BUILD/download"
OBJ="$BUILD/build"
export LANG=C
export LC_ALL=C
export LANGUAGE=C
rm -rf $PREFIX $SRC $OBJ
if [ "$BIN_ARCH" = "x86_64" ]; then
    PREFIXLIBDIR=$PREFIX/lib64
    LIBDIR=lib64
    LIBDIR2=lib
	P7ZIP1=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86_64/bin/7z
	P7ZIP2=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86_64/bin/7za
	P7ZIP3=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86_64/libexec/p7zip/7z
	P7ZIP4=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86_64/libexec/p7zip/7z.so
	P7ZIP5=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86_64/libexec/p7zip/7zCon.sfx
	P7ZIP6=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86_64/libexec/p7zip/7za
	#yum -y install yum-utils
	#repotrack --arch=x86_64 --url acl attr basesystem coreutils dhclient filesystem initscripts iptables-ipv6 ipw2200-firmware iwl1000-firmware iwl5000-firmware iwl6000g2a-firmware kernel-firmware ncurses policycoreutils ql2100-firmware ql2400-firmware rootfiles rt61pci-firmware setup util-linux-ng yum aic94xx-firmware audit bash cpio e2fsprogs glibc iproute iputils ivtv-firmware iwl3945-firmware iwl5150-firmware iwl6050-firmware kexec-tools openssh-server postfix ql2200-firmware ql2500-firmware rpm rt73usb-firmware shadow-utils vim-minimal zd1211-firmware atmel-firmware b43-openfwwf bfa-firmware cronie efibootmgr grub iptables ipw2100-firmware iwl100-firmware iwl4965-firmware iwl6000-firmware kbd libertas-usb8388-firmware passwd procps ql23xx-firmware rdma rsyslog selinux-policy-targeted sudo xorg-x11-drv-ati-firmware wget curl-devel openssl-devel gcc gcc-c++ libmpc limpc-devel libmpfr libmpfr-devel |grep x86_64.rpm
	TOOLSET1=https://vault.centos.org/6.10/os/x86_64/Packages/audit-libs-2.4.5-6.el6.x86_64.rpm
	TOOLSET2=https://vault.centos.org/6.10/os/x86_64/Packages/bash-4.1.2-48.el6.x86_64.rpm
	TOOLSET3=https://vault.centos.org/6.10/os/x86_64/Packages/binutils-2.20.51.0.2-5.48.el6.x86_64.rpm
	TOOLSET4=https://vault.centos.org/6.10/os/x86_64/Packages/chkconfig-1.3.49.5-1.el6.x86_64.rpm
	TOOLSET5=https://vault.centos.org/6.10/os/x86_64/Packages/cloog-ppl-0.15.7-1.2.el6.i686.rpm
	TOOLSET6=https://vault.centos.org/6.10/os/x86_64/Packages/cloog-ppl-0.15.7-1.2.el6.x86_64.rpm
	TOOLSET7=https://vault.centos.org/6.10/os/x86_64/Packages/coreutils-8.4-47.el6.x86_64.rpm
	TOOLSET8=https://vault.centos.org/6.10/os/x86_64/Packages/coreutils-libs-8.4-47.el6.x86_64.rpm
	TOOLSET9=https://vault.centos.org/6.10/os/x86_64/Packages/cpp-4.4.7-23.el6.x86_64.rpm
	TOOLSET10=https://vault.centos.org/6.10/os/x86_64/Packages/cracklib-2.8.16-4.el6.x86_64.rpm
	TOOLSET11=https://vault.centos.org/6.10/os/x86_64/Packages/cracklib-dicts-2.8.16-4.el6.x86_64.rpm
	TOOLSET12=https://vault.centos.org/6.10/os/x86_64/Packages/db4-4.7.25-22.el6.x86_64.rpm
	TOOLSET13=https://vault.centos.org/6.10/os/x86_64/Packages/filesystem-2.4.30-3.el6.x86_64.rpm
	TOOLSET14=https://vault.centos.org/6.10/os/x86_64/Packages/gcc-4.4.7-23.el6.x86_64.rpm
	TOOLSET15=https://vault.centos.org/6.10/os/x86_64/Packages/gcc-c++-4.4.7-23.el6.x86_64.rpm
	TOOLSET16=https://vault.centos.org/6.10/os/x86_64/Packages/glibc-2.12-1.212.el6.i686.rpm
	TOOLSET17=https://vault.centos.org/6.10/os/x86_64/Packages/glibc-2.12-1.212.el6.x86_64.rpm
	TOOLSET18=https://vault.centos.org/6.10/os/x86_64/Packages/glibc-common-2.12-1.212.el6.x86_64.rpm
	TOOLSET19=https://vault.centos.org/6.10/os/x86_64/Packages/glibc-devel-2.12-1.212.el6.i686.rpm
	TOOLSET20=https://vault.centos.org/6.10/os/x86_64/Packages/glibc-devel-2.12-1.212.el6.x86_64.rpm
	TOOLSET21=https://vault.centos.org/6.10/os/x86_64/Packages/glibc-headers-2.12-1.212.el6.x86_64.rpm
	TOOLSET22=https://vault.centos.org/6.10/os/x86_64/Packages/gmp-4.3.1-13.el6.i686.rpm
	TOOLSET23=https://vault.centos.org/6.10/os/x86_64/Packages/gmp-4.3.1-13.el6.x86_64.rpm
	TOOLSET24=https://vault.centos.org/6.10/os/x86_64/Packages/grep-2.20-6.el6.x86_64.rpm
	TOOLSET25=https://vault.centos.org/6.10/os/x86_64/Packages/groff-1.18.1.4-21.el6.x86_64.rpm
	TOOLSET26=https://vault.centos.org/6.10/os/x86_64/Packages/gzip-1.3.12-24.el6.x86_64.rpm
	TOOLSET27=https://vault.centos.org/6.10/os/x86_64/Packages/info-4.13a-8.el6.x86_64.rpm
	TOOLSET28=https://vault.centos.org/6.10/os/x86_64/Packages/kernel-headers-2.6.32-754.el6.x86_64.rpm
	TOOLSET29=https://vault.centos.org/6.10/os/x86_64/Packages/keyutils-libs-1.4-5.el6.x86_64.rpm
	TOOLSET30=https://vault.centos.org/6.10/os/x86_64/Packages/keyutils-libs-devel-1.4-5.el6.x86_64.rpm
	TOOLSET31=https://vault.centos.org/6.10/os/x86_64/Packages/krb5-devel-1.10.3-65.el6.x86_64.rpm
	TOOLSET32=https://vault.centos.org/6.10/os/x86_64/Packages/krb5-libs-1.10.3-65.el6.x86_64.rpm
	TOOLSET33=https://vault.centos.org/6.10/os/x86_64/Packages/less-436-13.el6.x86_64.rpm
	TOOLSET34=https://vault.centos.org/6.10/os/x86_64/Packages/libacl-2.2.49-7.el6_9.1.x86_64.rpm
	TOOLSET35=https://vault.centos.org/6.10/os/x86_64/Packages/libattr-2.4.44-7.el6.x86_64.rpm
	TOOLSET36=https://vault.centos.org/6.10/os/x86_64/Packages/libcap-2.16-5.5.el6.x86_64.rpm
	TOOLSET37=https://vault.centos.org/6.10/os/x86_64/Packages/libcom_err-1.41.12-24.el6.x86_64.rpm
	TOOLSET38=https://vault.centos.org/6.10/os/x86_64/Packages/libcom_err-devel-1.41.12-24.el6.x86_64.rpm
	TOOLSET39=https://vault.centos.org/6.10/os/x86_64/Packages/libgcc-4.4.7-23.el6.i686.rpm
	TOOLSET40=https://vault.centos.org/6.10/os/x86_64/Packages/libgcc-4.4.7-23.el6.x86_64.rpm
	TOOLSET41=https://vault.centos.org/6.10/os/x86_64/Packages/libgomp-4.4.7-23.el6.i686.rpm
	TOOLSET42=https://vault.centos.org/6.10/os/x86_64/Packages/libgomp-4.4.7-23.el6.x86_64.rpm
	TOOLSET43=https://vault.centos.org/6.10/os/x86_64/Packages/libkadm5-1.10.3-65.el6.x86_64.rpm
	TOOLSET44=https://fedora-archive.ip-connect.info/epel/6/x86_64/Packages/l/libmpc-0.8-3.el6.x86_64.rpm
	TOOLSET45=https://vault.centos.org/6.10/os/x86_64/Packages/libselinux-2.0.94-7.el6.x86_64.rpm
	TOOLSET46=https://vault.centos.org/6.10/os/x86_64/Packages/libselinux-devel-2.0.94-7.el6.x86_64.rpm
	TOOLSET47=https://vault.centos.org/6.10/os/x86_64/Packages/libsepol-2.0.41-4.el6.x86_64.rpm
	TOOLSET48=https://vault.centos.org/6.10/os/x86_64/Packages/libsepol-devel-2.0.41-4.el6.x86_64.rpm
	TOOLSET49=https://vault.centos.org/6.10/os/x86_64/Packages/libstdc++-4.4.7-23.el6.i686.rpm
	TOOLSET50=https://vault.centos.org/6.10/os/x86_64/Packages/libstdc++-4.4.7-23.el6.x86_64.rpm
	TOOLSET51=https://vault.centos.org/6.10/os/x86_64/Packages/libstdc++-devel-4.4.7-23.el6.x86_64.rpm
	TOOLSET52=https://vault.centos.org/6.10/os/x86_64/Packages/libtasn1-2.3-6.el6_5.x86_64.rpm
	TOOLSET53=https://vault.centos.org/6.10/os/x86_64/Packages/make-3.81-23.el6.x86_64.rpm
	TOOLSET54=https://vault.centos.org/6.10/os/x86_64/Packages/mpfr-2.4.1-6.el6.x86_64.rpm
	TOOLSET55=https://vault.centos.org/6.10/os/x86_64/Packages/ncurses-5.7-4.20090207.el6.x86_64.rpm
	TOOLSET56=https://vault.centos.org/6.10/os/x86_64/Packages/ncurses-base-5.7-4.20090207.el6.x86_64.rpm
	TOOLSET57=https://vault.centos.org/6.10/os/x86_64/Packages/ncurses-libs-5.7-4.20090207.el6.i686.rpm
	TOOLSET58=https://vault.centos.org/6.10/os/x86_64/Packages/ncurses-libs-5.7-4.20090207.el6.x86_64.rpm
	TOOLSET59=https://vault.centos.org/6.10/os/x86_64/Packages/nss-softokn-freebl-3.14.3-23.3.el6_8.i686.rpm
	TOOLSET60=https://vault.centos.org/6.10/os/x86_64/Packages/nss-softokn-freebl-3.14.3-23.3.el6_8.x86_64.rpm
	TOOLSET61=https://vault.centos.org/6.10/os/x86_64/Packages/openssl-1.0.1e-57.el6.x86_64.rpm
	TOOLSET62=https://vault.centos.org/6.10/os/x86_64/Packages/openssl-devel-1.0.1e-57.el6.x86_64.rpm
	TOOLSET63=https://vault.centos.org/6.10/os/x86_64/Packages/p11-kit-0.18.5-2.el6_5.2.x86_64.rpm
	TOOLSET64=https://vault.centos.org/6.10/os/x86_64/Packages/p11-kit-trust-0.18.5-2.el6_5.2.x86_64.rpm
	TOOLSET65=https://vault.centos.org/6.10/os/x86_64/Packages/pam-1.1.1-24.el6.x86_64.rpm
	TOOLSET66=https://vault.centos.org/6.10/os/x86_64/Packages/pcre-7.8-7.el6.x86_64.rpm
	TOOLSET67=https://vault.centos.org/6.10/os/x86_64/Packages/pkgconfig-0.23-9.1.el6.x86_64.rpm
	TOOLSET68=https://vault.centos.org/6.10/os/x86_64/Packages/popt-1.13-7.el6.x86_64.rpm
	TOOLSET69=https://vault.centos.org/6.10/os/x86_64/Packages/ppl-0.10.2-11.el6.i686.rpm
	TOOLSET70=https://vault.centos.org/6.10/os/x86_64/Packages/ppl-0.10.2-11.el6.x86_64.rpm
	TOOLSET71=https://vault.centos.org/6.10/os/x86_64/Packages/sed-4.2.1-10.el6.x86_64.rpm
	TOOLSET72=https://vault.centos.org/6.10/os/x86_64/Packages/setup-2.8.14-23.el6.noarch.rpm
	TOOLSET73=https://vault.centos.org/6.10/os/x86_64/Packages/tzdata-2018e-3.el6.noarch.rpm
	TOOLSET74=https://vault.centos.org/6.10/os/x86_64/Packages/wget-1.12-10.el6.x86_64.rpm
	TOOLSET75=https://vault.centos.org/6.10/os/x86_64/Packages/zlib-1.2.3-29.el6.x86_64.rpm
	TOOLSET76=https://vault.centos.org/6.10/os/x86_64/Packages/zlib-devel-1.2.3-29.el6.x86_64.rpm
	TOOLSET77=https://vault.centos.org/6.10/os/x86_64/Packages/basesystem-10.0-4.el6.noarch.rpm
	TOOLSET_MAX=77
else
    PREFIXLIBDIR=$PREFIX/lib
    LIBDIR=lib
    LIBDIR2=lib
	P7ZIP1=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86/bin/7z
	P7ZIP2=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86/bin/7za
	P7ZIP3=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86/libexec/p7zip/7z
	P7ZIP4=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86/libexec/p7zip/7z.so
	P7ZIP5=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86/libexec/p7zip/7zCon.sfx
	P7ZIP6=https://raw.githubusercontent.com/amidevous2/p7zip-bin/refs/heads/main/x86/libexec/p7zip/7za
	TOOLSET1=https://vault.centos.org/centos/6.10/os/i386/Packages/alsa-lib-1.1.0-4.el6.i686.rpm
	TOOLSET2=https://vault.centos.org/centos/6.10/os/i386/Packages/alsa-lib-devel-1.1.0-4.el6.i686.rpm
	TOOLSET3=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-1.3.9-5.el6_9.1.i686.rpm
	TOOLSET4=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-devel-1.3.9-5.el6_9.1.i686.rpm
	TOOLSET5=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-util-1.3.9-3.el6_0.1.i686.rpm
	TOOLSET6=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-util-devel-1.3.9-3.el6_0.1.i686.rpm
	TOOLSET7=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-util-ldap-1.3.9-3.el6_0.1.i686.rpm
	TOOLSET8=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-util-mysql-1.3.9-3.el6_0.1.i686.rpm
	TOOLSET9=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-util-odbc-1.3.9-3.el6_0.1.i686.rpm
	TOOLSET10=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-util-pgsql-1.3.9-3.el6_0.1.i686.rpm
	TOOLSET11=https://vault.centos.org/centos/6.10/os/i386/Packages/apr-util-sqlite-1.3.9-3.el6_0.1.i686.rpm
	TOOLSET12=https://vault.centos.org/centos/6.10/os/i386/Packages/atk-1.30.0-1.el6.i686.rpm
	TOOLSET13=https://vault.centos.org/centos/6.10/os/i386/Packages/atk-devel-1.30.0-1.el6.i686.rpm
	TOOLSET14=https://vault.centos.org/centos/6.10/os/i386/Packages/attr-2.4.44-7.el6.i686.rpm
	TOOLSET15=https://vault.centos.org/centos/6.10/os/i386/Packages/autoconf-2.63-5.1.el6.noarch.rpm
	TOOLSET16=https://vault.centos.org/centos/6.10/os/i386/Packages/automake-1.11.1-4.el6.noarch.rpm
	TOOLSET17=https://vault.centos.org/centos/6.10/os/i386/Packages/basesystem-10.0-4.el6.noarch.rpm
	TOOLSET18=https://vault.centos.org/centos/6.10/os/i386/Packages/bash-4.1.2-48.el6.i686.rpm
	TOOLSET19=https://vault.centos.org/centos/6.10/updates/i386/Packages/binutils-2.20.51.0.2-5.48.el6_10.1.i686.rpm
	TOOLSET20=https://vault.centos.org/centos/6.10/updates/i386/Packages/binutils-devel-2.20.51.0.2-5.48.el6_10.1.i686.rpm	
	TOOLSET21=https://vault.centos.org/centos/6.10/os/i386/Packages/bison-2.4.1-5.el6.i686.rpm
	TOOLSET22=https://vault.centos.org/centos/6.10/os/i386/Packages/bison-devel-2.4.1-5.el6.i686.rpm
	TOOLSET23=https://vault.centos.org/centos/6.10/os/i386/Packages/bison-runtime-2.4.1-5.el6.i686.rpm
	TOOLSET24=https://vault.centos.org/centos/6.10/os/i386/Packages/byacc-1.9.20070509-7.el6.i686.rpm
	TOOLSET25=https://vault.centos.org/centos/6.10/os/i386/Packages/cairo-1.8.8-6.el6_6.i686.rpm
	TOOLSET26=https://vault.centos.org/centos/6.10/os/i386/Packages/cairomm-1.8.0-2.1.el6.i686.rpm
	TOOLSET27=https://vault.centos.org/centos/6.10/os/i386/Packages/cairomm-devel-1.8.0-2.1.el6.i686.rpm
	TOOLSET28=https://vault.centos.org/centos/6.10/os/i386/Packages/cloog-ppl-0.15.7-1.2.el6.i686.rpm
	TOOLSET29=https://vault.centos.org/centos/6.10/os/i386/Packages/cloog-ppl-devel-0.15.7-1.2.el6.i686.rpm
	TOOLSET30=https://vault.centos.org/centos/6.10/os/i386/Packages/cpp-4.4.7-23.el6.i686.rpm
	TOOLSET31=https://vault.centos.org/centos/6.10/os/i386/Packages/cscope-15.6-7.el6.i686.rpm
	TOOLSET32=https://vault.centos.org/centos/6.10/os/i386/Packages/ctags-5.8-2.el6.i686.rpm
	TOOLSET33=https://vault.centos.org/centos/6.10/os/i386/Packages/ctags-etags-5.8-2.el6.i686.rpm
	TOOLSET34=https://vault.centos.org/centos/6.10/os/i386/Packages/cups-1.4.2-79.el6.i686.rpm
	TOOLSET35=https://vault.centos.org/centos/6.10/os/i386/Packages/cups-devel-1.4.2-79.el6.i686.rpm
	TOOLSET36=https://vault.centos.org/centos/6.10/os/i386/Packages/cups-libs-1.4.2-79.el6.i686.rpm
	TOOLSET37=https://vault.centos.org/centos/6.10/os/i386/Packages/cups-lpd-1.4.2-79.el6.i686.rpm
	TOOLSET38=https://vault.centos.org/centos/6.10/os/i386/Packages/cups-php-1.4.2-79.el6.i686.rpm
	TOOLSET39=https://vault.centos.org/centos/6.10/os/i386/Packages/cvs-1.11.23-16.el6.i686.rpm
	TOOLSET40=https://vault.centos.org/centos/6.10/os/i386/Packages/cvs-inetd-1.11.23-16.el6.noarch.rpm
	TOOLSET41=https://vault.centos.org/centos/6.10/os/i386/Packages/diffstat-1.51-2.el6.i686.rpm
	TOOLSET42=https://vault.centos.org/centos/6.10/os/i386/Packages/doxygen-1.6.1-6.el6.i686.rpm
	TOOLSET43=https://vault.centos.org/centos/6.10/os/i386/Packages/doxygen-doxywizard-1.6.1-6.el6.i686.rpm
	TOOLSET44=https://vault.centos.org/centos/6.10/os/i386/Packages/elfutils-0.164-2.el6.i686.rpm
	TOOLSE145=https://vault.centos.org/centos/6.10/os/i386/Packages/elfutils-devel-0.164-2.el6.i686.rpm
	TOOLSET46=https://vault.centos.org/centos/6.10/os/i386/Packages/elfutils-devel-static-0.164-2.el6.i686.rpm
	TOOLSET47=https://vault.centos.org/centos/6.10/os/i386/Packages/elfutils-libelf-0.164-2.el6.i686.rpm
	TOOLSET48=https://vault.centos.org/centos/6.10/os/i386/Packages/elfutils-libelf-devel-0.164-2.el6.i686.rpm
	TOOLSET49=https://vault.centos.org/centos/6.10/os/i386/Packages/elfutils-libelf-devel-static-0.164-2.el6.i686.rpm
	TOOLSET50=https://vault.centos.org/centos/6.10/os/i386/Packages/elfutils-libs-0.164-2.el6.i686.rpm
	TOOLSET51=https://vault.centos.org/centos/6.10/os/i386/Packages/filesystem-2.4.30-3.el6.i686.rpm
	TOOLSET52=https://vault.centos.org/centos/6.10/os/i386/Packages/fontconfig-2.8.0-5.el6.i686.rpm
	TOOLSET53=https://vault.centos.org/centos/6.10/os/i386/Packages/fontconfig-devel-2.8.0-5.el6.i686.rpm
	TOOLSET54=https://vault.centos.org/centos/6.10/os/i386/Packages/flex-2.5.35-9.el6.i686.rpm
	TOOLSET55=https://vault.centos.org/centos/6.10/os/i386/Packages/flex-devel-2.5.35-9.el6.i686.rpm
	TOOLSET56=https://vault.centos.org/centos/6.10/os/i386/Packages/freetype-2.3.11-17.el6.i686.rpm
	TOOLSET57=https://vault.centos.org/centos/6.10/os/i386/Packages/freetype-demos-2.3.11-17.el6.i686.rpm
	TOOLSET58=https://vault.centos.org/centos/6.10/os/i386/Packages/freetype-devel-2.3.11-17.el6.i686.rpm
	TOOLSET59=https://vault.centos.org/centos/6.10/os/i386/Packages/gcc-4.4.7-23.el6.i686.rpm
	TOOLSET60=https://vault.centos.org/centos/6.10/os/i386/Packages/gcc-c++-4.4.7-23.el6.i686.rpm
	TOOLSET87=https://vault.centos.org/centos/6.10/os/i386/Packages/gcc-gfortran-4.4.7-23.el6.i686.rpm
	TOOLSET61=https://vault.centos.org/centos/6.10/os/i386/Packages/gcc-gnat-4.4.7-23.el6.i686.rpm
	TOOLSET62=https://vault.centos.org/centos/6.10/os/i386/Packages/gcc-java-4.4.7-23.el6.i686.rpm
	TOOLSET63=https://vault.centos.org/centos/6.10/os/i386/Packages/gcc-objc++-4.4.7-23.el6.i686.rpm
	TOOLSET64=https://vault.centos.org/centos/6.10/os/i386/Packages/gdb-7.2-92.el6.i686.rpm
	TOOLSET65=https://vault.centos.org/centos/6.10/os/i386/Packages/gdb-gdbserver-7.2-92.el6.i686.rpm
	TOOLSET66=https://vault.centos.org/centos/6.10/os/i386/Packages/gdk-pixbuf2-2.24.1-6.el6_7.i686.rpm
	TOOLSET67=https://vault.centos.org/centos/6.10/os/i386/Packages/gdk-pixbuf2-devel-2.24.1-6.el6_7.i686.rpm
	TOOLSET68=https://vault.centos.org/centos/6.10/os/i386/Packages/gettext-0.17-18.el6.i686.rpm
	TOOLSET69=https://vault.centos.org/centos/6.10/os/i386/Packages/gettext-devel-0.17-18.el6.i686.rpm
	TOOLSET70=https://vault.centos.org/centos/6.10/updates/i386/Packages/git-1.7.1-10.el6_10.i686.rpm
	TOOLSET71=https://vault.centos.org/centos/6.10/updates/i386/Packages/git-all-1.7.1-10.el6_10.noarch.rpm
	TOOLSET72=https://vault.centos.org/centos/6.10/updates/i386/Packages/git-cvs-1.7.1-10.el6_10.noarch.rpm
	TOOLSET73=https://vault.centos.org/centos/6.10/updates/i386/Packages/git-daemon-1.7.1-10.el6_10.i686.rpm
	TOOLSET74=https://vault.centos.org/centos/6.10/updates/i386/Packages/git-email-1.7.1-10.el6_10.noarch.rpm
	TOOLSET75=https://vault.centos.org/centos/6.10/updates/i386/Packages/git-gui-1.7.1-10.el6_10.noarch.rpm
	TOOLSET76=https://vault.centos.org/centos/6.10/updates/i386/Packages/git-svn-1.7.1-10.el6_10.noarch.rpm
	TOOLSET77=https://vault.centos.org/centos/6.10/updates/i386/Packages/gitk-1.7.1-10.el6_10.noarch.rpm
	TOOLSET78=https://vault.centos.org/centos/6.10/updates/i386/Packages/gitweb-1.7.1-10.el6_10.noarch.rpm
	TOOLSET79=https://vault.centos.org/centos/6.10/updates/i386/Packages/glibc-2.12-1.212.el6_10.3.i686.rpm
	TOOLSET80=https://vault.centos.org/centos/6.10/updates/i386/Packages/glibc-common-2.12-1.212.el6_10.3.i686.rpm
	TOOLSET81=https://vault.centos.org/centos/6.10/updates/i386/Packages/glibc-devel-2.12-1.212.el6_10.3.i686.rpm
	TOOLSET82=https://vault.centos.org/centos/6.10/updates/i386/Packages/glibc-headers-2.12-1.212.el6_10.3.i686.rpm
	TOOLSET83=https://vault.centos.org/centos/6.10/updates/i386/Packages/glibc-static-2.12-1.212.el6_10.3.i686.rpm
	TOOLSET84=https://vault.centos.org/centos/6.10/updates/i386/Packages/glibc-utils-2.12-1.212.el6_10.3.i686.rpm
	TOOLSET85=https://vault.centos.org/centos/6.10/os/i386/Packages/gnutls-2.12.23-22.el6.i686.rpm
	TOOLSET86=https://vault.centos.org/centos/6.10/os/i386/Packages/gnutls-devel-2.12.23-22.el6.i686.rpm
	TOOLSET87=https://vault.centos.org/centos/6.10/os/i386/Packages/gnutls-guile-2.12.23-22.el6.i686.rpm
	TOOLSET88=https://vault.centos.org/centos/6.10/os/i386/Packages/gnutls-utils-2.12.23-22.el6.i686.rpm
	TOOLSET89=https://vault.centos.org/centos/6.10/os/i386/Packages/gmp-4.3.1-13.el6.i686.rpm
	TOOLSET90=https://vault.centos.org/centos/6.10/os/i386/Packages/gmp-devel-4.3.1-13.el6.i686.rpm
	TOOLSET91=https://vault.centos.org/centos/6.10/os/i386/Packages/gmp-static-4.3.1-13.el6.i686.rpm
	TOOLSET92=https://vault.centos.org/centos/6.10/os/i386/Packages/gtk2-2.24.23-9.el6.i686.rpm
	TOOLSET93=https://vault.centos.org/centos/6.10/os/i386/Packages/gtk2-devel-2.24.23-9.el6.i686.rpm
	TOOLSET94=https://vault.centos.org/centos/6.10/os/i386/Packages/gtk2-engines-2.18.4-5.el6.centos.i686.rpm
	TOOLSET95=https://vault.centos.org/centos/6.10/os/i386/Packages/gtk2-engines-devel-2.18.4-5.el6.centos.i686.rpm
	TOOLSET96=https://vault.centos.org/centos/6.10/os/i386/Packages/gtk2-immodule-xim-2.24.23-9.el6.i686.rpm
	TOOLSET97=https://vault.centos.org/centos/6.10/os/i386/Packages/gtk2-immodules-2.24.23-9.el6.i686.rpm
	TOOLSET98=https://vault.centos.org/centos/6.10/os/i386/Packages/hicolor-icon-theme-0.11-1.1.el6.noarch.rpm
	TOOLSET99=https://vault.centos.org/centos/6.10/os/i386/Packages/indent-2.2.10-7.el6.i686.rpm
	TOOLSET100=https://vault.centos.org/centos/6.10/os/i386/Packages/info-4.13a-8.el6.i686.rpm
	TOOLSET101=https://vault.centos.org/centos/6.10/os/i386/Packages/intltool-0.41.0-1.1.el6.noarch.rpm
	TOOLSET102=https://vault.centos.org/centos/6.10/os/i386/Packages/jasper-1.900.1-22.el6.i686.rpm
	TOOLSET103=https://vault.centos.org/centos/6.10/os/i386/Packages/jasper-devel-1.900.1-22.el6.i686.rpm
	TOOLSET104=https://vault.centos.org/centos/6.10/os/i386/Packages/jasper-libs-1.900.1-22.el6.i686.rpm
	TOOLSET105=https://vault.centos.org/centos/6.10/os/i386/Packages/jasper-utils-1.900.1-22.el6.i686.rpm
	TOOLSET106=https://vault.centos.org/centos/6.10/os/i386/Packages/kernel-2.6.32-754.el6.i686.rpm
	TOOLSET107=https://vault.centos.org/centos/6.10/os/i386/Packages/kernel-abi-whitelists-2.6.32-754.el6.noarch.rpm
	TOOLSET108=https://vault.centos.org/centos/6.10/os/i386/Packages/kernel-devel-2.6.32-754.el6.i686.rpm
	TOOLSET109=https://vault.centos.org/centos/6.10/os/i386/Packages/kernel-firmware-2.6.32-754.el6.noarch.rpm
	TOOLSET110=https://vault.centos.org/centos/6.10/os/i386/Packages/kernel-headers-2.6.32-754.el6.i686.rpm
	TOOLSET159=https://vault.centos.org/centos/6.10/os/i386/Packages/kexec-tools-2.0.0-310.el6.i686.rpm
	TOOLSET111=https://vault.centos.org/centos/6.10/os/i386/Packages/kexec-tools-eppic-2.0.0-310.el6.i686.rpm
	TOOLSET112=https://vault.centos.org/centos/6.10/os/i386/Packages/libattr-2.4.44-7.el6.i686.rpm
	TOOLSET113=https://vault.centos.org/centos/6.10/os/i386/Packages/libattr-devel-2.4.44-7.el6.i686.rpm
	TOOLSET114=https://vault.centos.org/centos/6.10/os/i386/Packages/libcap-2.16-5.5.el6.i686.rpm
	TOOLSET115=https://vault.centos.org/centos/6.10/os/i386/Packages/libcap-devel-2.16-5.5.el6.i686.rpm
	TOOLSET116=https://vault.centos.org/centos/6.10/os/i386/Packages/libcap-ng-0.6.4-3.el6_0.1.i686.rpm
	TOOLSET117=https://vault.centos.org/centos/6.10/os/i386/Packages/libcap-ng-devel-0.6.4-3.el6_0.1.i686.rpm
	TOOLSET118=https://vault.centos.org/centos/6.10/os/i386/Packages/libcap-ng-python-0.6.4-3.el6_0.1.i686.rpm
	TOOLSET119=https://vault.centos.org/centos/6.10/os/i386/Packages/libcap-ng-utils-0.6.4-3.el6_0.1.i686.rpm
	TOOLSET120=https://vault.centos.org/centos/6.10/os/i386/Packages/libgcc-4.4.7-23.el6.i686.rpm
	TOOLSET121=https://vault.centos.org/centos/6.10/os/i386/Packages/libgfortran-4.4.7-23.el6.i686.rpm
	TOOLSET122=https://vault.centos.org/centos/6.10/os/i386/Packages/libgfortran4-7.2.1-1.2.1.el6.i686.rpm
	TOOLSET123=https://vault.centos.org/centos/6.10/os/i386/Packages/ncurses-5.7-4.20090207.el6.i686.rpm
	TOOLSET124=https://vault.centos.org/centos/6.10/os/i386/Packages/ncurses-base-5.7-4.20090207.el6.i686.rpm
	TOOLSET125=https://vault.centos.org/centos/6.10/os/i386/Packages/ncurses-devel-5.7-4.20090207.el6.i686.rpm
	TOOLSET126=https://vault.centos.org/centos/6.10/os/i386/Packages/ncurses-libs-5.7-4.20090207.el6.i686.rpm
	TOOLSET127=https://vault.centos.org/centos/6.10/os/i386/Packages/ncurses-static-5.7-4.20090207.el6.i686.rpm
	TOOLSET128=https://vault.centos.org/centos/6.10/os/i386/Packages/ncurses-term-5.7-4.20090207.el6.i686.rpm
	TOOLSET129=https://vault.centos.org/centos/6.10/os/i386/Packages/nspr-4.19.0-1.el6.i686.rpm
	TOOLSET130=https://vault.centos.org/centos/6.10/os/i386/Packages/nspr-devel-4.19.0-1.el6.i686.rpm
	TOOLSET131=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-3.36.0-8.el6.i686.rpm
	TOOLSET132=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-devel-3.36.0-8.el6.i686.rpm
	TOOLSET133=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-pam-ldapd-0.7.5-32.el6.i686.rpm
	TOOLSET134=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-pkcs11-devel-3.36.0-8.el6.i686.rpm
	TOOLSET135=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-softokn-3.14.3-23.3.el6_8.i686.rpm
	TOOLSET136=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-softokn-devel-3.14.3-23.3.el6_8.i686.rpm
	TOOLSET137=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-softokn-freebl-3.14.3-23.3.el6_8.i686.rpm
	TOOLSET138=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-sysinit-3.36.0-8.el6.i686.rpm
	TOOLSET139=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-tools-3.36.0-8.el6.i686.rpm
	TOOLSET140=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-util-3.36.0-1.el6.i686.rpm
	TOOLSET141=https://vault.centos.org/centos/6.10/os/i386/Packages/nss-util-devel-3.36.0-1.el6.i686.rpm
	TOOLSET142=https://vault.centos.org/centos/6.10/os/i386/Packages/nss_compat_ossl-0.9.6-2.el6_7.i686.rpm
	TOOLSET143=https://vault.centos.org/centos/6.10/os/i386/Packages/nss_compat_ossl-devel-0.9.6-2.el6_7.i686.rpm
	TOOLSET144=https://vault.centos.org/centos/6.10/os/i386/Packages/nss_db-2.2.3-0.5.pre1.el6_5.1.i686.rpm
	TOOLSET145=https://vault.centos.org/centos/6.10/os/i386/Packages/libgnat-4.4.7-23.el6.i686.rpm
	TOOLSET146=https://vault.centos.org/centos/6.10/os/i386/Packages/libgnat-devel-4.4.7-23.el6.i686.rpm
	TOOLSET147=https://vault.centos.org/centos/6.10/os/i386/Packages/libICE-1.0.6-1.el6.i686.rpm
	TOOLSET148=https://vault.centos.org/centos/6.10/os/i386/Packages/libICE-devel-1.0.6-1.el6.i686.rpm
	TOOLSET149=https://archives.fedoraproject.org/pub/archive/epel/6/i386/Packages/l/libmpc-0.8-3.el6.i686.rpm
	TOOLSET150=https://archives.fedoraproject.org/pub/archive/epel/6/i386/Packages/l/libmpc-devel-0.8-3.el6.i686.rpm
	TOOLSET151=https://vault.centos.org/centos/6.10/os/i386/Packages/libSM-1.2.1-2.el6.i686.rpm
	TOOLSET152=https://vault.centos.org/centos/6.10/os/i386/Packages/libSM-devel-1.2.1-2.el6.i686.rpm
	TOOLSET153=https://vault.centos.org/centos/6.10/os/i386/Packages/libX11-1.6.4-3.el6.i686.rpm
	TOOLSET154=https://vault.centos.org/centos/6.10/os/i386/Packages/libX11-common-1.6.4-3.el6.noarch.rpm
	TOOLSET155=https://vault.centos.org/centos/6.10/os/i386/Packages/libX11-devel-1.6.4-3.el6.i686.rpm
	TOOLSET156=https://vault.centos.org/centos/6.10/os/i386/Packages/libXau-1.0.6-4.el6.i686.rpm
	TOOLSET157=https://vault.centos.org/centos/6.10/os/i386/Packages/libXau-devel-1.0.6-4.el6.i686.rpm
	TOOLSET158=https://vault.centos.org/centos/6.10/os/i386/Packages/libXcomposite-0.4.3-4.el6.i686.rpm
	TOOLSET159=https://vault.centos.org/centos/6.10/os/i386/Packages/libXcomposite-devel-0.4.3-4.el6.i686.rpm
	TOOLSET160=https://vault.centos.org/centos/6.10/os/i386/Packages/libXcursor-1.1.14-2.1.el6.i686.rpm
	TOOLSET161=https://vault.centos.org/centos/6.10/os/i386/Packages/libXcursor-devel-1.1.14-2.1.el6.i686.rpm
	TOOLSET162=https://vault.centos.org/centos/6.10/os/i386/Packages/libXdamage-1.1.3-4.el6.i686.rpm
	TOOLSET163=https://vault.centos.org/centos/6.10/os/i386/Packages/libXdamage-devel-1.1.3-4.el6.i686.rpm
	TOOLSET164=https://vault.centos.org/centos/6.10/os/i386/Packages/libXext-1.3.3-1.el6.i686.rpm
	TOOLSET165=https://vault.centos.org/centos/6.10/os/i386/Packages/libXext-devel-1.3.3-1.el6.i686.rpm
	TOOLSET166=https://vault.centos.org/centos/6.10/os/i386/Packages/libXfixes-5.0.3-1.el6.i686.rpm
	TOOLSET167=https://vault.centos.org/centos/6.10/os/i386/Packages/libXfixes-devel-5.0.3-1.el6.i686.rpm
	TOOLSET168=https://vault.centos.org/centos/6.10/os/i386/Packages/libXft-2.3.2-1.el6.i686.rpm
	TOOLSET169=https://vault.centos.org/centos/6.10/os/i386/Packages/libXft-devel-2.3.2-1.el6.i686.rpm
	TOOLSET170=https://vault.centos.org/centos/6.10/os/i386/Packages/libXi-1.7.8-1.el6.i686.rpm
	TOOLSET171=https://vault.centos.org/centos/6.10/os/i386/Packages/libXi-devel-1.7.8-1.el6.i686.rpm
	TOOLSET172=https://vault.centos.org/centos/6.10/os/i386/Packages/libXinerama-1.1.3-2.1.el6.i686.rpm
	TOOLSET173=https://vault.centos.org/centos/6.10/os/i386/Packages/libXinerama-devel-1.1.3-2.1.el6.i686.rpm
	TOOLSET174=https://vault.centos.org/centos/6.10/os/i386/Packages/libXrandr-1.5.1-1.el6.i686.rpm
	TOOLSET175=https://vault.centos.org/centos/6.10/os/i386/Packages/libXrandr-devel-1.5.1-1.el6.i686.rpm
	TOOLSET176=https://vault.centos.org/centos/6.10/os/i386/Packages/libXrender-0.9.10-1.el6.i686.rpm
	TOOLSET177=https://vault.centos.org/centos/6.10/os/i386/Packages/libXrender-devel-0.9.10-1.el6.i686.rpm
	TOOLSET178=https://vault.centos.org/centos/6.10/os/i386/Packages/libXtst-1.2.3-1.el6.i686.rpm
	TOOLSET179=https://vault.centos.org/centos/6.10/os/i386/Packages/libXtst-devel-1.2.3-1.el6.i686.rpm
	TOOLSET180=https://vault.centos.org/centos/6.10/os/i386/Packages/libart_lgpl-2.3.20-5.1.el6.i686.rpm
	TOOLSET181=https://vault.centos.org/centos/6.10/os/i386/Packages/libart_lgpl-devel-2.3.20-5.1.el6.i686.rpm
	TOOLSET182=https://vault.centos.org/centos/6.10/os/i386/Packages/libedit-2.11-4.20080712cvs.1.el6.i686.rpm
	TOOLSET183=https://vault.centos.org/centos/6.10/os/i386/Packages/libedit-devel-2.11-4.20080712cvs.1.el6.i686.rpm
	TOOLSET184=https://vault.centos.org/centos/6.10/os/i386/Packages/libgcj-4.4.7-23.el6.i686.rpm
	TOOLSET185=https://vault.centos.org/centos/6.10/os/i386/Packages/libgcj-devel-4.4.7-23.el6.i686.rpm
	TOOLSET186=https://vault.centos.org/centos/6.10/os/i386/Packages/libgcj-src-4.4.7-23.el6.i686.rpm
	TOOLSET187=https://vault.centos.org/centos/6.10/os/i386/Packages/libgomp-4.4.7-23.el6.i686.rpm
	TOOLSET188=https://vault.centos.org/centos/6.10/os/i386/Packages/libjpeg-turbo-1.2.1-3.el6_5.i686.rpm
	TOOLSET189=https://vault.centos.org/centos/6.10/os/i386/Packages/libjpeg-turbo-devel-1.2.1-3.el6_5.i686.rpm
	TOOLSET190=https://vault.centos.org/centos/6.10/os/i386/Packages/libjpeg-turbo-static-1.2.1-3.el6_5.i686.rpm
	TOOLSET191=https://vault.centos.org/centos/6.10/os/i386/Packages/libpng-1.2.49-2.el6_7.i686.rpm
	TOOLSET192=https://vault.centos.org/centos/6.10/os/i386/Packages/libpng-devel-1.2.49-2.el6_7.i686.rpm
	TOOLSET193=https://vault.centos.org/centos/6.10/os/i386/Packages/libpng-static-1.2.49-2.el6_7.i686.rpm
	TOOLSET194=https://vault.centos.org/centos/6.10/os/i386/Packages/libproxy-0.3.0-10.el6.i686.rpm
	TOOLSET195=https://vault.centos.org/centos/6.10/os/i386/Packages/libproxy-bin-0.3.0-10.el6.i686.rpm
	TOOLSET196=https://vault.centos.org/centos/6.10/os/i386/Packages/libproxy-devel-0.3.0-10.el6.i686.rpm
	TOOLSET197=https://vault.centos.org/centos/6.10/os/i386/Packages/libthai-0.1.12-3.el6.i686.rpm
	TOOLSET198=https://vault.centos.org/centos/6.10/os/i386/Packages/libthai-devel-0.1.12-3.el6.i686.rpm
	TOOLSET199=https://vault.centos.org/centos/6.10/os/i386/Packages/libtiff-3.9.4-21.el6_8.i686.rpm
	TOOLSET200=https://vault.centos.org/centos/6.10/os/i386/Packages/libtiff-devel-3.9.4-21.el6_8.i686.rpm
	TOOLSET201=https://vault.centos.org/centos/6.10/os/i386/Packages/libtiff-static-3.9.4-21.el6_8.i686.rpm
	TOOLSET202=https://vault.centos.org/centos/6.10/os/i386/Packages/libtool-2.2.6-15.5.el6.i686.rpm
	TOOLSET203=https://vault.centos.org/centos/6.10/os/i386/Packages/libtool-ltdl-2.2.6-15.5.el6.i686.rpm
	TOOLSET204=https://vault.centos.org/centos/6.10/os/i386/Packages/libtool-ltdl-devel-2.2.6-15.5.el6.i686.rpm
	TOOLSET205=https://vault.centos.org/centos/6.10/os/i386/Packages/libstdc++-4.4.7-23.el6.i686.rpm
	TOOLSET206=https://vault.centos.org/centos/6.10/os/i386/Packages/libstdc++-devel-4.4.7-23.el6.i686.rpm
	TOOLSET207=https://vault.centos.org/centos/6.10/os/i386/Packages/libxcb-1.12-4.el6.i686.rpm
	TOOLSET208=https://vault.centos.org/centos/6.10/os/i386/Packages/libxcb-devel-1.12-4.el6.i686.rpm
	TOOLSET209=https://vault.centos.org/centos/6.10/os/i386/Packages/libxcb-python-1.12-4.el6.i686.rpm
	TOOLSET210=https://vault.centos.org/centos/6.10/os/i386/Packages/m4-1.4.13-5.el6.i686.rpm
	TOOLSET211=https://vault.centos.org/centos/6.10/os/i386/Packages/mailcap-2.1.31-2.el6.noarch.rpm
    TOOLSET212=https://vault.centos.org/centos/6.10/os/i386/Packages/make-3.81-23.el6.i686.rpm
	TOOLSET213=https://vault.centos.org/centos/6.10/os/i386/Packages/mpfr-2.4.1-6.el6.i686.rpm
	TOOLSET214=https://vault.centos.org/centos/6.10/os/i386/Packages/mpfr-devel-2.4.1-6.el6.i686.rpm
	TOOLSET215=https://vault.centos.org/centos/6.10/os/i386/Packages/neon-0.29.3-3.el6_4.i686.rpm
	TOOLSET216=https://vault.centos.org/centos/6.10/os/i386/Packages/neon-devel-0.29.3-3.el6_4.i686.rpm
	TOOLSET217=https://vault.centos.org/centos/6.10/os/i386/Packages/openssh-5.3p1-123.el6_9.i686.rpm
	TOOLSET218=https://vault.centos.org/centos/6.10/os/i386/Packages/openssh-askpass-5.3p1-123.el6_9.i686.rpm
	TOOLSET219=https://vault.centos.org/centos/6.10/os/i386/Packages/openssh-askpass-5.3p1-123.el6_9.i686.rpm
	TOOLSET220=https://vault.centos.org/centos/6.10/os/i386/Packages/openssh-clients-5.3p1-123.el6_9.i686.rpm
	TOOLSET221=https://vault.centos.org/centos/6.10/os/i386/Packages/openssh-ldap-5.3p1-123.el6_9.i686.rpm
	TOOLSET222=https://vault.centos.org/centos/6.10/os/i386/Packages/openssh-server-5.3p1-123.el6_9.i686.rpm
	TOOLSET223=https://vault.centos.org/centos/6.10/os/i386/Packages/openssl-1.0.1e-57.el6.i686.rpm
	TOOLSET224=https://vault.centos.org/centos/6.10/os/i386/Packages/openssl-devel-1.0.1e-57.el6.i686.rpm
	TOOLSET225=https://vault.centos.org/centos/6.10/os/i386/Packages/pakchois-0.4-3.2.el6.i686.rpm
	TOOLSET226=https://vault.centos.org/centos/6.10/os/i386/Packages/pakchois-devel-0.4-3.2.el6.i686.rpm
	TOOLSET227=https://vault.centos.org/centos/6.10/os/i386/Packages/pango-1.28.1-11.el6.i686.rpm
	TOOLSET228=https://vault.centos.org/centos/6.10/os/i386/Packages/pango-devel-1.28.1-11.el6.i686.rpm
	TOOLSET229=https://vault.centos.org/centos/6.10/os/i386/Packages/patch-2.6-8.el6_9.i686.rpm
	TOOLSET230=https://vault.centos.org/centos/6.10/os/i386/Packages/patchutils-0.3.1-3.1.el6.i686.rpm
	TOOLSET231=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-5.10.1-144.el6.i686.rpm
	TOOLSET232=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Compress-Raw-Bzip2-2.021-144.el6.i686.rpm
	TOOLSET233=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Compress-Raw-Zlib-2.021-144.el6.i686.rpm
	TOOLSET234=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Compress-Zlib-2.021-144.el6.i686.rpm
	TOOLSET235=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Devel-Cover-0.65-1.el6.i686.rpm
	TOOLSET236=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Devel-Cycle-1.10-3.1.el6.noarch.rpm
	TOOLSET237=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Devel-Leak-0.03-10.el6.i686.rpm
	TOOLSET238=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Devel-StackTrace-1.22-4.el6.noarch.rpm
	TOOLSET239=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Devel-Symdump-2.08-2.el6.noarch.rpm
	TOOLSET240=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Error-0.17015-4.el6.noarch.rpm
	TOOLSET241=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Git-1.7.1-9.el6_9.noarch.rpm
	TOOLSET242=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-HTML-Format-2.04-11.1.el6.noarch.rpm
	TOOLSET243=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-HTML-Parser-3.64-2.el6.i686.rpm
	TOOLSET244=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-HTML-Tagset-3.20-4.el6.noarch.rpm
	TOOLSET245=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-HTML-Tree-3.23-10.el6.noarch.rpm
	TOOLSET246=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-Compress-Base-2.021-144.el6.i686.rpm
	TOOLSET247=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-Compress-Bzip2-2.021-144.el6.i686.rpm
	TOOLSET248=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-Compress-Zlib-2.021-144.el6.i686.rpm
	TOOLSET249=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-Socket-INET6-2.56-4.el6.noarch.rpm
	TOOLSET250=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-Socket-SSL-1.31-3.el6_8.2.noarch.rpm
	TOOLSET251=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-String-1.08-9.el6.noarch.rpm
	TOOLSET252=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-Tty-1.08-4.el6.i686.rpm
	TOOLSET253=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-Zlib-1.09-144.el6.i686.rpm
	TOOLSET254=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-IO-stringy-2.110-10.1.el6.noarch.rpm
	TOOLSET255=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Module-Pluggable-3.90-144.el6.i686.rpm
	TOOLSET256=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Pod-Coverage-0.20-4.el6.noarch.rpm
	TOOLSET257=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Pod-Escapes-1.04-144.el6.i686.rpm
	TOOLSET258=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Pod-POM-0.25-2.el6.noarch.rpm
	TOOLSET259=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Pod-Simple-3.13-144.el6.i686.rpm
	TOOLSET260=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-Pod-Spell-1.01-6.1.el6.noarch.rpm
	TOOLSET261=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-URI-1.40-2.el6.noarch.rpm
	TOOLSET262=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-DOM-1.44-7.el6.noarch.rpm
	TOOLSET263=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-DOM-XPath-0.14-4.el6.noarch.rpm
	TOOLSET264=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-Dumper-0.81-8.el6.noarch.rpm
	TOOLSET265=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-Filter-BufferText-1.01-8.el6.noarch.rpm
	TOOLSET266=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-Grove-0.46alpha-40.el6.noarch.rpm
	TOOLSET267=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-LibXML-1.70-5.el6.i686.rpm
	TOOLSET268=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-LibXSLT-1.70-1.1.el6.i686.rpm
	TOOLSET269=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-NamespaceSupport-1.10-3.el6.noarch.rpm
	TOOLSET270=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-Parser-2.36-7.el6.i686.rpm
	TOOLSET271=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-RSS-1.45-2.el6.noarch.rpm
	TOOLSET272=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-RegExp-0.03-7.el6.noarch.rpm
	TOOLSET273=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-SAX-0.96-7.el6.noarch.rpm
	TOOLSET274=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-SAX-Writer-0.50-8.el6.noarch.rpm
	TOOLSET275=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-Simple-2.18-6.el6.noarch.rpm
	TOOLSET276=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-Stream-1.22-12.el6.noarch.rpm
	TOOLSET277=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-TokeParser-0.05-2.1.el6.noarch.rpm
	TOOLSET278=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-TreeBuilder-3.09-16.1.el6.noarch.rpm
	TOOLSET279=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-Twig-3.34-1.el6.noarch.rpm
	TOOLSET280=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-Writer-0.606-6.el6.noarch.rpm
	TOOLSET281=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-XPath-1.13-10.el6.noarch.rpm
	TOOLSET282=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-XML-XPathEngine-0.12-3.el6.noarch.rpm
	TOOLSET283=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-libs-5.10.1-144.el6.i686.rpm
	TOOLSET284=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-libwww-perl-5.833-5.el6.noarch.rpm
	TOOLSET285=https://vault.centos.org/centos/6.10/os/i386/Packages/perl-version-0.77-144.el6.i686.rpm
	TOOLSET286=https://vault.centos.org/centos/6.10/os/i386/Packages/pixman-0.32.8-1.el6.i686.rpm
	TOOLSET287=https://vault.centos.org/centos/6.10/os/i386/Packages/pixman-devel-0.32.8-1.el6.i686.rpm
	TOOLSET288=https://vault.centos.org/centos/6.10/os/i386/Packages/ppl-0.10.2-11.el6.i686.rpm
	TOOLSET289=https://vault.centos.org/centos/6.10/os/i386/Packages/ppl-devel-0.10.2-11.el6.i686.rpm
	TOOLSET290=https://vault.centos.org/centos/6.10/os/i386/Packages/ppl-utils-0.10.2-11.el6.i686.rpm
	TOOLSET291=https://vault.centos.org/centos/6.10/os/i386/Packages/rcs-5.7-37.el6.i686.rpm
	TOOLSET292=https://vault.centos.org/centos/6.10/os/i386/Packages/rsync-3.0.6-12.el6.i686.rpm
	TOOLSET293=https://vault.centos.org/centos/6.10/os/i386/Packages/setup-2.8.14-23.el6.noarch.rpm
	TOOLSET294=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-2.9-9.el6.i686.rpm
	TOOLSET295=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-client-2.9-9.el6.i686.rpm
	TOOLSET296=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-devel-2.9-9.el6.i686.rpm
	TOOLSET297=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-initscript-2.9-9.el6.i686.rpm
	TOOLSET298=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-runtime-2.9-9.el6.i686.rpm
	TOOLSET299=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-runtime-virtguest-2.9-9.el6.i686.rpm
	TOOLSET300=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-sdt-devel-2.9-9.el6.i686.rpm
	TOOLSET301=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-server-2.9-9.el6.i686.rpm
	TOOLSET302=https://vault.centos.org/centos/6.10/os/i386/Packages/systemtap-testsuite-2.9-9.el6.i686.rpm
	TOOLSET302=https://vault.centos.org/centos/6.10/os/i386/Packages/texinfo-4.13a-8.el6.i686.rpm
	TOOLSET304=https://vault.centos.org/centos/6.10/os/i386/Packages/texinfo-tex-4.13a-8.el6.i686.rpm
	TOOLSET305=https://vault.centos.org/centos/6.10/os/i386/Packages/tzdata-2018e-3.el6.noarch.rpm
	TOOLSET306=https://vault.centos.org/centos/6.10/os/i386/Packages/unzip-6.0-5.el6.i686.rpm
	TOOLSET307=https://vault.centos.org/centos/6.10/os/i386/Packages/xz-4.999.9-0.5.beta.20091007git.el6.i686.rpm
	TOOLSET308=https://vault.centos.org/centos/6.10/os/i386/Packages/xz-devel-4.999.9-0.5.beta.20091007git.el6.i686.rpm
	TOOLSET309=https://vault.centos.org/centos/6.10/os/i386/Packages/xz-libs-4.999.9-0.5.beta.20091007git.el6.i686.rpm
	TOOLSET310=https://vault.centos.org/centos/6.10/os/i386/Packages/xz-lzma-compat-4.999.9-0.5.beta.20091007git.el6.i686.rpm
	TOOLSET311=https://vault.centos.org/centos/6.10/os/i386/Packages/zip-3.0-1.el6_7.1.i686.rpm
	TOOLSET312=https://vault.centos.org/centos/6.10/os/i386/Packages/zlib-1.2.3-29.el6.i686.rpm	
	TOOLSET_MAX=312
fi
JOBS=$(nproc)

mkdir -p "$PREFIX"
mkdir -p "$PREFIX/bin"
mkdir -p "$PREFIXLIBDIR"
mkdir -p "$PREFIX/include"
mkdir -p "$PREFIX/share"
mkdir -p "$PREFIX/etc"
mkdir -p "$SRC"
mkdir -p "$OBJ"
export PATH=$PREFIX/bin:/usr/bin:/usr/sbin:/sbin:/bin:/usr/local/bin:/usr/local/sbin
export LD_LIBRARY_PATH="$PREFIXLIBDIR"
export CPATH="$CPATH:$PREFIX/include"
export LIBRARY_PATH="$LIBRARY_PATH:$GCC447/usr/$PREFIXLIBDIR"
export CPATH="$CPATH:$PREFIX/include"
export C_INCLUDE_PATH="$C_INCLUDE_PATH:$PREFIX/include"
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$PREFIX/include"
export PKG_CONFIG_PATH="$PREFIXLIBDIR/pkgconfig"
export CPPFLAGS="-I$PREFIX/include"
export CFLAGS="-O2 -fPIC -I$PREFIX/include"
export CXXFLAGS="-O2 -fPIC -I$PREFIX/include"
export LDFLAGS="-L$PREFIXLIBDIR -Wl,-rpath,'\$ORIGIN/..$LIBDIR'"

#je verais bien un rajout ici



mkdir -p "$PREFIX/etc/profile.d"

cat > "$PREFIX/etc/profile.d/endenv.sh" <<ENV
unset PATH
export PATH="/usr/bin:/usr/sbin:/sbin:/bin:/usr/local/bin:/usr/local/sbin"
unset SSL_CERT_FILE
unset CURL_CA_BUNDLE
unset LD_LIBRARY_PATH
unset CPATH
unset LIBRARY_PATH
unset CPATH
unset C_INCLUDE_PATH
unset CPLUS_INCLUDE_PATH
unset PKG_CONFIG_PATH
unset CPPFLAGS
unset CFLAGS
unset CXXFLAGS
unset LDFLAGS
ENV



###############################################################################
# SET VERSION
###############################################################################

ZLIB_VERSION=1.3.2
M4_VERSION=1.4.19
AUTOCONF_VERSION=2.69
AUTOMAKE_VERSION=1.14.1
LIBTOOL_VERSION=2.4.6
BINUTILS_VERSION=2.31
PERL_VERSION=5.10.0
PERL_VERSION_URL="${PERL_VERSION%.*}"
GMP1_VERSION=5.1.3
MPFR1_VERSION=3.1.2
MPC1_VERSION=1.0.2
XZ_VERSION=5.8.3
GCC1_VERSION=4.8.5
BZIP2_VERSION=1.0.8
GZIP_VERSION=1.14
MAKE_VERSION=4.4.1
TAR_VERSION=1.35
WGET_VERSION=1.21.4
OPENSSL_VERSION=1.1.1w
COREUTILS_VERSION=8.32
BASH_VERSION=4.4.23
GLIBC_VERSION=2.12.2
LINUX_VERSION=2.6.32
PATCH_VERSION=2.7.6
ZSTD_VERSION=1.5.7
OPENSSL_VERSION_URL="${OPENSSL_VERSION//./_}"
LINUX_VERSION_URL="${LINUX_VERSION%.*}"
TEXINFO_VERSION=6.8


###############################################################################
# SET URL
###############################################################################

CA_URL=https://curl.se/ca/cacert.pem
ZLIB_URL=https://zlib.net/fossils/zlib-$ZLIB_VERSION.tar.gz
M4_URL=https://mirrors.kernel.org/gnu//m4/m4-$M4_VERSION.tar.xz
AUTOCONF_URL=https://mirrors.kernel.org/gnu/autoconf/autoconf-$AUTOCONF_VERSION.tar.xz
AUTOMAKE_URL=https://mirrors.kernel.org/gnu//automake/automake-$AUTOMAKE_VERSION.tar.xz
LIBTOOL_URL=https://mirrors.kernel.org/gnu/libtool/libtool-$LIBTOOL_VERSION.tar.xz
BINUTILS_URL=https://mirrors.kernel.org/gnu/binutils/binutils-$BINUTILS_VERSION.tar.bz2
PERL_URL=https://www.cpan.org/src/$PERL_VERSION_URL/perl-$PERL_VERSION.tar.gz
GMP1_URL=https://mirrors.kernel.org/gnu/gmp/gmp-$GMP1_VERSION.tar.bz2
MPFR1_URL=https://www.mpfr.org/mpfr-$MPFR1_VERSION/mpfr-$MPFR1_VERSION.tar.bz2
MPC1_URL=https://mirrors.kernel.org/gnu/mpc/mpc-$MPC1_VERSION.tar.gz
XZ_URL=https://sourceforge.net/projects/lzmautils/files/xz-$XZ_VERSION.tar.gz
GCC1_URL=https://mirrors.kernel.org/gnu/gcc/gcc-$GCC1_VERSION/gcc-$GCC1_VERSION.tar.bz2
BZIP2_URL=https://sourceware.org/pub/bzip2/bzip2-$BZIP2_VERSION.tar.gz
GZIP_URL=https://mirrors.kernel.org/gnu/gzip/gzip-$GZIP_VERSION.tar.xz
MAKE_URL=https://mirrors.kernel.org/gnu/make/make-$MAKE_VERSION.tar.gz
TAR_URL=https://mirrors.kernel.org/gnu/tar/tar-$TAR_VERSION.tar.xz
WGET_URL=https://mirrors.kernel.org/gnu/wget/wget-$WGET_VERSION.tar.gz
OPENSSL_URL=https://github.com/openssl/openssl/releases/download/OpenSSL_$OPENSSL_VERSION_URL/openssl-$OPENSSL_VERSION.tar.gz
COREUTILS_URL=https://mirrors.kernel.org/gnu/coreutils/coreutils-$COREUTILS_VERSION.tar.xz
BASH_URL=https://source.ipfire.org/source-2.x/bash-$BASH_VERSION.tar.gz
GLIBC_URL=https://mirrors.kernel.org/gnu/glibc/glibc-$GLIBC_VERSION.tar.gz
LINUX_URL=https://cdn.kernel.org/pub/linux/kernel/v$LINUX_VERSION_URL/linux-$LINUX_VERSION.tar.xz
PATCH_URL=https://mirrors.kernel.org/gnu/patch/patch-$PATCH_VERSION.tar.xz
ZSTD_URL=https://github.com/facebook/zstd/releases/download/v$ZSTD_VERSION/zstd-$ZSTD_VERSION.tar.gz
TEXINFO_URL=https://mirrors.kernel.org/gnu/texinfo/texinfo-$TEXINFO_VERSION.tar.xz
ZLIB_FILE="${ZLIB_URL##*/}"
XZ_FILE="${XZ_URL##*/}"
ZSTD_FILE="${ZSTD_URL##*/}"
BZIP2_FILE="${BZIP2_URL##*/}"
GZIP_FILE="${GZIP_URL##*/}"
TAR_FILE="${TAR_URL##*/}"
ZLIB_TAR="${ZLIB_FILE%.gz}"
XZ_TAR="${XZ_FILE%.gz}"
ZSTD_TAR="${ZSTD_FILE%.gz}"
BZIP2_TAR="${BZIP2_FILE%.gz}"
GZIP_TAR="${GZIP_FILE%.gz}"
TAR_TAR="${TAR_FILE%.xz}"

###############################################################################
# INSTALL BASE P7ZIP                                                    #
###############################################################################


mkdir -p "$PREFIX/bin" "$PREFIX/libexec/p7zip/"

cat > "$PREFIX/bin/7z" <<PZIP
#!/bin/bash
"$PREFIX/libexec/p7zip/7z" "\$@"
PZIP

cat > "$PREFIX/bin/7za" <<PZIPA
#!/bin/bash
"$PREFIX/libexec/p7zip/7za" "\$@"
PZIPA
downloaddirectory $P7ZIP3 "$PREFIX/libexec/p7zip/7z"
downloaddirectory $P7ZIP4 "$PREFIX/libexec/p7zip/7z.so"
downloaddirectory $P7ZIP5 "$PREFIX/libexec/p7zip/7zCon.sfx"
downloaddirectory $P7ZIP6 "$PREFIX/libexec/p7zip/7za"
chmod +x "$PREFIX/bin/7z"
chmod +x "$PREFIX/bin/7za"
chmod +x "$PREFIX/libexec/p7zip/7z"
chmod +x "$PREFIX/libexec/p7zip/7z.so"
chmod +x "$PREFIX/libexec/p7zip/7zCon.sfx"
chmod +x "$PREFIX/libexec/p7zip/7za"

###############################################################################
# INSTALL BASE GGC TOOLSET                                                    #
###############################################################################
rm -rf $GCC447
mkdir -p $GCC447
cd $GCC447

for i in $(seq 1 "$TOOLSET_MAX"); do
    eval URL=\$TOOLSET$i

    if [ -n "$URL" ]; then
		RPM_NAME="${URL##*/}"
        CPIO_NAME="${RPM_NAME%.rpm}.cpio"
		downloaddirectory "$URL" "$GCC447/$RPM_NAME"
		"$PREFIX/bin/7z" x -aoa "$RPM_NAME"
        "$PREFIX/bin/7z" x -aoa "$CPIO_NAME"
		rm -f "$RPM_NAME" "$CPIO_NAME"
	fi
done
#exit
#bash-4.1# ls gcc-4.4.7-portable/lib
#cpp			 libasound.so.2      libcap.so.2       libfreeblpriv3.chk	     libnsl-2.12.so	    libnss_files.so.2	    libpthread-2.12.so	 libutil-2.12.so
#firmware		 libasound.so.2.0.0  libcap.so.2.16    libfreeblpriv3.so	     libnsl.so.1	    libnss_hesiod-2.12.so   libpthread.so.0	 libutil.so.1
#i686			 libattr.so	     libcidn-2.12.so   libgcc_s-4.4.7-20120601.so.1  libnspr4.so	    libnss_hesiod.so.2	    libresolv-2.12.so	 libz.so.1
#ld-2.12.so		 libattr.so.1	     libcidn.so.1      libgcc_s.so.1		     libnss_compat-2.12.so  libnss_ldap.so.2	    libresolv.so.2	 libz.so.1.2.3
#ld-linux.so.2		 libattr.so.1.1.0    libcrypt-2.12.so  libm-2.12.so		     libnss_compat.so.2     libnss_nis-2.12.so	    librt-2.12.so	 modules
#libBrokenLocale-2.12.so  libc-2.12.so	     libcrypt.so.1     libm.so.6		     libnss_db-2.2.3.so     libnss_nis.so.2	    librt.so.1		 rtkaio
#libBrokenLocale.so.1	 libc.so.6	     libdl-2.12.so     libncurses.so.5		     libnss_db.so.2	    libnss_nisplus-2.12.so  libthread_db-1.0.so  security
#libSegFault.so		 libcap-ng.so.0      libdl.so.2        libncurses.so.5.7	     libnss_dns-2.12.so     libnss_nisplus.so.2     libthread_db.so.1	 terminfo
#libanl-2.12.so		 libcap-ng.so.0.0.0  libfreebl3.chk    libncursesw.so.5		     libnss_dns.so.2	    libplc4.so		    libtinfo.so.5	 udev
#libanl.so.1		 libcap.so	     libfreebl3.so     libncursesw.so.5.7	     libnss_files-2.12.so   libplds4.so		    libtinfo.so.5.7
#
#bash-4.1# ls gcc-4.4.7-portable/lib64
#ld-2.12.so		 libattr.so.1	     libcidn.so.1		   libgcc_s.so.1       libnss_compat-2.12.so  libnss_ldap.so.2	      libresolv.so.2	   libz.so.1.2.3
#ld-linux-x86-64.so.2	 libattr.so.1.1.0    libcrypt-2.12.so		   libm-2.12.so        libnss_compat.so.2     libnss_nis-2.12.so      librt-2.12.so	   rtkaio
#libBrokenLocale-2.12.so  libc-2.12.so	     libcrypt.so.1		   libm.so.6	       libnss_db-2.2.3.so     libnss_nis.so.2	      librt.so.1	   security
#libBrokenLocale.so.1	 libc.so.6	     libdl-2.12.so		   libncurses.so.5     libnss_db.so.2	      libnss_nisplus-2.12.so  libthread_db-1.0.so  tls
#libSegFault.so		 libcap-ng.so.0      libdl.so.2			   libncurses.so.5.7   libnss_dns-2.12.so     libnss_nisplus.so.2     libthread_db.so.1
#libanl-2.12.so		 libcap-ng.so.0.0.0  libfreebl3.chk		   libncursesw.so.5    libnss_dns.so.2	      libplc4.so	      libtinfo.so.5
#libanl.so.1		 libcap.so	     libfreebl3.so		   libncursesw.so.5.7  libnss_files-2.12.so   libplds4.so	      libtinfo.so.5.7
#libasound.so.2		 libcap.so.2	     libfreeblpriv3.chk		   libnsl-2.12.so      libnss_files.so.2      libpthread-2.12.so      libutil-2.12.so
#libasound.so.2.0.0	 libcap.so.2.16      libfreeblpriv3.so		   libnsl.so.1	       libnss_hesiod-2.12.so  libpthread.so.0	      libutil.so.1
#libattr.so		 libcidn-2.12.so     libgcc_s-4.4.7-20120601.so.1  libnspr4.so	       libnss_hesiod.so.2     libresolv-2.12.so       libz.so.1


rm -f "$GCC447/usr/$LIBDIR/libasound.so.2"
ln -s "$GCC447/usr/$LIBDIR/libasound.so.2.0.0" "$GCC447/usr/$LIBDIR2/libasound.so.2"
rm -f "$GCC447/usr/$LIBDIR2/libasound.so.2"
ln -s "$GCC447/usr/$LIBDIR2/libasound.so.2.0.0" "$GCC447/usr/$LIBDIR2/libasound.so.2"
rm -f "$GCC447/usr/$LIBDIR/libattr.so"
ln -s "$GCC447/usr/$LIBDIR/libattr.so.1.1.0" "$GCC447/usr/$LIBDIR/libattr.so"
rm -f "$GCC447/usr/$LIBDIR2/libattr.so"
ln -s "$GCC447/usr/$LIBDIR2/libattr.so.1.1.0" "$GCC447/usr/$LIBDIR2/libattr.so"
rm -f "$GCC447/usr/$LIBDIR/libattr.so.1"
ln -s "$GCC447/usr/$LIBDIR/libattr.so.1.1.0" "$GCC447/usr/$LIBDIR/libattr.so.1"
rm -f "$GCC447/usr/$LIBDIR2/libattr.so.1"
ln -s "$GCC447/usr/$LIBDIR2/libattr.so.1.1.0" "$GCC447/usr/$LIBDIR2/libattr.so.1"
rm -f "$GCC447/usr/$LIBDIR/libc.so.6"
ln -s "$GCC447/usr/$LIBDIR/libc-2.12.so" "$GCC447/usr/$LIBDIR/libc.so.6"
rm -f "$GCC447/usr/$LIBDIR2/libc.so.6"
ln -s "$GCC447/usr/$LIBDIR2/libc-2.12.so" "$GCC447/usr/$LIBDIR2/libc.so.6"
rm -f "$GCC447/usr/$LIBDIR/libcap-ng.so.0"
ln -s "$GCC447/usr/$LIBDIR/libcap-ng.so.0.0.0" "$GCC447/usr/$LIBDIR/libcap-ng.so.0"
rm -f "$GCC447/usr/$LIBDIR2/libcap-ng.so.0"
ln -s "$GCC447/usr/$LIBDIR2/libcap-ng.so.0.0.0" "$GCC447/usr/$LIBDIR2/libcap-ng.so.0"
rm -f "$GCC447/usr/$LIBDIR/libcap.so"
ln -s "$GCC447/usr/$LIBDIR/libcap.so.2.16" "$GCC447/usr/$LIBDIR/libcap.so"
rm -f "$GCC447/usr/$LIBDIR2/libcap.so"
ln -s "$GCC447/usr/$LIBDIR2/libcap.so.2.16" "$GCC447/usr/$LIBDIR2/libcap.so"
rm -f "$GCC447/usr/$LIBDIR/libcap.so.2"
ln -s "$GCC447/usr/$LIBDIR/libcap.so.2.16" "$GCC447/usr/$LIBDIR/libcap.so.2"
rm -f "$GCC447/usr/$LIBDIR2/libcap.so.2"
ln -s "$GCC447/usr/$LIBDIR2/libcap.so.2.16" "$GCC447/usr/$LIBDIR2/libcap.so.2"
rm -f "$GCC447/usr/$LIBDIR/libcidn.so.1"
ln -s "$GCC447/usr/$LIBDIR/libcidn-2.12.so" "$GCC447/usr/$LIBDIR/libcidn.so.1"
rm -f "$GCC447/usr/$LIBDIR2/libcidn.so.1"
ln -s "$GCC447/usr/$LIBDIR2/libcidn-2.12.so" "$GCC447/usr/$LIBDIR2/libcidn.so.1"
rm -f "$GCC447/usr/$LIBDIR/libcrypt.so.1"
ln -s "$GCC447/usr/$LIBDIR/libcrypt-2.12.so" "$GCC447/usr/$LIBDIR/libcrypt.so.1"
rm -f "$GCC447/usr/$LIBDIR2/libcrypt.so.1"
ln -s "$GCC447/usr/$LIBDIR2/libcrypt-2.12.so" "$GCC447/usr/$LIBDIR2/libcrypt.so.1"
rm -f "$GCC447/usr/$LIBDIR/libmpfr.so.1"
ln -s "$GCC447/usr/$LIBDIR/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR/libmpfr.so.1"
rm -f "$GCC447/usr/$LIBDIR/libopcodes.so"
ln -s "$GCC447/usr/$LIBDIR/libopcodes-2.20.51.0.2-5.48.el6_10.1.so" "$GCC447/usr/$LIBDIR/libopcodes.so"
rm -f "$GCC447/usr/$LIBDIR/libstdc++.so.6"
ln -s "$GCC447/usr/$LIBDIR/libstdc++.so.6.0.13" "$GCC447/usr/$LIBDIR/libstdc++.so.6"
rm -f "$GCC447/usr/$LIBDIR/libmp.so.3"
ln -s "$GCC447/usr/$LIBDIR/libmp.so.3.1.14" "$GCC447/usr/$LIBDIR/libmp.so.3"
rm -f "$GCC447/usr/$LIBDIR/libmpc.so"
ln -s "$GCC447/usr/$LIBDIR/libmpc.so.2.0.0" "$GCC447/usr/$LIBDIR/libmpc.so"
rm -f "$GCC447/usr/$LIBDIR/libmpc.so.2"
ln -s "$GCC447/usr/$LIBDIR/libmpc.so.2.0.0" "$GCC447/usr/$LIBDIR/libmpc.so.2"
rm -f "$GCC447/usr/$LIBDIR/libmpfr.so"
ln -s "$GCC447/usr/$LIBDIR/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR/libmpfr.so"
rm -f "$GCC447/usr/$LIBDIR/libmpfr.so.1"
ln -s "$GCC447/usr/$LIBDIR/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR/libmpfr.so.1"
rm -f "$GCC447/usr/$LIBDIR/libopcodes.so"
ln -s "$GCC447/usr/$LIBDIR/libopcodes-2.20.51.0.2-5.48.el6_10.1.so" "$GCC447/usr/$LIBDIR/libopcodes.so"
rm -f "$GCC447/usr/$LIBDIR/libstdc++.so.6"
ln -s "$GCC447/usr/$LIBDIR/libstdc++.so.6.0.13" "$GCC447/usr/$LIBDIR/libstdc++.so.6"
rm -f "$GCC447/usr/$LIBDIR/libmp.so.3"
ln -s "$GCC447/usr/$LIBDIR/libmp.so.3.1.14" "$GCC447/usr/$LIBDIR/libmp.so.3"
rm -f "$GCC447/usr/$LIBDIR/libmpc.so"
ln -s "$GCC447/usr/$LIBDIR/libmpc.so.2.0.0" "$GCC447/usr/$LIBDIR/libmpc.so"
rm -f "$GCC447/usr/$LIBDIR/libmpc.so.2"
ln -s "$GCC447/usr/$LIBDIR/libmpc.so.2.0.0" "$GCC447/usr/$LIBDIR/libmpc.so.2"
rm -f "$GCC447/usr/$LIBDIR/libmpfr.so"
ln -s "$GCC447/usr/$LIBDIR/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR/libmpfr.so"
rm -f "$GCC447/usr/$LIBDIR/libmpfr.so.1"
ln -s "$GCC447/usr/$LIBDIR/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR/libmpfr.so.1"
rm -f "$GCC447/usr/$LIBDIR/libopcodes.so"
ln -s "$GCC447/usr/$LIBDIR/libopcodes-2.20.51.0.2-5.48.el6_10.1.so" "$GCC447/usr/$LIBDIR/libopcodes.so"
rm -f "$GCC447/usr/$LIBDIR/libstdc++.so.6"
ln -s "$GCC447/usr/$LIBDIR/libstdc++.so.6.0.13" "$GCC447/usr/$LIBDIR/libstdc++.so.6"
rm -f "$GCC447/usr/$LIBDIR2/libmpfr.so.1"
ln -s "$GCC447/usr/$LIBDIR2/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR2/libmpfr.so.1"
rm -f "$GCC447/usr/$LIBDIR2/libopcodes.so"
ln -s "$GCC447/usr/$LIBDIR2/libopcodes-2.20.51.0.2-5.48.el6_10.1.so" "$GCC447/usr/$LIBDIR2/libopcodes.so"
rm -f "$GCC447/usr/$LIBDIR2/libstdc++.so.6"
ln -s "$GCC447/usr/$LIBDIR2/libstdc++.so.6.0.13" "$GCC447/usr/$LIBDIR2/libstdc++.so.6"
rm -f "$GCC447/usr/$LIBDIR2/libmp.so.3"
ln -s "$GCC447/usr/$LIBDIR2/libmp.so.3.1.14" "$GCC447/usr/$LIBDIR2/libmp.so.3"
rm -f "$GCC447/usr/$LIBDIR2/libmpc.so"
ln -s "$GCC447/usr/$LIBDIR2/libmpc.so.2.0.0" "$GCC447/usr/$LIBDIR2/libmpc.so"
rm -f "$GCC447/usr/$LIBDIR2/libmpc.so.2"
ln -s "$GCC447/usr/$LIBDIR2/libmpc.so.2.0.0" "$GCC447/usr/$LIBDIR2/libmpc.so.2"
rm -f "$GCC447/usr/$LIBDIR2/libmpfr.so"
ln -s "$GCC447/usr/$LIBDIR2/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR2/libmpfr.so"
rm -f "$GCC447/usr/$LIBDIR2/libmpfr.so.1"
ln -s "$GCC447/usr/$LIBDIR2/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR2/libmpfr.so.1"
rm -f "$GCC447/usr/$LIBDIR2/libopcodes.so"
ln -s "$GCC447/usr/$LIBDIR2/libopcodes-2.20.51.0.2-5.48.el6_10.1.so" "$GCC447/usr/$LIBDIR2/libopcodes.so"
rm -f "$GCC447/usr/$LIBDIR2/libstdc++.so.6"
ln -s "$GCC447/usr/$LIBDIR2/libstdc++.so.6.0.13" "$GCC447/usr/$LIBDIR2/libstdc++.so.6"
rm -f "$GCC447/usr/$LIBDIR2/libmp.so.3"
ln -s "$GCC447/usr/$LIBDIR2/libmp.so.3.1.14" "$GCC447/usr/$LIBDIR2/libmp.so.3"
rm -f "$GCC447/usr/$LIBDIR2/libmpc.so"
ln -s "$GCC447/usr/$LIBDIR2/libmpc.so.2.0.0" "$GCC447/usr/$LIBDIR2/libmpc.so"
rm -f "$GCC447/usr/$LIBDIR2/libmpc.so.2"
ln -s "$GCC447/usr/$LIBDIR2/libmpc.so.2.0.0" "$GCC447/usr/$LIBDIR2/libmpc.so.2"
rm -f "$GCC447/usr/$LIBDIR2/libmpfr.so"
ln -s "$GCC447/usr/$LIBDIR2/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR2/libmpfr.so"
rm -f "$GCC447/usr/$LIBDIR2/libmpfr.so.1"
ln -s "$GCC447/usr/$LIBDIR2/libmpfr.so.1.2.0" "$GCC447/usr/$LIBDIR1/libmpfr.so.1"
rm -f "$GCC447/usr/$LIBDIR2/libopcodes.so"
ln -s "$GCC447/usr/$LIBDIR2/libopcodes-2.20.51.0.2-5.48.el6_10.1.so" "$GCC447/usr/$LIBDIR2/libopcodes.so"
rm -f "$GCC447/usr/$LIBDIR2/libstdc++.so.6"
ln -s "$GCC447/usr/$LIBDIR2/libstdc++.so.6.0.13" "$GCC447/usr/$LIBDIR2/libstdc++.so.6"
export PATH=$PATH:$GCC447/usr/bin:$GCC447/usr/sbin:$GCC447/sbin:$GCC447/bin
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GCC447/usr/$LIBDIR"
export CPATH="$CPATH:$GCC447/usr/include"
export LIBRARY_PATH="$LIBRARY_PATH:$GCC447/usr/$LIBDIR"
export CPATH="$CPATH:$GCC447/usr/include"
export C_INCLUDE_PATH="$C_INCLUDE_PATH:$GCC447/usr/include"
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$GCC447/usr/include"
export CC="$GCC447/usr/bin/gcc"
export CXX="$GCC447/usr/bin/g++"
find "$GCC447/usr/bin" "$GCC447/usr/sbin" "$GCC447/sbin" "$GCC447/usr/libexec" -type f -exec chmod +x {} \; 2>/dev/null
