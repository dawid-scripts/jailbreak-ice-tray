-- This was also NOT made by me. I only fixed sliders fixed few stuff at togglres made it rainbow and added TextBox
-- If owner of the lib sees this and wants credits. please dm me: alex9#9999

for i,v in next, game:GetService("CoreGui"):GetDescendants() do
	if v:IsA("IntValue") and v.Name == "ice_tray" then
		v.Parent:Destroy()
	end
end

local Heartbeat = game:GetService("RunService").Heartbeat;
local UIS = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");

local saveColor;

spawn(function()
	while true do
		for i = 0, 100 do
			saveColor = Color3.fromHSV(i / 100, 0.75, 0.75)
			wait(0.1)
		end
	end
end)

local library = {}
library.WindowCount = 0
local UIS = game:GetService("UserInputService");
local Heartbeat = game:GetService("RunService").Heartbeat;

local dragger = {};
do
	local mouse = game:GetService("Players").LocalPlayer:GetMouse();
	local inputService = game:GetService('UserInputService');
	local heartbeat = game:GetService("RunService").Heartbeat;
    -- // credits to Ririchi / Inori for this cute drag function :)
	function dragger.new(frame, bar)
		frame.Active = true;
		bar.Active = true;
		bar.MouseLeave:connect(function()
			IsInFrame = false;
		end)
		bar.MouseEnter:connect(function()
			IsInFrame = true;
		end)
		local input = bar.InputBegan:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 and IsInFrame then
				local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
				while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					pcall(function()
						frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Linear', 0.01, true);
					end)
				end
			end
		end)
	end
end

library.gui = Instance.new("ScreenGui")
library.gui.Parent = game:WaitForChild('CoreGui')
library.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
library.gui.Name = game:GetService("HttpService"):GenerateGUID(false):lower():sub(1, 10);
library.toggled = true

game:GetService('UserInputService').InputBegan:connect(function(key, gpe)
	if key.KeyCode == Enum.KeyCode.RightShift and library.gui then
		library.toggled = not library.toggled;
		library.gui.Enabled = library.toggled;
		shared.Cursor.Visible = library.toggled;
	end
end)

function library:CreateWindow(name, size)
	size = size or 0
	library.flags = {};
	local main = Instance.new("ImageLabel")
	local bar = Instance.new("ImageLabel")
	local title = Instance.new("TextLabel")
	local UIListLayout = Instance.new("UIListLayout")
	main.Name = "main"
	main.Parent = library.gui
	main.BackgroundColor3 = Color3.new(1, 1, 1)
	main.BackgroundTransparency = 1
	main.BorderSizePixel = 0
	main.Position = UDim2.new(0, 30 + (190 * self.WindowCount), 0, (main.Size.Y.Offset / 2) + 33)
	main.Size = UDim2.new(0, 60, 0, 60)--333
	main.Image = "rbxassetid://4550094458"
	main.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
	main.ScaleType = Enum.ScaleType.Slice
	main.SliceCenter = Rect.new(4, 4, 296, 296)
	bar.Name = "bar"
	bar.Parent = main
	bar.BackgroundColor3 = Color3.new(1, 0.27451, 0.286275)
	bar.BackgroundTransparency = 1
	bar.BorderSizePixel = 0
	bar.Position = UDim2.new(0, 0, 0, -2)
	bar.Size = UDim2.new(0, 170, 0, 32)
	bar.Image = "rbxassetid://4550094255"
	bar.ImageColor3 = Color3.fromRGB(45, 45, 45)--Color3.fromHSV(i/100,0.75,0.75) --Color3.fromRGB(45, 45, 45)
	bar.ScaleType = Enum.ScaleType.Slice
	bar.SliceCenter = Rect.new(4, 4, 296, 296)
	dragger.new(main, bar)
	title.Name = "title"
	title.Parent = bar
	title.BackgroundColor3 = Color3.new(1, 1, 1)
	title.BackgroundTransparency = 1
	title.BorderSizePixel = 0
	title.Size = UDim2.new(1, 0, 1, 0)
	title.Font = Enum.Font.GothamSemibold
	title.Text = name
	title.TextColor3 = Color3.fromRGB(191, 255, 0)
	title.TextSize = 16
	spawn(function()
		while true do
			if not title then
				return
			end
			for i = 0, 100 do
				title.TextColor3 = Color3.fromHSV(i / 100, 0.75, 0.75)
				wait(0.1)
			end
		end
	end)
	UIListLayout.Parent = main
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.HorizontalAlignment = "Center";
	UIListLayout.Padding = UDim.new(0, 5);
	local mainLib = {}
	mainLib.Count = self.WindowCount
	mainLib.Container = main
	self.WindowCount = self.WindowCount + 1
	function mainLib:Resize()
		local count = 0
		for i, v in next, main:GetChildren() do
			if not v:IsA('UIListLayout') then
				count = count + 1
			end
		end
		local Size = UDim2.new(0, 170, 0, UIListLayout.AbsoluteContentSize.Y + 6 )
		main.Size = Size
	end
	function mainLib:Box(name, callback)
		local callback = callback or function()
		end
		local container = Instance.new("ImageLabel")
		local button = Instance.new("ImageLabel")
		local button2 = Instance.new("TextBox")

		container.Name = "boxsection"
		container.Parent = main
		container.BackgroundColor3 = Color3.new(1, 1, 1)
		container.BackgroundTransparency = 1
		container.BorderSizePixel = 0
		container.Position = UDim2.new(0.5, -85, 0, 215)
		container.Size = UDim2.new(0, 160, 0, 35)
		container.Image = "http://www.roblox.com/asset/?id=4550094458"
		container.ImageColor3 = Color3.new(0.156863, 0.156863, 0.156863)
		container.ScaleType = Enum.ScaleType.Slice
		container.SliceCenter = Rect.new(4, 4, 296, 296)

		button.Name = "button"
		button.Parent = container
		button.BackgroundColor3 = Color3.new(1, 1, 1)
		button.BackgroundTransparency = 1
		button.BorderSizePixel = 0
		button.Position = UDim2.new(0.5, -73, 0.5, -12)
		button.Size = UDim2.new(0.917647064, 0, 0.685714304, 0)
		button.Image = "rbxassetid://4641155515"
		button.ImageTransparency = 1
		button.ScaleType = Enum.ScaleType.Slice
		button.SliceCenter = Rect.new(4, 4, 296, 296)

		button2.Name = "button"
		button2.Parent = button
		button2.BackgroundColor3 = Color3.new(1, 1, 1)
		button2.BackgroundTransparency = 1
		button2.BorderSizePixel = 0
		button2.Size = UDim2.new(1, 0, 1, 0)
		button2.Font = Enum.Font.Gotham
		button2.TextColor3 = Color3.new(1, 1, 1)
		button2.ClipsDescendants = true
		button2.TextSize = 14
		button2.Text = name
		if string.len(button2.Text) >= 25 then
			button2.TextScaled = true
		end
		spawn(function()
			while wait() do
				button2.TextColor3 = saveColor
			end
		end)
		button2.FocusLost:connect(function(a)
			if a then
				if #button2.Text > 0 then
					pcall(callback, button2.Text)
				end
			end
		end)
		self:Resize()
	end
	function mainLib:Button(name, callback)
		local callback = callback or function()
		end
		local container = Instance.new("ImageLabel")
		local button = Instance.new("ImageLabel")
		local button2 = Instance.new("TextButton")

		container.Name = "buttonsection"
		container.Parent = main
		container.BackgroundColor3 = Color3.new(1, 1, 1)
		container.BackgroundTransparency = 1
		container.BorderSizePixel = 0
		container.Position = UDim2.new(0.5, -85, 0, 215)
		container.Size = UDim2.new(0, 160, 0, 35)
		container.Image = "http://www.roblox.com/asset/?id=4550094458"
		container.ImageColor3 = Color3.new(0.156863, 0.156863, 0.156863)
		container.ScaleType = Enum.ScaleType.Slice
		container.SliceCenter = Rect.new(4, 4, 296, 296)

		button.Name = "button"
		button.Parent = container
		button.BackgroundColor3 = Color3.new(1, 1, 1)
		button.BackgroundTransparency = 1
		button.BorderSizePixel = 0
		button.Position = UDim2.new(0.5, -74, 0.5, -12)
		button.Size = UDim2.new(0.917647064, 0, 0.685714304, 0)
		button.Image = "rbxassetid://4641155515"
		button.ImageTransparency = 1
		button.ScaleType = Enum.ScaleType.Slice
		button.SliceCenter = Rect.new(4, 4, 296, 296)

		button2.Name = "button"
		button2.Parent = button
		button2.BackgroundColor3 = Color3.new(1, 1, 1)
		button2.BackgroundTransparency = 1
		button2.BorderSizePixel = 0
		button2.Size = UDim2.new(1, 0, 1, 0)
		button2.Font = Enum.Font.Gotham
		button2.TextColor3 = Color3.new(1, 1, 1)
		button2.ClipsDescendants = true
		button2.TextSize = 14
		button2.Text = name
		if string.len(button2.Text) >= 25 then
			button2.TextScaled = true
		end
		button2.MouseButton1Click:Connect(function()
			coroutine.resume(coroutine.create(function()
				for i = 0, 1, 0.1 do
					button2.TextColor3 = button2.TextColor3:lerp(saveColor, i)
					wait(0.01)				
				end
				wait()
				for i = 0, 1, 0.1 do
					button2.TextColor3 = button2.TextColor3:lerp(Color3.new(1, 1, 1), i)
					wait(0.01)
				end
			end))
		end)
		button2.MouseButton1Click:Connect(callback)
		self:Resize()
	end
	function mainLib:Toggle(name, callback)
		local callback = callback or function()
		end
		local button = Instance.new('TextButton')
		local section = Instance.new('ImageLabel')
		section.Name = "section"
		section.Parent = main
		section.BackgroundColor3 = Color3.new(1, 1, 1)
		section.BackgroundTransparency = 1
		section.BorderSizePixel = 0
		section.Position = UDim2.new(0.5, -85, 0, 98)
		section.Size = UDim2.new(0, 160, 0, 35)
		section.Image = "http://www.roblox.com/asset/?id=4550094458"
		section.ImageColor3 = Color3.fromRGB(40, 40, 40)
		section.ScaleType = Enum.ScaleType.Slice
		section.SliceCenter = Rect.new(4, 4, 296, 296)
		button.Name = "title"
		button.Parent = section
		button.BackgroundColor3 = Color3.new(1, 1, 1)
		button.BackgroundTransparency = 1
		button.BorderSizePixel = 0
		button.Position = UDim2.new(0, 0, 0, 0)
		button.Size = UDim2.new(1, 0, 1, 0)
		button.Font = Enum.Font.Gotham
		button.Text = name
		button.TextColor3 = Color3.new(1, 1, 1)
		button.TextSize = 14
		button.TextXAlignment = Enum.TextXAlignment.Center
		button.Modal = true
		local toggle = false

		button.MouseButton1Click:connect(function()
			if toggle then
				toggle = false
				coroutine.resume(coroutine.create(function()
					local newColor = Color3.new(1, 1, 1)
					for i = 0, 1, 0.2 do
						button.TextColor3 = button.TextColor3:lerp(newColor, i)
						wait(0.01)
					end
				end))
			else
				toggle = true
				coroutine.resume(coroutine.create(function()
					spawn(function()
						while true do
							if toggle == false then
								return
							end
							button.TextColor3 = saveColor
							wait(0.01)
						end
					end)
				end))
			end
			callback(toggle)
		end)
		self:Resize()
	end
	function mainLib:Slider(name, settings, callback)
		local callback = callback or function()
		end
		assert(settings.min and settings.max, "You need to put a min value and a max value and a default value!");

		local slidersection = Instance.new("ImageLabel")
		local slidername = Instance.new("TextLabel")
		local slider = Instance.new("TextButton")
		local line = Instance.new("ImageLabel")
		local fill = Instance.new("ImageLabel")
		local Frame = Instance.new("ImageLabel")
		local label = Instance.new("TextLabel")

		slidersection.Name = "slidersection"
		slidersection.Parent = main
		slidersection.BackgroundColor3 = Color3.new(1, 1, 1)
		slidersection.BackgroundTransparency = 1
		slidersection.BorderSizePixel = 0
		slidersection.Position = UDim2.new(0.5, -85, 0, 34)
		slidersection.Size = UDim2.new(0, 160, 0, 60)
		slidersection.Image = "http://www.roblox.com/asset/?id=4550094458"
		slidersection.ImageColor3 = Color3.new(0.156863, 0.156863, 0.156863)
		slidersection.ScaleType = Enum.ScaleType.Slice
		slidersection.SliceCenter = Rect.new(4, 4, 296, 296)

		slidername.Name = "slidername"
		slidername.Parent = slidersection
		slidername.BackgroundColor3 = Color3.new(1, 1, 1)
		slidername.BackgroundTransparency = 1
		slidername.BorderSizePixel = 0
		slidername.Position = UDim2.new(0.311764717, -43, 0, 0)
		slidername.Size = UDim2.new(0.470588237, 0, 0.646666706, 0)
		slidername.Font = Enum.Font.Gotham
		slidername.Text = name
		spawn(function()
			while true do
				slidername.TextColor3 = saveColor
				wait(0.01)
			end
		end)
		slidername.TextSize = 14
		slidername.TextXAlignment = Enum.TextXAlignment.Left

		slider.Name = "slider"
		slider.Parent = slidersection
		slider.BackgroundColor3 = Color3.new(1, 1, 1)
		slider.BackgroundTransparency = 1
		slider.BorderSizePixel = 0
		slider.Size = UDim2.new(1, 0, 1, 0)
		slider.Font = Enum.Font.SourceSans
		slider.Text = ""
		slider.TextColor3 = Color3.new(0, 0, 0)
		slider.TextSize = 14

		line.Name = "line"
		line.Parent = slider
		line.BackgroundColor3 = Color3.new(1, 1, 1)
		line.BackgroundTransparency = 1
		line.BorderSizePixel = 0
		line.Position = UDim2.new(0.50, -75, 0.680000007, -2)
		line.Size = UDim2.new(0.882352948, 0, 0.0500000007, 0)
		line.Image = "rbxassetid://4550094458"
		line.ImageTransparency = 0
		line.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
		line.ScaleType = Enum.ScaleType.Slice
		line.SliceCenter = Rect.new(4, 4, 296, 296)

		Frame.Name = "Frame"
		Frame.Parent = line
		Frame.BackgroundColor3 = Color3.new(1, 1, 1)
		Frame.BackgroundTransparency = 1
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0, 0, 0.5, -7)
		Frame.Size = UDim2.new(0.0199999996, 0, 4.66666651, 0)
		Frame.Image = "rbxassetid://4550094458"
		Frame.ImageColor3 = Color3.fromRGB(191, 255, 0)
		Frame.ScaleType = Enum.ScaleType.Slice
		Frame.SliceCenter = Rect.new(4, 4, 296, 296)

		spawn(function()
			while true do
				Frame.ImageColor3 = saveColor
				wait(0.01)
			end
		end)

		label.Name = "label"
		label.Parent = slidersection
		label.BackgroundColor3 = Color3.new(1, 1, 1)
		label.BackgroundTransparency = 1
		label.BorderSizePixel = 0
		label.Position = UDim2.new(0.9841179, -43, 0, 0)
		label.Size = UDim2.new(0.223529384, 0, 0.646666706, 0)
		label.Font = Enum.Font.Gotham
		label.Text = settings.min
		label.TextColor3 = Color3.new(1, 1, 1)
		label.TextSize = 14
		label.TextTransparency = 0

		local Player = game:GetService("Players").LocalPlayer;
		local UIS = game:GetService("UserInputService");
		local RuS = game:GetService("RunService");

		local held = false
		local step = 1
		local percentage = 0

		UIS.InputEnded:connect(function(input, processed)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				held = false;
			end
		end)
		slider.MouseButton1Down:connect(function()
			held = true;
		end)
		RuS.RenderStepped:connect(function(delta)
			if held then
				-- fixed
				local mouuuus = function()
					return Vector2.new(UIS:GetMouseLocation().X + 1, UIS:GetMouseLocation().Y - 35)
				end
				local BtnPos = Frame.Position;
				local SliderSize = slider.AbsoluteSize.X;
				local SliderPos = slider.AbsolutePosition.X;
				local x = (SliderSize - (SliderSize - ((mouuuus().X - SliderPos)) + 1)) / SliderSize
				local min = 0
				local max = 1
				local size = min
				if x >= min and x <= max then
					size = x
				elseif x < min then
					size = min
				elseif x > max then
					size = max
				end
				local checkpos = math.floor((size or min) * 100)
				local minv = settings.min
				local maxv = settings.max
				local diff = maxv - minv
				percentage = math.floor(((diff / 100) * checkpos) + minv)
				Frame.Position = UDim2.new(size, 0, BtnPos.Y.Scale, BtnPos.Y.Offset)
				label.Text = tostring(percentage)
				callback(tonumber(label.Text))
			end;
		end);
		self:Resize()
	end
	local Detect = Instance.new('IntValue', main)
	Detect.Name = 'ice_tray'
	return mainLib
end
--nig
return library
