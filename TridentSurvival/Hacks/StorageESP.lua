local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/Notifications.lua"), true))()

-- Military Crates
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

wait(1.5)

-- Part Crates

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