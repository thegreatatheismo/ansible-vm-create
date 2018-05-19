auth  --useshadow  --enablemd5
bootloader --location=mbr
zerombr
clearpart --all --initlabel
text
firewall --enabled --port=22:tcp
firstboot --disable
keyboard us
network --device ens3 --bootproto static --ip 10.1.1.2 --netmask 255.255.255.0 --gateway 10.1.1.1 --nameserver 10.1.1.53 --hostname satellite.example.com
lang en_US
logging --level=info
url --url=http://example.com/media/x86_64/rhel7.4/
reboot
## Hashed root password goes here
rootpw --iscrypted "{{ secret_rootpw }}"
selinux --enforcing
skipx
timezone  Australia/Sydney
install
part / --fstype="xfs" --size=20000
part /var/lib/mongodb --fstype="xfs" --size=50000
part /var/lib/pgsql --fstype="xfs" --size=15000
part /var/lib/pulp --fstype="xfs" --size=200000 --grow
part /var/cache/pulp --fstype="xfs" --size=15000
part /var/log --fstype="xfs" --size=1024
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
