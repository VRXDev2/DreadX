---@diagnostic disable: undefined-global
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

setfpscap(0)

local colors = {
    SchemeColor = Color3.fromRGB(109, 65, 170),
    Background = Color3.fromRGB(82, 45, 135),
    Header = Color3.fromRGB(68, 32, 117),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(70, 38, 114)
}

local Window = Library.CreateLib("DreadX | Trident Survival V2", colors)

local Main_Tab = Window:NewTab("Main")
local Main_ = Main_Tab:NewSection("Section Name")

----------------------------------------------------------------------------------------------------------------------------------------------

local ESP_Tab = Window:NewTab("ESP")
local ESP_PlayerESP = ESP_Tab:NewSection("PlayerESP")

ESP_PlayerESP:NewToggle("Toggle", "Enables or disables the Player ESP", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)

local ESP_OreESP = ESP_Tab:NewSection("OreESP")

ESP_OreESP:NewToggle("Nitrate", "Enables or disables the Nitrate ESP", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)

ESP_OreESP:NewToggle("Iron", "Enables or disables the Iron ESP", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)

ESP_OreESP:NewToggle("Stone", "Enables or disables the Stone ESP", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)

local ESP_StorageESP = ESP_Tab:NewSection("StorageESP")

ESP_StorageESP:NewToggle("Toggle", "Enables or disables the Storage ESP", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------

local About = Window:NewTab("About")
local About_Section = About:NewSection("About")

About_Section:NewLabel("Version: 0.0.1")

----------------------------------------------------------------------------------------------------------------------------------------------

local Settings = Window:NewTab("Settings")
local Settings_ = Settings:NewSection("Section Name")