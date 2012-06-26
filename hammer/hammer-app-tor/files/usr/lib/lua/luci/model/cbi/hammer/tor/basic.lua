require("luci.util");
m = Map("tor-hammer",translate("Tor"))
s = m:section(TypedSection, "global", translate("Tor config file"))
s.addremove = false

f = s:option(Flag, 'enabled' ,translate("Enable"))
f.default=1
f.rmempty = false

function f.cfgvalue(self, section)
	return luci.sys.init.enabled("tor") and self.enabled or self.disabled
end
function f.write(self, section, value)
	if value == "1" then
		luci.sys.call("/etc/init.d/tor enable >/dev/null")
		luci.sys.call("/etc/init.d/tor start >/dev/null")
		luci.sys.call("echo 'Turning you on'")
	else
		luci.sys.call("/etc/init.d/tor stop >/dev/null")
		luci.sys.call("/etc/init.d/tor disable >/dev/null")
		luci.sys.call("echo 'Lights out'")
	end
end
p = s:option(StaticList, 'ignored_users' ,translate('Ignored system users'));

ss = luci.util.exec( "cat /etc/passwd | cut -d':' -f1 | tr '\n' ','")
ss = string.sub(ss,0,string.len(ss)-1)
t = string.split(ss,",")
for index,value in ipairs(t) 
do 
  p:value(value) 
end



p = s:option(StaticList, 'interfaces' ,translate('interfaces to use'));
interfaces = luci.util.exec( "ifconfig | grep -v ^' ' | cut -d' ' -f1 | tr -s '\n' ','")
interfaces = string.sub(interfaces,0,string.len(interfaces)-1)
ifarr = string.split(interfaces,",")
for index,value in ipairs(ifarr) 
do 
  if value ~= "lo" and value ~= "eth0"
  then
    p:value(value, value)
  end
end

p = s:option(StaticList, 'ignore_out_interfaces' ,translate('Ignored out interfaces'));
interfaces = luci.util.exec( "ifconfig | grep -v ^' ' | cut -d' ' -f1 | tr -s '\n' ','")
interfaces = string.sub(interfaces,0,string.len(interfaces)-1)
ifarr = string.split(interfaces,",")
for index,value in ipairs(ifarr) 
do 
  if value ~= "eth0"
  then
    p:value(value, value)
  end
end

p = s:option(DynamicList, 'ignored_networks', translate("Ignored tor networks"),translate("Dont touch this unless you know what it is!"))
p.addremove = true

p = s:option(ListValue,"exit_group",translate("Exit Group"))
cur = luci.model.uci.cursor()

cur.foreach("tor-oconcept","exit_nodes",
  function (section)
    p:value(section[".name"])
  end
)
p = s:option(Flag, "exit_enabled", translate("Enable exit groups"),translate("if you enable exit group but not strictNodes in torrc this group will be prefered"))
p.default = 1
p = s:option(ListValue,"entry_group",translate("entry Group"))

cur = luci.model.uci.cursor()

cur.foreach("tor-oconcept","entry_nodes",
  function (section)
    p:value(section[".name"])
  end
)
p = s:option(Flag, "entry_enabled", translate("Enableentry groups"),translate("if you enable entry group but not strictNodes in torrc this group will be prefered"))
p.default = 0

p = s:option(Flag, "strict_nodes", translate("Strict nodes"),translate("Enable strict nodes"))
p.default = 0
return m
