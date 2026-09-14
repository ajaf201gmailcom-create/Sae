local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local G = {
	BG = Color3.fromRGB(14, 15, 25),
	BG2 = Color3.fromRGB(20, 22, 36),
	BG3 = Color3.fromRGB(28, 30, 50),
	SEP = Color3.fromRGB(42, 45, 70),
	TEXT = Color3.fromRGB(198, 198, 215),
	MUTED = Color3.fromRGB(92, 95, 122),
	WHITE = Color3.fromRGB(228, 228, 240),
	ACCENT = Color3.fromRGB(80, 135, 218),
	GREEN = Color3.fromRGB(58, 208, 92),
	RED = Color3.fromRGB(228, 62, 62)
}

local DISCORD_LINK = "https://discord.gg/HnYTWpKpV"

local function corner(p, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 6)
	c.Parent = p
	return c
end

local function stroke(p, col, t)
	local s = Instance.new("UIStroke")
	s.Color = col or G.SEP
	s.Thickness = t or 1
	s.Parent = p
	return s
end

local oldGui = PlayerGui:FindFirstChild("UpdateRequired")
if oldGui then
	oldGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UpdateRequired"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "Main"
Frame.Size = UDim2.new(0, 320, 0, 185)
Frame.Position = UDim2.new(0.5, -160, 0.5, -92)
Frame.BackgroundColor3 = G.BG
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui
corner(Frame, 8)
stroke(Frame, G.SEP, 1)

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = G.BG2
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Frame
corner(TitleBar, 8)

local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size = UDim2.new(1, -45, 1, 0)
TitleLbl.Position = UDim2.new(0, 12, 0, 0)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Text = "Vincitore"
TitleLbl.TextColor3 = G.WHITE
TitleLbl.TextSize = 11
TitleLbl.Font = Enum.Font.GothamBold
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 20)
CloseBtn.Position = UDim2.new(1, -28, 0.5, -10)
CloseBtn.BackgroundColor3 = G.BG3
CloseBtn.Text = "X"
CloseBtn.TextColor3 = G.MUTED
CloseBtn.TextSize = 10
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = TitleBar
corner(CloseBtn, 4)

local Sep = Instance.new("Frame")
Sep.Size = UDim2.new(1, -16, 0, 1)
Sep.Position = UDim2.new(0, 8, 0, 30)
Sep.BackgroundColor3 = G.SEP
Sep.BorderSizePixel = 0
Sep.Parent = Frame

local StatusLbl = Instance.new("TextLabel")
StatusLbl.Size = UDim2.new(1, -20, 0, 20)
StatusLbl.Position = UDim2.new(0, 10, 0, 42)
StatusLbl.BackgroundTransparency = 1
StatusLbl.Text = "SCRIPT OUTDATED"
StatusLbl.TextColor3 = G.RED
StatusLbl.TextSize = 12
StatusLbl.Font = Enum.Font.GothamBold
StatusLbl.TextXAlignment = Enum.TextXAlignment.Left
StatusLbl.Parent = Frame

local MsgLbl = Instance.new("TextLabel")
MsgLbl.Size = UDim2.new(1, -20, 0, 42)
MsgLbl.Position = UDim2.new(0, 10, 0, 65)
MsgLbl.BackgroundTransparency = 1
MsgLbl.Text = "This script is outdated.\nJoin our Discord server to get the updated script."
MsgLbl.TextColor3 = G.TEXT
MsgLbl.TextSize = 11
MsgLbl.Font = Enum.Font.Gotham
MsgLbl.TextWrapped = true
MsgLbl.TextYAlignment = Enum.TextYAlignment.Top
MsgLbl.TextXAlignment = Enum.TextXAlignment.Left
MsgLbl.Parent = Frame

local DiscordBox = Instance.new("TextBox")
DiscordBox.Size = UDim2.new(1, -100, 0, 28)
DiscordBox.Position = UDim2.new(0, 10, 0, 112)
DiscordBox.BackgroundColor3 = G.BG3
DiscordBox.Text = DISCORD_LINK
DiscordBox.TextColor3 = G.TEXT
DiscordBox.TextSize = 10
DiscordBox.Font = Enum.Font.Gotham
DiscordBox.TextXAlignment = Enum.TextXAlignment.Left
DiscordBox.ClearTextOnFocus = false
DiscordBox.TextEditable = true
DiscordBox.MultiLine = false
DiscordBox.BorderSizePixel = 0
DiscordBox.Parent = Frame
corner(DiscordBox, 5)
stroke(DiscordBox, G.SEP, 1)

local BoxPad = Instance.new("UIPadding")
BoxPad.PaddingLeft = UDim.new(0, 7)
BoxPad.PaddingRight = UDim.new(0, 7)
BoxPad.Parent = DiscordBox

local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0, 82, 0, 28)
CopyBtn.Position = UDim2.new(1, -92, 0, 112)
CopyBtn.BackgroundColor3 = G.ACCENT
CopyBtn.Text = "Copy Link"
CopyBtn.TextColor3 = G.WHITE
CopyBtn.TextSize = 10
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.BorderSizePixel = 0
CopyBtn.AutoButtonColor = false
CopyBtn.Parent = Frame
corner(CopyBtn, 5)

local HintLbl = Instance.new("TextLabel")
HintLbl.Size = UDim2.new(1, -20, 0, 20)
HintLbl.Position = UDim2.new(0, 10, 0, 148)
HintLbl.BackgroundTransparency = 1
HintLbl.Text = "Can't copy? Tap the link above and copy it manually."
HintLbl.TextColor3 = G.MUTED
HintLbl.TextSize = 9
HintLbl.Font = Enum.Font.Gotham
HintLbl.TextXAlignment = Enum.TextXAlignment.Center
HintLbl.Parent = Frame

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

CloseBtn.MouseEnter:Connect(function()
	CloseBtn.BackgroundColor3 = G.RED
	CloseBtn.TextColor3 = G.WHITE
end)

CloseBtn.MouseLeave:Connect(function()
	CloseBtn.BackgroundColor3 = G.BG3
	CloseBtn.TextColor3 = G.MUTED
end)

CopyBtn.MouseButton1Click:Connect(function()
	local success = false

	pcall(function()
		if typeof(setclipboard) == "function" then
			setclipboard(DISCORD_LINK)
			success = true
		elseif typeof(toclipboard) == "function" then
			toclipboard(DISCORD_LINK)
			success = true
		end
	end)

	if success then
		CopyBtn.Text = "Copied!"
		CopyBtn.BackgroundColor3 = G.GREEN

		task.delay(1.5, function()
			if CopyBtn and CopyBtn.Parent then
				CopyBtn.Text = "Copy Link"
				CopyBtn.BackgroundColor3 = G.ACCENT
			end
		end)
	else
		CopyBtn.Text = "Manual Copy"
		CopyBtn.BackgroundColor3 = G.RED
		DiscordBox.TextEditable = true
		DiscordBox:CaptureFocus()
		DiscordBox.CursorPosition = #DiscordBox.Text + 1
		DiscordBox.SelectionStart = 1

		task.delay(2, function()
			if CopyBtn and CopyBtn.Parent then
				CopyBtn.Text = "Copy Link"
				CopyBtn.BackgroundColor3 = G.ACCENT
			end
		end)
	end
end)

local dragging = false
local dragStart
local startPos

local function ipos(input)
	local p = input.Position
	return Vector2.new(p.X, p.Y)
end

TitleBar.InputBegan:Connect(function(input)
	local t = input.UserInputType

	if t ~= Enum.UserInputType.MouseButton1
		and t ~= Enum.UserInputType.Touch then
		return
	end

	local mp = UserInputService:GetMouseLocation()
	local cb = CloseBtn.AbsolutePosition
	local cs = CloseBtn.AbsoluteSize

	if mp.X >= cb.X
		and mp.X <= cb.X + cs.X
		and mp.Y >= cb.Y
		and mp.Y <= cb.Y + cs.Y then
		return
	end

	dragging = true
	dragStart = ipos(input)
	startPos = Frame.Position
end)

UserInputService.InputEnded:Connect(function(input)
	local t = input.UserInputType

	if t == Enum.UserInputType.MouseButton1
		or t == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not dragging then
		return
	end

	local t = input.UserInputType

	if t ~= Enum.UserInputType.MouseMovement
		and t ~= Enum.UserInputType.Touch then
		return
	end

	local delta = ipos(input) - dragStart

	Frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end)
