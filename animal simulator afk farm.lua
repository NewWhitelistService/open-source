if game.PlaceId ~= 5712833750 then return end
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
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

task.spawn(function()
    while true do
        local players = game:GetService("Players"):GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character and randomPlayer.Character:FindFirstChild("Humanoid") then
            local args = {
                [1] = "damage",
                [2] = {
                    ["EnemyHumanoid"] = randomPlayer.Character.Humanoid
                }
            }
            game:GetService("ReplicatedStorage").SkillsInRS.RemoteEvent:FireServer(unpack(args))

            local avatarIcon = "rbxthumb://type=AvatarHeadShot&id=" .. randomPlayer.UserId .. "&w=180&h=180"
            pcall(function()
                OrionLib:MakeNotification({
                    Name = "Random Player Damage",
                    Content = "Damage sent to: " .. randomPlayer.Name,
                    Image = avatarIcon,
                    Time = 0.2
                })
            end)
        end
        task.wait(0.2)
    end
end)

task.spawn(function()
    while true do
        local npcs = workspace.NPC:GetChildren()
        if #npcs > 0 then
            local args = {
                [1] = npcs[math.random(1, #npcs)].Humanoid,
                [2] = math.random(1, 20)
            }
            game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(args))
        end
        task.wait(0.35)
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
        task.wait(0.5)
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
