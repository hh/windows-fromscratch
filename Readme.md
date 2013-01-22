# Windows from scratch


Download this repo and install veewee, em-winrm, and vagrant-windows from the Gemfile.

```
git clone git://github.com/hh/windows-fromscratch.git
cd windows-fromscratch
bundle install
bundle exec bash
```

The [veewee](jedi4ever/veewee@master) gem includes some windows templates:

```
$ veewee vbox templates | grep windows
veewee vbox define '<box_name>' 'windows-2008R1-serverstandard-amd64'
veewee vbox define '<box_name>' 'windows-2008R1-serverweb-amd64'
veewee vbox define '<box_name>' 'windows-2008R1-serverweb-i386'
veewee vbox define '<box_name>' 'windows-2008R1-serverwebcore-amd64'
veewee vbox define '<box_name>' 'windows-2008R2-amd64'
veewee vbox define '<box_name>' 'windows-2008R2-serverstandard-amd64'
veewee vbox define '<box_name>' 'windows-2008R2-serverstandard-amd64-winrm'
veewee vbox define '<box_name>' 'windows-2008R2-serverweb-amd64'
veewee vbox define '<box_name>' 'windows-2008R2-serverwebcore-amd64'
veewee vbox define '<box_name>' 'windows-7-enterprise-amd64'
veewee vbox define '<box_name>' 'windows-7-enterprise-amd64-winrm'
veewee vbox define '<box_name>' 'windows-7-enterprise-i386'
veewee vbox define '<box_name>' 'windows-7-premium-amd64'
veewee vbox define '<box_name>' 'windows-7-professional-amd64'
veewee vbox define '<box_name>' 'windows-7-ultimate-amd64'
veewee vbox define '<box_name>' 'windows-7sp1-ultimate-amd64'
veewee vbox define '<box_name>' 'windows-8-amd64'
veewee vbox define '<box_name>' 'windows-8-i386'
veewee vbox define '<box_name>' 'windows-8-preview-amd64'
```

The following command would create a definitions/my2008r2/definition.rb which you could edit:

```
$ veewee vbox define 'my2008r2' 'windows-2008R2-serverstandard-amd64-winrm'
The basebox 'my2008r2' has been successfully created from the template 'windows-2008R2-serverstandard-amd64-winrm'
You can now edit the definition files stored in definitions/my2008r2 or build the box with:
veewee vbox build 'my2008r2'
```

## vagrant basebox list

However, I included a few DRYer definitions from opscode/bento@master within this repo:

```
$ vagrant basebox list
- windows-7-enterprise
- windows-2008r2-standard
```

## vagrant basebox build windows-2008r2-standard

An iso directory will be created and the VBoxGuestAdditions will be downloaded as well as the definitions iso. You can manually copy the iso's into place if you want to avoid downloading in place.

```
$ vagrant basebox build windows-2008r2-standard
[windows-2008r2-standard] Downloading vbox guest additions iso v 4.1.12 - http://download.virtualbox.org/virtualbox/4.1.12/VBoxGuestAdditions_4.1.12.iso
[windows-2008r2-standard] Checking if isofile VBoxGuestAdditions_4.1.12.iso already exists.
[windows-2008r2-standard] Full path: /home/user/src/windows-fromscratch/iso/VBoxGuestAdditions_4.1.12.iso
[windows-2008r2-standard] 
[windows-2008r2-standard] The isofile VBoxGuestAdditions_4.1.12.iso already exists.
[windows-2008r2-standard] Building Box windows-2008r2-standard with Definition windows-2008r2-standard:
[windows-2008r2-standard] 
[windows-2008r2-standard] The isofile 7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso already exists.
```

### Autounattended.xml on a virtual floppy

Everything within Windows is automated via the Autounattended.xml, which includes formatting disks, creating the vagrant user, and commands for setting up winrm. The Autounattended.xml is placed on a virtual floppy which is attached to the VM as it boots. Windows looks for a file by that name on any removeable media. The rest of the VM parameters come from our definition.rb.

```
[windows-2008r2-standard] Creating vm windows-2008r2-standard : 384M - 1 CPU - Windows2008_64
[windows-2008r2-standard] Creating new harddrive of size 40960, format VDI, variant Standard 
[windows-2008r2-standard] Attaching disk: /home/user/VirtualBox VMs/windows-2008r2-standard/windows-2008r2-standard.vdi
[windows-2008r2-standard] Mounting cdrom: /home/user/src/windows-fromscratch/iso/7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso
[windows-2008r2-standard] Mounting guest additions: /home/user/src/windows-fromscratch/iso/VBoxGuestAdditions_4.1.12.iso
[vagrant] Using winrm because winrm_user and winrm_password are both set
[windows-2008r2-standard] Received port hint - 5985
[windows-2008r2-standard] Found port 5986 available
[vagrant] Changing winrm port from 5985 to 5986
[windows-2008r2-standard] Received port hint - 5986
[windows-2008r2-standard] Found port 5986 available
[vagrant] Changing winrm port on UP from 5985 to 5986
[windows-2008r2-standard] Waiting 1 seconds for the machine to boot
[windows-2008r2-standard] Received port hint - 7190
[windows-2008r2-standard] Found port 7190 available
[windows-2008r2-standard] 
[windows-2008r2-standard] Typing:[1]: 
[windows-2008r2-standard] Done typing.
[windows-2008r2-standard] 
[vagrant] Skipping webserver as no kickstartfile was specified
[windows-2008r2-standard] Received port hint - 7190
[windows-2008r2-standard] Found port 7190 available
```

## scp equivalent... wincp using wget vbscript to retrieve from a one-shot webserver

Windows doesn't have scp or easy cross platform file copy abilities
(assuming you have only ruby and not samba4). So we spin up a small
webserver on your host and create a wget.vbs which we use to retrieve
any files we want to copy.

```
[vagrant] Waiting for winrm login on 127.0.0.1 with user vagrant to windows on port => 5986 to work, timeout=10000 sec
[vagrant] ....................................................
[vagrant] Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
[vagrant] File Not Found
[vagrant] Creating wget.vbs
[vagrant] Executing winrm command: cmd.exe /C echo "Rendering '%TEMP%\\wget.vbs'.... OMITTING STUFF ....)
[vagrant] "Rendering 'C:\Users\vagrant\AppData\Local\Temp\\wget.vbs' chunk 1" 
[vagrant] Executing winrm command: cmd.exe /C echo "Rendering '%TEMP%\\wget.vbs' chunk 2" && >> %TEMP%\\wget.vbs (echo.Set objADOStream = Nothing) && >> %TEMP%\\wget.vbs (echo.End if) && >> %TEMP%\\wget.vbs (echo.Set objXMLHTTP = Nothing)
[vagrant] "Rendering 'C:\Users\vagrant\AppData\Local\Temp\\wget.vbs' chunk 2" 

[vagrant] Spinning up a wait_for_http_request on http://10.0.2.2:7190/tmp/.veewee_version20130122-16271-v7yvjc
[vagrant] Going to try and copy /tmp/.veewee_version20130122-16271-v7yvjc to ".veewee_version"
[vagrant] Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7190/tmp/.veewee_version20130122-16271-v7yvjc /path:.veewee_version
[windows-2008r2-standard] Serving file /tmp/.veewee_version20130122-16271-v7yvjc
[vagrant] Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

[windows-2008r2-standard] Received port hint - 7190
[windows-2008r2-standard] Found port 7191 available
[vagrant] Changing wincp port from 7190 to 7191
[vagrant] Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
[vagrant] Spinning up a wait_for_http_request on http://10.0.2.2:7191/tmp/.vbox_version20130122-16271-1ja4p8y
[vagrant] Going to try and copy /tmp/.vbox_version20130122-16271-1ja4p8y to ".vbox_version"
[vagrant] Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7191/tmp/.vbox_version20130122-16271-1ja4p8y /path:.vbox_version
[windows-2008r2-standard] Serving file /tmp/.vbox_version20130122-16271-1ja4p8y
[vagrant] Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

[windows-2008r2-standard] Received port hint - 7191
[windows-2008r2-standard] Found port 7192 available
[vagrant] Changing wincp port from 7191 to 7192
[vagrant] Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
[vagrant] Spinning up a wait_for_http_request on http://10.0.2.2:7192/home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/install-chef.bat
[vagrant] Going to try and copy /home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/install-chef.bat to "install-chef.bat"
[vagrant] Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7192/home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/install-chef.bat /path:install-chef.bat
[windows-2008r2-standard] Serving file /home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/install-chef.bat
[vagrant] Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

[windows-2008r2-standard] Received port hint - 7192
[windows-2008r2-standard] Found port 7193 available
[vagrant] Changing wincp port from 7192 to 7193
[vagrant] Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
[vagrant] Spinning up a wait_for_http_request on http://10.0.2.2:7193/home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/install-vbox.bat
[vagrant] Going to try and copy /home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/install-vbox.bat to "install-vbox.bat"
[vagrant] Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7193/home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/install-vbox.bat /path:install-vbox.bat
[windows-2008r2-standard] Serving file /home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/install-vbox.bat
[vagrant] Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

[windows-2008r2-standard] Received port hint - 7193
[windows-2008r2-standard] Found port 7194 available
[vagrant] Changing wincp port from 7193 to 7194
[vagrant] Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
[vagrant] Spinning up a wait_for_http_request on http://10.0.2.2:7194/home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/mount-validation.bat
[vagrant] Going to try and copy /home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/mount-validation.bat to "mount-validation.bat"
[vagrant] Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7194/home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/mount-validation.bat /path:mount-validation.bat
[windows-2008r2-standard] Serving file /home/user/src/windows-fromscratch/definitions/windows-2008r2-standard/mount-validation.bat
[vagrant] Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.
```

## postinstall_files

The postinstall_files are then executed, installing chef and vbox guest utilities:

```
[vagrant] Executing winrm command: install-chef.bat
[vagrant] 
[vagrant] C:\Users\vagrant>cmd /C cscript C:\Users\vagrant\AppData\Local\Temp\wget.vbs /url:http://www.opscode.com/chef/install.msi /path:C:\Users\vagrant\AppData\Local\Temp\chef-client.msi 
[vagrant] Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

[vagrant] 
[vagrant] C:\Users\vagrant>cmd /C msiexec /qn /i C:\Users\vagrant\AppData\Local\Temp\chef-client.msi 
[vagrant] Executing winrm command: 
[vagrant] Executing winrm command: install-vbox.bat
[vagrant] 
[vagrant] C:\Users\vagrant># with this, we can open the iso, and extract the VBoxWindowsAdditions.exe! 
[vagrant] '#' is not recognized as an internal or external command,
operable program or batch file.
[vagrant] '#' is not recognized as an internal or external command,
operable program or batch file.
[vagrant] 
C:\Users\vagrant># http://downloads.sourceforge.net/sevenzip/7z920.exe 

C:\Users\vagrant>cmd /c certutil -addstore -f "TrustedPublisher" a:oracle-cert.cer 
[vagrant] TrustedPublisher
[vagrant] Certificate "CN=Oracle Corporation, OU=Digital ID Class 3 - Microsoft Software Validation v2, O=Oracle Corporation, L=Redwood Shores, S=California, C=US" added to store.[vagrant] 
CertUtil: -addstore command completed successfully.
[vagrant] 
C:\Users\vagrant>cmd /c e:\VBoxWindowsAdditions-amd64.exe /S 
[vagrant] 
[vagrant] C:\Users\vagrant>cmd /c shutdown.exe /r /t 0 /d p:2:4 /c "Vagrant reboot for VBoxWindowsAdditions" 
[vagrant] Executing winrm command: 
[vagrant] Executing winrm command: mount-validation.bat
[vagrant] Unable to authenticate as 'vagrant' with password 'vagrant'
[vagrant] Executing winrm command: 
[windows-2008r2-standard] The box windows-2008r2-standard was build successfully!
[windows-2008r2-standard] You can now login to the box with:
[vagrant] knife winrm -m 127.0.0.1 -P 5986 -x vagrant -P vagrant COMMAND
```

## vagrant basebox validate windows-2008r2-standard

The VM is now running and we can use, customize, and validate it.

```
$ vagrant basebox validate windows-2008r2-standard
Feature: veewee box validation
  As a valid veewee box
  I need to comply to a set of rules
  In order to make sure it works on Windows with Winrm

  @vmfusion @virtualbox @kvm
  Scenario: Valid definition                              # /opt/chef/embedded/lib/ruby/gems/1.9.1/gems/veewee-0.3.7/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:7
    Given a veeweebox was build                           # veewee-0.3.7/validation/features/steps/veewee_steps.rb:3
    And I run "whoami" over ssh                           # veewee-0.3.7/validation/features/steps/veewee_steps.rb:16
    Then I should see the provided username in the output # veewee-0.3.7/validation/features/steps/veewee_steps.rb:20

  @vmfusion @virtualbox @kvm
  Scenario: Checking ruby                                                     # /opt/chef/embedded/lib/ruby/gems/1.9.1/gems/veewee-0.3.7/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:13
    Given a veeweebox was build                                               # veewee-0.3.7/validation/features/steps/veewee_steps.rb:3
    And I run "ruby --version > %TEMP%\devnull && echo %ERRORLEVEL%" over ssh # veewee-0.3.7/validation/features/steps/veewee_steps.rb:16
    Then I should see "0" in the output                                       # veewee-0.3.7/validation/features/steps/veewee_steps.rb:24

  @vmfusion @virtualbox @kvm
  Scenario: Checking gem                                                     # /opt/chef/embedded/lib/ruby/gems/1.9.1/gems/veewee-0.3.7/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:19
    Given a veeweebox was build                                              # veewee-0.3.7/validation/features/steps/veewee_steps.rb:3
    And I run "gem --version > %TEMP%\devnull && echo %ERRORLEVEL%" over ssh # veewee-0.3.7/validation/features/steps/veewee_steps.rb:16
    Then I should see "0" in the output                                      # veewee-0.3.7/validation/features/steps/veewee_steps.rb:24

  @vmfusion @virtualbox @kvm
  Scenario: Checking chef                                                            # /opt/chef/embedded/lib/ruby/gems/1.9.1/gems/veewee-0.3.7/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:25
    Given a veeweebox was build                                                      # veewee-0.3.7/validation/features/steps/veewee_steps.rb:3
    And I run "chef-client --version > %TEMP%\devnull && echo %ERRORLEVEL%" over ssh # veewee-0.3.7/validation/features/steps/veewee_steps.rb:16
    Then I should see "0" in the output                                              # veewee-0.3.7/validation/features/steps/veewee_steps.rb:24

  @vagrant
  Scenario: Checking shared folders                     # /opt/chef/embedded/lib/ruby/gems/1.9.1/gems/veewee-0.3.7/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:31
    Given a veeweebox was build                         # veewee-0.3.7/validation/features/steps/veewee_steps.rb:3
    And I run "net use|grep veewee-validation" over ssh # veewee-0.3.7/validation/features/steps/veewee_steps.rb:16
    Then I should see "veewee-validation" in the output # veewee-0.3.7/validation/features/steps/veewee_steps.rb:24

5 scenarios (5 passed)
15 steps (15 passed)
0m36.740s
```

## vagrant basebox export windows-2008r2-standard

We should now export our new windows box so we can share it within our organization for testing.

```
$ vagrant basebox export windows-2008r2-standard
[windows-2008r2-standard] Vagrant requires the box to be shutdown, before it can export
[windows-2008r2-standard] Sudo also needs to work for user vagrant
[windows-2008r2-standard] Performing a clean shutdown now.
[vagrant] Waiting for winrm login on 127.0.0.1 with user vagrant to windows on port => 5986 to work, timeout=10000 sec
[vagrant] .[vagrant] 
[vagrant] Executing winrm command: shutdown /s /t 10  /f /d p:4:1 /c "Vagrant Shutdown"
[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] .[windows-2008r2-standard] 
[windows-2008r2-standard] Machine windows-2008r2-standard is powered off cleanly
[windows-2008r2-standard] Executing vagrant voodoo:
[windows-2008r2-standard] vagrant package --base 'windows-2008r2-standard' --output 'windows-2008r2-standard.box'
[windows-2008r2-standard] 
[windows-2008r2-standard] To import it into vagrant type:
[windows-2008r2-standard] vagrant box add 'windows-2008r2-standard' 'windows-2008r2-standard.box'
[windows-2008r2-standard] 
[windows-2008r2-standard] To use it:
[windows-2008r2-standard] vagrant init 'windows-2008r2-standard'
[windows-2008r2-standard] vagrant up
[windows-2008r2-standard] vagrant ssh

```


## Vagrantfile Box config

We have a Vagrantfile that contains a vm.box_url pointing to the .box file we just created:

```ruby
Vagrant::Config.run do |config|
  config.vm.box = "windows-2008r2-standard"
  config.vm.box_url = "./windows-2008r2-standard.box"
end
```

## vagrant up #(box download and import)

First vagrant imports the basebox from the url which is pointed to the locally generated file in this example.

```
$ vagrant up
[default] Box windows-2008r2-standard was not found. Fetching box from specified URL...
[vagrant] Downloading with Vagrant::Downloaders::File...
[vagrant] Copying box to temporary location...
[vagrant] Extracting box...
[vagrant] Verifying box...
[vagrant] Cleaning up downloaded box...
[default] Importing base box 'windows-2008r2-standard'...
```

## Vagrantfile VM config

```ruby
Vagrant::Config.run do |config|
  config.vm.guest = :windows
  config.vm.boot_mode = :gui
  config.vm.forward_port 3389, 3390, :name => "rdp", :auto => true
  config.vm.forward_port 5985, 5985, :name => "winrm", :auto => true
  config.vm.customize ["modifyvm", :id, "--memory", 1024]
  config.vm.customize ["modifyvm", :id, "--vram", 48] # I have a big screen
  config.vm.customize ["modifyvm", :id, "--cpus", 4] # I have an 8 way
  # ...
end
```

## vagrant up #(setting up network, ports, booting, shared folders)

```
[default] Matching MAC address for NAT networking...
[default] Clearing any previously set forwarded ports...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] -- 3389 => 3390 (adapter 1)
[default] -- 5985 => 5985 (adapter 1)
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Running any VM customizations...
[default] Booting VM...
[default] Waiting for VM to boot. This can take a few minutes.
vagrant-2008R2
[default] VM booted and ready for use!
[default] Mounting shared folders...
[default] -- v-root: /vagrant
[default] -- v-csc-1: /tmp/vagrant-chef-1/chef-solo-1/cookbooks
```

## Vagrantfile VM provisioning 

We add a few recipes from our windows-fromscratch cookbook.

```ruby
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.json = {}
    chef.add_recipe("windows-fromscratch::_annoyances")
    chef.add_recipe("windows-fromscratch::sysinternals")
    chef.add_recipe("windows-fromscratch::bginfo")
  end
```

## vagrant up #(provisioning via chef_solo)

Note that a solo.rb and dna.json are dynamically created and the cookbooks are mounted. The result is a chef-solo run within the new windows VM that points to the cookbooks outside the VM.

```
[default] Running provisioner: Vagrant::Provisioners::ChefSolo...
C:\opscode\chef\bin\chef-solo.bat
[default] Generating chef JSON and uploading...
[default] Running chef-solo...
[2013-01-22T12:44:09-08:00] INFO: *** Chef 10.18.2 ***
[2013-01-22T12:44:47-08:00] INFO: Setting the run_list to ["recipe[windows-fromscratch::_annoyances]", "recipe[windows-fromscratch::sysinternals]", "recipe[windows-fromscratch::bginfo]"] from JSON
[2013-01-22T12:44:47-08:00] INFO: Run List is [recipe[windows-fromscratch::_annoyances], recipe[windows-fromscratch::sysinternals], recipe[windows-fromscratch::bginfo]]
[2013-01-22T12:44:47-08:00] INFO: Run List expands to [windows-fromscratch::_annoyances, windows-fromscratch::sysinternals, windows-fromscratch::bginfo]
[2013-01-22T12:44:47-08:00] INFO: Starting Chef Run for vagrant-2008R2
[2013-01-22T12:44:47-08:00] INFO: Running start handlers
[2013-01-22T12:44:47-08:00] INFO: Start handlers complete.
[2013-01-22T12:44:48-08:00] INFO: Processing windows_registry[HKLM\SOFTWARE\Microsoft\ServerManager\Oobe] action modify (windows-fromscratch::_annoyances line X)
[2013-01-22T12:44:48-08:00] INFO: Processing windows_registry[HKLM\SOFTWARE\Microsoft\ServerManager] action modify (windows-fromscratch::_annoyances line X)
[2013-01-22T12:44:48-08:00] INFO: Processing windows_registry[HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability] action modify (windows-fromscratch::_annoyances line X)
[2013-01-22T12:44:48-08:00] INFO: Processing windows_registry[HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System] action modify (windows-fromscratch::_annoyances line X)
[2013-01-22T12:44:48-08:00] INFO: Processing directory[/tmp/vagrant-chef-1/sysinternals] action create (windows-fromscratch::sysinternals line )
[2013-01-22T12:44:48-08:00] INFO: directory[/tmp/vagrant-chef-1/sysinternals] created directory /tmp/vagrant-chef-1/sysinternals
[2013-01-22T12:44:48-08:00] INFO: Processing remote_file[c:\opscode\chef\bin/Procmon.exe] action create (windows-fromscratch::sysinternals line X)
[2013-01-22T12:45:10-08:00] INFO: remote_file[c:/opscode/chef/bin/Procmon.exe] updated
[2013-01-22T12:45:10-08:00] INFO: Processing windows_registry[HKCU\Software\Sysinternals\Process Monitor] action modify (windows-fromscratch::sysinternals line X)
[2013-01-22T12:45:10-08:00] INFO: Processing remote_file[c:\opscode\chef\bin/Bginfo.exe] action create (windows-fromscratch::sysinternals line X)
[2013-01-22T12:45:34-08:00] INFO: remote_file[c:/opscode/chef/bin/Bginfo.exe] updated
[2013-01-22T12:45:34-08:00] INFO: Processing windows_registry[HKCU\Software\Sysinternals\BGInfo] action modify (windows-fromscratch::sysinternals line X)
[2013-01-22T12:45:34-08:00] INFO: Processing windows_auto_run[BGINFO] action create (windows-fromscratch::bginfo line X)
[2013-01-22T12:45:34-08:00] INFO: Processing windows_registry[HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] action modify (C line X)
[2013-01-22T12:45:34-08:00] INFO: Processing windows_registry[HKEY_CURRENT_USER\Software\Winternals\BGInfo] action modify (windows-fromscratch::bginfo line X)
[2013-01-22T12:45:34-08:00] INFO: Chef Run complete in 47.390537 seconds
[2013-01-22T12:45:34-08:00] INFO: Running report handlers
[2013-01-22T12:45:34-08:00] INFO: Report handlers complete
```

Enjoy.