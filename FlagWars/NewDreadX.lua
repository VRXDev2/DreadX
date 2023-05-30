---@diagnostic disable: undefined-global
local Library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/UILib.lua"), true))()

setfpscap(900)

local colors = {
    SchemeColor = Color3.fromRGB(109, 65, 170),
    Background = Color3.fromRGB(82, 45, 135),
    Header = Color3.fromRGB(68, 32, 117),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(70, 38, 114)
}

local Window = Library.CreateLib("DreadX | Flag Wars", colors)

local config = Instance.new("Folder")
config.Name = "DreadX"
config.Parent = workspace

local ESPAdornee = Instance.new("Folder")
ESPAdornee.Name = "ESPAdornee"
ESPAdornee.Parent = workspace:WaitForChild("DreadX")

local Main_Tab = Window:NewTab("Main")

local Main_Section = Main_Tab:NewSection("Main")

Main_Section:NewButton("[EXPERIMENTAL] Teleport to Flag", "Teleports you to the opposite team's flag.", function()
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local localPlayer = game.Players.LocalPlayer
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    local TeamName = localPlayer.Team.Name

    local cooldown = false

    if rootPart and humanoid.Health > 0 then
        if not cooldown then
            if TeamName == "Team Blue" then

                rootPart.CFrame = workspace.Core.Flags["Team Red"].Base.CFrame
                localPlayer.Character.Jump = true
                wait(0.2)
                rootPart.CFrame = workspace.Core.Flags["Team Red"].Base.CFrame
                wait(1.5)
                localPlayer.Character.Jump = false
                rootPart.CFrame = workspace.Core.Flags["Team Blue"].Base.CFrame

                cooldown = true

                wait(5)

                cooldown = false

            else

                rootPart.CFrame = workspace.Core.Flags["Team Blue"].Base.CFrame
                localPlayer.Character.Jump = true
                wait(0.2)
                rootPart.CFrame = workspace.Core.Flags["Team Blue"].Base.CFrame
                wait(1.5)
                localPlayer.Character.Jump = false
                rootPart.CFrame = workspace.Core.Flags["Team Red"].Base.CFrame

                cooldown = true

                wait(5)

                cooldown = false

            end
        end
    end
end)

Main_Section:NewButton("SilentAim (Click once only)", "Aims for you, silently.", function()
    local currPlayer = game:GetService('Players').LocalPlayer
    local servPlayer = game:GetService('Players')

    local RunService = game:GetService('RunService')
    local servTeams = game:GetService("Teams")

    local currMouse = currPlayer:GetMouse()
    local currCamera = game:GetService("Workspace").CurrentCamera

    getgenv().GameSettings = {
        SilentAim = {
            ["active"] = true,
            ["fov"] = 130,
            ["hitpart"] = "Head",
            ["circlevis"] = true,
            ["wallbang"] = false,
            ["circcolor"] = Color3.fromRGB(95, 50, 158)
        }
    }

    local CircleInline = Drawing.new("Circle")
    local CircleOutline = Drawing.new("Circle")
    CircleInline.Radius = getgenv().GameSettings.SilentAim.fov
    CircleInline.Thickness = 2
    CircleInline.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
    CircleInline.Transparency = 1
    CircleInline.Color = getgenv().GameSettings.SilentAim.circcolor
    CircleInline.Visible = getgenv().GameSettings.SilentAim.circlevis
    CircleInline.ZIndex = 2
    CircleOutline.Radius = getgenv().GameSettings.SilentAim.fov
    CircleOutline.Thickness = 4
    CircleOutline.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
    CircleOutline.Transparency = 1
    CircleOutline.Color = Color3.fromRGB(95, 50, 158)
    CircleOutline.Visible = getgenv().GameSettings.SilentAim.circlevis
    CircleOutline.ZIndex = 1

    function isSameTeam(player)
        if player.team ~= currPlayer.team and player.team ~= servTeams["Neutral"] then
            return false
        else
            return true
        end
    end

    function isDead(player)
        if player == nil or player.Character == nil or player.Character:FindFirstChildWhichIsA("Humanoid") == nil or
            player.Character.Humanoid.Health <= 0 then
            return true
        else
            return false
        end
    end

    local function isClosestPlayer()
        local target
        local dist = math.huge
        for _, v in next, servPlayer:GetPlayers() do
            if not isDead(v) and v ~= currPlayer and not isSameTeam(v) and v.Character:FindFirstChild("Head") and
                getgenv().GameSettings.SilentAim.active then
                local pos, visible = currCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(currMouse.X, currMouse.Y) - Vector2.new(pos.X, pos.Y)).magnitude
                if magnitude < (getgenv().GameSettings.SilentAim.fov) then
                    if magnitude < dist then
                        if getgenv().GameSettings.SilentAim.wallbang then
                            target = v
                            dist = magnitude
                        else
                            if visible then
                                target = v
                                dist = magnitude
                            end
                        end

                    end
                end
            end
        end
        return target
    end

    local target
    local gmt = getrawmetatable(game)
    setreadonly(gmt, false)
    local oldNamecall = gmt.__namecall

    gmt.__namecall = newcclosure(function(self, ...)
        local Args = {...}
        local method = getnamecallmethod()
        if tostring(self) == "WeaponHit" and tostring(method) == "FireServer" then
            target = isClosestPlayer()
            if target then
                Args[2]["part"] = target.Character[getgenv().GameSettings.SilentAim.hitpart]
                return self.FireServer(self, unpack(Args))
            end
        end
        return oldNamecall(self, ...)
    end)
end)

Main_Section:NewToggle("ESP", "Toggles ESP", function(state)
    if state then

        local dwEntities = game:GetService("Players")
        local dwLocalPlayer = dwEntities.LocalPlayer
        local dwRunService = game:GetService("RunService")

        local settings_tbl = {
            ESP_Enabled = true,
            ESP_TeamCheck = true,
            Chams = true,
            Chams_Color = Color3.fromRGB(255, 255, 255),
            Chams_Transparency = 0.1,
            Chams_Glow_Color = Color3.fromRGB(255, 0, 0)
        }

        function destroy_chams(char)

            for k, v in next, char:GetChildren() do

                if v:IsA("BasePart") and v.Transparency ~= 1 then

                    if v:FindFirstChild("Glow") and v:FindFirstChild("Chams") then

                        v.Glow:Destroy()
                        v.Chams:Destroy()

                    end

                end

            end

        end

        dwRunService.Heartbeat:Connect(function()

            if settings_tbl.ESP_Enabled then

                for k, v in next, dwEntities:GetPlayers() do

                    if v ~= dwLocalPlayer then

                        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                            v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health ~=
                            0 then

                            if settings_tbl.ESP_TeamCheck == false then

                                local char = v.Character

                                for k, b in next, char:GetChildren() do

                                    if b:IsA("BasePart") and b.Transparency ~= 1 then

                                        if settings_tbl.Chams then

                                            if not b:FindFirstChild("Glow") and not b:FindFirstChild("Chams") then

                                                local chams_box = Instance.new("BoxHandleAdornment", b)
                                                chams_box.Name = "Chams"
                                                chams_box.AlwaysOnTop = true
                                                chams_box.ZIndex = 4
                                                chams_box.Adornee = b
                                                chams_box.Parent = workspace.DreadX.ESPAdornee
                                                chams_box.Color3 = settings_tbl.Chams_Color
                                                chams_box.Transparency = settings_tbl.Chams_Transparency
                                                chams_box.Size = b.Size + Vector3.new(0.002, 0.002, 0.002)

                                                local glow_box = Instance.new("BoxHandleAdornment", b)
                                                glow_box.Name = "Glow"
                                                glow_box.AlwaysOnTop = false
                                                glow_box.ZIndex = 3
                                                glow_box.Parent = workspace.DreadX.ESPAdornee
                                                glow_box.Adornee = b
                                                glow_box.Color3 = settings_tbl.Chams_Glow_Color
                                                glow_box.Size = chams_box.Size + Vector3.new(0.05, 0.05, 0.05)

                                            end

                                        else

                                            destroy_chams(char)

                                        end

                                    end

                                end

                            else

                                local char = v.Character
                                for k, b in next, char:GetChildren() do

                                    if b:IsA("BasePart") and b.Transparency ~= 1 then

                                        if settings_tbl.Chams then

                                            if not b:FindFirstChild("Glow") and not b:FindFirstChild("Chams") then

                                                local chams_box = Instance.new("BoxHandleAdornment", b)
                                                chams_box.Name = "Chams"
                                                chams_box.AlwaysOnTop = true
                                                chams_box.ZIndex = 4
                                                chams_box.Adornee = b
                                                chams_box.Color3 = settings_tbl.Chams_Color
                                                chams_box.Transparency = settings_tbl.Chams_Transparency
                                                chams_box.Size = b.Size + Vector3.new(0.002, 0.002, 0.002)

                                                local glow_box = Instance.new("BoxHandleAdornment", b)
                                                glow_box.Name = "Glow"
                                                glow_box.AlwaysOnTop = false
                                                glow_box.ZIndex = 3
                                                glow_box.Adornee = b
                                                glow_box.Color3 = settings_tbl.Chams_Glow_Color
                                                glow_box.Size = chams_box.Size + Vector3.new(0.05, 0.05, 0.05)

                                            end

                                        else

                                            destroy_chams(char)

                                        end

                                    end

                                end

                                if v.Team.Name == dwLocalPlayer.Team.Name then
                                    destroy_chams(v.Character)
                                end

                            end

                        else

                            destroy_chams(v.Character)

                        end

                    end

                end

            else

                for k, v in next, dwEntities:GetPlayers() do

                    if v ~= dwLocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                        v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health ~= 0 then

                        destroy_chams(v.Character)

                    end

                end

            end

        end)

    else
        ESP_Enabled = false
    end
end)

-- Keybinds

local Keybinds_Tab = Window:NewTab("Keybinds")
local Keybinds_Section = Keybinds_Tab:NewSection("Keybinds")

Keybinds_Section:NewKeybind("Toggle GUI", "Toggles the GUI on and off", Enum.KeyCode.Delete, function()
    Library:ToggleUI()
end)

-- About

local About_Tab = Window:NewTab("About")
local About_Section = About_Tab:NewSection("About")
local About_Authors = About_Section:NewLabel("Authors: VRX#0001, HuskyPoe#5284")
local About_Version = About_Section:NewLabel("Version: 0.0.1")

local DCclicked = false

local button = About_Section:NewButton("Official Discord Server", "Link to our official Discord server.", function()
    DCclicked = true
    setclipboard('https://discord.gg/5bjTbbr85k')
end)

if DCclicked == true then
    button:UpdateButton("Copied to clipboard")
    wait(2)
    button:UpdateButton("Official Discord Server")
    DCclicked = false
end
