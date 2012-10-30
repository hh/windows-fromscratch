# Windows from scratch


Download this repo and install the gems from the Gemfile.

```
git clone git://github.com/hh/windows-fromscratch.git
cd windows-fromscratch
bundle install
bundle exec bash
```

Now generate a new windows 2008R2 box from scratch.

```
veewee vbox build windows-2008R2-serverstandard-amd64-winrm
veewee vbox validate windows-2008R2-serverstandard-amd64-winrm
vagrant basebox export windows-2008R2-serverstandard-amd64-winrm
vagrant up
```



## veewee vbox build windows-2008R2-serverstandard-amd64-winrm

If you don't have the isos in ./iso you'll need to download them.

```
Downloading vbox guest additions iso v 4.1.12 - http://download.virtualbox.org/virtualbox/4.1.12/VBoxGuestAdditions_4.1.12.iso
Checking if isofile VBoxGuestAdditions_4.1.12.iso already exists.
Full path: /home/hh/chef/t/windows-fromscratch/iso/VBoxGuestAdditions_4.1.12.iso

The isofile VBoxGuestAdditions_4.1.12.iso already exists.
Building Box windows-2008R2-serverstandard-amd64-winrm with Definition windows-2008R2-serverstandard-amd64-winrm:
- force : false
- debug : false
- nogui : false
- auto : false
- redirectconsole : false
- postinstall_include : []
- postinstall_exclude : []

We did not find an isofile here : /home/hh/chef/t/windows-fromscratch/iso/7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso. 

The definition provided the following download information:
- Download url: http://care.dlservice.microsoft.com//dl/download/7/5/E/75EC4E54-5B02-42D6-8879-D8D3A25FBEF7/7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso
- Md5 Checksum: 4263be2cf3c59177c45085c0a7bc6ca5


Download? (Yes/No) Yes
Checking if isofile 7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso already exists.
Full path: /home/hh/chef/t/windows-fromscratch/iso/7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso
Fetching file:   0% |                                                               |   1.4MB 346.4KB/s ETA
```

If everything is downloaded the output will look like this:

```
Downloading vbox guest additions iso v 4.1.12 - http://download.virtualbox.org/virtualbox/4.1.12/VBoxGuestAdditions_4.1.12.iso
Checking if isofile VBoxGuestAdditions_4.1.12.iso already exists.
Full path: /home/hh/chef/t/windows-fromscratch/iso/VBoxGuestAdditions_4.1.12.iso

The isofile VBoxGuestAdditions_4.1.12.iso already exists.
Building Box windows-2008R2-serverstandard-amd64-winrm with Definition windows-2008R2-serverstandard-amd64-winrm:
- force : false
- debug : false
- nogui : false
- auto : false
- redirectconsole : false
- postinstall_include : []
- postinstall_exclude : []

The isofile 7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso already exists.
Creating vm windows-2008R2-serverstandard-amd64-winrm : 384M - 1 CPU - Windows2008_64
Creating new harddrive of size 20280, format VDI, variant Standard 
Attaching disk: /home/hh/VirtualBox VMs/windows-2008R2-serverstandard-amd64-winrm/windows-2008R2-serverstandard-amd64-winrm.vdi
Mounting cdrom: /home/hh/chef/t/windows-fromscratch/iso/7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso
Mounting guest additions: /home/hh/chef/t/windows-fromscratch/iso/VBoxGuestAdditions_4.1.12.iso
Using winrm because winrm_user and winrm_password are both set
Received port hint - 5985
Found port 5985 available
Received port hint - 5985
Found port 5985 available
Waiting 1 seconds for the machine to boot
Received port hint - 7100
Found port 7100 available

Typing:[1]: 
Done typing.

Skipping webserver as no kickstartfile was specified
Received port hint - 7100
Found port 7100 available
Waiting for winrm login on 127.0.0.1 with user vagrant to windows on port => 5985 to work, timeout=10000 sec
.............................
Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
File Not Found
Creating wget.vbs
Executing winrm command: cmd.exe /C echo "Rendering '%TEMP%\\wget.vbs' chunk 1" && >> %TEMP%\\wget.vbs (echo.url = WScript.Arguments.Named^("url"^)) && >> %TEMP%\\wget.vbs (echo.path = WScript.Arguments.Named^("path"^)) && >> %TEMP%\\wget.vbs (echo.Set objXMLHTTP = CreateObject^("MSXML2.ServerXMLHTTP"^)) && >> %TEMP%\\wget.vbs (echo.Set wshShell = CreateObject^( "WScript.Shell" ^)) && >> %TEMP%\\wget.vbs (echo.Set objUserVariables = wshShell.Environment^("USER"^)) && >> %TEMP%\\wget.vbs (echo.) && >> %TEMP%\\wget.vbs (echo.'http proxy is optional) && >> %TEMP%\\wget.vbs (echo.'attempt to read from HTTP_PROXY env var first) && >> %TEMP%\\wget.vbs (echo.On Error Resume Next) && >> %TEMP%\\wget.vbs (echo.) && >> %TEMP%\\wget.vbs (echo.If NOT ^(objUserVariables^("HTTP_PROXY"^) = ""^) Then) && >> %TEMP%\\wget.vbs (echo.objXMLHTTP.setProxy 2, objUserVariables^("HTTP_PROXY"^)) && >> %TEMP%\\wget.vbs (echo.) && >> %TEMP%\\wget.vbs (echo.'fall back to named arg) && >> %TEMP%\\wget.vbs (echo.ElseIf NOT ^(WScript.Arguments.Named^("proxy"^) = ""^) Then) && >> %TEMP%\\wget.vbs (echo.objXMLHTTP.setProxy 2, WScript.Arguments.Named^("proxy"^)) && >> %TEMP%\\wget.vbs (echo.End If) && >> %TEMP%\\wget.vbs (echo.) && >> %TEMP%\\wget.vbs (echo.On Error Goto 0) && >> %TEMP%\\wget.vbs (echo.) && >> %TEMP%\\wget.vbs (echo.objXMLHTTP.open "GET", url, false) && >> %TEMP%\\wget.vbs (echo.objXMLHTTP.send^(^)) && >> %TEMP%\\wget.vbs (echo.If objXMLHTTP.Status = 200 Then) && >> %TEMP%\\wget.vbs (echo.Set objADOStream = CreateObject^("ADODB.Stream"^)) && >> %TEMP%\\wget.vbs (echo.objADOStream.Open) && >> %TEMP%\\wget.vbs (echo.objADOStream.Type = 1) && >> %TEMP%\\wget.vbs (echo.objADOStream.Write objXMLHTTP.ResponseBody) && >> %TEMP%\\wget.vbs (echo.objADOStream.Position = 0) && >> %TEMP%\\wget.vbs (echo.Set objFSO = Createobject^("Scripting.FileSystemObject"^)) && >> %TEMP%\\wget.vbs (echo.If objFSO.Fileexists^(path^) Then objFSO.DeleteFile path) && >> %TEMP%\\wget.vbs (echo.Set objFSO = Nothing) && >> %TEMP%\\wget.vbs (echo.objADOStream.SaveToFile path) && >> %TEMP%\\wget.vbs (echo.objADOStream.Close)
"Rendering 'C:\Users\vagrant\AppData\Local\Temp\\wget.vbs' chunk 1" 
Executing winrm command: cmd.exe /C echo "Rendering '%TEMP%\\wget.vbs' chunk 2" && >> %TEMP%\\wget.vbs (echo.Set objADOStream = Nothing) && >> %TEMP%\\wget.vbs (echo.End if) && >> %TEMP%\\wget.vbs (echo.Set objXMLHTTP = Nothing)
"Rendering 'C:\Users\vagrant\AppData\Local\Temp\\wget.vbs' chunk 2" 
Spinning up a wait_for_http_request on http://10.0.2.2:7100/tmp/.veewee_version20121029-8765-162hbn1
Going to try and copy /tmp/.veewee_version20121029-8765-162hbn1 to ".veewee_version"
Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7100/tmp/.veewee_version20121029-8765-162hbn1 /path:.veewee_version
Serving file /tmp/.veewee_version20121029-8765-162hbn1
Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

Received port hint - 7100
Found port 7101 available
Changing wincp port from 7100 to 7101
Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
Spinning up a wait_for_http_request on http://10.0.2.2:7101/tmp/.vbox_version20121029-8765-r7jmcx
Going to try and copy /tmp/.vbox_version20121029-8765-r7jmcx to ".vbox_version"
Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7101/tmp/.vbox_version20121029-8765-r7jmcx /path:.vbox_version
Serving file /tmp/.vbox_version20121029-8765-r7jmcx
Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

Received port hint - 7101
Found port 7102 available
Changing wincp port from 7101 to 7102
Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
Spinning up a wait_for_http_request on http://10.0.2.2:7102/home/hh/chef/t/windows-fromscratch/definitions/windows-2008R2-serverstandard-amd64-winrm/install-chef.bat
Going to try and copy /home/hh/chef/t/windows-fromscratch/definitions/windows-2008R2-serverstandard-amd64-winrm/install-chef.bat to "install-chef.bat"
Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7102/home/hh/chef/t/windows-fromscratch/definitions/windows-2008R2-serverstandard-amd64-winrm/install-chef.bat /path:install-chef.bat
Serving file /home/hh/chef/t/windows-fromscratch/definitions/windows-2008R2-serverstandard-amd64-winrm/install-chef.bat
Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

Received port hint - 7102
Found port 7103 available
Changing wincp port from 7102 to 7103
Executing winrm command: cmd.exe /C dir %TEMP%\\wget.vbs > %TEMP%\null
Spinning up a wait_for_http_request on http://10.0.2.2:7103/home/hh/chef/t/windows-fromscratch/definitions/windows-2008R2-serverstandard-amd64-winrm/install-vbox.bat
Going to try and copy /home/hh/chef/t/windows-fromscratch/definitions/windows-2008R2-serverstandard-amd64-winrm/install-vbox.bat to "install-vbox.bat"
Executing winrm command: cmd.exe /C cscript %TEMP%\wget.vbs /url:http://10.0.2.2:7103/home/hh/chef/t/windows-fromscratch/definitions/windows-2008R2-serverstandard-amd64-winrm/install-vbox.bat /path:install-vbox.bat
Serving file /home/hh/chef/t/windows-fromscratch/definitions/windows-2008R2-serverstandard-amd64-winrm/install-vbox.bat
Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.

Executing winrm command: install-chef.bat

C:\Users\vagrant>cmd /C cscript C:\Users\vagrant\AppData\Local\Temp\wget.vbs /url:http://www.opscode.com/chef/install.msi /path:C:\Users\vagrant\AppData\Local\Temp\chef-client.msi 
Microsoft (R) Windows Script Host Version 5.8
Copyright (C) Microsoft Corporation. All rights reserved.


C:\Users\vagrant>cmd /C msiexec /qn /i C:\Users\vagrant\AppData\Local\Temp\chef-client.msi 
Executing winrm command: 
Executing winrm command: install-vbox.bat

C:\Users\vagrant>'#' is not recognized as an internal or external command,
operable program or batch file.
'#' is not recognized as an internal or external command,
operable program or batch file.
# with this, we can open the iso, and extract the VBoxWindowsAdditions.exe! 

C:\Users\vagrant># http://downloads.sourceforge.net/sevenzip/7z920.exe 

C:\Users\vagrant>cmd /c certutil -addstore -f "TrustedPublisher" a:oracle-cert.cer 
TrustedPublisher
Certificate "CN=Oracle Corporation, OU=Digital ID Class 3 - Microsoft Software Validation v2, O=Oracle Corporation, L=Redwood Shores, S=California, C=US" added to store.
CertUtil: -addstore command completed successfully.

C:\Users\vagrant>cmd /c e:\VBoxWindowsAdditions-amd64.exe /S 
Executing winrm command: 
The box windows-2008R2-serverstandard-amd64-winrm was build succesfully!
You can now login to the box with:
knife winrm -m 127.0.0.1 -P 5985 -x vagrant -P vagrant COMMAND
```

## veewee vbox validate windows-2008R2-serverstandard-amd64-winrm

```
Feature: veewee box validation
  As a valid veewee box
  I need to comply to a set of rules
  In order to make sure it works on Windows with Winrm

  @vmfusion @virtualbox @kvm
  Scenario: Valid definition                              # /home/hh/.rvm/gems/ruby-1.9.3-p194/bundler/gems/veewee-8ce8f06c75b6/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:7
    Given a veeweebox was build                           # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:3
    And I run "whoami" over ssh                           # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:16
    Then I should see the provided username in the output # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:20

  @vmfusion @virtualbox @kvm
  Scenario: Checking ruby                                                     # /home/hh/.rvm/gems/ruby-1.9.3-p194/bundler/gems/veewee-8ce8f06c75b6/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:13
    Given a veeweebox was build                                               # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:3
    And I run "ruby --version > %TEMP%\devnull && echo %ERRORLEVEL%" over ssh # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:16
    Then I should see "0" in the output                                       # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:24

  @vmfusion @virtualbox @kvm
  Scenario: Checking gem                                                     # /home/hh/.rvm/gems/ruby-1.9.3-p194/bundler/gems/veewee-8ce8f06c75b6/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:19
    Given a veeweebox was build                                              # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:3
    And I run "gem --version > %TEMP%\devnull && echo %ERRORLEVEL%" over ssh # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:16
    Then I should see "0" in the output                                      # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:24

  @vmfusion @virtualbox @kvm
  Scenario: Checking chef                                                            # /home/hh/.rvm/gems/ruby-1.9.3-p194/bundler/gems/veewee-8ce8f06c75b6/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:25
    Given a veeweebox was build                                                      # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:3
    And I run "chef-client --version > %TEMP%\devnull && echo %ERRORLEVEL%" over ssh # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:16
    Then I should see "0" in the output                                              # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:24

  @vagrant
  Scenario: Checking shared folders                     # /home/hh/.rvm/gems/ruby-1.9.3-p194/bundler/gems/veewee-8ce8f06c75b6/lib/veewee/provider/core/box/../../../../../validation/veewee-windows.feature:31
    Given a veeweebox was build                         # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:3
    And I run "net use|grep veewee-validation" over ssh # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:16
    Then I should see "veewee-validation" in the output # veewee-8ce8f06c75b6/validation/features/steps/veewee_steps.rb:24

5 scenarios (5 passed)
15 steps (15 passed)
0m16.461s
```

## vagrant basebox export windows-2008R2-serverstandard-amd64-winrm

This creates the windows-2008R2-serverstandard-amd64-winrm.box file, which could be put on an internal url.

```
$ vagrant basebox export windows-2008R2-serverstandard-amd64-winrm
[windows-2008R2-serverstandard-amd64-winrm] Vagrant requires the box to be shutdown, before it can export
[windows-2008R2-serverstandard-amd64-winrm] Sudo also needs to work for user 
[windows-2008R2-serverstandard-amd64-winrm] Performing a clean shutdown now.
[vagrant] Waiting for winrm login on 127.0.0.1 with user vagrant to windows on port => 5985 to work, timeout=10000 sec
[vagrant] 
[vagrant] Executing winrm command: shutdown /s /t 10  /f /d p:4:1 /c "Vagrant Shutdown"
[windows-2008R2-serverstandard-amd64-winrm] .......................
[windows-2008R2-serverstandard-amd64-winrm] Machine windows-2008R2-serverstandard-amd64-winrm is powered off cleanly
[windows-2008R2-serverstandard-amd64-winrm] Executing vagrant voodoo:
[windows-2008R2-serverstandard-amd64-winrm] vagrant package --base 'windows-2008R2-serverstandard-amd64-winrm' --output 'windows-2008R2-serverstandard-amd64-winrm.box'
[windows-2008R2-serverstandard-amd64-winrm] 
[windows-2008R2-serverstandard-amd64-winrm] To import it into vagrant type:
[windows-2008R2-serverstandard-amd64-winrm] vagrant box add 'windows-2008R2-serverstandard-amd64-winrm' 'windows-2008R2-serverstandard-amd64-winrm.box'
[windows-2008R2-serverstandard-amd64-winrm] 
[windows-2008R2-serverstandard-amd64-winrm] To use it:
[windows-2008R2-serverstandard-amd64-winrm] vagrant init 'windows-2008R2-serverstandard-amd64-winrm'
[windows-2008R2-serverstandard-amd64-winrm] vagrant up
[windows-2008R2-serverstandard-amd64-winrm] vagrant ssh
```


## vagrant up

This imports the basebox from the url (which is pointed to the locally generated file in this example) and runs the chef-solo provisioner specified in the Vagrantfile.

```
[default] Box windows-2008R2-serverstandard-amd64-winrm was not found. Fetching box from specified URL...
[vagrant] Downloading with Vagrant::Downloaders::File...
[vagrant] Copying box to temporary location...
[vagrant] Extracting box...
[vagrant] Verifying box...
[vagrant] Cleaning up downloaded box...
[default] Importing base box 'windows-2008R2-serverstandard-amd64-winrm'...
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
[default] Running provisioner: Vagrant::Provisioners::ChefSolo...
C:\opscode\chef\bin\chef-solo.bat
[default] Generating chef JSON and uploading...
#< CLIXML
<Objs Version="1.1.0.1" xmlns="http://schemas.microsoft.com/powershell/2004/04"><S S="Error">Remove-Item : Cannot find path 'C:\tmp\vagrant-chef-1\solo.rb' because it does _x000D__x000A_</S><S S="Error">not exist._x000D__x000A_</S><S S="Error">At line:25 char:3_x000D__x000A_</S><S S="Error">+ rm &lt;&lt;&lt;&lt;  /tmp/vagrant-chef-1/solo.rb_x000D__x000A_</S><S S="Error">    + CategoryInfo          : ObjectNotFound: (C:\tmp\vagrant-chef-1\solo.rb:S _x000D__x000A_</S><S S="Error">   tring) [Remove-Item], ItemNotFoundException_x000D__x000A_</S><S S="Error">    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.Remov _x000D__x000A_</S><S S="Error">   eItemCommand_x000D__x000A_</S><S S="Error"> _x000D__x000A_</S></Objs>
[default] Running chef-solo...
[2012-10-29T17:09:49-07:00] INFO: *** Chef 10.16.2 ***
[2012-10-29T17:10:09-07:00] INFO: Setting the run_list to ["recipe[windows-fromscratch::bginfo]"] from JSON
[2012-10-29T17:10:09-07:00] INFO: Run List is [recipe[windows-fromscratch::bginfo]]
[2012-10-29T17:10:09-07:00] INFO: Run List expands to [windows-fromscratch::bginfo]
[2012-10-29T17:10:09-07:00] INFO: Starting Chef Run for vagrant-2008R2
[2012-10-29T17:10:09-07:00] INFO: Running start handlers
[2012-10-29T17:10:09-07:00] INFO: Start handlers complete.
[2012-10-29T17:10:10-07:00] INFO: Processing directory[C:/Sysinternals] action create (windows-fromscratch::bginfo line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows-fromscratch/recipes/bginfo.rb)
[2012-10-29T17:10:10-07:00] INFO: directory[C:/Sysinternals] created directory C:/Sysinternals
[2012-10-29T17:10:10-07:00] INFO: Processing windows_zipfile[C:/Sysinternals] action unzip (windows-fromscratch::bginfo line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows-fromscratch/recipes/bginfo.rb)
[2012-10-29T17:10:10-07:00] INFO: Missing gem 'rubyzip'...installing now.
[2012-10-29T17:10:10-07:00] INFO: Processing chef_gem[rubyzip] action install (C line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows/providers/zipfile.rb)
[2012-10-29T17:10:13-07:00] INFO: Processing remote_file[/tmp/vagrant-chef-1/BGInfo.zip] action create (dynamically defined)
[2012-10-29T17:10:14-07:00] INFO: remote_file[/tmp/vagrant-chef-1/BGInfo.zip] updated
[2012-10-29T17:10:14-07:00] INFO: Processing chef_gem[rubyzip] action install (C line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows/providers/zipfile.rb)
[2012-10-29T17:10:14-07:00] INFO: Processing windows_registry[HKCU\Software\Sysinternals\BGInfo] action modify (windows-fromscratch::bginfo line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows-fromscratch/recipes/bginfo.rb)
[2012-10-29T17:10:14-07:00] INFO: Processing windows_registry[HKLM\SOFTWARE\Microsoft\ServerManager] action modify (windows-fromscratch::bginfo line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows-fromscratch/recipes/bginfo.rb)
[2012-10-29T17:10:14-07:00] INFO: Processing windows_registry[HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability] action modify (windows-fromscratch::bginfo line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows-fromscratch/recipes/bginfo.rb)
[2012-10-29T17:10:14-07:00] INFO: Processing cookbook_file[C:/Sysinternals/config.bgi] action create (windows-fromscratch::bginfo line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows-fromscratch/recipes/bginfo.rb)
[2012-10-29T17:10:14-07:00] INFO: cookbook_file[C:/Sysinternals/config.bgi] created file C:/Sysinternals/config.bgi
[2012-10-29T17:10:14-07:00] INFO: Processing windows_auto_run[BGINFO] action create (windows-fromscratch::bginfo line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows-fromscratch/recipes/bginfo.rb)
[2012-10-29T17:10:14-07:00] INFO: Processing windows_registry[HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] action modify (C line /tmp/vagrant-chef-1/chef-solo-1/cookbooks/windows/providers/auto_run.rb)
[2012-10-29T17:10:14-07:00] INFO: Chef Run complete in 4.810163 seconds
[2012-10-29T17:10:14-07:00] INFO: Running report handlers
[2012-10-29T17:10:14-07:00] INFO: Report handlers complete
'''