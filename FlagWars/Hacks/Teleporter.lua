local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
local localPlayer = game.Players.LocalPlayer
local humanoid = game.Players.LocalPlayer.Character.Humanoid
local TeamName = localPlayer.Team.Name
local UserInputService = game:getService("UserInputService")

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.P then
        if rootPart and humanoid.Health > 0 then
            if TeamName == "Team Blue" then
                -- firetouchintrest(rootPart, workspace.Core.Flags["Team Red"].Base, 0)
                rootPart.CFrame = workspace.Core.Flags["Team Red"].Base.CFrame
                wait(1.5)
                rootPart.CFrame = workspace.Core.Flags["Team Blue"].Base.CFrame
            else
                rootPart.CFrame = workspace.Core.Flags["Team Blue"].Base.CFrame
                wait(1.5)
                rootPart.CFrame = workspace.Core.Flags["Team Red"].Base.CFrame
            end
        end
    end
end)
