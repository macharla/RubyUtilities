def Versions()
require 'win32/registry'
Win32::Registry::HKEY_LOCAL_MACHINE.open(
  'Software\Microsoft\Windows\CurrentVersion\Uninstall' 
) do |reg|
  reg.each_key do |key|
    k = reg.open(key)

    puts key
    puts k["DisplayName"]    rescue "?"
    puts k["DisplayVersion"] rescue "?"
    puts k["Publisher"]      rescue "?"
    #puts k["URLInfoAbout"]   rescue "?"
    puts
  end
end
end
Versions()