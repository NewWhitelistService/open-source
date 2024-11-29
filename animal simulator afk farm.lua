if game.PlaceId ~= 5712833750 then return end

local bb = game:service("VirtualUser")
game:service("Players").LocalPlayer.Idled:connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)

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

local npcFolder = workspace.NPC
while true do
pcall(function()
    local npcs = npcFolder:GetChildren()
    if #npcs > 0 then
        local args = {
            [1] = npcs[math.random(1, #npcs)].Humanoid,
            [2] = math.random(1, 20)
        }
        game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(args))
    end
end)
pcall(function()
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
end)
    game:GetService("ReplicatedStorage").Events.CoinEvent:FireServer()
    task.wait(1)
end
