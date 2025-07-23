<p align='center'>
	<br/>
    This is an AwesomeWM config that is based off of The Glorious Dotfiles by Eromatiya
</p>

### Using

- [`awesomewm`](https://awesomewm.org) as window manager
- [`linuxmint`](https://linuxmint.com/download.php) as distribution
- [`picom-git`](https://github.com/yshui/picom) as compositor
- [`rofi`](https://github.com/davatorium/rofi) as application launcher
- [`wezterm`](https://wezterm.org) as terminal emulator
- [`fish`](https://fishshell.com/) as shell

## Core features

+ Session restoration
+ Low-battery hibernate
+ Notification center
+ Dynamic wallpaper
+ Global search, like the Windows start menu
+ Weather (OpenWeatherMap) 
+ Quake terminal
+ Hardware monitor

## Installation and usage

1. Install the [required dependencies](#required-dependencies). Note that there's also an [optional dependencies](#optional-dependencies) for full functionality.
2. Clone this repository.

	```bash
	$ git clone --depth 1 https://github.com/bmorin-dev/awesome-kaleido/
	```

3. Make sure to create a backup of your old config (if applicable)
4. Copy the contents of the folder to your `"${HOME}"/.config/`.:

	```bash
	$ cp -r the-glorious-dotfiles/config/awesome/floppy $HOME/.config/awesome
	```

4. Add your specific hardware (like wireless interfaces) to `$HOME/.config/awesome/config/user/machine.lua`).
5. Add your credentials, like API keys, to `$HOME/.config/awesome/config/user/credentials.lua`.
6. Change the global configuration in `$HOME/.config/awesome/config/user/preferences.lua` to your liking.
7. Reload AwesomeWM by pressing <kbd>Super + Shift + r</kbd>.
8. Enjoy! (hopefully)



## Required dependencies

| Name | Description | Why? |
| --- | --- | --- |
| [`awesome-git`](https://github.com/awesomeWM/awesome) |  Highly configurable lua window manager | Hopefully, you know why |
| [`rofi`](https://github.com/davatorium/rofi) | Window switcher, app launcher, dmenu replacement | App launcher and menu framework |
| [`picom-git`](https://github.com/yshui/picom) | Compositor for X11 | Compositor with kawase-blur |
| [`kitty`](https://github.com/kovidgoyal/kitty) | GPU-accelerated terminal emulator | Quake terminal | 

## Optional dependencies

### CLI tools (CANNOT be replaced without widget rewrite)

| Name | Description | Why? |
| --- | --- | --- |
| redshift | Blue light blocker | Blue light widget |
| xprop | X11 property display | Custom titlebars |
| xdg-user-dirs | Manage /home/*, like Documents | XDG widgets |
| iproute2, iw | Network connection managers | Network widgets |
| xclip | X11 Clipboard CLI | Clipboard manager module, and for screenshots |
| flameshot | Screenshot manager | Tool to take screenshots |
| patctl | Audio manager | Audio and microphone widgets |
| brightnessctl | Brightness manager | Brightness widgets |
| acpi | Manages power settings | Battery widget, and hibernate module |

### Default applications (easily replaced in preferences)

| Name | Description | Why? |
| --- | --- | --- |
| blueman | Bluetooth manager | Default bluetooth manager |
| gnome-power-statistics | Gnome GUI power info | Default power manager |
| mintinstall | Mint's software manager | Default software manager |
| mintupdate | Mint's update manager | Default update manager |
| cinnamon-settings | Settings for Cinnamon DE | Default everything-else manager|

## TODO:

+ Custom lua lockscreen (eventually) 
