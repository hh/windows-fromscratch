require 'Win32API'

ruby_block 'set windows background' do
  block do
    desktop = Win32API.new("user32", "SystemParametersInfo", ['L','L','P','L'] , 'L')
    desktop.Call(20,0,node['windows-fromscratch']['background'],1)
  end
  # not_if 'some code to check current desktop'
end
