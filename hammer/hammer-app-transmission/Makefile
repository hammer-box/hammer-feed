#
# Copyright (C) 2012-2012 OpenConcept Solutions limited
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk
PKG_NAME:=hammer-app-transmission
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-transmission
  SECTION:=system
  CATEGORY:=H.A.M.M.E.R
  TITLE:=transmission support
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+hammer-app-hd +luci-app-transmission
endef
define Build/Compile 

endef
define Build/Prepare

endef
define Package/hammer-app-transmission/description
Use your hammer with transmission
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
define Package/hammer-app-transmission/conffiles
	/etc/config/transmission
endef
define Package/hammer-app-transmission/postinst
#!/bin/bash
#if [ -z "$${IPKG_INSTROOT}" ]
#then
#	uci set transmisson
#fi
endef
define Package/hammer-app-transmission/install

endef
$(eval $(call BuildPackage,hammer-app-transmission))
