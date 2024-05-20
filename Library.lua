-- UILibrary.lua
local UILibrary = {}

-- Create a new screen GUI
function UILibrary:CreateScreenGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    return screenGui
end

-- Create a new frame
function UILibrary:CreateFrame(parent, size, position, bgColor)
    local frame = Instance.new("Frame")
    frame.Size = size or UDim2.new(0, 200, 0, 200)
    frame.Position = position or UDim2.new(0.5, -100, 0.5, -100)
    frame.BackgroundColor3 = bgColor or Color3.new(1, 1, 1)
    frame.BorderSizePixel = 0
    frame.Parent = parent
    return frame
end

-- Create a new button
function UILibrary:CreateButton(parent, size, position, text, bgColor, textColor)
    local button = Instance.new("TextButton")
    button.Size = size or UDim2.new(0, 100, 0, 50)
    button.Position = position or UDim2.new(0.5, -50, 0.5, -25)
    button.BackgroundColor3 = bgColor or Color3.new(0.3, 0.3, 0.3)
    button.Text = text or "Button"
    button.TextColor3 = textColor or Color3.new(1, 1, 1)
    button.BorderSizePixel = 0
    button.Parent = parent
    return button
end

-- Create a new text label
function UILibrary:CreateTextLabel(parent, size, position, text, textColor)
    local label = Instance.new("TextLabel")
    label.Size = size or UDim2.new(0, 100, 0, 50)
    label.Position = position or UDim2.new(0.5, -50, 0.5, -25)
    label.BackgroundTransparency = 1
    label.Text = text or "Label"
    label.TextColor3 = textColor or Color3.new(1, 1, 1)
    label.Parent = parent
    return label
end

return UILibrary
