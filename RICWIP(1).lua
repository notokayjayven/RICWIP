local see = workspace:findFirstChild("executedtrue")
if see then repeat wait() until true == false end
local trans = 0
local executed = Instance.new("StringValue", workspace)
executed.Name = "executedtrue"
local UserInputService = game:GetService("UserInputService")
local maingui = Instance.new("ScreenGui", game.CoreGui)--game.Players.LocalPlayer.PlayerGui)
local frame = Instance.new("Frame", maingui)
local gui = frame
local scrollframe = Instance.new("ScrollingFrame", frame)
local name = Instance.new("TextLabel", frame)
local by = Instance.new("TextLabel", frame)
local headtext = Instance.new("TextLabel", scrollframe)
local baldtext = Instance.new("TextLabel", scrollframe)
local pulsetext = Instance.new("TextLabel", scrollframe)
local headbox = Instance.new("TextBox", scrollframe)
local baldbox = Instance.new("TextBox", scrollframe)
local pulseexec = Instance.new("TextBox", scrollframe)
frame.BackgroundTransparency = 0
frame.Position = UDim2.new(.325, 0, .3, 0)
frame.Size = UDim2.new(.35, 0, .4, 0)
frame.Style = "RobloxRound"
scrollframe.BackgroundTransparency = 0.2
scrollframe.Position = UDim2.new(0, 0, .2, 0)
scrollframe.Size = UDim2.new(1, 0, .8, 0)
name.BackgroundTransparency = 0.9
name.Size = UDim2.new(.8, 0, .2, 0)
name.Text = "Ragdoll Invisibility Commands [WIP]"
name.TextScaled = true
name.Font = "Ubuntu"
name.TextColor3 = Color3.new(0, 0, 0)
by.BackgroundTransparency = 0.9
by.Position = UDim2.new(.8, 0, 0, 0)
by.Size = UDim2.new(.2, 0, .2, 0)
by.Text = "made by jayven#5641"
by.TextScaled = true
by.Font = "Ubuntu"
by.TextColor3 = Color3.new(0, 0, 0)
headtext.BackgroundTransparency = 0.9
headtext.Size = UDim2.new(.4, 0, .1, 0)
headtext.Font = "Ubuntu"
headtext.Text = "headless head"
headtext.TextScaled = true
headtext.TextColor3 = Color3.new(0, 0, 0)
pulsetext.Size = UDim2.new(.4, 0, .1, 0)
pulsetext.Position = UDim2.new(0, 0, .3, 0)
pulsetext.Font = "Ubuntu"
pulsetext.Text = "[WIP]"
pulsetext.TextScaled = true
pulsetext.BackgroundTransparency = .9
pulsetext.TextColor3 = Color3.new(0, 0, 0)
baldtext.BackgroundTransparency = .9
baldtext.Position = UDim2.new(.55, 0, 0, 0)
baldtext.Size = UDim2.new(.4, 0, .1, 0)
baldtext.TextScaled = true
baldtext.Text = "make peoples hair like johnny sins"
baldtext.Font = "Ubuntu"
baldtext.TextColor3 = Color3.new(0, 0, 0)
headbox.Position = UDim2.new(0, 0, .1, 0)
headbox.Size = UDim2.new(.4, 0, .1, 0)
headbox.Font = "Ubuntu"
headbox.Text = "Enter [name]/All here"
headbox.TextScaled = true
headbox.TextColor3 = Color3.new(0, 0, 0)
headbox.PlaceholderColor3 = Color3.new(0, 0, 0)
baldbox.Position = UDim2.new(.55, 0, .1, 0)
baldbox.Size = UDim2.new(.4, 0, .1, 0)
baldbox.Font = "Ubuntu"
baldbox.TextColor3 = Color3.new(0, 0, 0)
baldbox.PlaceholderColor3 = Color3.new(0, 0, 0)
baldbox.TextScaled = true
baldbox.Text = "Enter [name]/All here"
pulseexec.Position = UDim2.new(0, 0, .4, 0)
pulseexec.Size = UDim2.new(.4, 0, .1, 0)
pulseexec.TextScaled = true
pulseexec.Font = "Ubuntu"
pulseexec.TextColor3 = Color3.new(0, 0, 0)
pulseexec.PlaceholderColor3 = Color3.new(0, 0, 0)
pulseexec.Text = "Enter [name]/All here"
local popsound = Instance.new("Sound", workspace)
popsound.SoundId = "rbxassetid://1412830636"
popsound:Play()
wait(.5)
popsound:Destroy()

for _, v in pairs(game.Players:GetChildren()) do
    if not v:findFirstChild("headval") and not v:findFirstChild("baldval") then
        local boolval1 = Instance.new("BoolValue", v)
        boolval1.Name = "headval"
        local boolval2 = Instance.new("BoolValue", v)
        boolval2.Name = "baldval"
    end
    wait()
end

game.Players.PlayerAdded:Connect(function(v)
    local boolval1 = Instance.new("BoolValue", v)
    boolval1.Name = "headval"
    local boolval2 = Instance.new("BoolValue", v)
    boolval2.Name = "baldval"
end)

local allhead = Instance.new("BoolValue", workspace)
local allbald = Instance.new("BoolValue", workspace)
allhead.Name = "allhead"
allbald.Name = "allbald"

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = gui.Position
        		
        input.Changed:Connect(function()
        	if input.UserInputState == Enum.UserInputState.End then
        		dragging = false
        	end
        end)
    end
end)

gui.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    	dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
    	update(input)
	end
end)

headbox.FocusLost:Connect(function(enterpressed, inputs)
    local findplr = game.Players:findFirstChild(headbox.Text)
    print("-")
    if findplr and enterpressed and findplr.headval.Value == false then
        print("working..")
        game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(workspace[headbox.Text]["Head"], 1)
        game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(workspace[headbox.Text]["Head"].face, 1)
        findplr.headval.Value = true
        headbox.Text = ""
    elseif not findplr and enterpressed and (headbox.Text == "all") and workspace.allhead.Value == false then
        workspace.allhead.Value = true
        for _, v in pairs(game.Players:GetChildren()) do
             game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(v.Character["Head"], 1)
             game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(v.Character["Head"].face, 1)
        end
        headbox.Text = ""
    elseif not findplr and enterpressed and (headbox.Text == "all") and workspace.allhead.Value == true then
        workspace.allhead.Value = false
        for _, v in pairs(game.Players:GetChildren()) do
             game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(v.Character["Head"], 0)
             game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(v.Character["Head"].face, 0)
        end
        headbox.Text = ""
    elseif findplr and enterpressed and findplr.headval.Value == true then
        print("working..")
        game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(workspace[headbox.Text]["Head"], 0)
        game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(workspace[headbox.Text]["Head"].face, 0)
        findplr.headval.Value = false
        headbox.Text = ""
    elseif not findplr and enterpressed then
        headbox.Text = ""
        headbox.Text = "Not a player!"
    end
end)

baldbox.FocusLost:Connect(function(enterpressed, inputs)
    local findplr = game.Players:findFirstChild(baldbox.Text)
    print("-")
    if findplr and enterpressed and findplr.baldval.Value == false then
        print("working..")
        for _, h in pairs(game.Players[baldbox.Text].Character:GetChildren()) do
            if h.ClassName == "Accessory" then
             game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(h.Handle, 1)
             --wait()
            end
        end
        findplr.baldval.Value = true
        baldbox.Text = ""
    elseif not findplr and enterpressed and (baldbox.Text == "all") and workspace.allbald.Value == false then
        workspace.allbald.Value = true
        for i, v in pairs(game.Players:GetChildren()) do
            for _, h in pairs(v.Character:GetChildren()) do
                 if h.ClassName == "Accessory" then
                     game.Players.okayjayven.Backpack.OddPotion.TransEvent:FireServer(h.Handle, 1)
                 end
            end
            wait()
        end
         baldbox.Text = ""
    elseif not findplr and enterpressed and (baldbox.Text == "all") and workspace.allbald.Value == true then
        workspace.allbald.Value = false
       for i, v in pairs(game.Players:GetChildren()) do
            for _, h in pairs(v.Character:GetChildren()) do
                 if h.ClassName == "Accessory" then
                     game.Players.okayjayven.Backpack.OddPotion.TransEvent:FireServer(h.Handle, 0)
                 end
            end
            wait()
       end
     baldbox.Text = ""
    elseif findplr and enterpressed and findplr.baldval.Value == true then
        print("working..")
        for _, h in pairs(game.Players[baldbox.Text].Character:GetChildren()) do
            if h.ClassName == "Accessory" then
             game.Players.LocalPlayer.Backpack.OddPotion.TransEvent:FireServer(h.Handle, 0)
             --wait()
            end
        end
        findplr.baldval.Value = false
         baldbox.Text = ""
    elseif not findplr and enterpressed then
        baldbox.Text = ""
        baldbox.Text = "Not a player!"
    end
end)

























