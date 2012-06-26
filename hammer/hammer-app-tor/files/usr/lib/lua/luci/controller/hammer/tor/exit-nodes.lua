module("luci.controller.oconcept.tor-exit-nodes", package.seeall)
function index()
  if not nixio.fs.access("/etc/config/tor-oconcept") then                       
    return                                                       
  end
 require("luci.i18n")
  local i18n = luci.i18n.translate
 page = entry({"admin", "oconcept", "tor","nodes", "exit"}, cbi("oconcept/tor/exit-nodes")  , i18n("Exit"), 2)
  page.leaf = true
  page.subindex = true
end
