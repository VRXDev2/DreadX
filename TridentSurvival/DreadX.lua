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

-- if not game.GameId == 13253735473 then
local Window = Library.CreateLib("DreadX | Trident Survival V2", colors)

local config = Instance.new("Folder")
config.Name = "DreadX"
config.Parent = workspace

local OreESPAdornee = Instance.new("Folder")
OreESPAdornee.Name = "OreESPAdornee"
OreESPAdornee.Parent = workspace:WaitForChild("DreadX")

local PlayerESPAdornee = Instance.new("Folder")
PlayerESPAdornee.Name = "PlayerESPAdornee"
PlayerESPAdornee.Parent = workspace:WaitForChild("DreadX")

local TotemESPAdornee = Instance.new("Folder")
TotemESPAdornee.Name = "TotemESPAdornee"
TotemESPAdornee.Parent = workspace:WaitForChild("DreadX")

local StorageESPAdornee = Instance.new("Folder")
StorageESPAdornee.Name = "StorageESPAdornee"
StorageESPAdornee.Parent = workspace:WaitForChild("DreadX")

local Main_Tab = Window:NewTab("Main")
local Main_ = Main_Tab:NewSection("Hacks here are coming soon. \nSee the other tabs.")

loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/TridentSurvival/Visuals.lua"), true))()

-- ESP

local ESP_Tab = Window:NewTab("ESP")
local ESP_PlayerESP = ESP_Tab:NewSection("PlayerESP")

ESP_PlayerESP:NewToggle("Toggle", "Enables or disables Player ESP", function(state)
    if state then
        for i, v in pairs(game:GetService("ReplicatedStorage").Player:GetDescendants()) do
            if v:IsA("MeshPart") or v:IsA("Part") then
                local adornment = Instance.new("BoxHandleAdornment")
                adornment.Adornee = v
                adornment.AlwaysOnTop = true
                adornment.ZIndex = 1
                adornment.Size = v.Size
                adornment.Color = BrickColor.new("Bright green")
                adornment.Transparency = 0.3
                adornment.Parent = workspace.DreadX.PlayerESPAdornee
    
                if v.Name == "HumanoidRootPart" then
                    adornment:Destroy()
                end
            end
        end
        for i, v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Head") then
    
                for i, v in pairs(v:GetChildren()) do
                    if v:IsA("Part") then
    
                        local adornment = Instance.new("BoxHandleAdornment")
                        adornment.Adornee = v
                        adornment.AlwaysOnTop = true
                        adornment.ZIndex = 1
                        adornment.Size = v.Size
                        adornment.Color = BrickColor.new("Really red")
                        adornment.Transparency = 0.3
                        adornment.Parent = workspace.DreadX.PlayerESPAdornee
    
                        if v.Name == "HumanoidRootPart" then
                            adornment:Destroy()
                        end
                    end
                end
                for i, v in pairs(v:GetChildren()) do
                    if v:IsA("MeshPart") then
    
                        local adornment = Instance.new("BoxHandleAdornment")
                        adornment.Adornee = v
                        adornment.AlwaysOnTop = true
                        adornment.ZIndex = 1
                        adornment.Size = v.Size
                        adornment.Color = BrickColor.new("Bright green")
                        adornment.Transparency = 0.3
                        adornment.Parent = workspace.DreadX.PlayerESPAdornee
    
                        if v.Name == "HumanoidRootPart" then
                            adornment:Destroy()
                        end
                    end
                end
            end
        end
    else
        for _, v in ipairs(workspace.DreadX.PlayerESPAdornee:GetDescendants()) do
            v:Destroy()
        end
    end
end)

local ESP_OreESP = ESP_Tab:NewSection("OreESP")

ESP_OreESP:NewToggle("Nitrate", "Enables or disables Nitrate ESP", function(state)
    if state then
        local parts = workspace:GetDescendants()
        local meshes = {}
        for _, part in ipairs(parts) do
            if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Institutional white") and part.Material ==
                Enum.Material.Slate then
                local NitrateEsp = Instance.new("BoxHandleAdornment")
                NitrateEsp.Adornee = part
                NitrateEsp.AlwaysOnTop = true
                NitrateEsp.ZIndex = 0
                NitrateEsp.Name = "Nitrate"
                NitrateEsp.Size = part.Size
                NitrateEsp.Transparency = 0.3
                NitrateEsp.Color = BrickColor.new("Institutional white")
                NitrateEsp.Parent = workspace.DreadX.OreESPAdornee
            end
        end
        
        local function onPartAdded(part)
            if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Institutional white") and part.Material ==
                Enum.Material.Slate then
                if state then
                    local UpdateNitrateEsp = Instance.new("BoxHandleAdornment")
                    UpdateNitrateEsp.Adornee = part
                    UpdateNitrateEsp.AlwaysOnTop = true
                    UpdateNitrateEsp.ZIndex = 0
                    UpdateNitrateEsp.Size = part.Size
                    UpdateNitrateEsp.Name = "Nitrate"
                    UpdateNitrateEsp.Transparency = 0.3
                    UpdateNitrateEsp.Color = BrickColor.new("Institutional white")
                    UpdateNitrateEsp.Parent = workspace.DreadX.OreESPAdornee
                end
            end
        end
        
        workspace.DescendantAdded:Connect(onPartAdded)
    else
        for _, v in ipairs(workspace.DreadX.OreESPAdornee:GetDescendants()) do
            if v.Name == "Nitrate" then
                v:Destroy()
            end
        end
    end
end)

ESP_OreESP:NewToggle("Iron", "Enables or disables Iron ESP", function(state)
    if state then
        local parts = workspace:GetDescendants()
        local meshes = {}
        for _, part in ipairs(parts) do
            if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Burlap") and part.Material == Enum.Material.Slate then
                local IronEsp = Instance.new("BoxHandleAdornment")
                IronEsp.Adornee = part
                IronEsp.AlwaysOnTop = true
                IronEsp.ZIndex = 0
                IronEsp.Size = part.Size
                IronEsp.Name = "Iron"
                IronEsp.Transparency = 0.3
                IronEsp.Color = BrickColor.new("Burlap")
                IronEsp.Parent = workspace.DreadX.OreESPAdornee
            end
        end

        local function onPartAdded(part)
            if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Burlap") and part.Material == Enum.Material.Slate then
                if state then
                    local UpdateIronEsp = Instance.new("BoxHandleAdornment")
                    UpdateIronEsp.Adornee = part
                    UpdateIronEsp.AlwaysOnTop = true
                    UpdateIronEsp.ZIndex = 0
                    UpdateIronEsp.Size = part.Size
                    UpdateIronEsp.Name = "Iron"
                    UpdateIronEsp.Transparency = 0.3
                    UpdateIronEsp.Color = BrickColor.new("Burlap")
                    UpdateIronEsp.Parent = workspace.DreadX.OreESPAdornee
                end
            end
        end

        workspace.DescendantAdded:Connect(onPartAdded)
    else
        for _, v in ipairs(workspace.DreadX.OreESPAdornee:GetDescendants()) do
            if v.Name == "Iron" then
                v:Destroy()
            end
        end
    end
end)

ESP_OreESP:NewToggle("Stone", "Enables or disables Stone ESP", function(state)
    if state then
        local function adornStoneOre(part)
            if part:IsA("MeshPart") and part.BrickColor == BrickColor.new("Flint") and part.Material == Enum.Material.Limestone then
                local parent = part.Parent
                if parent and parent:IsA("Model") and #parent:GetChildren() == 1 then
                    local StoneEsp = Instance.new("BoxHandleAdornment")
                    StoneEsp.Adornee = part
                    StoneEsp.AlwaysOnTop = true
                    StoneEsp.ZIndex = 0
                    StoneEsp.Size = part.Size
                    StoneEsp.Name = "Stone"
                    StoneEsp.Transparency = 0.3
                    StoneEsp.Color = BrickColor.new("Grey")
                    StoneEsp.Parent = workspace.DreadX.OreESPAdornee
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
    else
        for _, v in ipairs(workspace.DreadX.OreESPAdornee:GetDescendants()) do
            if v.Name == "Stone" then
                v:Destroy()
            end
        end
    end
end)

local ESP_TotemESP = ESP_Tab:NewSection("TotemESP")

ESP_TotemESP:NewButton("TotemESP", "Enables or disables TotemESP", function()
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
                TCESP.Color = BrickColor.new("Steel blue")
                TCESP.Parent = workspace.DreadX.TotemESPAdornee
                TCESP.CFrame = CFrame.new(0, -2.2, 0)
                table.insert(TCESPs, TCESP)
            end
        end
    end

    local function removeAdornments()
        for _, v in ipairs(workspace.DreadX.TotemESPAdornee:GetDescendants()) do
            v:Destroy()
        end
        TCESPs = {}
    end

    local function toggleAdornments()
        print(adorned)
        if adorned then
            removeAdornments()
            adorned = false
        else
            addAdornments()
            adorned = true
        end
    end

    toggleAdornments()
end)

local ESP_StorageESP = ESP_Tab:NewSection("StorageESP")

ESP_StorageESP:NewToggle("Toggle", "Enables or disables Storage ESP", function(state)
    if state then

        local function onPartAdded(part)
            if part:IsA("Part") and part.BrickColor == BrickColor.new("Linen") and part.Material == Enum.Material.WoodPlanks then
                local parent = part.Parent
                if parent and parent:IsA("Model") and #parent:GetChildren() == 2 then
                    local MilitaryEsp = Instance.new("BoxHandleAdornment")
                    MilitaryEsp.Adornee = part
                    MilitaryEsp.AlwaysOnTop = true
                    MilitaryEsp.ZIndex = 0
                    MilitaryEsp.Size = part.Size
                    MilitaryEsp.Name = "MilitaryCrate"
                    MilitaryEsp.Transparency = 0.3
                    MilitaryEsp.Color = BrickColor.new("Dark Royal blue")
                    MilitaryEsp.Parent = workspace.DreadX.StorageESPAdornee
                end
            end
        end
        
        workspace.DescendantAdded:Connect(onPartAdded)
        
        wait(1.5)
        
        
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
                PartCrateEsp.Name = "PartCrate"
                PartCrateEsp.Transparency = 0.3
                PartCrateEsp.Color = BrickColor.new("Bright yellow")
                PartCrateEsp.Parent = workspace.DreadX.StorageESPAdornee
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
                UpdatePartCrateEsp.Name = "PartCrate"
                UpdatePartCrateEsp.Transparency = 0.3
                UpdatePartCrateEsp.Color = BrickColor.new("Bright yellow")
                UpdatePartCrateEsp.Parent = workspace.DreadX.StorageESPAdornee
            end
        end
        
        workspace.DescendantAdded:Connect(onPartAdded)

    else
        for _, v in ipairs(workspace.DreadX.StorageESPAdornee:GetDescendants()) do
            v:Destroy()
        end
    end
end)

-- Other

local Other_Tab = Window:NewTab("Other")

local Other_Freecam = Other_Tab:NewSection("Freecam")

Other_Freecam:NewButton("Freecam (Press Y after clicking)", "Enables or disables Freecam", function()
    function sandbox(var, func)
        local env = getfenv(func)
        local newenv = setmetatable({}, {
            __index = function(self, k)
                if k == "script" then
                    return var
                else
                    return env[k]
                end
            end
        })
        setfenv(func, newenv)
        return func
    end
    cors = {}
    mas = Instance.new("Model", game:GetService("Lighting"))
    LocalScript0 = Instance.new("LocalScript")
    LocalScript0.Name = "FreeCamera"
    LocalScript0.Parent = mas
    table.insert(cors, sandbox(LocalScript0, function()
    
        local pi = math.pi
        local abs = math.abs
        local clamp = math.clamp
        local exp = math.exp
        local rad = math.rad
        local sign = math.sign
        local sqrt = math.sqrt
        local tan = math.tan
    
        local ContextActionService = game:GetService("ContextActionService")
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local StarterGui = game:GetService("StarterGui")
        local UserInputService = game:GetService("UserInputService")
    
        local LocalPlayer = Players.LocalPlayer
        if not LocalPlayer then
            Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
            LocalPlayer = Players.LocalPlayer
        end
    
        local Camera = workspace.CurrentCamera
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
            local newCamera = workspace.CurrentCamera
            if newCamera then
                Camera = newCamera
            end
        end)
    
        local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
        local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
        local FREECAM_MACRO_KB = {Enum.KeyCode.Y}
    
        local NAV_GAIN = Vector3.new(1, 1, 1) * 64
        local PAN_GAIN = Vector2.new(0.75, 1) * 8
        local FOV_GAIN = 300
    
        local PITCH_LIMIT = rad(90)
    
        local VEL_STIFFNESS = 1.5
        local PAN_STIFFNESS = 1.0
        local FOV_STIFFNESS = 4.0
    
        local Spring = {}
        do
            Spring.__index = Spring
    
            function Spring.new(freq, pos)
                local self = setmetatable({}, Spring)
                self.f = freq
                self.p = pos
                self.v = pos * 0
                return self
            end
    
            function Spring:Update(dt, goal)
                local f = self.f * 2 * pi
                local p0 = self.p
                local v0 = self.v
    
                local offset = goal - p0
                local decay = exp(-f * dt)
    
                local p1 = goal + (v0 * dt - offset * (f * dt + 1)) * decay
                local v1 = (f * dt * (offset * f - v0) + v0) * decay
    
                self.p = p1
                self.v = v1
    
                return p1
            end
    
            function Spring:Reset(pos)
                self.p = pos
                self.v = pos * 0
            end
        end
    
        local cameraPos = Vector3.new()
        local cameraRot = Vector2.new()
        local cameraFov = 0
    
        local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
        local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
        local fovSpring = Spring.new(FOV_STIFFNESS, 0)
    
        local Input = {}
        do
            local thumbstickCurve
            do
                local K_CURVATURE = 2.0
                local K_DEADZONE = 0.15
    
                local function fCurve(x)
                    return (exp(K_CURVATURE * x) - 1) / (exp(K_CURVATURE) - 1)
                end
    
                local function fDeadzone(x)
                    return fCurve((x - K_DEADZONE) / (1 - K_DEADZONE))
                end
    
                function thumbstickCurve(x)
                    return sign(x) * clamp(fDeadzone(abs(x)), 0, 1)
                end
            end
    
            local gamepad = {
                ButtonX = 0,
                ButtonY = 0,
                DPadDown = 0,
                DPadUp = 0,
                ButtonL2 = 0,
                ButtonR2 = 0,
                Thumbstick1 = Vector2.new(),
                Thumbstick2 = Vector2.new()
            }
    
            local keyboard = {
                W = 0,
                A = 0,
                S = 0,
                D = 0,
                E = 0,
                Q = 0,
                U = 0,
                H = 0,
                J = 0,
                K = 0,
                I = 0,
                Y = 0,
                Up = 0,
                Down = 0,
                LeftShift = 0,
                RightShift = 0
            }
    
            local mouse = {
                Delta = Vector2.new(),
                MouseWheel = 0
            }
    
            local NAV_GAMEPAD_SPEED = Vector3.new(1, 1, 1)
            local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
            local PAN_MOUSE_SPEED = Vector2.new(1, 1) * (pi / 64)
            local PAN_GAMEPAD_SPEED = Vector2.new(1, 1) * (pi / 8)
            local FOV_WHEEL_SPEED = 1.0
            local FOV_GAMEPAD_SPEED = 0.25
            local NAV_ADJ_SPEED = 0.75
            local NAV_SHIFT_MUL = 0.25
    
            local navSpeed = 1
    
            function Input.Vel(dt)
                navSpeed = clamp(navSpeed + dt * (keyboard.Up - keyboard.Down) * NAV_ADJ_SPEED, 0.01, 4)
    
                local kGamepad = Vector3.new(thumbstickCurve(gamepad.Thumbstick1.x),
                    thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
                    thumbstickCurve(-gamepad.Thumbstick1.y)) * NAV_GAMEPAD_SPEED
    
                local kKeyboard = Vector3.new(keyboard.D - keyboard.A + keyboard.K - keyboard.H,
                    keyboard.E - keyboard.Q + keyboard.I - keyboard.Y, keyboard.S - keyboard.W + keyboard.J - keyboard.U) *
                                      NAV_KEYBOARD_SPEED
    
                local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or
                                  UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
    
                return (kGamepad + kKeyboard) * (navSpeed * (shift and NAV_SHIFT_MUL or 1))
            end
    
            function Input.Pan(dt)
                local kGamepad =
                    Vector2.new(thumbstickCurve(gamepad.Thumbstick2.y), thumbstickCurve(-gamepad.Thumbstick2.x)) *
                        PAN_GAMEPAD_SPEED
                local kMouse = mouse.Delta * PAN_MOUSE_SPEED
                mouse.Delta = Vector2.new()
                return kGamepad + kMouse
            end
    
            function Input.Fov(dt)
                local kGamepad = (gamepad.ButtonX - gamepad.ButtonY) * FOV_GAMEPAD_SPEED
                local kMouse = mouse.MouseWheel * FOV_WHEEL_SPEED
                mouse.MouseWheel = 0
                return kGamepad + kMouse
            end
    
            do
                local function Keypress(action, state, input)
                    keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
                    return Enum.ContextActionResult.Sink
                end
    
                local function GpButton(action, state, input)
                    gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
                    return Enum.ContextActionResult.Sink
                end
    
                local function MousePan(action, state, input)
                    local delta = input.Delta
                    mouse.Delta = Vector2.new(-delta.y, -delta.x)
                    return Enum.ContextActionResult.Sink
                end
    
                local function Thumb(action, state, input)
                    gamepad[input.KeyCode.Name] = input.Position
                    return Enum.ContextActionResult.Sink
                end
    
                local function Trigger(action, state, input)
                    gamepad[input.KeyCode.Name] = input.Position.z
                    return Enum.ContextActionResult.Sink
                end
    
                local function MouseWheel(action, state, input)
                    mouse[input.UserInputType.Name] = -input.Position.z
                    return Enum.ContextActionResult.Sink
                end
    
                local function Zero(t)
                    for k, v in pairs(t) do
                        t[k] = v * 0
                    end
                end
    
                function Input.StartCapture()
                    ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
                        Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J,
                        Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.L,
                        Enum.KeyCode.Up, Enum.KeyCode.Down)
                    ContextActionService:BindActionAtPriority("FreecamMousePan", MousePan, false, INPUT_PRIORITY,
                        Enum.UserInputType.MouseMovement)
                    ContextActionService:BindActionAtPriority("FreecamMouseWheel", MouseWheel, false, INPUT_PRIORITY,
                        Enum.UserInputType.MouseWheel)
                    ContextActionService:BindActionAtPriority("FreecamGamepadButton", GpButton, false, INPUT_PRIORITY,
                        Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
                    ContextActionService:BindActionAtPriority("FreecamGamepadTrigger", Trigger, false, INPUT_PRIORITY,
                        Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
                    ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb, false, INPUT_PRIORITY,
                        Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
                end
    
                function Input.StopCapture()
                    navSpeed = 1
                    Zero(gamepad)
                    Zero(keyboard)
                    Zero(mouse)
                    ContextActionService:UnbindAction("FreecamKeyboard")
                    ContextActionService:UnbindAction("FreecamMousePan")
                    ContextActionService:UnbindAction("FreecamMouseWheel")
                    ContextActionService:UnbindAction("FreecamGamepadButton")
                    ContextActionService:UnbindAction("FreecamGamepadTrigger")
                    ContextActionService:UnbindAction("FreecamGamepadThumbstick")
                end
            end
        end
    
        local function GetFocusDistance(cameraFrame)
            local znear = 0.1
            local viewport = Camera.ViewportSize
            local projy = 2 * tan(cameraFov / 2)
            local projx = viewport.x / viewport.y * projy
            local fx = cameraFrame.rightVector
            local fy = cameraFrame.upVector
            local fz = cameraFrame.lookVector
    
            local minVect = Vector3.new()
            local minDist = 512
    
            for x = 0, 1, 0.5 do
                for y = 0, 1, 0.5 do
                    local cx = (x - 0.5) * projx
                    local cy = (y - 0.5) * projy
                    local offset = fx * cx - fy * cy + fz
                    local origin = cameraFrame.p + offset * znear
                    local part, hit = workspace:FindPartOnRay(Ray.new(origin, offset.unit * minDist))
                    local dist = (hit - origin).magnitude
                    if minDist > dist then
                        minDist = dist
                        minVect = offset.unit
                    end
                end
            end
    
            return fz:Dot(minVect) * minDist
        end
    
        local function StepFreecam(dt)
            local vel = velSpring:Update(dt, Input.Vel(dt))
            local pan = panSpring:Update(dt, Input.Pan(dt))
            local fov = fovSpring:Update(dt, Input.Fov(dt))
    
            local zoomFactor = sqrt(tan(rad(70 / 2)) / tan(rad(cameraFov / 2)))
    
            cameraFov = clamp(cameraFov + fov * FOV_GAIN * (dt / zoomFactor), 1, 120)
            cameraRot = cameraRot + pan * PAN_GAIN * (dt / zoomFactor)
            cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y % (2 * pi))
    
            local cameraCFrame = CFrame.new(cameraPos) * CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0) *
                                     CFrame.new(vel * NAV_GAIN * dt)
            cameraPos = cameraCFrame.p
    
            Camera.CFrame = cameraCFrame
            Camera.Focus = cameraCFrame * CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
            Camera.FieldOfView = cameraFov
        end
    
        local PlayerState = {}
        do
            local mouseIconEnabled
            local cameraSubject
            local cameraType
            local cameraFocus
            local cameraCFrame
            local cameraFieldOfView
            local screenGuis = {}
            local coreGuis = {
                Backpack = true,
                Chat = true,
                Health = true,
                PlayerList = true
            }
            local setCores = {
                BadgesNotificationsActive = true,
                PointsNotificationsActive = true
            }
    
            function PlayerState.Push()
                for name in pairs(coreGuis) do
                    coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
                    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
                end
                for name in pairs(setCores) do
                    setCores[name] = StarterGui:GetCore(name)
                    StarterGui:SetCore(name, false)
                end
                local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
                if playergui then
                    for _, gui in pairs(playergui:GetChildren()) do
                        if gui:IsA("ScreenGui") and gui.Enabled then
                            screenGuis[#screenGuis + 1] = gui
                            gui.Enabled = false
                            if gui.Name == "DreadX" then
                                gui.Enabled = true
                            end
                        end
                    end
                end
    
                cameraFieldOfView = Camera.FieldOfView
                Camera.FieldOfView = 70
    
                cameraType = Camera.CameraType
                Camera.CameraType = Enum.CameraType.Custom
    
                cameraSubject = Camera.CameraSubject
                Camera.CameraSubject = nil
    
                cameraCFrame = Camera.CFrame
                cameraFocus = Camera.Focus
    
                mouseIconEnabled = UserInputService.MouseIconEnabled
                UserInputService.MouseIconEnabled = false
    
                mouseBehavior = UserInputService.MouseBehavior
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            end
    
            function PlayerState.Pop()
                for name, isEnabled in pairs(coreGuis) do
                    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
                end
                for name, isEnabled in pairs(setCores) do
                    StarterGui:SetCore(name, isEnabled)
                end
                for _, gui in pairs(screenGuis) do
                    if gui.Parent then
                        gui.Enabled = true
                    end
                end
    
                Camera.FieldOfView = cameraFieldOfView
                cameraFieldOfView = nil
    
                Camera.CameraType = cameraType
                cameraType = nil
    
                Camera.CameraSubject = cameraSubject
                cameraSubject = nil
    
                Camera.CFrame = cameraCFrame
                cameraCFrame = nil
    
                Camera.Focus = cameraFocus
                cameraFocus = nil
    
                UserInputService.MouseIconEnabled = mouseIconEnabled
                mouseIconEnabled = nil
    
                UserInputService.MouseBehavior = mouseBehavior
                mouseBehavior = nil
            end
        end
    
        local function StartFreecam()
            local cameraCFrame = Camera.CFrame
            cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
            cameraPos = cameraCFrame.p
            cameraFov = Camera.FieldOfView
    
            velSpring:Reset(Vector3.new())
            panSpring:Reset(Vector2.new())
            fovSpring:Reset(0)
    
            PlayerState.Push()
            RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
            Input.StartCapture()

            LocalPlayer.Character.Humanoid.WalkSpeed = 0

        end
    
        local function StopFreecam()
            Input.StopCapture()
            RunService:UnbindFromRenderStep("Freecam")
            PlayerState.Pop()
        end
    
        do
            local enabled = false
    
            local function ToggleFreecam()
                if enabled then
                    StopFreecam()
                else
                    StartFreecam()
                end
                enabled = not enabled
            end
    
            local function CheckMacro(macro)
                for i = 1, #macro - 1 do
                    if not UserInputService:IsKeyDown(macro[i]) then
                        return
                    end
                end
                ToggleFreecam()
            end
    
            local function HandleActivationInput(action, state, input)
                if state == Enum.UserInputState.Begin then
                    if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
                        CheckMacro(FREECAM_MACRO_KB)
                    end
                end
                return Enum.ContextActionResult.Pass
            end
    
            ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY,
                FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
        end
    end))
    for i, v in pairs(mas:GetChildren()) do
        v.Parent = game:GetService("Players").LocalPlayer.PlayerGui
        pcall(function()
            v:MakeJoints()
        end)
    end
    mas:Destroy()
    for i, v in pairs(cors) do
        spawn(function()
            pcall(v)
        end)
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
local About_Version = About_Section:NewLabel("Version: 0.0.2")

About_Section:NewButton("Official Discord Server (It will be in your clipboard)", "Link to our official Discord server.", function()
    setclipboard('https://discord.gg/5bjTbbr85k')
end)
-- else
--    warn("DreadX | Unsupported Game")
-- end

