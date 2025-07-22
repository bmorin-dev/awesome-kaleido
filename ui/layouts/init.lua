local beautiful = require("beautiful")
local gears = require("gears")

local gfs = require("gears.filesystem")

local config_dir = gfs.get_configuration_dir()

local M = {}
local relative_lua_path = tostring(...)

local function get_layout_icon_path(name)
	local relative_path = "ui/layouts/icons/" .. name .. ".png"

	return config_dir .. relative_path
end

local function get_icon(icon_raw)
	if icon_raw ~= nil then
		return gears.color.recolor_image(icon_raw, beautiful.fg_normal)
	else
		return nil
	end
end

local layouts = {
	"mstab",
	"vertical",
	"horizontal",
	"centered",
	"equalarea",
	"deck",
}

for _, layout_name in ipairs(layouts) do
	local icon_raw = get_layout_icon_path(layout_name)
	if beautiful["layout_" .. layout_name] == nil then
		beautiful["layout_" .. layout_name] = get_icon(icon_raw)
	end
	M[layout_name] = require(... .. "." .. layout_name)
end

return M
