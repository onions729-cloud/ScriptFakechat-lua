-- if you cant access the doc, here is the script. THIS IS A SERVERSCRIPT THAT CAN BE USED ONCE IN SERVERSCRIPTSERVICE, CLICK A SERVER BUTTON IF IT IS A EXECUTOR FOR IT TO WORK RIGHT.



local messageText = "✅ (YourUserHere): (Your message here)"

local function injectJandelMessage(player)
	local gui = Instance.new("ScreenGui")
	gui.Name = "JandelGlobalMessage"
	gui.ResetOnSpawn = false
	gui.Parent = player:WaitForChild("PlayerGui")

	local container = Instance.new("Frame")
	container.Size = UDim2.new(0, 600, 0, 60)
	container.Position = UDim2.new(0.5, -300, 0.25, -30)
	container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	container.BackgroundTransparency = 0
	container.Parent = gui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = container

	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Parent = container

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -20, 1, 0)
	label.Position = UDim2.new(0, 10, 0, 0)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 24
	label.TextWrapped = true
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.Text = messageText
	label.Parent = container

	task.delay(5, function()
		for i = 1, 20 do
			local fade = i / 20
			container.BackgroundTransparency = fade
			label.TextTransparency = fade
			stroke.Transparency = fade
			task.wait(0.1)
		end
		gui:Destroy()
	end)
end

for _, player in ipairs(game.Players:GetPlayers()) do
	injectJandelMessage(player)
end

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		injectJandelMessage(player)
	end)
end)
