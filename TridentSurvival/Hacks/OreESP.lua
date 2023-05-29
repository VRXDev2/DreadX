local notifications = loadstring(game:HttpGet(
    ("https://raw.githubusercontent.com/VRXDev2/DreadX/main/Notifications.lua"), true))()

local UserInputService = game:getService("UserInputService")
local toggle = true

local Frame = game.Players.LocalPlayer.PlayerGui.DreadX.Background.Frame

-- Nitrate Ores

local parts = workspace:GetDescendants()
local meshes = {}
for _, part in ipairs(parts) do
    if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Institutional white") and part.Material ==
        Enum.Material.Slate then
        local NitrateEsp = Instance.new("BoxHandleAdornment")
        NitrateEsp.Adornee = part
        NitrateEsp.AlwaysOnTop = true
        NitrateEsp.ZIndex = 0
        NitrateEsp.Size = part.Size
        NitrateEsp.Transparency = 0.3
        NitrateEsp.Color = BrickColor.new("Institutional white")
        NitrateEsp.Parent = workspace.DreadX.OreESPAdornee

        notifications:message{
            Title = "Yuri <font color='rgb(148, 0, 211)'>X</font> - v5.0",
            Description = "Nitrate Ores Located!"
        }
    end
end

local function onPartAdded(part)
    if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Institutional white") and part.Material ==
        Enum.Material.Slate then
        if toggle then
            local UpdateNitrateEsp = Instance.new("BoxHandleAdornment")
            UpdateNitrateEsp.Adornee = part
            UpdateNitrateEsp.AlwaysOnTop = true
            UpdateNitrateEsp.ZIndex = 0
            UpdateNitrateEsp.Size = part.Size
            UpdateNitrateEsp.Transparency = 0.3
            UpdateNitrateEsp.Color = BrickColor.new("Institutional white")
            UpdateNitrateEsp.Parent = workspace.DreadX.OreESPAdornee
        end
    end
end

workspace.DescendantAdded:Connect(onPartAdded)

wait(0.25)

-- Iron Ores

local parts = workspace:GetDescendants()
local meshes = {}
for _, part in ipairs(parts) do
    if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Burlap") and part.Material == Enum.Material.Slate then
        local IronEsp = Instance.new("BoxHandleAdornment")
        IronEsp.Adornee = part
        IronEsp.AlwaysOnTop = true
        IronEsp.ZIndex = 0
        IronEsp.Size = part.Size
        IronEsp.Transparency = 0.3
        IronEsp.Color = BrickColor.new("Burlap")
        IronEsp.Parent = workspace.DreadX.OreESPAdornee

        notifications:message{
            Title = "Yuri <font color='rgb(148, 0, 211)'>X</font> - v5.0",
            Description = "Iron Ores Located!"
        }
    end
end

local function onPartAdded(part)
    if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Burlap") and part.Material == Enum.Material.Slate then
        if toggle then
            local UpdateIronEsp = Instance.new("BoxHandleAdornment")
            UpdateIronEsp.Adornee = part
            UpdateIronEsp.AlwaysOnTop = true
            UpdateIronEsp.ZIndex = 0
            UpdateIronEsp.Size = part.Size
            UpdateIronEsp.Transparency = 0.3
            UpdateIronEsp.Color = BrickColor.new("Burlap")
            UpdateIronEsp.Parent = workspace.DreadX.OreESPAdornee
        end

    end
end

workspace.DescendantAdded:Connect(onPartAdded)

wait(0.25)

notifications:message{
    Title = "Yuri <font color='rgb(148, 0, 211)'>X</font> - v5.0",
    Description = "Stone Ores Located!"
}

local function adornStoneOre(part)
    if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Flint") and part.Material == Enum.Material.Limestone then
        local parent = part.Parent
        if parent and parent:IsA("Model") and #parent:GetChildren() == 1 then
            local StoneEsp = Instance.new("BoxHandleAdornment")
            StoneEsp.Adornee = part
            StoneEsp.AlwaysOnTop = true
            StoneEsp.ZIndex = 0
            StoneEsp.Size = part.Size
            StoneEsp.Transparency = 0.3
            StoneEsp.Color = BrickColor.new("Grey")
            StoneEsp.Parent = workspace.DreadX.OreESPAdornee
        end
    end
end

local function onPartAdded(part)
    if toggle then
        adornStoneOre(part)
    end
end

for _, part in ipairs(workspace:GetDescendants()) do
    if toggle then
        adornStoneOre(part)
    end
end

workspace.DescendantAdded:Connect(onPartAdded)

notifications:message{
    Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
    Description = "OreESP Loaded."
}

local function disableOreESP()
    for _, v in ipairs(workspace.DreadX.OreESPAdornee:GetDescendants()) do
        v:Destroy()
    end
    notifications:message{
        Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
        Description = "OreESP Disabled."
    }
end

local function toggleOreESP()
    if toggle == false then
        toggle = true
        Frame.OreESPToggled.Text = "<b>ON</b>"
        Frame.OreESPToggled.TextColor3 = Color3.fromRGB(0, 170, 0)

        notifications:message{
            Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
            Description = "OreESP Enabled."
        }
    elseif toggle == true then
        toggle = false
        disableOreESP()
        Frame.OreESPToggled.Text = "<b>OFF</b>"
        Frame.OreESPToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.O and not gameProcessed then
        toggleOreESP()
    end
end)
