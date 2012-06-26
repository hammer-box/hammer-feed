m = Map("tor-hammer",translate("Tor"))
s = m:section(TypedSection, "entry_nodes", translate("Entry nodes"),translate("Entry nodes"))
s.addremove = true
o = s:option(DynamicList, 'node', translate("Add your entry nodes here."),translate(""))

o.addremove = true

return m
