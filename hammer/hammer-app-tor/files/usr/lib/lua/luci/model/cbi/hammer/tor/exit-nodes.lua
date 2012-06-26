m = Map("tor-hammer",translate("Tor"))
s = m:section(TypedSection, "exit_nodes", translate("Exit nodes"),translate("Exit nodes"))
s.addremove = true
o = s:option(DynamicList, 'node', translate("Add your exit nodes here."),translate(""))

o.addremove = true

return m
