-- Debug Notification
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Script Loaded";
        Text = "✅ Animation UI script has loaded!";
        Duration = 5;
    })
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage:FindFirstChild("PlayAnimationEvent")
if not event then
    event = Instance.new("RemoteEvent")
    event.Name = "PlayAnimationEvent"
    event.Parent = ReplicatedStorage
end

-- GUI in CoreGui so it always shows
local gui = Instance.new("ScreenGui")
gui.Name = "AnimationGui"
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

-- Open Menu button
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 120, 0, 50)
openButton.Position = UDim2.new(0, 20, 0.8, 0)
openButton.Text = "Open Menu"
openButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.ZIndex = 10
openButton.Parent = gui

-- Panel
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 250, 0, 160)
panel.Position = UDim2.new(0.5, -125, 0.5, -80)
panel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
panel.Visible = false
panel.ZIndex = 10
panel.Parent = gui

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 80, 0, 40)
closeButton.Position = UDim2.new(1, -90, 0, 10)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.ZIndex = 10
closeButton.Parent = panel

-- TextBox for Animation ID
local animBox = Instance.new("TextBox")
animBox.Size = UDim2.new(0, 200, 0, 40)
animBox.Position = UDim2.new(0.5, -100, 0.3, -20)
animBox.PlaceholderText = "Enter Animation ID"
animBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
animBox.TextColor3 = Color3.fromRGB(255, 255, 255)
animBox.ZIndex = 10
animBox.Parent = panel

-- Play button
local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0, 200, 0, 50)
playButton.Position = UDim2.new(0.5, -100, 0.7, -25)
playButton.Text = "Play Animation"
playButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
playButton.TextColor3 = Color3.fromRGB(255, 255, 255)
playButton.ZIndex = 10
playButton.Parent = panel

-- Button logic
openButton.MouseButton1Click:Connect(function()
	panel.Visible = true
	openButton.Visible = false
end)

closeButton.MouseButton1Click:Connect(function()
	panel.Visible = false
	openButton.Visible = true
end)

playButton.MouseButton1Click:Connect(function()
	local inputId = animBox.Text
	if inputId and inputId ~= "" then
		-- Fire to server with entered animation ID
		event:FireServer(inputId)

		-- Debug confirm
		pcall(function()
			game.StarterGui:SetCore("SendNotification", {
				Title = "Animation Sent";
				Text = "🎬 ID: " .. inputId;
				Duration = 3;
			})
		end)
	end
end)
