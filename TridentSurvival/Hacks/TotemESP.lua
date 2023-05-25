local Frame = game.Players.LocalPlayer.PlayerGui:WaitForChild("YuriX").Background.Frame
local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/Notifications.lua"), true))()

local UserInputService = game:GetService("UserInputService")
local TCESPs = {}
local adorned = false

local function addAdornments()
    local parts = workspace:GetDescendants()
    for _, part in ipairs(parts) do
        if part:IsA("UnionOperation") and part.Name == "State" and part.Material == Enum.Material.Neon then
            local TCESP = Instance.new("BoxHandleAdornment")
            TCESP.Adornee = part
            TCESP.AlwaysOnTop = true
            TCESP.ZIndex = 0
            TCESP.Size = Vector3.new(2.5, 6.25, 2.5)
            TCESP.Transparency = 0.3
            TCESP.Color = BrickColor.new("Royal purple")
            TCESP.Parent = workspace
            TCESP.CFrame = CFrame.new(0, -2.2, 0)
            table.insert(TCESPs, TCESP)
        end
    end
end

local function removeAdornments()
    for _, TCESP in ipairs(TCESPs) do
        TCESP:Destroy()
    end
    TCESPs = {}
end

local function toggleAdornments()
    if adorned then
        removeAdornments()
        adorned = false
        Frame.TotemESPToggled.Text = "OFF"
        Frame.TotemESPToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
        notifications:message{
            Title = "Dread<font color='rgb(183, 11, 209)'>X</font>",
            Description = "TC ESP Disabled."
        }
    else
        addAdornments()
        adorned = true
        Frame.TotemESPToggled.Text = "ON"
        Frame.TotemESPToggled.TextColor3 = Color3.fromRGB(0, 170, 0)
        notifications:message{
            Title = "Dread<font color='rgb(183, 11, 209)'>X</font>",
            Description = "TC ESP Enabled."
        }
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.U and not gameProcessed then
        toggleAdornments()
    end
end)

notifications:message{
    Title = "Dread<font color='rgb(183, 11, 209)'>X</font>",
    Description = "TC ESP Loaded, Keybind 'U'."
}