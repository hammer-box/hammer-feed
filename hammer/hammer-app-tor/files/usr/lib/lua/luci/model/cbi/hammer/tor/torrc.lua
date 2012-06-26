m = Map("tor-hammer", translate("Torrc"), translate("only mess with this if you are a 1337 h4x0r...if you break it we warned you !"))
s = m:section(TypedSection, "advanced", translate("Tor proces configuration"))
s.anonymous = true





t = s:option(Value, "TransPort", "TransPort", translate("Where to bind the transparent proxy (empty to turn off)"))
t.datatype = "uinteger"
t.optional = true
t.default = "1984"
t = s:option(Value, "ControlPort", "ControlPort", translate("Control port"))
t.datatype = "uinteger"
t.optional = true
t.default = "9051"
t = s:option(Value, "SocksPort", "SocksPort", translate("sockport"))
t.datatype = "uinteger"
t.optional = true
t.default = "0"
t = s:option(Value, "DNSPort", "DNSPort", translate("Where bind the anynomous DNS resolver (empty to turn off)"))
t.datatype = "uinteger"
t.optional = true
t.default = "9053"
t = s:option(Value, "TransListenAddress", "TransListenAddress", translate("Address the transproxy listen too"))
t.optional = true

t = s:option(Value, "DataDirectory", "DataDirectory", translate("User that runs the tor application"))
t.datatype = "string"
t.optional = true
t.default = "/var/lib/tor"
t = s:option(Value, "User", "User", translate("User that runs the tor application"))
t.datatype = "string"
t.default = "tor"



t = s:option(Flag, "RunAsDaemon", "RunAsDaemon", translate("Run as a daemon"))
t.datatype = "string"
t.disabled = "0"
t.enabled = "1"
t.rmempty = false


return m
