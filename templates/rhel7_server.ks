auth  --useshadow  --enablemd5
bootloader --location=mbr
zerombr
clearpart --all --initlabel
text
firewall --enabled --port=22:tcp
firstboot --disable
keyboard us
network --device ens3 --bootproto dhcp
lang en_US
logging --level=info
url --url=http://example.com/pub/media/x86_64/rhel7.4/
reboot
## Add hashed root password here 
rootpw --iscrypted "{{ secret_rootpw }}" 
selinux --enforcing
skipx
timezone  Australia/Sydney
install
part / --fstype="xfs" --size=20000
#part / --fstype="xfs" --size=20000 --grow
part swap --recommended
%packages
@core
#--nobase
%end
%post
( 
echo 'IPV6INIT=no' >> /etc/sysconfig/network
echo 'install ipv6 /bin/true' >> /etc/modprobe.conf
) 1>/root/post_install.log 2>&1
%end
