pcall(function()

local plr = game:GetService("Players").LocalPlayer

--------------------------------------------------
-- GUI
--------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Parent = plr:WaitForChild("PlayerGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

--------------------------------------------------
-- LOADING SCREEN
--------------------------------------------------

local bg = Instance.new("Frame")
bg.Parent = gui
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.new(0,0,0)

local title = Instance.new("TextLabel")
title.Parent = bg
title.Size = UDim2.new(1,0,0,100)
title.Position = UDim2.new(0,0,0.32,0)
title.BackgroundTransparency = 1
title.Text = "GẤU HUB | BY Vũ Thành Đạt"
title.TextScaled = true
title.Font = Enum.Font.FredokaOne
title.TextColor3 = Color3.new(1,1,1)
title.TextTransparency = 1

local loadingbg = Instance.new("Frame")
loadingbg.Parent = bg
loadingbg.Size = UDim2.new(0.6,0,0,8)
loadingbg.Position = UDim2.new(0.2,0,0.6,0)
loadingbg.BackgroundColor3 = Color3.fromRGB(40,40,40)

local loading = Instance.new("Frame")
loading.Parent = loadingbg
loading.Size = UDim2.new(0,0,1,0)
loading.BackgroundColor3 = Color3.fromRGB(0,170,255)

for i = 1,0,-0.05 do
	title.TextTransparency = i
	task.wait(0.03)
end

for i = 0,1,0.01 do
	loading.Size = UDim2.new(i,0,1,0)
	task.wait(0.01)
end

task.wait(0.5)
bg:Destroy()

--------------------------------------------------
-- BUBBLE BUTTON
--------------------------------------------------

local bubble = Instance.new("ImageButton")
bubble.Parent = gui
bubble.Size = UDim2.new(0,60,0,60)
bubble.Position = UDim2.new(0,20,0.5,-30)
bubble.BackgroundColor3 = Color3.fromRGB(255,255,255)
bubble.Image = "https://i.postimg.cc/0NkSQL6W/file-000000007ac4720792891ff2430d66fb.png"
bubble.Active = true

Instance.new("UICorner", bubble).CornerRadius = UDim.new(1,0)

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

Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

local hubtitle = Instance.new("TextLabel")
hubtitle.Parent = main
hubtitle.Size = UDim2.new(1,0,0,50)
hubtitle.BackgroundColor3 = Color3.fromRGB(0,170,255)
hubtitle.Text = "GẤU HUB"
hubtitle.TextScaled = true
hubtitle.Font = Enum.Font.FredokaOne
hubtitle.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", hubtitle).CornerRadius = UDim.new(0,12)

--------------------------------------------------
-- TOGGLE
--------------------------------------------------

local open = true

bubble.MouseButton1Click:Connect(function()
	open = not open
	main.Visible = open
end)

--------------------------------------------------
-- TELEPORT DATA (FIXED)
--------------------------------------------------

local islands = {
	["Starter Island"] = Vector3.new(0,50,0),
	["Jungle"] = Vector3.new(-1200,20,500),
	["Pirate Village"] = Vector3.new(-3500,20,1500),
}

--------------------------------------------------
-- BUTTONS
--------------------------------------------------

local y = 60

for name,pos in pairs(islands) do
	local btn = Instance.new("TextButton")
	btn.Parent = main
	btn.Size = UDim2.new(1,-20,0,40)
	btn.Position = UDim2.new(0,10,0,y)
	btn.Text = "🚀 "..name
	btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
	btn.TextColor3 = Color3.new(1,1,1)

	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

	btn.MouseButton1Click:Connect(function()
		local char = plr.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0,5,0))
		end
	end)

	y += 45
end

end)