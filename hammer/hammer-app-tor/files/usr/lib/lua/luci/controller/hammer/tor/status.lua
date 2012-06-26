module("luci.controller.oconcept.tor-status", package.seeall)
function index()
  if not nixio.fs.access("/etc/config/tor-oconcept") then                       
    return                                                       
  end
 require("luci.i18n")
  local i18n = luci.i18n.translate
 page = entry({"admin", "oconcept", "tor", "tor-status"}, template("oconcept/tor_status2")  , i18n("Status"), 4)
  page.leaf = true
  page.subindex = true


end
