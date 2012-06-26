#
# Copyright (C) 2012-2012 OpenConcept Solutions limited
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
include $(TOPDIR)/rules.mk
PKG_NAME:=hammer-app-oneye
PKG_VERSION:=0.8.0
PKG_RELEASE:=1
PKG_SOURCE:=oneye_$(PKG_VERSION).zip
PKG_SOURCE_URL:=http://static.cdn.millionmind.com/martin
PKG_CAT:=zcat
PKG_MD5SUM:=8fa8f68ae23eac85ab4e6d3b0652a28d
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-oneye
  SECTION:=system
  CATEGORY:=H.A.M.M.E.R
  TITLE:=oneye support
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+hammer-app-hd +php5-fastcgi +php5-mod-apc +php5-mod-json \
+php5-mod-xml +php5-mod-mbstring +php5-mod-zip +php5-mod-gd +php5-mod-sqlite3 \
+php5-mod-pdo-sqlite +curl +libcurl +php5-mod-curl +php5-mod-pdo \
+php5-mod-ctype +php5-mod-iconv +php5-mod-session +php5-mod-soap +php5-mod-simplexml \
+php5-mod-sockets +php5-mod-tokenizer
endef
define Build/Compile 

endef
define Build/Prepare
unzip $(DL_DIR)/$(PKG_SOURCE) -d $(PKG_BUILD_DIR)/ 
endef
define Package/hammer-app-oneye/description
Use your hammer with oneye
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
define Package/hammer-app-oneye/conffiles
	/etc/config/hammer-app-oneye
endef
define Package/hammer-app-oneye/install
	$(INSTALL_DIR)  $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/nginx/sites-available
	$(INSTALL_DIR) $(1)/hd/system/apps/oneye
	$(INSTALL_CONF) ./files/etc/config/hammer-app-oneye $(1)/etc/config/
	$(CP) $(PKG_BUILD_DIR)/oneye_$(PKG_VERSION)/* $(1)/hd/system/apps/oneye/
	$(INSTALL_CONF) ./files/etc/config/hammer-app-oneye $(1)/etc/config/
endef
$(eval $(call BuildPackage,hammer-app-oneye))
