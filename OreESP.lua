local notifications = loadstring(game:HttpGet(("https://pastebin.com/raw/gTvmWhEe"), true))()

local UserInputService = game:getService("UserInputService")
local toggle = true

local function loadOres()
    -- Nitrate Ores </>

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
            NitrateEsp.Parent = workspace.YuriX.OreESPAdornee

        end
    end

    local function onPartAdded(part)
        if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Institutional white") and part.Material ==
            Enum.Material.Slate then
            local UpdateNitrateEsp = Instance.new("BoxHandleAdornment")
            UpdateNitrateEsp.Adornee = part
            UpdateNitrateEsp.AlwaysOnTop = true
            UpdateNitrateEsp.ZIndex = 0
            UpdateNitrateEsp.Size = part.Size
            UpdateNitrateEsp.Transparency = 0.3
            UpdateNitrateEsp.Color = BrickColor.new("Institutional white")
            UpdateNitrateEsp.Parent = workspace.YuriX.OreESPAdornee
        end
    end

    workspace.DescendantAdded:Connect(onPartAdded)

    wait(1)

    -- Iron Ores </>

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
            IronEsp.Parent = workspace.YuriX.OreESPAdornee

        end
    end

    local function onPartAdded(part)
        if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Burlap") and part.Material == Enum.Material.Slate then
            local UpdateIronEsp = Instance.new("BoxHandleAdornment")
            UpdateIronEsp.Adornee = part
            UpdateIronEsp.AlwaysOnTop = true
            UpdateIronEsp.ZIndex = 0
            UpdateIronEsp.Size = part.Size
            UpdateIronEsp.Transparency = 0.3
            UpdateIronEsp.Color = BrickColor.new("Burlap")
            UpdateIronEsp.Parent = workspace.YuriX.OreESPAdornee
        end
    end

    workspace.DescendantAdded:Connect(onPartAdded)

    wait(5)

    -- Stone Ores </>

    local function adornStoneOre(part)
        if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Flint") and part.Material ==
            Enum.Material.Limestone then
            local parent = part.Parent
            if parent and parent:IsA("Model") and #parent:GetChildren() == 1 then
                local StoneEsp = Instance.new("BoxHandleAdornment")
                StoneEsp.Adornee = part
                StoneEsp.AlwaysOnTop = true
                StoneEsp.ZIndex = 0
                StoneEsp.Size = part.Size
                StoneEsp.Transparency = 0.3
                StoneEsp.Color = BrickColor.new("Grey")
                StoneEsp.Parent = workspace.YuriX.OreESPAdornee
            end
        end
    end

    local function onPartAdded(part)
        adornStoneOre(part)
    end

    for _, part in ipairs(workspace:GetDescendants()) do
        adornStoneOre(part)
    end

    workspace.DescendantAdded:Connect(onPartAdded)

    notifications:message{
        Title = "Yuri <font color='rgb(148, 0, 211)'>X</font><font color='rgb(252, 3, 69)'> - VRX#0001 Edit</font>",
        Description = "OreESP loaded.",
        Icon = 13535930665
    }
end

local function disableOreESP()
    for _, v in ipairs(workspace.YuriX.OreESPAdornee:GetDescendants()) do
        v:Destroy()
    end
end

local function toggleOreESP()
    if toggle == false then
        toggle = true
        loadOres()
    elseif toggle == true then
        toggle = false
        disableOreESP()
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.O and not gameProcessed then
        toggleOreESP()
    end
end)
