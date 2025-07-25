local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local widget_dir = "ui.panels.dashboard.hardware-monitor.widgets."

local hardware_header = wibox.widget({
	text = "Hardware Monitor",
	font = "Inter Regular 12",
	align = "left",
	valign = "center",
	widget = wibox.widget.textbox,
})

return wibox.widget({
	layout = wibox.layout.fixed.vertical,
	{
		{
			hardware_header,
			left = dpi(24),
			right = dpi(24),
			widget = wibox.container.margin,
		},
		bg = beautiful.groups_title_bg,
		shape = function(cr, width, height)
			gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, beautiful.groups_radius)
		end,
		forced_height = dpi(35),
		widget = wibox.container.background,
	},
	{
		{
			layout = wibox.layout.fixed.vertical,
			require(widget_dir .. "cpu-meter"),
			require(widget_dir .. "gpu-meter"),
			require(widget_dir .. "ram-meter"),
			require(widget_dir .. "temp-meter"),
			require(widget_dir .. "disk-meter"),
		},
		bg = beautiful.groups_bg,
		shape = function(cr, width, height)
			gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, beautiful.groups_radius)
		end,
		widget = wibox.container.background,
	},
})
