cache_dir=File.join( Chef::Config[:file_cache_path], 'sysinternals')
directory cache_dir



basepath = 'c:\opscode\chef\bin'

node['sysinternals']['tools'].each do |toolname,url|
  exe=::File.join(basepath,::File.basename(url))
  remote_file exe do
    source url
    not_if {::File.exists? exe}
  end
  #disable popup, we accept the eula!
  # http://peter.hahndorf.eu/blog/2010/03/07/WorkAroundSysinternalsLicensePopups.aspx
  windows_registry "HKCU\\Software\\Sysinternals\\#{toolname}" do
    values 'EulaAccepted' => 1
  end
end

