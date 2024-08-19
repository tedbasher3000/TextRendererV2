# TextRendererV2
Monospaced Bitmap Font renderer for Roblox.

# Example code
```lua
local tr = require(path.to.TextRendererV2.2)

local container = tr.CreateContainer(script.Parent, 20, 1)
local params = tr.CreateParams(Color3.new(1,1,1), 1, 'System') -- color, line number, font

tr.RenderText("Hello World!", params, container)
```

# How to install
Get the latest release and import it to Roblox Studio via drag and drop or Right Click > Insert from file
