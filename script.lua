local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

--==================== КООРДИНАТЫ 1-30 ====================
local teleports = {
	["1 Egg"]  = CFrame.new(-75.012207,15.9492474,150.990265),
	["2 Egg"]  = CFrame.new(-284.552124,13.8830843,-180.348587),
	["3 Egg"]  = CFrame.new(-29.1067772,16.3646755,2.96363091),
	["4 Egg"]  = CFrame.new(-291.417297,13.7686071,-89.9730377),
	["5 Egg"]  = CFrame.new(-157.77002,13.4665861,-191.458801),
	["6 Egg"]  = CFrame.new(-112.494759,13.1334686,-236.658783),
	["7 Egg"]  = CFrame.new(-80.4320526,7.12250662,-99.4361725),
	["8 Egg"]  = CFrame.new(-129.043594,13.7600956,-119.449303),
	["9 Egg"]  = CFrame.new(-185.697983,10.3148518,47.7876205),
	["10 Egg"] = CFrame.new(-91.5854874,18.8235111,-270.460358),
	["11 Egg"] = CFrame.new(-33.9491234,12.6063347,-122.17823),
	["12 Egg"] = CFrame.new(-149.721481,12.1002598,-6.78095388),
	["13 Egg"] = CFrame.new(-303.290009,34.9594574,136.385681),
	["14 Egg"] = CFrame.new(-314.741302,24.1258106,38.2824402),
	["15 Egg"] = CFrame.new(-50.04776,5.07345104,70.865654),
	["16 Egg"] = CFrame.new(-245.940826,14.1699677,-58.240448),
	["17 Egg"] = CFrame.new(-182.779221,6.09910965,182.863663),
	["18 Egg"] = CFrame.new(-284.851044,24.3340054,237.315109),
	["19 Egg"] = CFrame.new(-75.0129929,6.03244448,37.6249275),
	["20 Egg"] = CFrame.new(-254.159897,13.0520296,-87.8735428),
	["21 Egg"] = CFrame.new(-69.4311447,19.264576,-20.4741592),
	["22 Egg"] = CFrame.new(-128.571472,18.5828285,181.587952),
	["23 Egg"] = CFrame.new(-206.729431,24.3340054,237.435165),
	["24 Egg"] = CFrame.new(-103.76194,16.2671394,92.120079),
	["25 Egg"] = CFrame.new(4.1473031,16.2947159,-9.9165802),
	["26 Egg"] = CFrame.new(-235.466995,14.1760502,32.629528),
	["27 Egg"] = CFrame.new(-165.766449,13.6370153,-82.1597519),
	["28 Egg"] = CFrame.new(8.17471695,6.04337215,51.1403389),
	["29 Egg"] = CFrame.new(-75.012207,15.9492474,150.990265),
	["30 Egg"] = CFrame.new(47.5715027,15.985817,-49.0982628),
}

--==================== GUI ====================
local gui = Instance.new("ScreenGui")
gui.Name = "EggMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Кнопка открытия
local openBtn = Instance.new("TextButton")
openBtn.Parent = gui
openBtn.Size = UDim2.new(0,60,0,60)
openBtn.Position = UDim2.new(0,15,0.5,-30)
openBtn.Text = "🥚"
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBold
openBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
openBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1,0)

-- Главное окно
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,340,0,500)
frame.Position = UDim2.new(0.5,-170,0.5,-250)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Visible = false
frame.Active = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(0,255,120)
stroke.Thickness = 2

-- Верх
local top = Instance.new("Frame")
top.Parent = frame
top.Size = UDim2.new(1,0,0,45)
top.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", top).CornerRadius = UDim.new(0,18)

local title = Instance.new("TextLabel")
title.Parent = top
title.Size = UDim2.new(1,-90,1,0)
title.Position = UDim2.new(0,10,0,0)
title.BackgroundTransparency = 1
title.Text = "🥚 Egg Menu"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)

-- Свернуть
local miniBtn = Instance.new("TextButton")
miniBtn.Parent = top
miniBtn.Size = UDim2.new(0,35,0,35)
miniBtn.Position = UDim2.new(1,-80,0,5)
miniBtn.Text = "-"
miniBtn.TextScaled = true
miniBtn.Font = Enum.Font.GothamBold
miniBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
miniBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", miniBtn)

-- Закрыть
local closeBtn = Instance.new("TextButton")
closeBtn.Parent = top
closeBtn.Size = UDim2.new(0,35,0,35)
closeBtn.Position = UDim2.new(1,-40,0,5)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BackgroundColor3 = Color3.fromRGB(255,70,70)
closeBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", closeBtn)

-- Скролл
local scroll = Instance.new("ScrollingFrame")
scroll.Parent = frame
scroll.Position = UDim2.new(0,10,0,55)
scroll.Size = UDim2.new(1,-20,1,-65)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0,0,0,0)

local grid = Instance.new("UIGridLayout")
grid.Parent = scroll
grid.CellSize = UDim2.new(0,150,0,45)
grid.CellPadding = UDim2.new(0,8,0,8)
grid.SortOrder = Enum.SortOrder.LayoutOrder

grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0,0,0,grid.AbsoluteContentSize.Y + 10)
end)

--==================== TP ====================
local function tp(cf)
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")
	hrp.CFrame = cf
end

-- Кнопки по порядку 1-30
for i = 1, 30 do
	local name = i .. " Egg"

	local btn = Instance.new("TextButton")
	btn.Parent = scroll
	btn.Text = name
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBold
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)

	btn.MouseButton1Click:Connect(function()
		tp(teleports[name])
	end)
end

--==================== КНОПКИ ====================
openBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	openBtn.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
	openBtn.Visible = true
end)

local minimized = false
miniBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	scroll.Visible = not minimized

	if minimized then
		frame.Size = UDim2.new(0,340,0,45)
	else
		frame.Size = UDim2.new(0,340,0,500)
	end
end)

--==================== ПЕРЕТАСКИВАНИЕ ====================
local dragging = false
local dragInput, startPos, startFramePos

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or
	   input.UserInputType == Enum.UserInputType.MouseButton1 then

		dragging = true
		startPos = input.Position
		startFramePos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

top.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or
	   input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - startPos

		frame.Position = UDim2.new(
			startFramePos.X.Scale,
			startFramePos.X.Offset + delta.X,
			startFramePos.Y.Scale,
			startFramePos.Y.Offset + delta.Y
		)
	end
end)

print("✅ Egg Menu 1-30 loaded")