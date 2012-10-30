cache_dir=File.join( Chef::Config[:file_cache_path], 'sysinternals')
directory cache_dir



basepath = 'c:\opscode\chef\bin'

[['Process Explorer','ProcessExplorer.zip','procexp.exe']].each do |toolname,zipfile,exe|
  windows_zipfile basepath do
    source "http://download.sysinternals.com/Files/#{zipfile}"
    creates ::File.join(basepath,exe)
  end
  #disable popup, we accept the eula!
  # http://peter.hahndorf.eu/blog/2010/03/07/WorkAroundSysinternalsLicensePopups.aspx
  windows_registry 'HKCU\Software\Sysinternals\#{toolname}' do
    values 'EulaAccepted' => 1
  end
end

