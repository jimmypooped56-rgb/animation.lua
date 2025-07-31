-- Debug Notification to confirm script runs
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

-- Create ScreenGui (force into CoreGui so it always shows)
local gui = Instance.new("ScreenGui")
gui.Name = "AnimationGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

-- Debug after GUI is created
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "UI Debug";
        Text = "📦 AnimationGui added to CoreGui!";
        Duration = 5;
    })
end)

-- "Open Menu" button
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
panel.Size = UDim2.new(0, 220, 0, 150)
panel.Position = UDim2.new(0.5, -110, 0.5, -75)
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

-- "Play Animation" button
local animButton = Instance.new("TextButton")
animButton.Size = UDim2.new(0, 200, 0, 50)
animButton.Position = UDim2.new(0.5, -100, 0.5, -25)
animButton.Text = "Play Animation"
animButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
animButton.TextColor3 = Color3.fromRGB(255, 255, 255)
animButton.ZIndex = 10
animButton.Parent = panel

-- Button logic
openButton.MouseButton1Click:Connect(function()
	panel.Visible = true
	openButton.Visible = false
end)

closeButton.MouseButton1Click:Connect(function()
	panel.Visible = false
	openButton.Visible = true
end)

animButton.MouseButton1Click:Connect(function()
	event:FireServer()

	-- Debug confirm
	pcall(function()
	    game.StarterGui:SetCore("SendNotification", {
	        Title = "Button Clicked";
	        Text = "🎵 Play Animation fired!";
	        Duration = 3;
	    })
	end)
end)
