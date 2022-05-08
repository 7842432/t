if not game:IsLoaded() then
game.Loaded:Wait()
end
repeat wait() until game:GetService("CoreGui")
local msg = Instance.new("Message", workspace)
local Asset = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local copy = game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.BottomButtonFrame.LeaveGameButtonButton:Clone()
local copy2 = game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.VersionContainer.ServerVersionLabel:Clone()
game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.VersionContainer.Visible = true
copy.Parent = game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.BottomButtonFrame
copy.LeaveGameHint.Image = "rbxasset://textures/ui/Settings/Help/ResetIcon.png"
copy.LayoutOrder = 0
copy.Name = "RejoinButton"
copy.Position = UDim2.new(0, 270, 0, 90)
copy.LayoutOrder = 0
copy.LeaveGameButtonTextLabel.Text = "Rejoin"
for i,v in pairs(game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.VersionContainer:GetChildren()) do
if v:IsA("TextLabel") then
v:Destroy()
end
end
copy2.Parent = game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.VersionContainer
copy2.Text = Asset.Name.." (ID: "..game.PlaceId..") by "..Asset.Creator.Name.." ("..Asset.Creator.CreatorType..")"
copy.MouseEnter:connect(function()
copy.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
end)
copy.MouseLeave:connect(function()
copy.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
end)
copy.MouseButton1Click:Connect(function()
game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.Visible = false
msg.Text = "Rejoining..."
if #game:GetService("Players"):GetPlayers() <= 1 then
game:GetService("Players").LocalPlayer:Kick("\nRejoining...")
wait()
game:GetService('TeleportService'):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
else
game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
end
end)
