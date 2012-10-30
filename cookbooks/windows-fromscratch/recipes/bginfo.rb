windows_auto_run 'BGINFO' do
  program 'c:\opscode\chef\bin\bginfo.exe'
  args "/NOLICPROMPT /TIMER:0"
  not_if { Registry.value_exists?(AUTO_RUN_KEY, 'BGINFO') }
  action :create
end

windows_registry 'HKEY_CURRENT_USER\Software\Winternals\BGInfo' do
  values 'RTF' => """{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fnil\\fcharset0 Arial;}}
{\\colortbl ;\\red255\\green255\\blue255;}
\\viewkind4\\uc1\\pard\\fi-2880\\li2880\\tx2880\\cf1\\b\\fs24 Ohai from:\\tab\\protect #{node.name}\\protect0\\par
Chef-Version:\\tab\\protect #{node.chef_packages['chef']['version']}\\protect0\\par
Recipes:\\tab\\protect #{node.recipes}\\protect0\\par
Boot Time:\\tab\\protect <Boot Time>\\protect0\\par
CPU:\\tab\\protect <CPU>\\protect0\\par
Default Gateway:\\tab\\protect <Default Gateway>\\protect0\\par
DHCP Server:\\tab\\protect <DHCP Server>\\protect0\\par
DNS Server:\\tab\\protect <DNS Server>\\protect0\\par
Free Space:\\tab\\protect <Free Space>\\protect0\\par
Host Name:\\tab\\protect <Host Name>\\protect0\\par
IE Version:\\tab\\protect <IE Version>\\protect0\\par
IP Address:\\tab\\protect <IP Address>\\protect0\\par
Logon Domain:\\tab\\protect <Logon Domain>\\protect0\\par
Logon Server:\\tab\\protect <Logon Server>\\protect0\\par
MAC Address:\\tab\\protect <MAC Address>\\protect0\\par
Machine Domain:\\tab\\protect <Machine Domain>\\protect0\\par
Memory:\\tab\\protect <Memory>\\protect0\\par
Network Card:\\tab\\protect <Network Card>\\protect0\\par
Network Speed:\\tab\\protect <Network Speed>\\protect0\\par
Network Type:\\tab\\protect <Network Type>\\protect0\\par
OS Version:\\tab\\protect <OS Version>\\protect0\\par
Service Pack:\\tab\\protect <Service Pack>\\protect0\\par
Snapshot Time:\\tab\\protect <Snapshot Time>\\protect0\\par
Subnet Mask:\\tab\\protect <Subnet Mask>\\protect0\\par
System Type:\\tab\\protect <System Type>\\protect0\\par
User Name:\\tab\\protect <User Name>\\protect0\\par
Volumes:\\tab\\protect <Volumes>\\protect0\\par
\\par
}
"""
end
