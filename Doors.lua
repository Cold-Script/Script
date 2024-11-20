local repo = 'https://raw.githubusercontent.com/Cold-Script/LinoriaLib/refs/heads/patch-3/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Options = getgenv().Linoria.Options
local Toggles = getgenv().Linoria.Toggles

local Window = Library:CreateWindow({
	Title = '🎃 YOUHUB - Halloween | Doors Version : 5',
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true,
	TabPadding = 8,
        NotifySide = "Right",
	MenuFadeTime = 0.2
})
local Tab = {
  Main = Window:AddTab("Main"),
  Exploit = Window:AddTab("Exploits"),
  Players = Window:AddTab("Players"),
  Visual = Window:AddTab("Visual"),
  Configs = Window:AddTab("Configs")
}
--// Local Service \\
local EntityFolder = if not game:GetService("ReplicatedStorage"):WaitForChild("GameData"):WaitForChild("Floor").Value == "Fools" then game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder") else game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
--// Function \\
function Alert(text)
Library:Notify("[ Alert ] : " .. text)
end
--// Script \\
local GamePlay = Tab.Main:AddLeftGroupbox("Game-Play")
GamePlay:AddToggle("MyToggle",{
Text = "Auto Revive",
Default = false,
Tooltip = "When you die you will revive but its not free\nbut Super then its free.",
Callback = function(v)
_G.AutoRevive = v
game:GetService("RunService").RenderStepped:Connect(function()
if game.Players.LocalPlayer.Character.Humanoid.Health == 0 and _G.AutoRevive then
EntityFolder.Revive:FireServer()
Alert("Loading,\nAuto Revive")							
end
end)
end})
GamePlay:AddToggle("MyToggle",{
Text = "Auto Lobby",
Default = false,
Tooltip = "When you die you will have to return to the Lobby",
Callback = function(v)
_G.AutoLobby = v
game:GetService("RunService").RenderStepped:Connect(function()
if game.Players.LocalPlayer.Character.Humanoid.Health == 0 and _G.AutoLobby then
EntityFolder.Lobby:FireServer()
Alert("Loading,\nAuto Lobby")							
end
end)
end})
GamePlay:AddToggle("MyToggle",{
Text = "Auto Shutdown",
Default = false,
Tooltip = "When you die you will have to shutdown out game",
Callback = function(v)
_G.AutoShutdown = v
game:GetService("RunService").RenderStepped:Connect(function()
if game.Players.LocalPlayer.Character.Humanoid.Health == 0 and _G.AutoShutdown then
game:Shutdown()
Alert("Loading,\nAuto Shutdown")							
end
end)
end})














