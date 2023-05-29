local notifications = loadstring(game:HttpGet(
    ("https://raw.githubusercontent.com/VRXDev2/DreadX/main/Notifications.lua"), true))()

local UserInputService = game:getService("UserInputService")
local toggle = true
local loaded = false

local Frame = game.Players.LocalPlayer.PlayerGui.DreadX.Background.Frame

local function loadPlayers()

    for i, v in pairs(game:GetService("ReplicatedStorage").Player:GetDescendants()) do
        if v:IsA("MeshPart") or v:IsA("Part") then
            local adornment = Instance.new("BoxHandleAdornment")
            adornment.Adornee = v
            adornment.AlwaysOnTop = true
            adornment.ZIndex = 1
            adornment.Size = v.Size
            adornment.Color = BrickColor.new("Bright green")
            adornment.Transparency = 0.3
            adornment.Parent = v

            if v.Name == "HumanoidRootPart" then
                v:Destroy()
            end
        end
    end
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v:FindFirstChild("Head") then

            for i, v in pairs(v:GetChildren()) do
                if v:IsA("Part") then

                    local adornment = Instance.new("BoxHandleAdornment")
                    adornment.Adornee = v
                    adornment.AlwaysOnTop = true
                    adornment.ZIndex = 1
                    adornment.Size = v.Size
                    adornment.Color = BrickColor.new("Crimson")
                    adornment.Transparency = 0.3
                    adornment.Parent = v

                    if v.Name == "HumanoidRootPart" then
                        v:Destroy()
                    end
                end
            end
            for i, v in pairs(v:GetChildren()) do
                if v:IsA("MeshPart") then

                    local adornment = Instance.new("BoxHandleAdornment")
                    adornment.Adornee = v
                    adornment.AlwaysOnTop = true
                    adornment.ZIndex = 1
                    adornment.Size = v.Size
                    adornment.Color = BrickColor.new("Bright green")
                    adornment.Transparency = 0.3
                    adornment.Parent = v

                    if v.Name == "HumanoidRootPart" then
                        v:Destroy()
                    end
                end
            end
        end
    end
end

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "PlayerESP Enabled."
}

loaded = true

local function disablePlayerESP()
    for _, v in ipairs(workspace.DreadX.PlayerESPAdornee:GetDescendants()) do
        v:Destroy()
    end
    notifications:message{
        Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
        Description = "PlayerESP Disabled."
    }
end

local function updateESP()
    for _, v in ipairs(workspace.DreadX.PlayerESPAdornee:GetDescendants()) do
        v:Destroy()
    end
    wait(1.5)
    loadPlayers()
end

local function togglePlayerESP()
    if toggle == false then
        toggle = true
        loadPlayers()
        Frame.PlayerESPToggled.Text = "<b>ON</b>"
        Frame.PlayerESPToggled.TextColor3 = Color3.fromRGB(0, 170, 0)
    elseif toggle == true then
        toggle = false
        disablePlayerESP()
        Frame.PlayerESPToggled.Text = "<b>OFF</b>"
        Frame.PlayerESPToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.P and not gameProcessed then
        togglePlayerESP()
    end
end)

--[[
while true do
    if loaded then
        if toggle then
            updateESP()
        end
    end
    wait(2.5)
end
]]