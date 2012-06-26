#
# Copyright (C) 2012-2012 OpenConcept Solutions limited
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk
PKG_NAME:=hammer-app-mediagoblin
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-mediagoblin
  SECTION:=system
  CATEGORY:=H.A.M.M.E.R
  TITLE:=mediagoblin support
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+hammer-app-hd
endef
define Build/Compile 

endef
define Build/Prepare

endef
define Package/hammer-app-mediagoblin/description
Use your hammer with mediagoblin
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
define Package/hammer-app-mediagoblin/conffiles
	/etc/config/hammer-app-mediagoblin
endef
define Package/hammer-app-mediagoblin/install
	$(INSTALL_DIR)  $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/hammer-app-mediagoblin $(1)/etc/config/
endef
$(eval $(call BuildPackage,hammer-app-mediagoblin))
