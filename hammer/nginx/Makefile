#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nginx
PKG_VERSION:=1.2.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nginx.org/download/
PKG_MD5SUM:=ceacae12d66d1f021bf3737a0269b6f4
PKG_BUILD_DEPENDS:=+libpcre +libopenssl +zlib +libxslt +liblua +libpthread  +libcryptoxx +libevent2-openssl +libevent2-extra +libevent2-core +libevent2 +libevent +libxml2
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

PKG_CONFIG_DEPENDS:=\
	CONFIG_NGINX_STUB_STATUS \
	CONFIG_NGINX_FLV \
	CONFIG_NGINX_SSL \
	CONFIG_NGINX_DAV \
	CONFIG_NGINX_MP4 \
	CONFIG_NGINX_XSLT \
	CONFIG_NGINX_GZIP \
	CONFIG_NGINX_SLOWFS \
	CONFIG_NGINX_EMEMC \
	CONFIG_NGINX_AUTHPAM \
	CONFIG_NGINX_LUA \
	CONFIG_NGINX_LUAFILE \
	CONFIG_NGINX_FANCYINDEX \
	CONFIG_NGINX_MEMC
include $(INCLUDE_DIR)/package.mk

define Package/nginx
  SECTION:=server
  CATEGORY:=H.A.M.M.E.R
  SUBMENU:=Web Servers/Proxies
  TITLE:=Nginx web server
  URL:=http://nginx.org/
  DEPENDS:=+libpcre +libopenssl +zlib +libxslt +liblua +libxml2
  MENU:=1
  MAINTAINER:=fishdaemon
endef

define Package/nginx/description
  Nginx is a free, open-source, high-performance HTTP server
  and reverse proxy, as well as an IMAP/POP3 proxy server,
  written by Igor Sysoev.
endef

define Package/nginx/config
  source "$(SOURCE)/Config.in"
endef



define Package/nginx/conffiles
/etc/nginx/fastcgi_params
/etc/nginx/koi-utf
/etc/nginx/koi-win
/etc/nginx/mime.types
/etc/nginx/naxsi.rules
/etc/nginx/naxsi_core.rules
/etc/nginx/nginx.conf
/etc/nginx/proxy_params
/etc/nginx/scgi_params
/etc/nginx/uwsgi_params
/etc/nginx/sites-available/default
endef

ADDITIONAL_MODULES:=
ifeq ($(CONFIG_NGINX_MP4),y)
  ADDITIONAL_MODULES += --with-http_mp4_module
endif
ifeq ($(CONFIG_NGINX_XSLT),y)
  ADDITIONAL_MODULES += --with-http_xslt_module
endif
ifeq ($(CONFIG_NGINX_GZIP),y)
  ADDITIONAL_MODULES += --with-http_gzip_static_module
endif
ifeq ($(CONFIG_IPV6),y)
  ADDITIONAL_MODULES += --with-ipv6
endif
ifeq ($(CONFIG_NGINX_STUB_STATUS),y)
  ADDITIONAL_MODULES += --with-http_stub_status_module
endif
ifeq ($(CONFIG_NGINX_FLV),y)
  ADDITIONAL_MODULES += --with-http_flv_module
endif
ifeq ($(CONFIG_NGINX_SSL),y)
  ADDITIONAL_MODULES += --with-http_ssl_module
else
  ADDITIONAL_MODULES += --without-http-cache
endif
ifeq ($(CONFIG_NGINX_DAV),y)
  ADDITIONAL_MODULES += --with-http_dav_module
endif
ifeq ($(CONFIG_NGINX_LUA),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/modules/chaoslawful-lua-nginx-module
endif
ifeq ($(CONFIG_NGINX_LUAFILE),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/modules/alacner-nginx_lua_module
endif
ifeq ($(CONFIG_NGINX_FANCYINDEX),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/modules/ngx-fancyindex-ngx-fancyindex
endif
ifeq ($(CONFIG_NGINX_MEMC),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/modules/agentzh-memc-nginx-module
endif
ifeq ($(CONFIG_NGINX_AUTHDIGEST),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/modules/samizdatco-nginx-http-auth-digest
endif
ifeq ($(CONFIG_NGINX_AUTHPAM),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/modules/ngx_http_auth_pam_module-1.2
endif
ifeq ($(CONFIG_NGINX_EMEMC),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/modules/bpaquet-ngx_http_enhanced_memcached_module
endif
ifeq ($(CONFIG_NGINX_SLOWFS),y)
  ADDITIONAL_MODULES += --add-module=$(PKG_BUILD_DIR)/modules/ngx_slowfs_cache-1.9
endif



define Build/Configure
	$(CP) -av ./modules $(PKG_BUILD_DIR)
	# TODO: fix --crossbuild
	$(CP) -av ./modules $(PKG_BUILD_DIR)
	(cd $(PKG_BUILD_DIR) ;\
		./configure \
			--crossbuild=Linux::$(ARCH) \
			--prefix=/usr \
			--conf-path=/etc/nginx/nginx.conf \
			--error-log-path=/var/log/nginx/error.log \
			--pid-path=/var/run/nginx.pid \
			--lock-path=/var/lock/nginx.lock \
			--http-log-path=/var/log/nginx/access.log \
			--http-client-body-temp-path=/var/lib/nginx/body \
			--http-proxy-temp-path=/var/lib/nginx/proxy \
			--http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
			--with-cc="$(TARGET_CC)" \
			--with-cc-opt="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
			--with-ld-opt="$(TARGET_LDFLAGS)" \
			$(ADDITIONAL_MODULES) )
endef

define Package/nginx/install
	$(INSTALL_DIR) $(1)/etc/nginx
	$(INSTALL_DIR) $(1)/etc/nginx/sites-available
	$(INSTALL_DIR) $(1)/etc/nginx/sites-disabled
	$(INSTALL_DIR) $(1)/etc/nginx/conf.d
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/nginx $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/usr/sbin/nxensite $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/usr/sbin/nxdissite $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/nginx $(1)/etc/init.d/nginx
	$(INSTALL_CONF) ./files/etc/nginx/{fastcgi_params,koi-utf,koi-win,mime.types,naxsi.rules,naxsi_core.rules,nginx.conf,proxy_params,scgi_params,uwsgi_params} $(1)/etc/nginx/
	$(INSTALL_CONF) ./files/etc/nginx/sites-available/default $(1)/etc/nginx/sites-available/
	$(CP) ./files/etc/nginx/sites-enabled/000-default $(1)/etc/nginx/sites-enable
endef

$(eval $(call BuildPackage,nginx))
