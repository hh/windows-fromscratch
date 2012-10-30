windows_auto_run 'BGINFO' do
  program 'c:\opscode\chef\bin\bginfo.exe'
  args "/NOLICPROMPT /TIMER:0"
  not_if { Registry.value_exists?(AUTO_RUN_KEY, 'BGINFO') }
  action :create
end
