#
# Copyright (C) 2012-2012 OpenConcept Solutions limited
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk
PKG_NAME:=hammer-app-tor-exitnodes
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-tor-exitnodes
  SECTION:=networking
  CATEGORY:=H.A.M.M.E.R
  TITLE:=Exit node configurations 
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+hammer-app-tor 
endef
define Build/Compile 

endef
define Build/Prepare

endef
define Package/hammer-app-tor-exitnodes/description
subscribe to exit nodes for hammer tor.
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
define Package/postinst
#!/bin/sh
#diff /etc/config/tor-hammer /tmp/exit-nodes > /tmp/exit-nodes.patch
#patch /etc/config/tor-hammer /tmp/exit-nodes.patch
endef

define Package/hammer-app-tor-exitnodes/install
	$(CP) ./files/exit-nodes /tmp

endef
$(eval $(call BuildPackage,hammer-app-tor-exitnodes))
