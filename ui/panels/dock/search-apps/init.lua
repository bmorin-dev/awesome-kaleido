local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local dpi = require("beautiful").xresources.apply_dpi
local clickable_container = require("ui.clickable-container")

local apps = require("config.user.preferences")
local icons = require("theme.icons")

local widget = wibox.widget({
	{
		id = "icon",
		image = icons.system.launcher,
		widget = wibox.widget.imagebox,
		resize = true,
	},
	layout = wibox.layout.align.horizontal,
})

local widget_button = wibox.widget({
	{
		widget,
		margins = dpi(10),
		widget = wibox.container.margin,
	},
	widget = clickable_container,
})

widget_button:buttons(gears.table.join(awful.button({}, 1, nil, function()
	awful.spawn(apps.default.rofi_appmenu, false)
end)))

return widget_button
