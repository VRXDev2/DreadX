--[[ Stop Skidding Loser, Yuri Owns You! :clown: ]] -- Aimlock </>
local Camera = workspace.CurrentCamera

_G.CircleSides = 100
_G.CircleColor = Color3.fromRGB(98, 37, 209)
_G.CircleTransparency = 0.5
_G.CircleRadius = 100
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 0

local FOVCircle = Drawing.new("Circle")
local Frame = game.Players.LocalPlayer.PlayerGui.YuriX.Background.Frame


FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local MouseLock = {
    Settings = {
        Enabled = false,
        Key = 'q',
        Prediction = 1,
        AimPart = 'Head'
    }
}

local CurrentCamera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local LockedPart = nil

local FOVCircleCenter = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)
local FOVCircleRadius = FOVCircle.Radius

function IsInFOVCircle(part)
    local pos = CurrentCamera:WorldToViewportPoint(part.Position)
    local partVector = Vector2.new(pos.X, pos.Y)
    local circleVector = FOVCircleCenter + (partVector - FOVCircleCenter).unit * FOVCircleRadius
    local distanceFromCircumference = (partVector - circleVector).magnitude
    return distanceFromCircumference <= FOVCircleRadius
end

function FindClosestPart()
    local closestPart
    local shortestDistance = math.huge

    for _, part in pairs(game.Workspace:GetDescendants()) do
        if part.Name == MouseLock.Settings.AimPart and part:IsA("BasePart") and part.CollisionGroupId == 2 and
            IsInFOVCircle(part) then
            local pos = CurrentCamera:WorldToViewportPoint(part.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPart = part
                shortestDistance = magnitude
            end
        end
    end

    return closestPart
end

Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (MouseLock.Settings.Key) then
        if MouseLock.Settings.Enabled == true then
            MouseLock.Settings.Enabled = false
            Frame.AimlockToggled.Text = "OFF"
            Frame.AimlockToggled.TextColor3 = Color3.fromRGB(226, 0, 0)
            LockedPart = nil
        else
            LockedPart = FindClosestPart()
            MouseLock.Settings.Enabled = true
            Frame.AimlockToggled.Text = "ON"
            Frame.AimlockToggled.TextColor3 = Color3.fromRGB(0, 170, 0)
        end
    end
end)

RunService.Stepped:Connect(function()
    if MouseLock.Settings.Enabled == true and LockedPart ~= nil then
        local Vector = CurrentCamera:WorldToScreenPoint(LockedPart.Position + LockedPart.Velocity *
                                                            MouseLock.Settings.Prediction)
        mousemoverel(Vector.X - Mouse.X, Vector.Y - Mouse.Y)
    end
end)
