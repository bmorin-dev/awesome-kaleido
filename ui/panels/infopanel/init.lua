local wibox = require("wibox")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
panel_visible = false

local infopanel = function(s)
	-- Set right panel geometry
	local panel_width = dpi(350)
	local panel_x = s.geometry.x + s.geometry.width - panel_width

	local panel = wibox({
		ontop = true,
		screen = s,
		visible = false,
		type = "dock",
		width = panel_width,
		height = s.geometry.height - dpi(36) + 1,
		x = panel_x,
		y = s.geometry.y + dpi(36) - 1,
		bg = beautiful.background,
		fg = beautiful.fg_normal,
	})

	panel.opened = false

	s.backdrop_rdb = wibox({
		ontop = true,
		screen = s,
		bg = beautiful.transparent,
		type = "utility",
		x = s.geometry.x,
		y = s.geometry.y,
		width = s.geometry.width,
		height = s.geometry.height,
	})

	panel:struts({
		right = 0,
	})

	open_panel = function()
		local focused = awful.screen.focused()
		panel_visible = true

		focused.backdrop_rdb.visible = true
		focused.infopanel.visible = true

		panel:emit_signal("opened")
	end

	close_panel = function()
		local focused = awful.screen.focused()
		panel_visible = false

		focused.infopanel.visible = false
		focused.backdrop_rdb.visible = false

		panel:emit_signal("closed")
	end

	-- Hide this panel when app dashboard is called.
	function panel:hide_dashboard()
		close_panel()
	end

	function panel:toggle()
		self.opened = not self.opened
		if self.opened then
			open_panel()
		else
			close_panel()
		end
	end

	function panel:switch_pane(mode)
		if mode == "notif_mode" then
			-- Update Content
			panel:get_children_by_id("notif_id")[1].visible = true
			panel:get_children_by_id("pane_id")[1].visible = false
		elseif mode == "today_mode" then
			-- Update Content
			panel:get_children_by_id("notif_id")[1].visible = false
			panel:get_children_by_id("pane_id")[1].visible = true
		end
	end

	s.backdrop_rdb:buttons(awful.util.table.join(awful.button({}, 1, function()
		panel:toggle()
	end)))

	local separator = wibox.widget({
		orientation = "horizontal",
		opacity = 0.0,
		forced_height = 15,
		widget = wibox.widget.separator,
	})

	local line_separator = wibox.widget({
		orientation = "horizontal",
		forced_height = dpi(1),
		span_ratio = 1.0,
		color = beautiful.groups_title_bg,
		widget = wibox.widget.separator,
	})

	panel:setup({
		{
			expand = "none",
			layout = wibox.layout.fixed.vertical,
			{
				layout = wibox.layout.align.horizontal,
				expand = "none",
				nil,
				require("ui.panels.infopanel.info-center-switch"),
				nil,
			},
			separator,
			line_separator,
			separator,
			{
				layout = wibox.layout.stack,
				-- Today Pane
				{
					id = "pane_id",
					visible = true,
					layout = wibox.layout.fixed.vertical,
					{
						layout = wibox.layout.fixed.vertical,
						spacing = dpi(7),
						require("ui.panels.infopanel.user-profile"),
						require("ui.panels.infopanel.weather"),
						require("ui.panels.infopanel.calculator"),
					},
				},
				-- Notification Center
				{
					id = "notif_id",
					visible = false,
					--require("widget.notif-center"),
					require("ui.panels.infopanel.notif-center")(s),
					layout = wibox.layout.fixed.vertical,
				},
			},
		},
		margins = dpi(16),
		widget = wibox.container.margin,
	})

	return panel
end

return infopanel
