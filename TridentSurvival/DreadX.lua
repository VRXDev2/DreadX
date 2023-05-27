--Creator: VRX#0001

local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/Notifications.lua"), true))()

local loaded = false

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Updated, May 25 2023!"
}

---@diagnostic disable-next-line: undefined-global
setfpscap(300)

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

wait(1.5)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/Aimlock.lua"), true))()

wait(2)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/OreESP.lua"), true))()

wait(2)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/TotemESP.lua"), true))()

wait(1.75)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/StorageESP.lua"), true))()

wait(1.75)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/Freecam.lua"), true))()

wait(3)

loaded = true

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Loading Finished!"
}


wait(2)

-- Player Joined

game.Players.PlayerAdded:Connect(function(player)
    if loaded then
        notifications:message{
            Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
            Description = (player.DisplayName .. " Joined The Server!")
        }
    end
end)

-- Player Left

game.Players.PlayerRemoving:Connect(function(player)
    if loaded then
        notifications:message{
            Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
            Description = (player.DisplayName .. " Left The Server!")
        }
    end
end)
