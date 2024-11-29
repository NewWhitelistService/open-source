if game.PlaceId ~= 5712833750 then return end
local bb = game:service("VirtualUser")
game:service("Players").LocalPlayer.Idled:connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Menu", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = ".",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local l = Tab:AddLabel(".")
local l2 = Tab:AddLabel(".")
task.spawn(function()
    while true do
        wait()
        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
            if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end)
    end
end)

task.spawn(function()
    while true do
        local players = game:GetService("Players"):GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character and randomPlayer.Character:FindFirstChild("Humanoid") and randomPlayer ~= game.Players.LocalPlayer then
            local args = {
                [1] = "damage",
                [2] = {
                    ["EnemyHumanoid"] = randomPlayer.Character.Humanoid
                }
            }
            game:GetService("ReplicatedStorage").SkillsInRS.RemoteEvent:FireServer(unpack(args))
            l:Set("Target: "..randomPlayer.Name)
        end
        task.wait(0.2)
    end
end)

task.spawn(function()
    while true do
        local npcs = workspace.NPC:GetChildren()
        if #npcs > 0 then
        local npcrandom = npcs[math.random(1, #npcs)]
            local args = {
                [1] = npcrandom.Humanoid,
                [2] = math.random(1, 30)
            }
            game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(args))
            l2:Set("Boss Attack: "..npcrandom.Name)
         else
	    l2:Set("Boss Attack: None")
        end
        task.wait()
    end
end)

task.spawn(function()
    while true do
        local dummiesFolder = workspace.MAP:FindFirstChild("5k_dummies")
        if dummiesFolder then
            local dummies = dummiesFolder:GetChildren()
            local selectedDummy = dummies[math.random(1, #dummies)]
            if selectedDummy and selectedDummy:FindFirstChild("Humanoid") then
                local newPosition = selectedDummy.HumanoidRootPart.Position + Vector3.new(3, 0, 0)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(selectedDummy.Humanoid, math.random(0, 10))
            end
        end
        task.wait(0.8)
    end
end)

task.spawn(function()
    while true do
        pcall(function()
            game:GetService("ReplicatedStorage").Events.CoinEvent:FireServer()
        end)
        task.wait(1)
    end
end)
