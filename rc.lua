-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local naughty = require("naughty")
-- Error handling
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
		app_name = "System Notification",
		icon = beautiful.awesome_icon,
	})
end)

require("awful.autofocus")

local awful = require("awful")
local gfs = require("gears.filesystem")

local config_dir = gfs.get_configuration_dir()
local script_dir = config_dir .. "/scripts/"

awful.spawn.with_shell(script_dir .. "preferences.sh")
awful.spawn.with_shell(script_dir .. "autorun.sh")

awful.layout.layouts = {
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.max,
}

require("config.keymaps.global-keys")
require("config.keymaps.client-keys")
require("config.tags")

require("config.signals")
require("config.rules")

require("theme")

require("ui")

require("modules.dynamic-wallpaper")

require("modules.auto-hibernate")
require("modules.vpn-auto-tunnel")
require("modules.session-mgr")
require("modules.flashfocus")

--require("modules.window-swallowing")
