local UserInputService = game:getService("UserInputService")
local toggle = true

local Frame = game.Players.LocalPlayer.PlayerGui.YuriX.Background.Frame


local function loadPlayers()
for i, v in pairs(game:GetService("ReplicatedStorage").Player:GetDescendants()) do
    if v:IsA("MeshPart") or v:IsA("Part") then
        local adornment = Instance.new("BoxHandleAdornment")
        adornment.Adornee = v
        adornment.AlwaysOnTop = true
        adornment.ZIndex = 1
        adornment.Size = v.Size
        adornment.Color = BrickColor.new("Bright green")
        adornment.Transparency = 0.55
        adornment.Parent = workspace.YuriX.PlayerESPAdornee
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
                adornment.Color = BrickColor.new("Dark red")
                adornment.Transparency = 0.55
                adornment.Parent = workspace.YuriX.PlayerESPAdornee

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
                adornment.Transparency = 0.55
                adornment.Parent = workspace.YuriX.PlayerESPAdornee
            end
        end
    end
end
end

loadPlayers()

local function disablePlayerESP()
    for _, v in ipairs(workspace.YuriX.PlayerESPAdornee:GetDescendants()) do
        v:Destroy()
    end
end

local function togglePlayerESP()
    if toggle == false then
        toggle = true
        loadPlayers()
        Frame.OreESPToggled.Text = "ON"
        Frame.OreESPToggled.TextColor3 = Color3.fromRGB(0, 170, 0)
    elseif toggle == true then
        toggle = false
        disablePlayerESP()
        Frame.OreESPToggled.Text = "OFF"
        Frame.OreESPToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.P and not gameProcessed then
        togglePlayerESP()
    end
end)