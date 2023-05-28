-- Instances:

local DreadX = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local Aimlock = Instance.new("TextLabel")
local AimlockToggled = Instance.new("TextLabel")
local PlayerESP = Instance.new("TextLabel")
local PlayerESPToggled = Instance.new("TextLabel")
local Bind = Instance.new("TextLabel")

local UserInputService = game:getService("UserInputService")

local toggle = false

--Properties:

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Insert and not gameProcessed then
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


DreadX.Name = "DreadX"
DreadX.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
DreadX.Enabled = true
DreadX.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Bind.Name = "Bind"
Bind.Parent = DreadX
Bind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bind.BackgroundTransparency = 1.000
Bind.Position = UDim2.new(0.870000005, 0, 0.0350000001, 0)
Bind.Size = UDim2.new(0.129999995, 0, 0.0500000007, 0)
Bind.Font = Enum.Font.Gotham
Bind.Text = "Press INSERT to toggle"
Bind.TextColor3 = Color3.fromRGB(255, 255, 255)
Bind.TextSize = 20.000

Background.Name = "Background"
Background.Parent = DreadX
Background.Visible = false
Background.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
Background.Position = UDim2.new(0.8, 3, 0, 0)
Background.Size = UDim2.new(0.2, 0, 0.175, 0)

UICorner.Parent = Background

Frame.Parent = Background
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.02, 0, 0, 0)
Frame.Size = UDim2.new(0.99, 0, 0.95, 0)

Aimlock.Name = "Aimlock"
Aimlock.Parent = Frame
Aimlock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Aimlock.BackgroundTransparency = 1.000
Aimlock.Position = UDim2.new(0.01, 0, 0, 0)
Aimlock.Size = UDim2.new(0.325, 0, 0.25, 0)
Aimlock.Font = Enum.Font.Code
Aimlock.Text = "Aimlock - Q"
Aimlock.TextColor3 = Color3.fromRGB(220, 220, 220)
Aimlock.TextSize = 16.000
Aimlock.TextWrapped = true
Aimlock.TextXAlignment = Enum.TextXAlignment.Left

AimlockToggled.Name = "AimlockToggled"
AimlockToggled.Parent = Frame
AimlockToggled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AimlockToggled.BackgroundTransparency = 1.000
AimlockToggled.Position = UDim2.new(0.31, 0, 0, 0)
AimlockToggled.Size = UDim2.new(0.325, 0, 0.25, 0)
AimlockToggled.Font = Enum.Font.Code
AimlockToggled.RichText = true
AimlockToggled.Text = "<b>OFF</b>"
AimlockToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
AimlockToggled.TextSize = 16.000
AimlockToggled.TextWrapped = true
AimlockToggled.TextXAlignment = Enum.TextXAlignment.Left

PlayerESP.Name = "PlayerESP"
PlayerESP.Parent = Frame
PlayerESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerESP.BackgroundTransparency = 1.000
PlayerESP.Position = UDim2.new(0.01, 0, 0.74, 0)
PlayerESP.Size = UDim2.new(0.325, 0, 0.25, 0)
PlayerESP.Font = Enum.Font.Code
PlayerESP.Text = "PlayerESP - P"
PlayerESP.TextColor3 = Color3.fromRGB(220, 220, 220)
PlayerESP.TextSize = 16.000
PlayerESP.TextWrapped = true
PlayerESP.TextXAlignment = Enum.TextXAlignment.Left

PlayerESPToggled.Name = "PlayerESPToggled"
PlayerESPToggled.Parent = Frame
PlayerESPToggled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerESPToggled.BackgroundTransparency = 1.000
PlayerESPToggled.Position = UDim2.new(0.31, 0, 0.74, 0)
PlayerESPToggled.Size = UDim2.new(0.325, 0, 0.25, 0)
PlayerESPToggled.Font = Enum.Font.Code
PlayerESPToggled.RichText = true
PlayerESPToggled.Text = "<b>ON</b>"
PlayerESPToggled.TextColor3 = Color3.fromRGB(0, 170, 0)
PlayerESPToggled.TextSize = 16.000
PlayerESPToggled.TextWrapped = true
PlayerESPToggled.TextXAlignment = Enum.TextXAlignment.Left