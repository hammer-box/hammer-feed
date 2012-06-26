module("luci.controller.oconcept.tor-entry-nodes", package.seeall)
function index()
  if not nixio.fs.access("/etc/config/tor-oconcept") then                       
    return                                                       
  end
 require("luci.i18n")
  local i18n = luci.i18n.translate
 page = entry({"admin", "oconcept", "tor","nodes", "entry"}, cbi("oconcept/tor/entry-nodes")  , i18n("Entry"), 2)
  page.leaf = true
  page.subindex = true
end
