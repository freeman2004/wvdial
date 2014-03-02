2014/02/18
1.
pppd/pathnames.h
#define _PATH_PEERFILES| _ROOT_PATH "/home/freeman/test/test1/wvdial/X86/ubuntu10.04/OBJ/etc/ppp/peers/"

make clean 
make 
make install

2.
wvdial-1.61/wvpapchap.h
#define PAP_SECRETS"/etc/ppp/pap-secrets"
#define CHAP_SECRETS"/etc/ppp/chap-secrets"

wvdial-1.61/wvdialer.cc
{ "PPPD Path",       &options.where_pppd,   NULL, "/usr/sbin/pppd", 0 },

make 
make insatall

3.
sudo chown root:dialout pppd
sudo chmod 6755 pppd
-rwsr-sr-x  1 root    dialout 255756 2014-02-18 11:45 pppd*

2014/02/17
1. New ubuntu 10.04 system
Please install following command.
sudo apt-get install build-essential

