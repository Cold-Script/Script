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
local Collision = LocalPlayer.Collision
--// Function \\
function Alert(text)
Library:Notify("[ Alert ] : " .. text)
end
--// Script \\
local GamePlay = Tab.Main:AddLeftGroupbox("Game-Play")
GamePlay:AddToggle("MyToggle",{
Text = "Revive On Death",
Default = false,
Callback = function(v)
_G.ReviveOnDeath = v
game:GetService("RunService").RenderStepped:Connect(function()
if game.Players.LocalPlayer.Character.Humanoid.Health == 0 and _G.ReviveOnDeath then
EntityFolder.Revive:FireServer()
end
end)
end})
















