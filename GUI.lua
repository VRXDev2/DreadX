-- Instances:

local YuriX = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local AimlockToggled = Instance.new("TextLabel")
local Freecam = Instance.new("TextLabel")
local TotemESP = Instance.new("TextLabel")
local Aimlock = Instance.new("TextLabel")
local FreecamToggled = Instance.new("TextLabel")
local TotemESPToggled = Instance.new("TextLabel")
local Bind = Instance.new("TextLabel")

local UserInputService = game.getService("UserInputService")

local toggle = false

--Properties:

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == 277 then
        if toggle == false then
            toggle = true
            Background.Visible = true
            Bind.Visible = false
        elseif toggle == true then
            toggle = false
            Background.Visible = false
            Bind.Visible = true
        end
    end
end)


YuriX.Name = "YuriX"
YuriX.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
YuriX.Enabled = false
YuriX.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Bind.Name = "Bind"
Bind.Parent = YuriX
Bind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bind.BackgroundTransparency = 1.000
Bind.Position = UDim2.new(0.870000005, 0, 0.0350000001, 0)
Bind.Size = UDim2.new(0.129999995, 0, 0.0500000007, 0)
Bind.Font = Enum.Font.SourceSans
Bind.Text = "Press INSERT to toggle"
Bind.TextColor3 = Color3.fromRGB(0, 0, 0)
Bind.TextSize = 20.000

Background.Name = "Background"
Background.Parent = YuriX
Background.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
Background.Position = UDim2.new(0.8, 3, 0, 0)
Background.Size = UDim2.new(0.2, 0, 0.175, 0)

UICorner.Parent = Background

Frame.Parent = Background
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.02, 0, 0, 0)
Frame.Size = UDim2.new(0.99, 0, 0.95, 0)

AimlockToggled.Name = "AimlockToggled"
AimlockToggled.Parent = Frame
AimlockToggled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AimlockToggled.BackgroundTransparency = 1.000
AimlockToggled.Position = UDim2.new(0.31, 0, 0, 0)
AimlockToggled.Size = UDim2.new(0.325, 0, 0.25, 0)
AimlockToggled.Font = Enum.Font.SourceSansBold
AimlockToggled.Text = "OFF"
AimlockToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
AimlockToggled.TextSize = 16.000
AimlockToggled.TextWrapped = true
AimlockToggled.TextXAlignment = Enum.TextXAlignment.Left

Freecam.Name = "Freecam"
Freecam.Parent = Frame
Freecam.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Freecam.BackgroundTransparency = 1.000
Freecam.Position = UDim2.new(0.01, 0, 0.185, 0)
Freecam.Size = UDim2.new(0.325, 0, 0.25, 0)
Freecam.Font = Enum.Font.SourceSans
Freecam.Text = "Freecam - Y"
Freecam.TextColor3 = Color3.fromRGB(0, 0, 0)
Freecam.TextSize = 16.000
Freecam.TextWrapped = true
Freecam.TextXAlignment = Enum.TextXAlignment.Left

TotemESP.Name = "TotemESP"
TotemESP.Parent = Frame
TotemESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TotemESP.BackgroundTransparency = 1.000
TotemESP.Position = UDim2.new(0.01, 0, 0.37, 0)
TotemESP.Size = UDim2.new(0.325, 0, 0.25, 0)
TotemESP.Font = Enum.Font.SourceSans
TotemESP.Text = "TCESP - U"
TotemESP.TextColor3 = Color3.fromRGB(0, 0, 0)
TotemESP.TextSize = 16.000
TotemESP.TextWrapped = true
TotemESP.TextXAlignment = Enum.TextXAlignment.Left

Aimlock.Name = "Aimlock"
Aimlock.Parent = Frame
Aimlock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Aimlock.BackgroundTransparency = 1.000
Aimlock.Position = UDim2.new(0.01, 0, 0, 0)
Aimlock.Size = UDim2.new(0.325, 0, 0.25, 0)
Aimlock.Font = Enum.Font.SourceSans
Aimlock.Text = "Aimlock - Q"
Aimlock.TextColor3 = Color3.fromRGB(0, 0, 0)
Aimlock.TextSize = 16.000
Aimlock.TextWrapped = true
Aimlock.TextXAlignment = Enum.TextXAlignment.Left

FreecamToggled.Name = "FreecamToggled"
FreecamToggled.Parent = Frame
FreecamToggled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FreecamToggled.BackgroundTransparency = 1.000
FreecamToggled.Position = UDim2.new(0.31, 0, 0.185, 0)
FreecamToggled.Size = UDim2.new(0.325, 0, 0.25, 0)
FreecamToggled.Font = Enum.Font.SourceSansBold
FreecamToggled.Text = "OFF"
FreecamToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
FreecamToggled.TextSize = 16.000
FreecamToggled.TextWrapped = true
FreecamToggled.TextXAlignment = Enum.TextXAlignment.Left

TotemESPToggled.Name = "TotemESPToggled"
TotemESPToggled.Parent = Frame
TotemESPToggled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TotemESPToggled.BackgroundTransparency = 1.000
TotemESPToggled.Position = UDim2.new(0.31, 0, 0.37, 0)
TotemESPToggled.Size = UDim2.new(0.325, 0, 0.25, 0)
TotemESPToggled.Font = Enum.Font.SourceSansBold
TotemESPToggled.Text = "OFF"
TotemESPToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
TotemESPToggled.TextSize = 16.000
TotemESPToggled.TextWrapped = true
TotemESPToggled.TextXAlignment = Enum.TextXAlignment.Left