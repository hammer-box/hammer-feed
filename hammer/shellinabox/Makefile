#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=shellinabox
PKG_VERSION:=2.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://shellinabox.googlecode.com/files
PKG_MD5SUM:=6c63b52edcebc56ee73a108e7211d174

PKG_BUILD_DEPENDS:=+hammer-app-base

include $(INCLUDE_DIR)/package.mk

define Package/shellinabox
  TITLE:=shellinabox
  SECTION:=net
  CATEGORY:=H.A.M.M.E.R
  URL:=http://code.google.com/p/shellinabox
  DEPENDS:=+hammer-app-base
  MAINTAINER:=fishdaemon
endef

define Package/shellinabox/description
Shell In A Box implements a web server that can export arbitrary command line tools to a web based terminal emulator. This emulator is accessible to any JavaScript and CSS enabled web browser and does not require any additional browser plugins. Most typically, login shells would be exported this way:
endef




CONFIGURE_ARGS += --disable-pam 

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)"

define Package/shellinabox/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/shellinabox $(1)/usr/sbin/
endef
$(eval $(call BuildPackage,shellinabox))
