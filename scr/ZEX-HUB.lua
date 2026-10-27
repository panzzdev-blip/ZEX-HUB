--[[
    ZEX HUB | Neo Green Edition
    Version: 1.0
    UI Prototype + Local Visual Settings
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Prevent duplicate UI
if PlayerGui:FindFirstChild("ZEX_HUB") then
    PlayerGui.ZEX_HUB:Destroy()
end

local Theme = {
    Background = Color3.fromRGB(10, 12, 12),
    Panel = Color3.fromRGB(18, 22, 22),
    Green = Color3.fromRGB(0, 255, 120),
    White = Color3.fromRGB(235, 245, 240),
    Gray = Color3.fromRGB(125, 140, 135),
    Red = Color3.fromRGB(255, 75, 75)
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZEX_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = PlayerGui

local function AddCorner(object, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 10)
    corner.Parent = object
    return corner
end

local function AddStroke(object, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Theme.Green
    stroke.Thickness = thickness or 1
    stroke.Transparency = 0.15
    stroke.Parent = object
    return stroke
end

local function Animate(object, properties, duration)
    local tween = TweenService:Create(
        object,
        TweenInfo.new(
            duration or 0.2,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        properties
    )
    tween:Play()
    return tween
end

-- Floating logo
local Logo = Instance.new("TextButton")
Logo.Name = "FloatingLogo"
Logo.Size = UDim2.fromOffset(58, 58)
Logo.Position = UDim2.new(0, 18, 0.45, 0)
Logo.BackgroundColor3 = Theme.Background
Logo.Text = "ZEX"
Logo.TextColor3 = Theme.Green
Logo.TextSize = 19
Logo.Font = Enum.Font.GothamBlack
Logo.AutoButtonColor = false
Logo.Parent = ScreenGui

AddCorner(Logo, 18)
AddStroke(Logo, Theme.Green, 2)

-- Main panel
local Main = Instance.new("Frame")
Main.Name = "MainPanel"
Main.Size = UDim2.fromOffset(330, 370)
Main.Position = UDim2.new(0.5, -165, 0.5, -185)
Main.BackgroundColor3 = Theme.Background
Main.Visible = false
Main.ClipsDescendants = true
Main.Parent = ScreenGui

AddCorner(Main, 14)
AddStroke(Main, Theme.Green, 1.5)

local SizeConstraint = Instance.new("UISizeConstraint")
SizeConstraint.MaxSize = Vector2.new(380, 450)
SizeConstraint.MinSize = Vector2.new(270, 320)
SizeConstraint.Parent = Main

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 58)
Header.BackgroundColor3 = Theme.Panel
Header.Parent = Main

AddCorner(Header, 14)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -65, 0, 28)
Title.Position = UDim2.fromOffset(15, 5)
Title.BackgroundTransparency = 1
Title.Text = "ZEX HUB"
Title.TextColor3 = Theme.Green
Title.TextSize = 21
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -65, 0, 17)
Subtitle.Position = UDim2.fromOffset(16, 32)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "NEO GREEN  •  v1.0"
Subtitle.TextColor3 = Theme.Gray
Subtitle.TextSize = 10
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(34, 34)
Close.Position = UDim2.new(1, -44, 0, 12)
Close.BackgroundColor3 = Color3.fromRGB(40, 25, 25)
Close.Text = "×"
Close.TextColor3 = Theme.Red
Close.TextSize = 25
Close.Font = Enum.Font.GothamBold
Close.Parent = Header

AddCorner(Close, 9)

-- Status
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -24, 0, 27)
Status.Position = UDim2.fromOffset(12, 67)
Status.BackgroundColor3 = Theme.Panel
Status.Text = "●  ZEX HUB READY"
Status.TextColor3 = Theme.Green
Status.TextSize = 11
Status.Font = Enum.Font.GothamBold
Status.Parent = Main

AddCorner(Status, 7)

local function SetStatus(message, color)
    Status.Text = "●  " .. message
    Status.TextColor3 = color or Theme.Green
end

-- Content
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -24, 1, -112)
Content.Position = UDim2.fromOffset(12, 102)
Content.BackgroundTransparency = 1
Content.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 8)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Content

local function CreateButton(text, description, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 55)
    Button.BackgroundColor3 = Theme.Panel
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = Content

    AddCorner(Button, 9)

    local Stroke = AddStroke(
        Button,
        Color3.fromRGB(45, 60, 53),
        1
    )

    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(1, -20, 0, 23)
    Name.Position = UDim2.fromOffset(12, 5)
    Name.BackgroundTransparency = 1
    Name.Text = text
    Name.TextColor3 = Theme.White
    Name.TextSize = 13
    Name.Font = Enum.Font.GothamBold
    Name.TextXAlignment = Enum.TextXAlignment.Left
    Name.Parent = Button

    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -20, 0, 18)
    Desc.Position = UDim2.fromOffset(12, 29)
    Desc.BackgroundTransparency = 1
    Desc.Text = description
    Desc.TextColor3 = Theme.Gray
    Desc.TextSize = 10
    Desc.Font = Enum.Font.Gotham
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Button

    Button.Activated:Connect(function()
        Animate(Button, {
            BackgroundColor3 = Color3.fromRGB(25, 40, 32)
        }, 0.1)

        Animate(Stroke, {
            Color = Theme.Green
        }, 0.1)

        callback()

        task.delay(0.15, function()
            if Button.Parent then
                Animate(Button, {
                    BackgroundColor3 = Theme.Panel
                }, 0.2)

                Animate(Stroke, {
                    Color = Color3.fromRGB(45, 60, 53)
                }, 0.2)
            end
        end)
    end)

    return Button
end

-- Visual toggle
local LowGraphicsEnabled = false

CreateButton(
    "LOW GRAPHICS",
    "Toggle supported local visual effects",
    function()
        LowGraphicsEnabled = not LowGraphicsEnabled

        -- This affects Lighting effects only.
        -- It does not guarantee higher FPS.
        for _, item in ipairs(Lighting:GetChildren()) do
            if item:IsA("BloomEffect")
                or item:IsA("BlurEffect")
                or item:IsA("SunRaysEffect")
                or item:IsA("ColorCorrectionEffect")
                or item:IsA("DepthOfFieldEffect") then

                item.Enabled = not LowGraphicsEnabled
            end
        end

        SetStatus(
            LowGraphicsEnabled
                and "LOCAL EFFECTS REDUCED"
                or "LOCAL EFFECTS RESTORED"
        )
    end
)

CreateButton(
    "PERFORMANCE MODE",
    "Display local optimization status",
    function()
        SetStatus(
            "USE ROBLOX GRAPHICS SETTINGS",
            Theme.Green
        )
    end
)

CreateButton(
    "VISUAL SETTINGS",
    "Open Roblox graphics settings manually",
    function()
        SetStatus(
            "SET GRAPHICS TO MANUAL",
            Theme.Green
        )
    end
)

CreateButton(
    "ABOUT ZEX",
    "Neo Green UI prototype",
    function()
        SetStatus("ZEX HUB v1.0 | UI PROTOTYPE")
    end
)

-- Open / close
local IsOpen = false

local function TogglePanel()
    IsOpen = not IsOpen

    if IsOpen then
        Main.Visible = true
        Main.Size = UDim2.fromOffset(290, 330)

        Animate(Main, {
            Size = UDim2.fromOffset(330, 370)
        }, 0.25)
    else
        Animate(Main, {
            Size = UDim2.fromOffset(290, 330)
        }, 0.15)

        task.delay(0.15, function()
            if not IsOpen then
                Main.Visible = false
            end
        end)
    end
end

Logo.Activated:Connect(TogglePanel)

Close.Activated:Connect(function()
    if IsOpen then
        TogglePanel()
    end
end)

-- Drag floating logo using mouse or touch
local dragging = false
local dragStart
local startPosition
local dragInput

Logo.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = Logo.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Logo.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart

        Logo.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

-- Intro animation
Logo.Size = UDim2.fromOffset(0, 0)

Animate(Logo, {
    Size = UDim2.fromOffset(58, 58)
}, 0.45)

print("[ZEX HUB] Neo Green UI loaded.")
