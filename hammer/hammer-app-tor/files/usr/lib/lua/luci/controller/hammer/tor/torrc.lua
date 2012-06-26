module("luci.controller.oconcept.torrc", package.seeall)
function index()
  if not nixio.fs.access("/etc/config/tor-oconcept") then                       
    return                                                       
  end
 require("luci.i18n")
  local i18n = luci.i18n.translate
 page = entry({"admin", "oconcept", "tor", "torrc"}, cbi("oconcept/tor/torrc")  , i18n("Advanced"), 3)
  page.leaf = true
  page.subindex = true
end
