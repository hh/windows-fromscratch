Vagrant::Config.run do |config|

  #The following timeout configuration is option, however if have
  #any large remote_file resources in your chef recipes, you may
  #experience timeouts (reported as 500 responses)
  config.winrm.timeout = 1800     #Set WinRM Timeout in seconds (Default 30)

  # Configure base box parameters
  config.vm.box = "windows-2008R2-serverstandard-amd64-winrm"
  config.vm.box_url = "./windows-2008R2-serverstandard-amd64-winrm.box"
  config.vm.guest = :windows
  config.vm.boot_mode = :gui
  config.vm.forward_port 3389, 3390, :name => "rdp", :auto => true
  config.vm.forward_port 5985, 5985, :name => "winrm", :auto => true
  config.vm.customize ["modifyvm", :id, "--memory", 1024]
  config.vm.customize ["modifyvm", :id, "--vram", 48] # I have a big screen
  config.vm.customize ["modifyvm", :id, "--cpus", 4] # I have an 8 way
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.json = {}
    chef.add_recipe("windows-fromscratch::bginfo")
    # chef.provisioning_path = 'C:\vagrant'
  end

end
