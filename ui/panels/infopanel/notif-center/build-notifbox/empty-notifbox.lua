-- This returns the "Wow, such empty." message.

local wibox = require("wibox")

local dpi = require("beautiful").xresources.apply_dpi

local icons = require("theme.icons")
local empty_notifbox = wibox.widget({
	{
		layout = wibox.layout.fixed.vertical,
		spacing = dpi(5),
		{
			expand = "none",
			layout = wibox.layout.align.horizontal,
			nil,
			{
				image = icons.applets.notifications.empty_notification,
				resize = true,
				forced_height = dpi(35),
				forced_width = dpi(35),
				widget = wibox.widget.imagebox,
			},
			nil,
		},
		{
			text = "Wow, such empty.",
			font = "Inter Bold 14",
			align = "center",
			valign = "center",
			widget = wibox.widget.textbox,
		},
		{
			text = "Come back later.",
			font = "Inter Regular 10",
			align = "center",
			valign = "center",
			widget = wibox.widget.textbox,
		},
	},
	margins = dpi(20),
	widget = wibox.container.margin,
})

local separator_for_empty_msg = wibox.widget({
	orientation = "vertical",
	opacity = 0.0,
	widget = wibox.widget.separator,
})

-- Make empty_notifbox center
local centered_empty_notifbox = wibox.widget({
	expand = "none",
	layout = wibox.layout.align.vertical,
	separator_for_empty_msg,
	empty_notifbox,
	separator_for_empty_msg,
})

return centered_empty_notifbox
