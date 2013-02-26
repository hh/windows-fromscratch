# http://technet.microsoft.com/en-us/library/cc732131.aspx
# Look upnder Registry settings
 

# (see http://support.microsoft.com/kb/182569/#letmefixit)
insecure_zone = {
    '1001' => 0,
    '1004' => 0,
    '1200' => 0,
    '1201' => 0,
    '1400' => 0,
    '1402' => 0,
    '1405' => 0,
    '1406' => 0,
    '1601' => 0,
    '1604' => 0,
    '1609' => 0,
    '1605' => 0,
    '1607' => 0,
    '1809' => 3,
    '2101' => 0,
    '2102' => 0,
    '2105' => 0,
    '2301' => 3,
    '2500' => 0,
    'CurrentLevel' => 10500,
    "WarnOnHTTPSToHTTPRedirect" => 0,
    "WarnOnPost" => 0,
    "WarnOnPostRedirect" => 0,
    "WarnOnZoneCrossing" => 0,
    "WarnonBadCertRecving" => 0
}

{
  'HKCU\Software\Microsoft\Internet Explorer\InformationBar' => {'FirstTime' => 0},
  'HKCU\Software\Microsoft\Internet Explorer\Security' => {'DisableSecuritySettingsCheck' => 1},
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1' => insecure_zone,
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2' => insecure_zone,
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3' => insecure_zone,
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\tips' => {'Show' => 0},
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' => {
    "StartButtonBalloonTip" => 0,
    "ShowInfoTip" => 0,
    "EnableBalloonTips" => 0,
    "FolderContentsInfoTip" => 0
  },
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' => {'NoSMBalloonTip' => 0},
  # Force IE to open Selenium in a window and not a tab
  'HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing' => {
    "Enabled" => 1,
    "WarnOnClose" => 0,
    "OpenInForeground" => 0,
    "PopupsUseNewWindow" => 1
  },
  # Bump IE 6 and 7 max synchronous requests
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings' => {
    "MaxConnectionsPer1_0Server" => 15,
    "MaxConnectionsPerServer" => 15,
    # Disable HTTPS->HTTP warning dialogue in IE on POST redirect
    # (see http://ie7triage.spaces.live.com/blog/cns!3B6634EF5458F389!240.entry)
    "WarnOnPostRedirect" => 0,
    "WarnOnIntranet" => 0,
    "WarnOnPost" => 0,
    "WarnonZoneCrossing" => 0,
    "WarnonBadCertRecving" => 0,
    "WarnOnPostRedirect" => 0,
    "DisableCachingOfSSLPages" => 0,
  },

  'HKCU\Software\Microsoft\Internet Explorer\Main' => {
    "Check_Associations" => "no",   # Disable default browser check
    "Start Page" => "about:blank",  # Setting start page
    "FormSuggest Passwords" => "no",
    "FormSuggest PW Ask" => "no",
    "Use FormSuggest" => "no"
  },

  'HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\WindowsSearch' => {
    "AutoCompleteGroups" => 1,
    "EnabledScopes" => 1
  },

  'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' => {
    "AutoSuggest"=>"yes"
  },

  'HKLM\Software\Policies\Microsoft\Internet Explorer\Main' => {
    'DisableFirstRunCustomize' => 1
  },
  'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}' => {
    'IsInstalled' => 0
  },
  'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}' => {
    'IsInstalled' => 0
  }
  #Disable taskbar/system tray/start menu stuff
  # 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' => {
  #   "NoTrayItemsDisplay" => 1,
  #   "NoStartMenuPinnedList" => 1,
  #   "NoStartMenuMFUprogramsList" => 1,
  #   "NoStartMenuMorePrograms" => 1,
  #   "NoCommonGroups" => 1,
  #   "GreyMSIAds" => 1,
  #   "NoWindowsUpdate" => 1,
  #   "NoStartMenuMyMusic" => 1,
  #   "NoSMMyPictures" => 1,
  #   "NoFavoritesMenu" => 1,
  #   "NoRecentDocsMenu" => 1,
  #   "DisableMyPicturesDirChange" => 1,
  #   "DisableMyMusicDirChange" => 1,
  #   "DisableFavoritesDirChange" => 1,
  #   "NoSMMyDocs" => 1,
  #   "DisablePersonalDirChange" => 1,
  #   "NoRecentDocsMenu" => 1,
  #   "NoFavoritesMenu" => 1,
  #   "NoNetworkConnections" => 1,
  #   "NoStartMenuNetworkPlaces" => 1,
  #   "NoRecentDocsNetHood" => 1,
  #   "NoSMHelp" => 1,
  #   "NoFind" => 1,
  #   "NoRun" => 1,
  #   "NoResolveSearch" => 1,
  #   "NoResolveTrack" => 1,
  #   "StartMenuLogoff" => 1,
  #   "NoClose" => 1,
  #   "NoStartMenuEjectPC" => 1,
  #   "NoChangeStartMenu" => 1,
  #   "NoSetTaskbar" => 1,
  #   "NoUserNameInStartMenu" => 1
  # }
}.each do |regpath,entries|
  windows_registry regpath do
    values entries
  end
end

