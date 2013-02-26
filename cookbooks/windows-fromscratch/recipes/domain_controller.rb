windows_feature "NetFx3"
windows_feature "DirectoryServices-DomainController"
windows_feature "DirectoryServices-DomainController-Tools"

file 'c:\dcunattended.txt' do
  content <<-EOC
    [DCINSTALL]
    InstallDNS=Yes
    DomainNetBiosName=vagrant
    NewDomainDNSName=vagrant.training
    SiteName=DefaultSite
    ReplicaOrNewDomain=domain
    NewDomain=forest
    ForestLevel=4
    DomainLevel=4
    SafeModeAdminPassword=Testing123!
    RebootOnSuccess=Yes
  EOC
end

# our ruby is 32bit, making file locations... interesting
# http://en.wikipedia.org/wiki/WoW64#Registry_and_file_system
dcpromo = 'c:\windows\sysnative\dcpromo.exe'
# This command will reboot before it returns... chef-client ends here
execute "#{dcpromo} /unattend:c:\\dcunattended.txt"
