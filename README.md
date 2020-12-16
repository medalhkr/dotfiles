ubuntu
----
In advance, put personal.tar.gz on $HOME
```
export BRANCH=master
curl -s https://raw.githubusercontent.com/cumet04/dotfiles/$BRANCH/install.sh | bash
```

#### <memo> clean $HOME
* `.npm`: can move/remove, but can't for part of them
  - This is created there by some package that has BAD install script (ex. esbuild)
* `.vscode-server`: can't move/remove
* `.sudo_as_admin_successful`: can remove, but can't prevent creation
  - It is created every time by sudo
* `.docker`: can't move/remove
  - It is created by Docker Desktop and the directory has symlink to windows dir

Windows
----
#### Enable WSL2
1. In Admin Powershell,
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
and reboot


2. Install kernel update package; https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
3. In Admin Powershell,
```
wsl --set-default-version 2
```

https://docs.microsoft.com/ja-jp/windows/wsl/install-win10

#### Docker Desktop
1. Do install above
2. In Docker Desktop, add integration for distro
3. `wsl -t XXX`
4. (Optional?) In Docker Desktop, remove/add integration for distro

#### Override Caps -> Ctrl
in `HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/KeyboardLayout/Scancode Map` (Binary)

```
00 00 00 00 00 00 00 00
02 00 00 00 1D 00 3A 00
00 00 00 00
```

refs https://ascii.jp/elem/000/000/927/927191/ 

#### Key repeat
in `HKEY_CURRENT_USER/Control Panel/Accessibility/Keyboard Response`
* AutoRepeatDelay 250
* AutoRepeatRate 20
* Flags 59 (magic number)

#### Disable web-search in start menu
1. Run `gpedit.msc` (グループポリシーの編集)
2. Dig tree view: コンピューターの構成 > 管理用テンプレート > Windowsコンポーネント > 検索
3. Activate: `Web を検索したり [検索] に Web の検索結果を表示したりしない`

refs https://www.tipsfound.com/windows10/06003
