# Switches capslock to control for everywhere all the time get some.

case node['platform']
when "mac_os_x"

  log "Map caps lock to control on #{node['platform']} in System Preferences -> Keyboard -> Modifier Keys."
  
when "windows"

  windows_registry 'HKLM\System\CurrentControlSet\Control\Keyboard Layout' do
    values "Scancode Map" => "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00"
  end

else
end
