local function Notify(...)
    game.StarterGui:SetCore('SendNotification',...)
end

--Basic inventory checks for Murderer and Sheriff
function findsussy()
    for i,v in pairs(game.Players:GetChildren()) do 
        if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") and v.Name == "Tool" then
            return v.Name
                end
            end
        return nil
    end

function findpig()
    for i,v in pairs(game.Players:GetChildren()) do 
        if v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") and v.Name == "Tool" then
            return v.Name
                end
            end
         return nil
    end

local imposter = findsussy()
local pig = findpig()

--ESP STUFF BELOW!
function allESP()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= imposter and v.Name ~= pig then
            for i, v in pairs(v.Character:GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    if v.Name == "BoxHandleAdornment" then
                        v:Destroy()
                    end
                    local funny = Instance.new("BoxHandleAdornment")--INNOCENT ESP
                    funny.Parent = v
                    funny.Adornee = v
                    funny.AlwaysOnTop = true
                    funny.Transparency = .8
                    funny.ZIndex = 0
                    funny.Size = v.size
                    funny.Color3 = Color3.fromRGB(255, 255, 255)
                end
            end
        end   
    end
end

function sussycheck()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == ("Knife") then
            allESP()
        end
    end
end

function esp()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Name == imposter then
            for i, v in pairs(v.Character:GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    if v.Name == "BoxHandleAdornment" then
                        v:Destroy()
                    end
                    local funny = Instance.new("BoxHandleAdornment")--imposter esp
                    funny.Parent = v
                    funny.Adornee = v
                    funny.AlwaysOnTop = true
                    funny.Transparency = .8
                    funny.ZIndex = 0
                    funny.Size = v.size
                    funny.Color3 = Color3.fromRGB(255, 0, 4)
                end
            end
        elseif v.Name == pig then
                for i, v in pairs(v.Character:GetDescendants()) do
                    if v:IsA("Part") or v:IsA("MeshPart") then
                        if v.Name == "BoxHandleAdornment" then
                            v:Destroy()
                        end
                        local funny = Instance.new("BoxHandleAdornment")--pig esp
                        funny.Parent = v
                        funny.Adornee = v
                        funny.AlwaysOnTop = true
                        funny.Transparency = .8
                        funny.ZIndex = 0
                        funny.Size = v.size
                        funny.Color3 = Color3.fromRGB(0, 12, 255)
                    end
                end
            end
        end
    end

local mt = getrawmetatable(game)
setreadonly(mt, false)
local namecall = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
local method = getnamecallmethod()
local args = {...}
    if tostring(method) == "InvokeServer" and tostring(self) == "GetChance" then
        spawn(function()
            wait(14)
if imposter and pig then
    Notify({Title="The Murderer is";Text=imposter;Icon="http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..imposter})
    Notify({Title="The Sheriff is";Text=pig;Icon="http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..pig})
    esp()
    sussycheck()
        end
    end)
end
return namecall(self, table.unpack(args))
end)
