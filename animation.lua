-- Animation Panel Script with Debug Print
print("✅ Animation UI script has loaded!")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage:WaitForChild("PlayAnimationEvent")

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "AnimationGui"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- "Open Menu" button
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 120, 0, 50)
openButton.Position = UDim2.new(0, 20, 0.8, 0)
openButton.Text = "Open Menu"
openButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.Parent = gui

-- Panel
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 220, 0, 150)
panel.Position = UDim2.new(0.5, -110, 0.5, -75)
panel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
panel.Visible = false
panel.Parent = gui

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 80, 0, 40)
closeButton.Position = UDim2.new(1, -90, 0, 10)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = panel

-- "Play Animation" button
local animButton = Instance.new("TextButton")
animButton.Size = UDim2.new(0, 200, 0, 50)
animButton.Position = UDim2.new(0.5, -100, 0.5, -25)
animButton.Text = "Play Animation"
animButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
animButton.TextColor3 = Color3.fromRGB(255, 255, 255)
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
end)
