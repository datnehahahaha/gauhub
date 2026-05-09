pcall(function()

local plr = game:GetService("Players").LocalPlayer

-- GUI chính
local gui = Instance.new("ScreenGui")
gui.Parent = plr.PlayerGui
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- Background loading
local bg = Instance.new("Frame")
bg.Parent = gui
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.new(0,0,0)

-- Title loading
local title = Instance.new("TextLabel")
title.Parent = bg
title.Size = UDim2.new(1,0,0,100)
title.Position = UDim2.new(0,0,0.32,0)
title.BackgroundTransparency = 1
title.Text = "GẤU HUB | BY Vũ Thành Đạt"
title.TextScaled = true
title.Font = Enum.Font.FredokaOne
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextTransparency = 1

-- Thanh loading nền
local loadingbg = Instance.new("Frame")
loadingbg.Parent = bg
loadingbg.Size = UDim2.new(0.6,0,0,8)
loadingbg.Position = UDim2.new(0.2,0,0.6,0)
loadingbg.BackgroundColor3 = Color3.fromRGB(40,40,40)
loadingbg.BorderSizePixel = 0

-- Thanh loading
local loading = Instance.new("Frame")
loading.Parent = loadingbg
loading.Size = UDim2.new(0,0,1,0)
loading.BackgroundColor3 = Color3.fromRGB(0,170,255)
loading.BorderSizePixel = 0

-- Hiện chữ
for i = 1,0,-0.05 do
	title.TextTransparency = i
	wait(0.03)
end

-- Loading chạy
for i = 0,1,0.01 do
	loading.Size = UDim2.new(i,0,1,0)
	wait(0.01)
end

wait(0.5)

-- Fade loading
for i = 0,1,0.05 do
	bg.BackgroundTransparency = i
	title.TextTransparency = i
	loading.BackgroundTransparency = i
	loadingbg.BackgroundTransparency = i
	wait(0.03)
end

bg:Destroy()

--------------------------------------------------
-- MAIN HUB
--------------------------------------------------

local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0,400,0,320)
main.Position = UDim2.new(0.5,-200,0.5,-160)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,12)
corner.Parent = main

-- Thanh tiêu đề
local hubtitle = Instance.new("TextLabel")
hubtitle.Parent = main
hubtitle.Size = UDim2.new(1,0,0,50)
hubtitle.BackgroundColor3 = Color3.fromRGB(0,170,255)
hubtitle.Text = "GẤU HUB | BY Vũ Thành Đạt"
hubtitle.TextScaled = true
hubtitle.Font = Enum.Font.FredokaOne
hubtitle.TextColor3 = Color3.new(1,1,1)

local topcorner = Instance.new("UICorner")
topcorner.CornerRadius = UDim.new(0,12)
topcorner.Parent = hubtitle

-- Nút test
local button = Instance.new("TextButton")
button.Parent = main
button.Size = UDim2.new(0.8,0,0,50)
button.Position = UDim2.new(0.1,0,0.25,0)
button.BackgroundColor3 = Color3.fromRGB(50,50,50)
button.Text = "BẤM VÀO ĐÂY"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.TextColor3 = Color3.new(1,1,1)

local btncorner = Instance.new("UICorner")
btncorner.CornerRadius = UDim.new(0,10)
btncorner.Parent = button

button.MouseButton1Click:Connect(function()
	print("Đã bấm nút ")
end)

--------------------------------------------------
-- TELEPORT ĐẢO
--------------------------------------------------

local islands = {
	["Starter Island"] = Vector3.new(0, 50, 0),
	["Jungle"] = Vector3.new(-1200, 20, 500),
	["Pirate Village"] = Vector3.new(-3500, 20, 1500),
	["Desert"] = Vector3.new(900, 20, 4300)
}

local islandNames = {
	"Starter Island",
	"Jungle",
	"Pirate Village",
	"Desert"
}

local currentIsland = islandNames[1]
local index = 1

-- Nút chọn đảo
local dropdown = Instance.new("TextButton")
dropdown.Parent = main
dropdown.Size = UDim2.new(0.8,0,0,45)
dropdown.Position = UDim2.new(0.1,0,0.52,0)
dropdown.BackgroundColor3 = Color3.fromRGB(45,45,45)
dropdown.Text = "Đảo: "..currentIsland
dropdown.TextScaled = true
dropdown.Font = Enum.Font.GothamBold
dropdown.TextColor3 = Color3.new(1,1,1)

local dropcorner = Instance.new("UICorner")
dropcorner.CornerRadius = UDim.new(0,10)
dropcorner.Parent = dropdown

-- Nút teleport
local teleport = Instance.new("TextButton")
teleport.Parent = main
teleport.Size = UDim2.new(0.8,0,0,45)
teleport.Position = UDim2.new(0.1,0,0.72,0)
teleport.BackgroundColor3 = Color3.fromRGB(0,170,255)
teleport.Text = "TELEPORT"
teleport.TextScaled = true
teleport.Font = Enum.Font.GothamBold
teleport.TextColor3 = Color3.new(1,1,1)

local tpCorner = Instance.new("UICorner")
tpCorner.CornerRadius = UDim.new(0,10)
tpCorner.Parent = teleport

-- Đổi đảo
dropdown.MouseButton1Click:Connect(function()

	index = index + 1

	if index > #islandNames then
		index = 1
	end

	currentIsland = islandNames[index]

	dropdown.Text = "Đảo: "..currentIsland

end)

-- Teleport
teleport.MouseButton1Click:Connect(function()

	local char = plr.Character

	if char and char:FindFirstChild("HumanoidRootPart") then

		char.HumanoidRootPart.CFrame = CFrame.new(islands[currentIsland])

	end

end)

-- Nút đóng
local close = Instance.new("TextButton")
close.Parent = main
close.Size = UDim2.new(0,35,0,35)
close.Position = UDim2.new(1,-40,0,7)
close.BackgroundColor3 = Color3.fromRGB(255,60,60)
close.Text = "X"
close.TextScaled = true
close.Font = Enum.Font.GothamBold
close.TextColor3 = Color3.new(1,1,1)

local closecorner = Instance.new("UICorner")
closecorner.CornerRadius = UDim.new(1,0)
closecorner.Parent = close

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

end)