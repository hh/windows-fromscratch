Vagrant::Config.run do |config|

  #The following timeout configuration is option, however if have
  #any large remote_file resources in your chef recipes, you may
  #experience timeouts (reported as 500 responses)
  config.winrm.timeout = 1800     #Set WinRM Timeout in seconds (Default 30)

  # Configure base box parameters
  config.vm.define :dc do |dc|
    dc.vm.host_name = "dc"
    dc.vm.box = "windows-2008r2-standard"
    dc.vm.box_url = "./windows-2008r2-standard.box"
    dc.vm.guest = :windows
    dc.vm.boot_mode = :gui
    dc.vm.forward_port 3389, 3390, :name => "rdp", :auto => true
    dc.vm.forward_port 5985, 5985, :name => "winrm", :auto => true
    dc.vm.customize ["modifyvm", :id, "--memory", 2048]
    dc.vm.customize ["modifyvm", :id, "--vram", 48] # I have a big screen
    dc.vm.customize ["modifyvm", :id, "--cpus", 4] # I have an 8 way
    dc.vm.network :hostonly, "1.1.1.2"
    dc.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.json = {}
      chef.add_recipe("windows-fromscratch::_annoyances")
      chef.add_recipe("windows-fromscratch::sysinternals")
      chef.add_recipe("windows-fromscratch::bginfo")
      chef.add_recipe("windows-fromscratch::_ie_annoyances")
      # domain_controller forces a reboot!
      chef.add_recipe("windows-fromscratch::domain_controller")
      chef.add_recipe("windows-fromscratch::setup_winrm")
    end
  end

  # Configure base box parameters
  config.vm.define :member do |member|
    member.vm.host_name = "member"
    member.vm.box = "windows-2008r2-standard"
    member.vm.box_url = "./windows-2008r2-standard.box"
    member.vm.guest = :windows
    member.vm.boot_mode = :gui
    member.vm.forward_port 3389, 3390, :name => "rdp", :auto => true
    member.vm.forward_port 5985, 5985, :name => "winrm", :auto => true
    member.vm.customize ["modifyvm", :id, "--memory", 2048]
    member.vm.customize ["modifyvm", :id, "--vram", 48] # I have a big screen
    member.vm.customize ["modifyvm", :id, "--cpus", 4] # I have an 8 way
    member.vm.network :hostonly, "1.1.1.3"
    member.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.json = {}
      chef.add_recipe("windows-fromscratch::_annoyances")
      chef.add_recipe("windows-fromscratch::sysinternals")
      chef.add_recipe("windows-fromscratch::bginfo")
      chef.add_recipe("windows-fromscratch::_ie_annoyances")
      chef.add_recipe("windows-fromscratch::setup_winrm")
    end
  end
end
