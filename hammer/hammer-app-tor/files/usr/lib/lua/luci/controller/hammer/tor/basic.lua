module("luci.controller.hammer.tor-basic", package.seeall)
function index()
  if not nixio.fs.access("/etc/config/tor-hammer") then                       
    return                                                       
  end
 require("luci.i18n")
  local i18n = luci.i18n.translate
 page = entry({"admin", "hammer", "tor", "tor-basic"}, cbi("hammer/tor/basic")  , i18n("Basic"), 1)
  page.leaf = true
  page.subindex = true


end
