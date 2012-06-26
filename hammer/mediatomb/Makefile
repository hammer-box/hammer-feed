#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#http://downloads.sourceforge.net/mediatomb/mediatomb-0.12.1.tar.gz

include $(TOPDIR)/rules.mk

PKG_NAME:=mediatomb
PKG_VERSION:=0.12.1
PKG_RELEASE:=1

#PKG_BUILD_DEPENDS:=Packages that need to be built before this package, but are not required at runtime. Uses the same syntax as DEPENDS below.
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.sourceforge.net/mediatomb/
PKG_MD5SUM:=e927dd5dc52d3cfcebd8ca1af6f0d3c2
#PKG_CAT:=zcat
PKG_BUILD_DEPENDS:=+libexif +libsqlite3 +id3lib +libiconv +file  +libpthread +libjs +js  +libffmpeg-full +libstdcpp
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_FIXUP:=libtool
#the paths within the tar gz where source can be found
#MAKE_PATH:=src
#CONFIGURE_PATH:=src

#Custom variable
#PKG_BUILD_BIN:=$(PKG_BUILD_DIR)/build

#PREFIX_SHARED:=$(PKG_BUILD_DIR)/prefix
#PREFIX_ARCH:=$(PKG_BUILD_DIR)/exec-prefix
include $(INCLUDE_DIR)/package.mk
#Maybe not needed, has to do with encoding i think
include $(INCLUDE_DIR)/nls.mk
#Custom variable used in Build/configure
CONFIGURE_ARGS += --disable-mysql \
                  --enable-mrreg-service \
                  --enable-sqlite-backup-defaults \
                  --disable-log \
                  --enable-iconv-lib \
                  --enable-libjs \
                  --disable-taglib \
                  --enable-id3lib \
                  --disable-libmp4v2 \
                  --disable-ffmpegthumbnailer \
                  --disable-lastfmlib \
                  --disable-libextractor \
                  --enable-libmagic \
                  --enable-libexif \
                  --with-js-h=$(STAGING_DIR)/usr/include/js \
                  --with-id3lib-h=$(STAGING_DIR)/usr/include
     #             --prefix=$(PREFIX_SHARED) \
      #            --exec-prefix=$(PREFIX_SHARED_ARCH)




TARGET_CFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib
#TARGET_LDFLAGS += Wl,-rpath-link=$(STAGING_DIR)/usr/lib
TARGET_LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib/libiconv/lib \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib/libintl/lib
define Package/mediatomb
  SECTION:=multimedia
  CATEGORY:=H.A.M.M.E.R
  TITLE:=uPnP server
  URL:=http://mediatomb.cc
  MAINTAINER:=fishdaemon
  #will add later
  DEPENDS:=+libexif +libsqlite3 +id3lib +libiconv +file  +libpthread +libjs +js +libffmpeg-full +libstdcpp
#  DEPENDS:=
  
endef

define Package/mediatomb/description
  uPnP media servers for the hammer
endef
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) HOSTCC="$(HOSTCC)" DESTDIR="$(PKG_INSTALL_DIR)" all install 
endef
#define Build/Compile
    #    $(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
#endef
define Build/Configure
 $(call Build/Configure/Default,$(CONFIGURE_ARGS))
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
INSTALL_SHARED_DIR:=/usr/share/mediatomb
INSTALL_WEB_DIR:=/srv/mediatomb
define Package/mediatomb/conffiles
	/etc/config/hammer-mediatomb
	$(INSTALL_SHARED_DIR)/mappings.xml
endef
define Package/mediatomb/postinst 
#!/bin/sh
# check if we are on real system
  if [ -z "$${IPKG_INSTROOT}" ]
  then
    echo "Enabling rc.d symlink for mediatomb"
   /etc/init.d/mediatomb enable
  fi
exit 0
endef

define Package/mediatomb/prerm 
#!/bin/sh
  # check if we are on real system
  if [ -z "$${IPKG_INSTROOT}" ]
  then
          echo "Removing rc.d symlink for mediatomb"
          /etc/init.d/mediatomb disable
  fi
  exit 0
endef
#IMPORTANT! YOU MUST USE TABS HERE! NOT SPACES!!!
define Package/mediatomb/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)$(INSTALL_SHARED_DIR)
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_CONF) ./files/etc/config/hammer-mediatomb $(1)/etc/config
	$(INSTALL_DIR) $(1)$(INSTALL_WEB_DIR)
	$(INSTALL_DIR) $(1)$(INSTALL_WEB_DIR)/{icons,js}
	$(INSTALL_DIR) $(1)$(INSTALL_WEB_DIR)/icons/nanotree
	$(INSTALL_DIR) $(1)$(INSTALL_WEB_DIR)/icons/nanotree/images
	$(INSTALL_DIR) $(1)$(INSTALL_SHARED_DIR)/js
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mediatomb $(1)/usr/sbin/mediatomb
	$(INSTALL_BIN) ./files/usr/sbin/mediatomb-generate-config $(1)/usr/sbin/mediatomb-generate-config
	$(INSTALL_BIN) ./files/etc/init.d/mediatomb $(1)/etc/init.d/mediatomb
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/usr/share/mediatomb/mappings.xml $(1)$(INSTALL_SHARED_DIR)/mappings.xml
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/usr/share/mediatomb/sqlite3.sql $(1)$(INSTALL_SHARED_DIR)/sqlite3.sql
	$(CP) $(PKG_INSTALL_DIR)/usr/share/mediatomb/js/{common.js,import.js,playlists.js} $(1)$(INSTALL_SHARED_DIR)/js
	$(CP) $(PKG_INSTALL_DIR)/usr/share/mediatomb/web/{disabled.html,cds.xml,cm.xml,favicon.ico,index.html,left.html,main.css,mr_reg.xml,right.html,std_treelook.css,top.html,topleft.html,topright.html} $(1)$(INSTALL_WEB_DIR)
	$(CP) $(PKG_INSTALL_DIR)/usr/share/mediatomb/web/js/{auth.js,autoscan.js,icons.js,iepngfix.htc,items.js,md5.js,nanotree.js,prototype.js,tasks.js,tools.js,tree.js}  $(1)$(INSTALL_WEB_DIR)/js
	$(CP) $(PKG_INSTALL_DIR)/usr/share/mediatomb/web/icons/*.{png,gif,bmp,jpg}  $(1)$(INSTALL_WEB_DIR)/icons
	$(CP) $(PKG_INSTALL_DIR)/usr/share/mediatomb/web/icons/nanotree/images/* $(1)$(INSTALL_WEB_DIR)/icons/nanotree/images
endef
$(eval $(call BuildPackage,mediatomb))
## HOOKS ##



#All variables in your pre/post install/removal scripts should have double ($$) 
#instead of a single ($) string characters. This will inform "make" to not interpret #the value as a variable, but rather just ignore the string and replace the double $ #by a single $

#define Package/preinst 
# The actual text of the script which is to be executed before installation. Dont forget
# to include the #!/bin/sh. If you need to abort installation have the script return false.
#endef
## Use this for installaing services


#define Package/postrm 
# The actual text of the script which is to be executed after removal. Dont forget
# to include the #!/bin/sh. 
#endef
#define Build/Prepare
  # A set of commands to unpack and patch the sources. You may safely leave this undefined.
#endef

## /HOOKS ##



#CONFIGURE_CMD =./autogen.sh
                  
#not sure if i need
#define Build/Compile
#	$(MAKE) -C $(PKG_BUILD_DIR) \
#		DESTDIR="$(PKG_INSTALL_DIR)" \
#		install
#endef



