local obj = {}
obj.__index = obj

-- Metadata
obj.name = "MouseCenter"
obj.version = "1.0.1"
obj.author = "Zachary Cutlip"
obj.homepage = ""
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.circle = nil
obj.timer = nil
obj.hotkey = nil
obj.mcspoon = nil
obj.log = hs.logger.new('mcenter','debug')
if hs.spoons.isInstalled("MouceCircle") then
    obj.mcspoon = hs.loadSpoon("MouseCircle")
else
    obj.log.i("MouseCircle spoon not installed")
end


function obj:bindHotkeys(mapping)
    if (self.hotkey) then
        self.hotkey:delete()
    end
    local centerMods = mapping["center"][1]
    local centerKey = mapping["center"][2]
    self.hotkey = hs.hotkey.bind(centerMods, centerKey, function() self:center() end)

    return self
end


function obj:center()
    local ps = hs.screen.primaryScreen()
    local ff = ps:fullFrame()
    local center = ps:absoluteToLocal(ff).center
    hs.mouse.setRelativePosition(center, ps)
    if self.mcspoon then
        self.mcspoon:show()
    end
end

return obj
