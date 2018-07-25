echo "==> Installing VBoxLinuxAdditions <=="
mount -t iso9660 /dev/sr1 /media/cdrom
sh /media/cdrom/VBoxLinuxAdditions.run --nox11
umount /media/cdrom
echo "==> VBoxLinuxAdditions installed <=="
echo "==> Configuring ssh for vagrant <=="
cd /home/vagrant/
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
-O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
echo "==> ssh for vagrant configured <=="
echo "==> Cleaning up installation  <=="
apt-get -y autoremove
apt-get -y clean
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync
echo "==> Cleaning up finished  <=="
