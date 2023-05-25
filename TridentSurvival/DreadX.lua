--Creator: VRX#0001

local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/Notifications.lua"), true))()

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Updated, May 25 2023!"
}

wait(3)

---@diagnostic disable-next-line: undefined-global
setclipboard('https://discord.gg/5bjTbbr85k')

notifications:message{
    Title = "Official <font color='rgb(89, 102, 240)'>Discord</font> Server",
    Description = "Copied To Clipboard!"
}

wait(2.5)

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Loading, Please Wait!"
}

wait(3)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/GUI.lua"), true))()

wait(0.5)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Visuals.lua"), true))()

--[[
wait(0.5)

game:GetService("ReplicatedStorage").Arrow.Trail.Lifetime = 20
game:GetService("ReplicatedStorage").Arrow.Trail.Brightness = 100
game:GetService("ReplicatedStorage").Arrow.Trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(229, 111, 255))})

-]]
wait(1)

local config = Instance.new("Folder")
config.Name = "YuriX"
config.Parent = workspace

local toggles = Instance.new("Folder")
toggles.Name = "Toggles"
toggles.Parent = workspace:WaitForChild("YuriX")

local OreESPAdornee = Instance.new("Folder")
OreESPAdornee.Name = "OreESPAdornee"
OreESPAdornee.Parent = workspace:WaitForChild("YuriX")

local PlayerESPAdornee = Instance.new("Folder")
PlayerESPAdornee.Name = "PlayerESPAdornee"
PlayerESPAdornee.Parent = workspace:WaitForChild("YuriX")

local toggleAimlock = Instance.new("BoolValue")
toggleAimlock.Name = "toggleAimlock"
toggleAimlock.Parent = workspace.YuriX:WaitForChild("Toggles")

local toggleFreecam = Instance.new("BoolValue")
toggleFreecam.Name = "toggleFreecam"
toggleFreecam.Parent = workspace.YuriX:WaitForChild("Toggles")

print(workspace.YuriX.Toggles:WaitForChild("toggleAimlock").Value)
print(workspace.YuriX.Toggles:WaitForChild("toggleAimlock").Value)

wait(1)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/PlayerESP.lua"), true))()

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "PlayerESP Loaded, Keybind 'P'."
}

wait(1.75)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/Aimlock.lua"), true))()

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Aimlock Loaded, Keybind 'Q'."
}

wait(2)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/OreESP.lua"), true))()

wait(2.5)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/TotemESP.lua"), true))()

wait(2)

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Military Crates Located!"
}

local function onPartAdded(part)
    if part:IsA("Part") and part.BrickColor == BrickColor.new("Linen") and part.Material == Enum.Material.WoodPlanks then
        local parent = part.Parent
        if parent and parent:IsA("Model") and #parent:GetChildren() == 2 then
            local MilitaryEsp = Instance.new("BoxHandleAdornment")
            MilitaryEsp.Adornee = part
            MilitaryEsp.AlwaysOnTop = true
            MilitaryEsp.ZIndex = 0
            MilitaryEsp.Size = part.Size
            MilitaryEsp.Transparency = 0.3
            MilitaryEsp.Color = BrickColor.new("Dark Royal blue")
            MilitaryEsp.Parent = workspace
        end
    end
end

workspace.DescendantAdded:Connect(onPartAdded)

wait(1)

-- Part Crates </>

local parts = workspace:GetDescendants()
local meshes = {}
for _, part in ipairs(parts) do
    if part:IsA("UnionOperation") and part.BrickColor == BrickColor.new("Cashmere") and part.Material ==
        Enum.Material.Plastic then
        local PartCrateEsp = Instance.new("BoxHandleAdornment")
        PartCrateEsp.Adornee = part
        PartCrateEsp.AlwaysOnTop = true
        PartCrateEsp.ZIndex = 0
        PartCrateEsp.Size = part.Size
        PartCrateEsp.Transparency = 0.3
        PartCrateEsp.Color = BrickColor.new("Bright yellow")
        PartCrateEsp.Parent = workspace

        notifications:message{
            Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
            Description = "Part Crates Located!"
        }
    end
end

local function onPartAdded(part)
    if part:IsA("UnionOperation") and part.BrickColor == BrickColor.new("Cashmere") and part.Material ==
        Enum.Material.Plastic then
        local UpdatePartCrateEsp = Instance.new("BoxHandleAdornment")
        UpdatePartCrateEsp.Adornee = part
        UpdatePartCrateEsp.AlwaysOnTop = true
        UpdatePartCrateEsp.ZIndex = 0
        UpdatePartCrateEsp.Size = part.Size
        UpdatePartCrateEsp.Transparency = 0.3
        UpdatePartCrateEsp.Color = BrickColor.new("Bright yellow")
        UpdatePartCrateEsp.Parent = workspace
    end
end

workspace.DescendantAdded:Connect(onPartAdded)

wait(2)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/Freecam.lua"), true))()

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Freecam Loaded, Keybind 'Y'."
}

wait(3)

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Loading Finished!"
}


wait(2)

-- Player Joined </>

game.Players.PlayerAdded:Connect(function(player)
    notifications:message{
        Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
        Description = (player.DisplayName .. " Joined The Server!")
    }
end)

-- Player Left </>

game.Players.PlayerRemoving:Connect(function(player)
    notifications:message{
        Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
        Description = (player.DisplayName .. " Left The Server!")
    }
end)
