module("luci.controller.hammer.index", package.seeall)
function index()
  if not nixio.fs.access("/etc/config/hammer") then                       
    return                                                       
  end
  
  require("luci.i18n")
  local i18n = luci.i18n.translate
  
  local page = node ("admin", "hammer" )
  page.target = alias("admin", "hammer", "tor")
  page.order = 1
  page.index=true
  page.title= i18n("H.A.M.M.E.R")

  page = entry({"admin", "hammer", "overview"}, template("hammer/overview")  , i18n("Can't touch this!"), 2)
  page.leaf = true
  page.subindex = true
  
  
  page = node ( "admin", "hammer", "tor" )
  page.target = alias("admin", "hammer", "tor" ,"tor-basic")
  page.order = 4
  page.index=true
  page.title= i18n("Tor")
  
   
  page = node ("admin", "hammer", "tor", "nodes" )
  page.target = alias("admin", "hammer", "tor" ,"nodes", "exit")
  page.index = true
  page.title= i18n("Nodes")
  page.order = 3
  

end



