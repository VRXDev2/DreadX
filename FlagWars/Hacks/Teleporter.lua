local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/VRXDev2/DreadX/main/Notifications.lua"), true))()

local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
local localPlayer = game.Players.LocalPlayer
local humanoid = game.Players.LocalPlayer.Character.Humanoid
local TeamName = localPlayer.Team.Name
local UserInputService = game:getService("UserInputService")

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.P then
        if rootPart and humanoid.Health > 0 then
            if TeamName == "Team Blue" then

                rootPart.CFrame = workspace.Core.Flags["Team Red"].Base.CFrame
                localPlayer.Character.Jump = true
                wait(0.2)
                rootPart.CFrame = workspace.Core.Flags["Team Red"].Base.CFrame
                wait(1.5)
                localPlayer.Character.Jump = false
                rootPart.CFrame = workspace.Core.Flags["Team Blue"].Base.CFrame

            else

                rootPart.CFrame = workspace.Core.Flags["Team Blue"].Base.CFrame
                localPlayer.Character.Jump = true
                wait(0.2)
                rootPart.CFrame = workspace.Core.Flags["Team Blue"].Base.CFrame
                wait(1.5)
                localPlayer.Character.Jump = false
                rootPart.CFrame = workspace.Core.Flags["Team Red"].Base.CFrame

            end

            notifications:message{
                Title = "<b>Dread<font color='rgb(183, 11, 209)'>X</font></b>",
                Description = "Teleported!"
            }
            
        end
    end
end)
