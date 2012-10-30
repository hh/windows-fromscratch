# http://technet.microsoft.com/en-us/library/cc732131.aspx
# Look upnder Registry settings
windows_registry 'HKLM\SOFTWARE\Microsoft\ServerManager\Oobe' do
  values 'DoNotOpenInitialConfigurationTasksAtLogon' => 1
end
windows_registry 'HKLM\SOFTWARE\Microsoft\ServerManager' do
  values 'DoNotOpenServerManagerAtLogon' => 1
end

# http://technet.microsoft.com/en-us/library/cc778526(v=ws.10).aspx#w2k3tr_set_tools_zgjt
windows_registry 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' do
  values 'ShutdownReasonUI' => 0, 'ShutdownReasonOn' => 0
end

# http://technet.microsoft.com/en-us/library/dd835564(v=ws.10).aspx#BKMK_AdminApprovalMode
# http://technet.microsoft.com/en-us/library/dd835564(v=ws.10).aspx#BKMK_RegistryKeys
windows_registry 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values 'EnableLUA' => 0
end

