#!/bin/sh

_RAM=2
_DISK=/dev/sda

echo "Retriving disk information"

_TSIZE_MiB=$(parted $_DISK unit MiB print | grep "Disk $_DISK:" | awk '{print $3}')

echo "Disk total size: $_TSIZE_MiB"

_win_gb=60
_win_MiB=$(($_win_gb*1024))
_gnu_gb=50
_gnu_MiB=$(($_gnu_gb*1024))
_swap_gb=$(($_RAM*2))
_swap_MiB=$(($_swap_gb*1024))
_rec_gb=20
_rec_MiB=$(($_rec_gb*1024))

_TSIZE=$(echo "$_TSIZE_MiB" | sed -r 's/[A-Za-z]+//')

_static_gb=$(($_swap_gb+$_win_gb+$_gnu_gb+$_rec_gb))
_static_MiB=$(($_static_gb*1024))
_data_MiB=$(($_TSIZE-$_static_MiB))
_data_gb=$(($_data_MiB/1024))

_ext_MiB=$(($_swap_MiB+$_data_MiB))

echo "PARTITIONS TO MAKE"
echo "[ WIN ${_win_gb}GB ][ GNU ${_gnu_gb}GB ][[ SWAP ${_swap_gb}GB ][ DATA ${_data_gb}GB ]][ RECOVERY 20GB]"

echo ""
echo "Creating the partition table"
parted --script ${_DISK} mktable msdos
echo ""

# OS partition
_from=1
_to=$(($_from+$_win_MiB))
echo "${_DISK}1: primary ntfs WIN $_from $_to"
parted -a cylinder ${_DISK} --script -- unit MiB mkpart primary ntfs $_from $_to
mkfs.ntfs -L WIN -Q ${_DISK}1
echo ""

_from=$(($_to+1))
_to=$(($_from+$_gnu_MiB))
echo "${_DISK}2: primary ext4 GNU $_from $_to"
parted -a cylinder ${_DISK} --script -- unit MiB mkpart primary ext4 $_from $_to
mkfs.ext4 -L GNU ${_DISK}2
echo ""

# save logical pionts
_from_l=$(($_to+1))

_from=$(($_to+1))
_to=$(($_from+$_ext_MiB))
_to_e=$(($_from+$_ext_MiB))
echo "${_DISK}3: extended $_from $_to"
parted -a cylinder ${_DISK} --script -- unit MiB mkpart extended $_from $_to
echo ""

# save point for recovery partition
_from_r=$(($_to+1))
_to_r=$(($_from_r+$_rec_MiB))


# logical partition
_from=$_from_l
_to=$(($_from+$_swap_MiB))
echo "${_DISK}4: logical linux-swap SWAP $_from $_to"
parted -a cylinder ${_DISK} --script -- unit MiB mkpart logical linux-swap $_from $_to
mkswap -L SWAP ${_DISK}5
echo ""

_from=$(($_to+1))
_to=$(($_from+$_data_MiB))
echo "${_DISK}5: logical ntfs DATA $_from $_to_e"
parted -a cylinder ${_DISK} --script -- unit MiB mkpart logical ntfs $_from $_to_e
mkfs.ntfs -L DATA -Q ${_DISK}6
echo ""

# recovery partition
echo "${_DISK}6: primary ext4 RECOVERY $_from_r $_TSIZE"
parted ${_DISK} --script -- unit MiB mkpart primary ext4 $_from_r $_TSIZE
parted ${_DISK} --script set 4 boot on
mkfs.ext4 -L RECOVERY ${_DISK}4
echo ""
