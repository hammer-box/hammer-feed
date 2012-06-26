#
# Copyright (C) 2012-2012 OpenConcept Solutions limited
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk
PKG_NAME:=hammer-app-tor
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-tor
  SECTION:=storage
  CATEGORY:=H.A.M.M.E.R
  TITLE:=Enables Advanced TOR settings for your H.A.M.M.E.R
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+hammer-app-base +tor +tor-geoip +iptables-mod-extra +iptables-mod-geoip +iptables-mod-nat-extra +iptables-mod-tproxy

endef
define Build/Compile 

endef
define Build/Prepare

endef
define Package/hammer-app-tor/description
Advanced tor settings
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
define Package/hammer-app-tor/conffiles
	/etc/config/tor-hammer
endef
define Package/hammer-app-tor/install
	$(INSTALL_DIR)  $(1)/etc/config
	$(INSTALL_DIR)  $(1)/etc/init.d
	$(INSTALL_DIR)  $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/hammer/tor
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/hammer/tor
	$(INSTALL_CONF) ./files/etc/config/tor-hammer $(1)/etc/config/
	$(INSTALL_BIN) ./files/etc/init.d/tor $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/usr/sbin/geoip $(1)/usr/sbin
	$(INSTALL_BIN) ./files/usr/sbin/tor-helper $(1)/usr/sbin	
	$(CP) ./files/usr/lib/lua/luci/controller/hammer/tor/* $(1)/usr/lib/lua/luci/controller/hammer/tor/
	$(CP) ./files/usr/lib/lua/luci/model/cbi/hammer/tor/* $(1)/usr/lib/lua/luci/model/cbi/hammer/tor/

endef
$(eval $(call BuildPackage,hammer-app-tor))


