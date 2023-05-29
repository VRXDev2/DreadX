--Creator: VRX#0001

local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/Notifications.lua"), true))()

local loaded = false

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Updated, May 28 2023!"
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

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/FlagWars/GUI.lua"), true))()

--wait(0.5)

--loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Visuals.lua"), true))()

wait(1)

local config = Instance.new("Folder")
config.Name = "DreadX"
config.Parent = workspace

local toggles = Instance.new("Folder")
toggles.Name = "Toggles"
toggles.Parent = workspace:WaitForChild("DreadX")

local PlayerESPAdornee = Instance.new("Folder")
PlayerESPAdornee.Name = "PlayerESPAdornee"
PlayerESPAdornee.Parent = workspace:WaitForChild("DreadX")

wait(1)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/FlagWars/Hacks/PlayerESP.lua"), true))()


wait(1.5)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/FlagWars/Hacks/Teleporter.lua"), true))()

--[[
wait(2)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/OreESP.lua"), true))()

wait(2)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/TotemESP.lua"), true))()

wait(1.75)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/StorageESP.lua"), true))()

wait(1.75)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Hacks/Freecam.lua"), true))()

--]]

wait(2)

loaded = true

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "Loading Finished!"
}


wait(5)

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
