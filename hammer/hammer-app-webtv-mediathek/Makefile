#
# Copyright (C) 2012-2012 OpenConcept Solutions limited
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk
PKG_NAME:=hammer-app-webtv-mediathek
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-webtv-mediathek
  SECTION:=system
  CATEGORY:=H.A.M.M.E.R
  TITLE:=webtv-mediathek support
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+hammer-app-webtv-enabler
endef
define Build/Compile 

endef
define Build/Prepare

endef
define Package/hammer-app-webtv-mediathek/description
Use your hammer with webtv-mediathek
endef
## Install
# macro commands Commands for creating direcwebtv-mediathekies
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
define Package/hammer-app-webtv-mediathek/conffiles
	/etc/config/hammer-app-webtv-mediathek
endef
define Package/hammer-app-webtv-mediathek/install
	$(INSTALL_DIR)  $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/hammer-app-webtv-mediathek $(1)/etc/config/
endef
$(eval $(call BuildPackage,hammer-app-webtv-mediathek))
