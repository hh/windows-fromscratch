Vagrant::Config.run do |config|

  #The following timeout configuration is option, however if have
  #any large remote_file resources in your chef recipes, you may
  #experience timeouts (reported as 500 responses)
  config.winrm.timeout = 1800     #Set WinRM Timeout in seconds (Default 30)

  # Configure base box parameters
  config.vm.box = "windows-2008r2-standard"
  config.vm.box_url = "./windows-2008r2-standard.box"
  config.vm.guest = :windows
  config.vm.boot_mode = :gui
  config.vm.forward_port 3389, 3390, :name => "rdp", :auto => true
  config.vm.forward_port 5985, 5985, :name => "winrm", :auto => true
  config.vm.customize ["modifyvm", :id, "--memory", 2048]
  config.vm.customize ["modifyvm", :id, "--vram", 48] # I have a big screen
  config.vm.customize ["modifyvm", :id, "--cpus", 4] # I have an 8 way
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.json = {
      mysql: {
        server_root_password: "iloverandompasswordsbutthiswilldo",
        server_repl_password: "iloverandompasswordsbutthiswilldo",
        server_debian_password: "iloverandompasswordsbutthiswilldo"
      }
    }
    
    # chef.add_recipe('mysql') # works
    # chef.add_recipe('git') # Works
    # chef.add_recipe('java') # Works
    # Requires ['java']['windows']['url'] = 'http://my.private.location'
    # Doesn't set config for JAVA_HOME etc

    #chef.add_recipe('mysql::server') # all based around ubuntu
    # Need new cookbook with MSI Installers
    # 10 days

    #chef.add_recipe('apache2') # based on packages
    # http://www.apache.org/dist/httpd/binaries/win32/
    # The last windows build was over a year ago httpd-2.2.22
    # Apache project does not provide binary release builds
    # http://www.anindya.com/apache-http-server-2-2-x64-and-x86-msi-installers/
    # Probably need a from source build
    # http://httpd.apache.org/docs/2.4/platform/windows.html#down
    # Or to use a community site:
    # http://www.apachelounge.com/download/
    # 10 days

    # chef.add_recipe('nginx')
    # http://wiki.nginx.org/Install#Official_Win32_Binaries
    # Uses user 'root'
   # FATAL: Chef::Exceptions::Win32APIError: remote_directory[/etc/chef/ohai_plugins] (ohai::default line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/ohai/recipes/default.rb) had an error: Chef::Exceptions::Win32APIError: No mapping between account names and security IDs was done.
    # 6 days

    # chef.add_recipe('php') # based on packages
    # Zip files are available
    # http://windows.php.net/download/#php-5.4-nts-VC9-x86
    # Look like they primarily target IIS
    # Which version do I choose?
    # If you are using PHP with Apache 1 or Apache2 from apache.org you
    # need to use the VC6 versions of PHP
    # If you are using PHP with IIS you should use the VC9 versions of PHP
    # VC6 Versions are compiled with the legacy Visual Studio 6 compiler
    # VC9 Versions are compiled with the Visual Studio 2008 compiler and
    # have improvements in performance and stability. The VC9 versions
    # require you to have the Microsoft 2008 C++ Runtime (x86) or the
    # Microsoft 2008 C++ Runtime (x64) installed
    # Do NOT use VC9 version with apache.org binaries
    # VC9 versions of Apache can be fetched at Apache Lounge. We use their
    # binaries to build the Apache SAPIs.

    # I didn't find an easy path to these:
    #chef.add_recipe('php::module_mysql')
    #chef.add_recipe('apache2::mod_php5') # PRobably NOT the way to go
    # 15 days


    # chef.add_recipe('postgresql') # relies on packages
    # Executable downloads
    # http://www.enterprisedb.com/products-services-training/pgdownload#windows
    # 10 days

    # relies on database gems for mysql and postgresql being available
    # chef.add_recipe('database')
    # depends on xfs, aws, postgresql and mysql cookbooks

    # chef.add_recipe('nagios') # Not supported
    # Nagios isn't supported on windows
    # http://www.nagios.org/news/77-news-announcements/273-introducing-nagwin-nagios-for-windows
    # This is over two years old and I haven't found any updates since then... it was a one-off
    # 0 days

    # chef.add_recipe('wordpress') # our cookbook requires mysql, php, apache2 and openssl
    # However this is Available as a webpi!!
    # The AppId is WordPress (http://www.microsoft.com/web/gallery/install.aspx?appid=WordPress)
    # Should probably combine with IIS and not apache
    chef.add_recipe("windows-fromscratch::wordpress")


    # Other apps are here...
    # http://www.microsoft.com/web/gallery/categories.aspx 


    # chef.add_recipe("windows-fromscratch::_annoyances")
    # chef.add_recipe("windows-fromscratch::sysinternals")
    # chef.add_recipe("windows-fromscratch::bginfo")
  end

end
