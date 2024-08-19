-- // TextRendererV2.2.lua \\ --
-- Made by tedbasher3000 for use in Sonic Genesis Framework
-- Revamp of Classic Sonic Engine's Text Renderer, while also modulizing it.
-- Uses a new font sheet with more characters as well.

-- Example usage:
--[[
local tr = require(path.to.TextRendererV2.2)

local container = tr.CreateContainer(script.Parent, 20, 1)
local params = tr.CreateParams(Color3.new(1,1,1), 1, 'System') -- color, line number, font

tr.RenderText("Hello World!", params, container)
]]--

local renderer = {}

local numfonts = {'HUD'} -- if your font is num only

local numlist = {
	'0',
	'1',
	'2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
	'9'
}
local charlist = {
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"0",
	"*",
	".",
	":",
	"-",
	"=",
	"!",
	"?",
	" ",
	""
}

function renderer.CreateContainer(gframe, gridX, gridY) -- Creates a container, kind of like a Tween from TweenService
	return {
		frame = gframe;
		x = gridX;
		y = gridY
	}
end

function renderer.CreateParams(colour, glinenum, gfont) -- Creates parameters, like RaycastParams, OverlapParams or TweenInfo
	return {
		color = colour;
		linenum = glinenum;
		font = gfont
	}
end

function renderer.RenderText(text, params, container) -- Renders text
	local errors = ''
	local numrows = 1/container.x
	local numlines = 1/container.y
	
	local color = params.color
	local linenum = params.linenum
	local font = params.font
	
	local list = charlist
	if table.find(numfonts, font) then
		list = numlist -- font is num only
	end
	
	for i=1,#text,1 do
		local char = string.lower(string.sub(text,i,i))
		if char == " " or char == '_' then
			-- ignore, it's a space
		else
			local index = table.find(list, char)
			if index then
				local gchar = script:FindFirstChild(font):Clone()
				gchar.ImageRectOffset = Vector2.new((index-1)*gchar.ImageRectSize.X, 0)
				gchar.Size = UDim2.new(i*numrows,0,numlines,0)
				gchar.Position = UDim2.new(i*numrows,0,linenum*numlines,0)
				gchar.ImageColor3 = color
				gchar.Parent = container.frame
				gchar.Name = 'Character'
			else
				errors = errors..char
			end
		end
	end

	if errors ~= '' then
		warn("Non-existent characters "..errors.." in "..text.." that were attempted to be rendered.")
	end
end

function renderer.ClearText(container) -- Clears text from a container
	for _,v in pairs(container.frame:GetChildren()) do
		if v.Name == 'Character' then
			v:Destroy()
		end
	end
end

return renderer
