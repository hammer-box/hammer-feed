#
# Copyright (C) 2012-2012 OpenConcept Solutions limited
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk
PKG_NAME:=hammer-app-hd
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-hd
  SECTION:=audio
  CATEGORY:=H.A.M.M.E.R
  TITLE:=Enables audio on for your H.A.M.M.E.R
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+hammer-app-base +kmod-usb2 +kmod-usb-storage-extras +kmod-usb-storage +kmod-usb-ohci +kmod-ide-core +kmod-ledtrig-usbdev \
+usbutils +kmod-usb-core +hotplug2 +blkid +kmod-fs-ext4 +e2fsprogs +kmod-scsi-core +kmod-scsi-generic +bash +kmod-fs-vfat +kmod-fs-msdos +sfdisk +fdisk +coreutils-dd +tar +swap-utils +smartd +smartmontools +kmod-fuse +tune2fs
endef
define Build/Compile 

endef
define Build/Prepare

endef
define Package/hammer-app-hd/description
Audio for hammer
endef
## Install
# macro commands Commands for creating directories
# INSTALL_DIR 
# install -d -m0755
# INSTALL_BIN 
# install -m0755
# INSTALL_DATA 
# install -m0644
# INSTALL_CONF 
# install -m0600
#
##
define Package/hammer-app-hd/conffiles
	/etc/config/hammer-app-hd
endef
define Package/hammer-app-hd/install
	$(INSTALL_DIR)  $(1)/etc/config
	$(INSTALL_DIR) $(1)/usr/lib/hammer/bash
	$(INSTALL_DIR) $(1)/usr/share/hd-layouts
	$(INSTALL_DATA) ./files/usr/lib/hammer/bash/hd.functions $(1)/usr/lib/hammer/bash/
	$(INSTALL_DATA) ./files/usr/share/hd-layouts/mbr.250.bin $(1)/usr/share/hd-layouts/
	$(INSTALL_DATA) ./files/usr/share/hd-layouts/extended.250GB.sf $(1)/usr/share/hd-layouts/
	$(INSTALL_CONF) ./files/etc/config/hammer-app-hd $(1)/etc/config/
endef
$(eval $(call BuildPackage,hammer-app-hd))
