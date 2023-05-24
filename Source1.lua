-- Sky </>
local skybox = Instance.new("Sky")
skybox.Parent = game.Lighting
skybox.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
skybox.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
skybox.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
skybox.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
skybox.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
skybox.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"
skybox.StarCount = 5000


-- Remove GC </>

game:GetService("Players").LocalPlayer.PlayerGui.GameUI.FPS.Crosshair.Visible = false

-- Custom CrossHair </>

local CrossHairX = Drawing.new("Circle")

CrossHairX.Position =
    Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
CrossHairX.Color = Color3.fromRGB(120, 120, 120)
CrossHairX.Transparency = 0.5
CrossHairX.Thickness = 0.1
CrossHairX.NumSides = 12
CrossHairX.Radius = 3
CrossHairX.Visible = true
CrossHairX.Filled = true

-- CAS </>

local workspace = game:GetService("Workspace")

local fpsArms = workspace.Ignore.FPSArms

local material = Enum.Material.ForceField
local color = Color3.fromHSV(tick() % 20/20, 1, 1)


for _, part in pairs(fpsArms:GetDescendants()) do
    if part:IsA("BasePart") then
        part.Material = material
        part.Color = color
    end
end

-- CGS </>

local replicatedStorage = game:GetService("ReplicatedStorage")

local handModels = replicatedStorage:WaitForChild("HandModels")

local material = Enum.Material.ForceField
local color = Color3.fromHSV(tick() % 20/20, 1, 1)

for _, part in pairs(handModels:GetDescendants()) do
    if part:IsA("BasePart") then
        part.Material = material
        part.Color = color
    end
end

-- RR </>

local replicatedStorage = game:GetService("ReplicatedStorage")
local handModels = replicatedStorage.HandModels

local gone = false

for _, descendant in ipairs(handModels:GetDescendants()) do
    if descendant:IsA("RopeConstraint") then
        descendant.Visible = gone
    end
end

-- Always Day hack
game.GetService("RunService").Stepped:Connect(function()
    game:GetService("Lighting").TimeOfDay = 12
end)