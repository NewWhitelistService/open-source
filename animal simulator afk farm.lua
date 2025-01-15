if game.PlaceId ~= 5712833750 then return end
local bb = game:service("VirtualUser")
game:service("Players").LocalPlayer.Idled:connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "animal simulator (afk)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
    Name = "main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local l = Tab:AddLabel(".")
local l2 = Tab:AddLabel(".")
local l3 = Tab:AddLabel(".")
Tab:AddLabel("make by doitenroi.9941 in discord, remove auto dummy")
task.spawn(function()
    while wait() do
        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
            if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end)
    end
end)

task.spawn(function()
    while wait(3) do
        local players = game:GetService("Players"):GetPlayers()
        if #players < 5 then
            local Player = game.Players.LocalPlayer    
            local Http = game:GetService("HttpService")
            local TPS = game:GetService("TeleportService")
            local Api = "https://games.roblox.com/v1/games/"
            local _place = game.PlaceId
            local _servers = Api.._place.."/servers/Public"

            function ListServers(cursor)
                local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
                return Http:JSONDecode(Raw)
            end

            Player.Character.HumanoidRootPart.Anchored = true
            local Servers = ListServers()

            local validServers = {}
            for _, server in pairs(Servers.data) do
                local maxPlayers = server.maxPlayers
                local playing = server.playing
                if (playing >= 12) and ((maxPlayers - playing) >= 3) then
                    table.insert(validServers, server)
                end
            end

            if #validServers > 0 then
                local bestServer = validServers[math.random(1, #validServers)]
                TPS:TeleportToPlaceInstance(_place, bestServer.id, Player)
            end
            break
        end
    end
end)

task.spawn(function()
    while task.wait(0.15) do
            pcall(function()
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
        end)
    end
end)
task.spawn(function()
    while task.wait(0.5) do
            pcall(function()
        local npcs = workspace.NPC:GetChildren()
        if #npcs > 0 then
            local npcrandom = npcs[math.random(1, #npcs)]
            if npcrandom:FindFirstChild("Humanoid") then
                    pcall(function()
                local args = {
                    [1] = npcrandom.Humanoid,
                    [2] = math.random(1, 30)
                }
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(args))
                l2:Set("Boss Attack: "..npcrandom.Name)
                end)
            else
                l2:Set("No Humanoid: "..npcrandom.Name)
            end
        else
            l2:Set("Boss Attack: None")
        end
    end)
    end
end
task.spawn(function()
    while task.wait(0.35) do
            pcall(function()
        --local dummiesFolder = game.Players.LocalPlayer.leaderstats.Level.Value > 5000 and workspace.MAP:FindFirstChild("5k_dummies") or workspace.MAP:FindFirstChild("dummies")
        l3:Set("Level: "..game.Players.LocalPlayer.leaderstats.Level.Value)
        --[[if dummiesFolder then
            local dummies = dummiesFolder:GetChildren()
            local selectedDummy = dummies[math.random(1, #dummies)]
            if selectedDummy and selectedDummy:FindFirstChild("Humanoid") then
                local newPosition = selectedDummy.HumanoidRootPart.Position + Vector3.new(3, 0, 0)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(selectedDummy.Humanoid, math.random(0, 10))
            end
        end]]
        end)
    end
end)
task.spawn(function()
    while task.wait(0.45) do
        pcall(function()
            game:GetService("ReplicatedStorage").Events.CoinEvent:FireServer()
        end)
    end
end)
