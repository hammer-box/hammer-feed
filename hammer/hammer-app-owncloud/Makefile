#
# Copyright (C) 2012-2012 OpenConcept Solutions limited
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk
PKG_NAME:=hammer-app-owncloud
PKG_VERSION:=4.0.2
PKG_RELEASE:=1
PKG_SOURCE:=owncloud-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.owncloud.org/releases/
PKG_MD5SUM:=7934ebe0b086110c7ee9858fa3ae4018
PKG_CAT:=bzcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-owncloud
  SECTION:=system
  CATEGORY:=H.A.M.M.E.R
  TITLE:=owncloud support
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+hammer-app-hd +php5-fastcgi +php5-mod-apc +php5-mod-json \
+php5-mod-xml +php5-mod-mbstring +php5-mod-zip +php5-mod-gd +php5-mod-sqlite3 \
+php5-mod-pdo-sqlite +curl +libcurl +php5-mod-curl +php5-mod-pdo \
+php5-mod-ctype +php5-mod-iconv +php5-mod-session +php5-mod-soap +php5-mod-simplexml \
+php5-mod-sockets +php5-mod-tokenizer +nginx
endef
define Build/Compile 

endef
define Build/Prepare
$(PKG_CAT) $(DL_DIR)/$(PKG_SOURCE) | tar -C $(PKG_BUILD_DIR)/ $(TAR_OPTIONS)
endef
define Package/hammer-app-owncloud/description
Use your hammer with owncloud
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
define Package/hammer-app-owncloud/postinst
#!/bin/bash

	
endef
define Package/hammer-app-owncloud/conffiles
	/etc/config/hammer-app-owncloud
	/etc/nginx/sites-available/owncloud
endef
define Package/hammer-app-owncloud/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/nginx/sites-available
	$(INSTALL_DIR) $(1)/srv/nginx/owncloud/
	$(INSTALL_CONF) ./files/etc/config/owncloud $(1)/etc/config/
	$(INSTALL_CONF) ./files/etc/nginx/sites-available/owncloud $(1)/etc/nginx/sites-available
	$(CP) $(PKG_BUILD_DIR)/owncloud/* $(1)/srv/nginx/owncloud/
endef
$(eval $(call BuildPackage,hammer-app-owncloud))
