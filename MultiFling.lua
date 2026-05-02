local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ImmortalFlingGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 340, 0, 440)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 42)
TitleBar.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "IMMORTAL'S MULTI-FLING"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Position = UDim2.new(1, -36, 0.5, -15)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 8)

-- Status
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Position = UDim2.new(0, 16, 0, 55)
StatusLabel.Size = UDim2.new(1, -32, 0, 28)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Select targets to fling"
StatusLabel.TextColor3 = Color3.fromRGB(210, 210, 210)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 16
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

-- Selection Frame
local SelectionFrame = Instance.new("Frame")
SelectionFrame.Position = UDim2.new(0, 16, 0, 88)
SelectionFrame.Size = UDim2.new(1, -32, 0, 235)
SelectionFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
SelectionFrame.BorderSizePixel = 0
SelectionFrame.Parent = MainFrame
Instance.new("UICorner", SelectionFrame).CornerRadius = UDim.new(0, 12)

local PlayerScrollFrame = Instance.new("ScrollingFrame")
PlayerScrollFrame.Position = UDim2.new(0, 8, 0, 8)
PlayerScrollFrame.Size = UDim2.new(1, -16, 1, -16)
PlayerScrollFrame.BackgroundTransparency = 1
PlayerScrollFrame.ScrollBarThickness = 6
PlayerScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70)
PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScrollFrame.Parent = SelectionFrame

-- Buttons
local StartButton = Instance.new("TextButton")
StartButton.Position = UDim2.new(0, 16, 0, 335)
StartButton.Size = UDim2.new(0.5, -22, 0, 48)
StartButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Text = "START FLING"
StartButton.TextColor3 = Color3.fromRGB(0, 0, 0)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 18
StartButton.Parent = MainFrame

local StopButton = Instance.new("TextButton")
StopButton.Position = UDim2.new(0.5, 6, 0, 335)
StopButton.Size = UDim2.new(0.5, -22, 0, 48)
StopButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
StopButton.Text = "STOP FLING"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 18
StopButton.Parent = MainFrame

local SelectAllButton = Instance.new("TextButton")
SelectAllButton.Position = UDim2.new(0, 16, 0, 390)
SelectAllButton.Size = UDim2.new(0.5, -22, 0, 32)
SelectAllButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SelectAllButton.Text = "SELECT ALL"
SelectAllButton.TextColor3 = Color3.fromRGB(200, 200, 200)
SelectAllButton.Font = Enum.Font.Gotham
SelectAllButton.TextSize = 14
SelectAllButton.Parent = MainFrame

local DeselectAllButton = Instance.new("TextButton")
DeselectAllButton.Position = UDim2.new(0.5, 6, 0, 390)
DeselectAllButton.Size = UDim2.new(0.5, -22, 0, 32)
DeselectAllButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DeselectAllButton.Text = "DESELECT ALL"
DeselectAllButton.TextColor3 = Color3.fromRGB(200, 200, 200)
DeselectAllButton.Font = Enum.Font.Gotham
DeselectAllButton.TextSize = 14
DeselectAllButton.Parent = MainFrame

for _, btn in pairs({StartButton, StopButton, SelectAllButton, DeselectAllButton, CloseButton}) do
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
end

-- Hover
local function Hover(btn, isMain)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = isMain and Color3.fromRGB(235,235,235) or Color3.fromRGB(55,55,55)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = isMain and Color3.fromRGB(255,255,255) or Color3.fromRGB(30,30,30)}):Play()
    end)
end
Hover(StartButton, true)
Hover(StopButton, false)
Hover(SelectAllButton, false)
Hover(DeselectAllButton, false)

-- ==================== VARIABLES & FLING LOGIC ====================
local SelectedTargets = {}
local PlayerCheckboxes = {}
local FlingActive = false

getgenv().OldPos = nil
getgenv().FPDH = workspace.FallenPartsDestroyHeight

local function RefreshPlayerList()
    for _, v in pairs(PlayerScrollFrame:GetChildren()) do
        if v:IsA("Frame") then v:Destroy() end
    end
    PlayerCheckboxes = {}

    local list = Players:GetPlayers()
    table.sort(list, function(a,b) return a.Name:lower() < b.Name:lower() end)

    local y = 5
    for _, plr in ipairs(list) do
        if plr ~= Player then
            local Entry = Instance.new("Frame")
            Entry.Size = UDim2.new(1, -12, 0, 38)
            Entry.Position = UDim2.new(0, 6, 0, y)
            Entry.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
            Entry.Parent = PlayerScrollFrame
            Instance.new("UICorner", Entry).CornerRadius = UDim.new(0, 9)

            local Checkbox = Instance.new("TextButton")
            Checkbox.Size = UDim2.new(0, 28, 0, 28)
            Checkbox.Position = UDim2.new(0, 8, 0.5, -14)
            Checkbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Checkbox.Text = ""
            Checkbox.Parent = Entry
            Instance.new("UICorner", Checkbox).CornerRadius = UDim.new(0, 7)

            local Check = Instance.new("TextLabel")
            Check.Size = UDim2.new(1,0,1,0)
            Check.BackgroundTransparency = 1
            Check.Text = "✓"
            Check.TextColor3 = Color3.fromRGB(0, 255, 100)
            Check.TextSize = 22
            Check.Font = Enum.Font.GothamBold
            Check.Visible = false
            Check.Parent = Checkbox

            local Name = Instance.new("TextLabel")
            Name.Position = UDim2.new(0, 48, 0, 0)
            Name.Size = UDim2.new(1, -60, 1, 0)
            Name.BackgroundTransparency = 1
            Name.Text = plr.Name
            Name.TextColor3 = Color3.fromRGB(240, 240, 240)
            Name.TextSize = 16
            Name.Font = Enum.Font.Gotham
            Name.TextXAlignment = Enum.TextXAlignment.Left
            Name.Parent = Entry

            local Click = Instance.new("TextButton")
            Click.Size = UDim2.new(1,0,1,0)
            Click.BackgroundTransparency = 1
            Click.Text = ""
            Click.Parent = Entry

            Click.MouseButton1Click:Connect(function()
                if SelectedTargets[plr.Name] then
                    SelectedTargets[plr.Name] = nil
                    Check.Visible = false
                else
                    SelectedTargets[plr.Name] = plr
                    Check.Visible = true
                end
                UpdateStatus()
            end)

            PlayerCheckboxes[plr.Name] = {Checkmark = Check}
            y += 45
        end
    end
    PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, y + 10)
end

local function UpdateStatus()
    local count = 0
    for _ in pairs(SelectedTargets) do count += 1 end
    if FlingActive then
        StatusLabel.Text = "Flinging " .. count .. " target(s)"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
    else
        StatusLabel.Text = count .. " target(s) selected"
        StatusLabel.TextColor3 = Color3.fromRGB(210, 210, 210)
    end
end

local function ToggleAllPlayers(state)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Player and PlayerCheckboxes[plr.Name] then
            if state then
                SelectedTargets[plr.Name] = plr
                PlayerCheckboxes[plr.Name].Checkmark.Visible = true
            else
                SelectedTargets[plr.Name] = nil
                PlayerCheckboxes[plr.Name].Checkmark.Visible = false
            end
        end
    end
    UpdateStatus()
end

-- ==================== ORIGINAL FLING FUNCTION ====================
local function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart
    local TCharacter = TargetPlayer.Character

    if not (Character and Humanoid and RootPart and TCharacter) then return end

    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter:FindFirstChild("Head")

    if RootPart.Velocity.Magnitude < 50 then
        getgenv().OldPos = RootPart.CFrame
    end

    workspace.FallenPartsDestroyHeight = 0/0

    local FPos = function(BasePart, Pos, Ang)
        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
    end

    local SFBasePart = function(BasePart)
        local Time = tick()
        local Angle = 0
        repeat
            if BasePart.Velocity.Magnitude < 50 then
                Angle = Angle + 100
                FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                task.wait()
            else
                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
            end
        until tick() - Time > 2 or not FlingActive
    end

    if TRootPart then
        SFBasePart(TRootPart)
    elseif THead then
        SFBasePart(THead)
    end

    workspace.FallenPartsDestroyHeight = getgenv().FPDH
end

local function StartFling()
    if FlingActive then return end
    local count = 0
    for _ in pairs(SelectedTargets) do count += 1 end
    if count == 0 then
        StatusLabel.Text = "No targets selected!"
        task.wait(1.5)
        UpdateStatus()
        return
    end

    FlingActive = true
    UpdateStatus()

    spawn(function()
        while FlingActive do
            for _, target in pairs(SelectedTargets) do
                if FlingActive and target and target.Character then
                    SkidFling(target)
                    task.wait(0.15)
                end
            end
            task.wait(0.3)
        end
    end)
end

local function StopFling()
    FlingActive = false
    UpdateStatus()
end

-- Connections
StartButton.MouseButton1Click:Connect(StartFling)
StopButton.MouseButton1Click:Connect(StopFling)
SelectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(true) end)
DeselectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(false) end)
CloseButton.MouseButton1Click:Connect(function() StopFling() ScreenGui:Destroy() end)

Players.PlayerAdded:Connect(RefreshPlayerList)
Players.PlayerRemoving:Connect(RefreshPlayerList)

RefreshPlayerList()
UpdateStatus()

print("Immortal Fling GUI Loaded - Full Version")
