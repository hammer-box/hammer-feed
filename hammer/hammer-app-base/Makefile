#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#http://downloads.sourceforge.net/mediatomb/mediatomb-0.12.1.tar.gz

include $(TOPDIR)/rules.mk

PKG_NAME:=hammer-app-base
PKG_VERSION:=1
PKG_RELEASE:=4

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_DEPENDS:=+bash-completion +openssl-util +luci-lib-lucid +nginx +php5-fastcgi +libsqlite3 +php5-cli +coreutils +php5

include $(INCLUDE_DIR)/package.mk
#Maybe not needed, has to do with encoding i think
include $(INCLUDE_DIR)/nls.mk
define Package/hammer-app-base
  SECTION:=base
  CATEGORY:=H.A.M.M.E.R
  TITLE:=Contains base files for H.A.M.M.E.R
  URL:=http://tarpediem.net
  MAINTAINER:=fishdaemon
  DEPENDS:=+bash +bash-completion +openssl-util +luci-lib-lucid +nginx +php5-fastcgi +libsqlite3 +coreutils +php5-cli +shadow-useradd +shadow +shadow-userdel +shadow-usermod +coreutils-users +sudo +coreutils-groups +coreutils-chgrp +sed +coreutils-dd

endef
define Build/Compile 

endef
define Build/Prepare

endef
define Package/hammer-app-base/description
Base stuff for hammer
endef
define Package/hammer-app-base/postinst
#!/bin/bash
#Making sure we are in the real environment
#temporarily disabled
#if [ -z "$${IPKG_INSTROOT}" ]
#then
#	if [ -t 1 ]
#	then
#		source /usr/lib/hammer/bash/base.functions
#		base.promptOwnerInfo
#		base.promptCAInfo
#	fi
#else
#	echo "0" > /usr/lib/hammer/data/CA.configured
#	echo "0" > /usr/lib/hammer/data/owner.configured
#fi

endef
define Package/hammer-app-base/conffiles
	/etc/config/hammer
endef
define Package/hammer-app-base/install
	$(INSTALL_DIR) $(1)/usr/lib/hammer
	$(INSTALL_DIR) $(1)/usr/lib/hammer/bash
	$(INSTALL_DIR) $(1)/usr/lib/hammer/data
	$(INSTALL_DIR) $(1)/etc/config

	$(INSTALL_DIR) $(1)/srv/nginx/default

	$(INSTALL_CONF) ./files/etc/config/hammer $(1)/etc/config/
	$(CP) ./files/srv/nginx/default/index.php $(1)/srv/nginx/default/
	$(CP) ./files/usr/lib/hammer/bash/* $(1)/usr/lib/hammer/bash/
endef
$(eval $(call BuildPackage,hammer-app-base))
