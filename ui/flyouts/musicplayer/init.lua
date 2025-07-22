local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local create_musicplayer = function(s)
	-- Set music box geometry
	local music_box_margin = dpi(5)
	local music_box_height = dpi(375)
	local music_box_width = dpi(260)
	local music_box_x = nil

	local musicpop = awful.popup({
		widget = {
			-- Removing this block will cause an error...
		},
		ontop = true,
		visible = true,
		type = "dock",
		screen = s,
		width = music_box_width,
		height = music_box_height,
		maximum_width = music_box_width,
		maximum_height = music_box_height,
		offset = dpi(5),
		shape = gears.shape.rectangle,
		bg = beautiful.transparent,
		preferred_anchors = { "middle", "back", "front" },
		preferred_positions = { "left", "right", "top", "bottom" },
	})

	local ui_content = require("ui.panels.musicplayer.content")

	local album = ui_content.album_cover
	local progress_bar = ui_content.progress_bar
	local time_track = ui_content.track_time.time_track
	local song_info = ui_content.song_info.music_info
	local media_buttons = ui_content.media_buttons.navigate_buttons
	local volume_slider = ui_content.volume_slider.vol_slider

	musicpop:setup({
		{
			{
				layout = wibox.layout.fixed.vertical,
				expand = "none",
				spacing = dpi(8),
				{
					album,
					bottom = dpi(5),
					widget = wibox.container.margin,
				},
				{
					layout = wibox.layout.fixed.vertical,
					{
						spacing = dpi(4),
						layout = wibox.layout.fixed.vertical,
						progress_bar,
						time_track,
					},
					song_info,
					media_buttons,
					volume_slider,
				},
			},
			top = dpi(15),
			left = dpi(15),
			right = dpi(15),
			widget = wibox.container.margin,
		},
		bg = beautiful.background,
		shape = function(cr, width, height)
			gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, beautiful.groups_radius)
		end,
		widget = wibox.container.background(),
	})

	return musicpop
end

return create_musicplayer
