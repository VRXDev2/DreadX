--[[ Stop Skidding Loser, Yuri Owns You! :clown: ]] for i, v in pairs(
    game:GetService("ReplicatedStorage").Player:GetDescendants()) do
    if v:IsA("MeshPart") or v:IsA("Part") then
        local adornment = Instance.new("BoxHandleAdornment")
        adornment.Adornee = v
        adornment.AlwaysOnTop = true
        adornment.ZIndex = 1
        adornment.Size = v.Size
        adornment.Color = BrickColor.new("Bright green")
        adornment.Transparency = 0.3
        adornment.Parent = v
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
                adornment.Color = BrickColor.new("Light red")
                adornment.Transparency = 0.3
                adornment.Parent = v

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
                adornment.Parent = v
            end
        end
    end
end
