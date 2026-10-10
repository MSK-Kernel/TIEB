#/bin/sh

printf "Make sure you place YOUR TanjaOS LiveCD ISO in this directory and make sure you name it 'livecd.iso'."
echo && echo
printf "Press ENTER to continue"
read dummy

cp -rf livecd.iso rootfs/etc/install.iso
mkdir -p output/rootfs
cd rootfs
find . -print0 | cpio --null --create --verbose --format=newc | gzip -9 > ../output/rootfs/installer.cpio.gz
cd ..

echo "[INFO] Installer ready at output/rootfs/installer.cpio.gz"
