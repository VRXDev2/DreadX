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

local Window = Library.CreateLib("DreadX | Murder Mystery 2", colors)

local Workspace = game:GetService('Workspace')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')
local Client = Players.LocalPlayer
local RunService = game:GetService('RunService')
local Workspace = game:GetService("Workspace")
local UIS = game:GetService("UserInputService")
local ScriptContext = game:GetService("ScriptContext")
local CoreGui = game:GetService("CoreGui")
local Camera = Workspace.CurrentCamera
local Mouse = Client:GetMouse()
local VirtualUser = game:GetService("VirtualUser")

local GunHighlight = Instance.new("Highlight")
local GunHandleAdornment = Instance.new("SphereHandleAdornment")

GunHighlight.FillColor = Color3.fromRGB(248, 241, 174)
GunHighlight.Adornee = Workspace:FindFirstChild("GunDrop")
GunHighlight.OutlineTransparency = 1
GunHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
GunHighlight.RobloxLocked = true

GunHandleAdornment.Color3 = Color3.fromRGB(248, 241, 174)
GunHandleAdornment.Transparency = 0.2
GunHandleAdornment.Adornee = Workspace:FindFirstChild("GunDrop")
GunHandleAdornment.AlwaysOnTop = true
GunHandleAdornment.AdornCullingMode = Enum.AdornCullingMode.Never
GunHandleAdornment.RobloxLocked = true

GunHighlight.Parent = CoreGui
GunHandleAdornment.Parent = CoreGui


function GetMurderer()
    for i,v in pairs(Players:GetChildren()) do 
        if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") and v.Name == "Tool" then
            return v.Name
        end
    end
    return nil
end

function GetSheriff()
    for i,v in pairs(Players:GetChildren()) do 
        if v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") and v.Name == "Tool" then
            return v.Name
        end
        return nil
    end
end





local Main_Tab = Window:NewTab("Main")
local Main_Character = Main_Tab:NewSection("Character")

Main_Character:NewSlider("WalkSpeed", "Changes your walkspeed", 150, 16, function(s)
    local Character = Client.Character
    local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid")
    Humanoid.WalkSpeed = s
end)

Main_Character:NewSlider("JumpPower", "Changes your jumppower", 150, 50, function(s)
    local Character = Client.Character
    local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid")
    Humanoid.JumpPower = s
end)



local c
local h
local bv
local bav
local cam
local flying
local p = Client
local buttons = {W = false, S = false, A = false, D = false, Moving = false}

local StartFly = function ()
    local Character = Client.Character
    local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart")

    if not Client.Character or not Character.Head or flying then return end
    c = Character
    h = Humanoid
    h.PlatformStand = true
    cam = workspace:WaitForChild('Camera')
    bv = Instance.new("BodyVelocity")
    bav = Instance.new("BodyAngularVelocity")
    bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bv.Parent = c.Head
    bav.Parent = c.Head
    flying = true
    h.Died:connect(function() flying = false end)
end

local EndFly = function ()
    if not p.Character or not flying then return end
    h.PlatformStand = false
    bv:Destroy()
    bav:Destroy()
    flying = false
end

game:GetService("UserInputService").InputBegan:connect(function (input, GPE) 
    if GPE then return end
    for i, e in pairs(buttons) do
        if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
            buttons[i] = true
            buttons.Moving = true
        end
    end
end)

game:GetService("UserInputService").InputEnded:connect(function (input, GPE) 
    if GPE then return end
    local a = false
    for i, e in pairs(buttons) do
        if i ~= "Moving" then
            if input.KeyCode == Enum.KeyCode[i] then
                buttons[i] = false
            end
            if buttons[i] then a = true end
        end
    end
    buttons.Moving = a
end)

local setVec = function (vec)
    return vec * ((getgenv().FlySpeed or 50) / vec.Magnitude)
end

game:GetService("RunService").Heartbeat:connect(function (step)
    if flying and c and c.PrimaryPart then
        local p = c.PrimaryPart.Position
        local cf = cam.CFrame
        local ax, ay, az = cf:toEulerAnglesXYZ()
        c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
        if buttons.Moving then
            local t = Vector3.new()
            if buttons.W then t = t + (setVec(cf.lookVector)) end
            if buttons.S then t = t - (setVec(cf.lookVector)) end
            if buttons.A then t = t - (setVec(cf.rightVector)) end
            if buttons.D then t = t + (setVec(cf.rightVector)) end
            c:TranslateBy(t * step)
        end
    end
end)


Main_Character:NewToggle("Fly", "Toggles Fly", function(state)
    getgenv().Fly = state
    if getgenv().Fly then
        StartFly()
    else
        EndFly()
    end
end)

Main_Character:NewSlider("Fly Speed", "Changes your FlySpeed", 150, 20, function(s)
    getgenv().FlySpeed = s
end)


local Main_Teleport = Main_Tab:NewSection("Teleport")

Main_Teleport:NewToggle("ClickTP (CTRL + Click)", "Toggles ClickTP", function(state)
    getgenv().ClickTP = state;
end)

Mouse.Button1Down:connect(function()
    if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end;
    if not Mouse.Target then return end;
    if not getgenv().ClickTP then return end;

    local Character = Client.Character
    Character:MoveTo(Mouse.Hit.p);
end)

local Main_Murderer = Main_Tab:NewSection("Murderer")

Main_Murderer:NewToggle("Killaura", "Toggles Killaura", function(state)
    getgenv().Killaura = state
end)

local lastAttack = tick()
RunService.Heartbeat:Connect(function()
   if (tick() - lastAttack) < 0.1 then
       return
   end
    pcall(function()
        local Knife = Client.Backpack:FindFirstChild("Knife") or Client.Character:FindFirstChild("Knife")
        if Knife and Knife:IsA("Tool") and getgenv().Killaura then
            for i, v in ipairs(Players:GetPlayers()) do
                if v ~= Client and v.Character ~= nil then
                    local EnemyRoot = v.Character.HumanoidRootPart
                    local EnemyPosition = EnemyRoot.Position
                    local Distance = (EnemyPosition - RootPart.Position).Magnitude
                    if (Distance <= 6.5) then
                        VirtualUser:ClickButton1(Vector2.new())
                        firetouchinterest(EnemyRoot, Knife.Handle, 1)
                        firetouchinterest(EnemyRoot, Knife.Handle, 0)
                        lastAttack = tick()
                    end
                end
            end
        end
    end)
end)

local Main_Sheriff = Main_Tab:NewSection("Sheriff")

getgenv().GunAccuracy = 25

Main_Sheriff:NewToggle("SilentAim", "Toggles SilentAim", function(state)
    getgenv().SilentAim = state
end)

Main_Sheriff:NewButton("Grab Gun", "Grabs the gun if it's on the ground", function()
    if not CanGrab then return end
        local gundrop = Workspace:FindFirstChild("GunDrop")
        if gundrop and not lastCFrame then
            local Character = Client.Character
			local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid")
			local RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart")
			
            lastCFrame = RootPart.CFrame
            --pcall(function()
                repeat
                    RootPart.CFrame = gundrop.CFrame
                    RunService.Stepped:Wait()
                until not gundrop:IsDescendantOf(Workspace)
                RootPart.CFrame = lastCFrame
                lastCFrame = nil
            --end)
        end
end)


coroutine.wrap(function()
    repeat wait()
        pcall(function()
            Murderer = GetMurderer()
            Sheriff = GetSheriff()
        end)
    until Murderer and Sheriff
end)()
--<>----<>----<>----<>----<>----<>----<>--
--<>----<>----<>----<>----<>----<>----<>--
ReplicatedStorage.UpdatePlayerData.OnClientEvent:Connect(function()
    CanGrab = false
end)

local GunHook
GunHook = hookmetamethod(game, "__namecall", function(self, ...)
	local method = getnamecallmethod()
	local args = { ... }
	if not checkcaller() then
		if typeof(self) == "Instance" then
			if self.Name == "ShootGun" and method == "InvokeServer" then
				if getgenv().SilentAim and getgenv().GunAccuracy then
					if Murderer then
						local Root = Players[tostring(Murderer)].Character.PrimaryPart
						local Veloc = Root.AssemblyLinearVelocity
						local Pos = Root.Position + (Veloc * Vector3.new(getgenv().GunAccuracy / 200, 0, getgenv().GunAccuracy/ 200))
						args[2] = Pos
					end
				end
			end
		end
	end
	return GunHook(self, unpack(args))
end)

local __namecall
__namecall = hookmetamethod(game, "__namecall", function(self, ...)
	local method = getnamecallmethod()
	local args = { ... }
	if not checkcaller() then
        if tostring(method) == "InvokeServer" and tostring(self) == "GetChance" then
            wait(13)
            Murderer = GetMurderer()
            Sheriff = GetSheriff()
            CanGrab = true
        end
	end
	return __namecall(self, unpack(args))
end)


local Autofarm_Tab = Window:NewTab("Autofarm")
local Autofarm_Section = Autofarm_Tab:NewSection("Autofarm")

Autofarm_Section:NewDropdown("Autofarm Target", "Choose the autofarm target", {"Coin", "XP"}, function(currentOption)
    getgenv().AutofarmTarget = currentOption
end)


Autofarm_Section:NewToggle("Toggle", "Toggles Autofarm", function(state)
    getgenv().Autofarm = state

    if not getgenv().AutofarmTarget then return end
    if getgenv().AutofarmTarget == "Coin" then
        while getgenv().Autofarm do
            task.wait()
            local CoinContainer = Workspace:FindFirstChild("CoinContainer", true)
            if CoinContainer and Client.PlayerGui.MainGUI.Game.CashBag.Visible == true then
                local coin = CoinContainer:FindFirstChild("Coin_Server")
                if coin and coin.CoinType.Value == "Coin" then
                    repeat
                    	local Character = Client.Character
						local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid")
						local RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart")
                    	
                        RootPart.CFrame = CFrame.new(coin.Position + Vector3.new(0, 2.5, 0)) * CFrame.Angles(0, 0, math.rad(180))
                        RunService.Stepped:Wait(0.7)
                        if not getgenv().Autofarm then break end
                    until not coin:IsDescendantOf(Workspace) or coin.Name ~= "Coin_Server" or Client.PlayerGui.MainGUI.Game.CashBag.Full.Visible
                    task.wait(1.75)
                end
            else
                task.wait(1.5)
            end
        end
    else
        while getgenv().Autofarm do
            wait()
            if Client.PlayerGui.MainGUI.Game.CashBag.Visible == true then
                RootPart.CFrame = CFrame.new(-121.12338256836, 138.27394104004, 38.946128845215)
            end
        end
    end

end)


local ESP_Tab = Window:NewTab("ESP")
local ESP_ESP = ESP_Tab:NewSection("ESP")


ESPfolder = Instance.new("Folder",CoreGui)
ESPfolder.Name = "ESP Holder"
	
local function AddBillboard(player)
    local billboard = Instance.new("BillboardGui",ESPfolder)
    billboard.Name = player.Name
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.fromOffset(200,50)
    billboard.ExtentsOffset = Vector3.new(0,3,0)
    billboard.Enabled = false

    local textLabel = Instance.new("TextLabel",billboard)
    textLabel.TextSize = 20
    textLabel.Text = player.Name
    textLabel.Font = Enum.Font.Arial
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.fromScale(1,1)

    if getgenv().AllEsp then
        billboard.Enabled = true
    end
    repeat
        wait()
        pcall(function()
            billboard.Adornee = player.Character.Head
            if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
                textLabel.TextColor3 = Color3.new(1,0,0)
                if not billboard.Enabled and getgenv().MurderEsp then
                    billboard.Enabled = true
                end
            elseif player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun") then
                textLabel.TextColor3 = Color3.new(0,0,1)
                if not billboard.Enabled and getgenv().SheriffEsp then
                    billboard.Enabled = true
                end
            else
                textLabel.TextColor3 = Color3.new(0,1,0)
            end
        end)
    until not player.Parent
end

for _,player in pairs(Players:GetPlayers()) do
    if player ~= Client then
        coroutine.wrap(AddBillboard)(player)
    end
end
Players.PlayerAdded:Connect(AddBillboard)

Players.PlayerRemoving:Connect(function(player)
    ESPfolder[player.Name]:Destroy()
end)

ESP_ESP:NewToggle("ESP (Player)", "Toggles ESP", function(state)
    getgenv().AllEsp = state

    for i, v in pairs(ESPfolder:GetChildren()) do
        if v:IsA("BillboardGui") and Players[tostring(v.Name)] then
            if getgenv().AllEsp then
                v.Enabled = true
            else
                v.Enabled = false
            end
        end
    end
end)


ESP_ESP:NewToggle("GunESP", "Toggles GunESP", function(state)
    getgenv().GunESP = state
end)

coroutine.wrap(function()
    RunService.RenderStepped:Connect(function()
        pcall(function()
            if getgenv().GunESP then
                local gundrop = Workspace:FindFirstChild("GunDrop")
                GunHighlight.Adornee = gundrop
                GunHandleAdornment.Adornee = gundrop
                if gundrop then 
                    GunHandleAdornment.Size = gundrop.Size + Vector3.new(0.05, 0.05, 0.05) 
                end
        
                GunHighlight.Enabled = getgenv().GunESP
                GunHandleAdornment.Visible = getgenv().GunESP
            end
        end)
    end)
end)()


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

About_Section:NewButton("Official Discord Server (It will be in your clipboard)", "Link to our official Discord server.", function()
    setclipboard('https://discord.gg/5bjTbbr85k')
end)