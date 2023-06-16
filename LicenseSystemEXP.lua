local PLR = game:GetService("Players")
local HTS = game:GetService("HttpService")

local LPLR = PLR.LocalPlayer

HTS.HttpEnabled = true

local response = game:HttpGetAsync("http://65.109.35.155:24751/validate/" .. LPLR.UserId)

wait(3)

print(response)