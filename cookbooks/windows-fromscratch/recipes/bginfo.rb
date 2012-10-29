directory "C:/Sysinternals"

windows_zipfile "C:/Sysinternals" do
  source 'http://download.sysinternals.com/files/BGInfo.zip'
  action :unzip
  not_if {::File.exists? "C:/Sysinternals/BGInfo.exe"}
end


windows_registry 'HKCU\Software\Sysinternals\BGInfo' do
  values 'EulaAccepted' => 1
end

windows_registry 'HKLM\SOFTWARE\Microsoft\ServerManager' do
  values 'DoNotOpenServerManagerAtLogon' => 1
end

windows_registry 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability' do
  values 'ShutdownReasonUI' => 0
end

cookbook_file 'C:/Sysinternals/config.bgi'

windows_auto_run 'BGINFO' do
  program "C:/Sysinternals/bginfo.exe"
  args "\"C:/Sysinternals/config.bgi\" /NOLICPROMPT /TIMER:0"
  not_if { Registry.value_exists?(AUTO_RUN_KEY, 'BGINFO') }
  action :create
end
