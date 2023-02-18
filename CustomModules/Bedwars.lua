
--[[
     CREDITS
     Ham135 - Made this script 2 months ago i am just making it better and fixing it
     Please notify me if you need credits
--]]
task.wait(0.1)
shared["Feather-ClientConfigs"] = {
    StrokeTransparency = 0.75,
    Color = Color3.fromRGB(196, 40, 28),
    Enabled = false
}
local lib
if shared["betterisfile"]("rektsky/Guilibrary.lua") then
    lib = loadstring(readfile("rektsky/Guilibrary.lua"))()
end
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()
local getasset = getsynasset or getcustomasset
local ScreenGuitwo = game:GetService("CoreGui").RektskyNotificationGui
local lplr = game:GetService("Players").LocalPlayer
local oldcloneroot

local repstorage = game:GetService("ReplicatedStorage")
local isnetworkowner = isnetworkowner or function() return true end
local Camera = workspace.CurrentCamera

function runcode(func)
    func()
end

lib:CreateWindow()
local Tabs = {
    ["Combat"] = lib:CreateTab("Combat",Color3.fromRGB(196, 40, 28),"combat"),
    ["Blatant"] = lib:CreateTab("Blatant",Color3.fromRGB(196, 40, 28),"movement"),
    ["Render"] = lib:CreateTab("Render",Color3.fromRGB(196, 40, 28),"render"),
    ["Utility"] = lib:CreateTab("Utility",Color3.fromRGB(196, 40, 28),"player"),
    ["World"] = lib:CreateTab("World",Color3.fromRGB(196, 40, 28),"world"),
    ["Exploits"] = lib:CreateTab("Exploits",Color3.fromRGB(196, 40, 28),"exploit"),
}
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local cam = game:GetService("Workspace").CurrentCamera
local uis = game:GetService("UserInputService")
function getremote(tab)
    for i,v in pairs(tab) do
        if v == "Client" then
            return tab[i + 1]
        end
    end
    return ""
end
local bedwars = {
	["KnockbackTable"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
	["ClientHandler"] = Client,
	["ReportRemote"] = getremote(debug.getconstants(require(lplr.PlayerScripts.TS.controllers.global.report["report-controller"]).default.reportPlayer)),
	["ItemTable"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1),
	["CombatConstant"] = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant,
	["SprintController"] = KnitClient.Controllers.SprintController,
	["ShopItems"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
	["DamageController"] = require(lplr.PlayerScripts.TS.controllers.global.damage["damage-controller"]).DamageController,
	["DamageTypes"] = require(game:GetService("ReplicatedStorage").TS.damage["damage-type"]).DamageType,
    ["SwordRemote"] = getremote(debug.getconstants((KnitClient.Controllers.SwordController).attackEntity)),
    ["PingController"] = require(lplr.PlayerScripts.TS.controllers.game.ping["ping-controller"]).PingController,
    ["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
    ["ClientHandlerStore"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
    ["SwordController"] = KnitClient.Controllers.SwordController,
    ["BlockCPSConstants"] = require(game:GetService("ReplicatedStorage").TS["shared-constants"]).CpsConstants,
    ["BalloonController"] = KnitClient.Controllers.BalloonController,
    ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
    ["GameSound"] = require(game:GetService("ReplicatedStorage").TS.sound["game-sound"]).GameSound,-- test
    ["ItemMeta"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1),
}

local uis = game:GetService("UserInputService")
function createnotification(TitleText, ContentText, Duration)
spawn(function()
local Notifications = Instance.new("ScreenGui")
Notifications.ResetOnSpawn = false

local Main = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local content = Instance.new("TextLabel")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")


	local ts = game:GetService("TweenService")

	for i,v in pairs(Notifications:GetChildren()) do
		spawn(function()
			local newpos = (v.Position - UDim2.new(0, 0, 0.1, 0))
			ts:Create(v, TweenInfo.new(0.07), {Position = newpos}):Play()
		end)
	end

--Properties:

Notifications.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = Notifications
Main.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.107, 0, 0.296, 0)
Main.Size = UDim2.new(0, 261, 0, 75)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(163, 163, 163)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(163, 163, 163))}
UIGradient.Offset = Vector2.new(-0.671999991, -0.00666667009)
UIGradient.Parent = Main

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Main

ImageLabel.Parent = Main
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0, 40, 0, 40)
ImageLabel.Size = UDim2.new(0, 61, 0, 52)
ImageLabel.Image = "rbxassetid://12311747586"
ImageLabel.ImageColor3 = Color3.fromRGB(200, 230, 230)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.351999998, 0, 0.25, 0)
Title.Size = UDim2.new(0, 137, 0, 16)
Title.Text = TitleText
Title.Font = Enum.Font.Ubuntu
Title.TextColor3 = Color3.fromRGB(200, 230, 230)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

content.Name = "content"
content.Parent = Main
content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
content.BackgroundTransparency = 1.000
content.Position = UDim2.new(0.351999998, 0, 0.449999988, 0)
content.Size = UDim2.new(0, 137, 0, 30)
content.Font = Enum.Font.SourceSans
content.Text = ContentText
content.TextColor3 = Color3.fromRGB(200, 230, 230)
content.TextScaled = true
content.TextSize = 14.000
content.TextWrapped = true
content.TextXAlignment = Enum.TextXAlignment.Left

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = Main
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
ts:Create(Main, TweenInfo.new(0.12), {Position = UDim2.new(0.831, 0, 0.887, 0)}):Play()
task.wait(0.12)
task.wait(Duration)
ts:Create(Main, TweenInfo.new(0.12), {Position = UDim2.new(1.3, 0, 0.887, 0)}):Play()
task.wait(0.13)
Main:Destroy()
end)
end

--skidded off the devforum because I hate projectile math
-- Compute 2D launch angle
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- d: horizontal distance
-- h: vertical distance
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchAngle(v: number, g: number, d: number, h: number, higherArc: boolean)
	local v2 = v * v
	local v4 = v2 * v2
	local root = math.sqrt(v4 - g*(g*d*d + 2*h*v2))
	if not higherArc then root = -root end
	return math.atan((v2 + root) / (g * d))
end

-- Compute 3D launch direction from
-- start: start position
-- target: target position
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchDirection(start, target, v, g, higherArc: boolean)
	-- get the direction flattened:
	local horizontal = Vector3.new(target.X - start.X, 0, target.Z - start.Z)

	local h = target.Y - start.Y
	local d = horizontal.Magnitude
	local a = LaunchAngle(v, g, d, h, higherArc)

	-- NaN ~= NaN, computation couldn't be done (e.g. because it's too far to launch)
	if a ~= a then return nil end

	-- speed if we were just launching at a flat angle:
	local vec = horizontal.Unit * v

	-- rotate around the axis perpendicular to that direction...
	local rotAxis = Vector3.new(-horizontal.Z, 0, horizontal.X)

	-- ...by the angle amount
	return CFrame.fromAxisAngle(rotAxis, a) * vec
end

local function FindLeadShot(targetPosition: Vector3, targetVelocity: Vector3, projectileSpeed: Number, shooterPosition: Vector3, shooterVelocity: Vector3, gravity: Number)
	local distance = (targetPosition - shooterPosition).Magnitude

	local p = targetPosition - shooterPosition
	local v = targetVelocity - shooterVelocity
	local a = Vector3.zero

	local timeTaken = (distance / projectileSpeed)

	if gravity > 0 then
		local timeTaken = projectileSpeed/gravity+math.sqrt(2*distance/gravity+projectileSpeed^2/gravity^2)
	end

	local goalX = targetPosition.X + v.X*timeTaken + 0.5 * a.X * timeTaken^2
	local goalY = targetPosition.Y + v.Y*timeTaken + 0.5 * a.Y * timeTaken^2
	local goalZ = targetPosition.Z + v.Z*timeTaken + 0.5 * a.Z * timeTaken^2

	return Vector3.new(goalX, goalY, goalZ)
end

local function addvectortocframe(cframe, vec)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function addvectortocframe2(cframe, newylevel)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x, newylevel, z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end


function IsAlive(plr)
    plr = plr or lplr
    if not plr.Character then return false end
    if not plr.Character:FindFirstChild("Head") then return false end
    if not plr.Character:FindFirstChild("Humanoid") then return false end
    if plr.Character:FindFirstChild("Humanoid").Health < 0.11 then return false end
    return true
end

local function getLowestHpPlrNear(max) 
	local returning, lowestnum = nil, 9999999999
	for i,v in next, PLAYERS:GetPlayers() do 
		if isAlive(v) and v~=lplr then 
			local diff = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
			local health = v.Character:GetAttribute("Health")
			if diff < max and health < lowestnum then 
				lowestnum = health 
				returning = v
			end
		end
	end
	return returning
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
    return plr ~= lplr and plr and IsAlive(lplr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
    local returnedplayer = {}
    local currentamount = 0
    if IsAlive(lplr) then -- alive check
        for i, v in pairs(game.Players:GetChildren()) do -- loop through players
            if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
                if mag <= distance then -- mag check
                    table.insert(returnedplayer, v)
                    currentamount = currentamount + 1
                end
            end
        end
        for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
            if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
                local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
                if mag <= distance then -- magcheck
                    table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
                    currentamount = currentamount + 1
                end
            end
        end
    end
    return returnedplayer -- table of attackable entities
end


function CanWalk(plr)
    plr = plr or lplr
    if not plr.Character then return false end
    if not plr.Character:FindFirstChild("Humanoid") then return false end
    local state = plr.Character:FindFirstChild("Humanoid"):GetState()
    if state == Enum.HumanoidStateType.Dead then
        return false
    end
    if state == Enum.HumanoidStateType.Ragdoll then
        return false
    end
    return true
end
function GetMatchState()
	return bedwars["ClientHandlerStore"]:getState().Game.matchState
end

function getNearestPlayer(maxdist)
    local obj = lplr
    local dist = math.huge
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Team ~= lplr.Team and v ~= lplr and IsAlive(v) then
            local mag = (v.Character:FindFirstChild("HumanoidRootPart").Position - lplr.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
            if (mag < dist) and (mag < maxdist) then
                dist = mag
                obj = v
            end
        end
    end
    return obj
end

function getQueueType()
    local state = bedwars["ClientHandlerStore"]:getState()
    return state.Game.queueType or "bedwars_test"
end

function getitem(itm)
    if IsAlive(lplr) and lplr.Character:FindFirstChild("InventoryFolder").Value:FindFirstChild(itm) then
        return true
    end
    return false
end

local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
	do
		function RunLoops:BindToRenderStep(name, num, func)
			if RunLoops.RenderStepTable[name] == nil then
				RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:Connect(func)
			end
		end

		function RunLoops:UnbindFromRenderStep(name)
			if RunLoops.RenderStepTable[name] then
				RunLoops.RenderStepTable[name]:Disconnect()
				RunLoops.RenderStepTable[name] = nil
			end
		end

		function RunLoops:BindToStepped(name, num, func)
			if RunLoops.StepTable[name] == nil then
				RunLoops.StepTable[name] = game:GetService("RunService").Stepped:Connect(func)
			end
		end

		function RunLoops:UnbindFromStepped(name)
			if RunLoops.StepTable[name] then
				RunLoops.StepTable[name]:Disconnect()
				RunLoops.StepTable[name] = nil
			end
		end

		function RunLoops:BindToHeartbeat(name, num, func)
			if RunLoops.HeartTable[name] == nil then
				RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:Connect(func)
			end
		end

		function RunLoops:UnbindFromHeartbeat(name)
			if RunLoops.HeartTable[name] then
				RunLoops.HeartTable[name]:Disconnect()
				RunLoops.HeartTable[name] = nil
			end
		end
	end

loadstring(game:HttpGet("https://raw.githubusercontent.com/EZEZEZEZZE/a/main/CustomModules/Whitelist"))()
local function checkstate(plr)
	local tab = shared.loaddata
	for i,v in pairs(tab) do
		if tonumber(v) == tonumber(plr.UserId) then
			return true
		end
	end
	return false
end
local function chat(msg)
	local args = {
		[1] = msg,
		[2] = "All"
	}
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end

local function update_tag_meta() --credits to spring and vape for the nametags
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ChatTag = {}
	for i,v in pairs(game.Players:GetPlayers()) do
		if checkstate(v) then
			ChatTag[v.UserId] =
				{
					TagColor = Color3.new(0.7, 0, 1),
					TagText = "PRIVATE"
				}
		end
	end
	local oldchanneltab
	local oldchannelfunc
	local oldchanneltabs = {}
	--// Chat Listener
	for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
		if
			v.Function
			and #debug.getupvalues(v.Function) > 0
			and type(debug.getupvalues(v.Function)[1]) == "table"
			and getmetatable(debug.getupvalues(v.Function)[1])
			and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		then
			oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
			oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
			getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
				local tab = oldchannelfunc(Self, Name)
				if tab and tab.AddMessageToChannel then
					local addmessage = tab.AddMessageToChannel
					if oldchanneltabs[tab] == nil then
						oldchanneltabs[tab] = tab.AddMessageToChannel
					end
					tab.AddMessageToChannel = function(Self2, MessageData)
						if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
							if ChatTag[Players[MessageData.FromSpeaker].UserId] then
								MessageData.ExtraData = {
									NameColor = Players[MessageData.FromSpeaker].Team == nil and Color3.new(255,255,0)
										or Players[MessageData.FromSpeaker].TeamColor.Color,
									Tags = {
										table.unpack(MessageData.ExtraData.Tags),
										{
											TagColor = ChatTag[Players[MessageData.FromSpeaker].UserId].TagColor,
											TagText = ChatTag[Players[MessageData.FromSpeaker].UserId].TagText,
										},
									},
								}
							end
						end
						return addmessage(Self2, MessageData)
					end
				end
				return tab
			end
		end
	end
end

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local DragGUI = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local TextLabel_2 = Instance.new("TextLabel")
local UIGradient_3 = Instance.new("UIGradient")

--Properties:

ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.737775087, 0, 0.660847902, 0)
MainFrame.Size = UDim2.new(0, 230, 0, 75)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(163, 163, 163)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(163, 163, 163))}
UIGradient.Offset = Vector2.new(-0.671999991, -0.00666667009)
UIGradient.Parent = MainFrame

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = MainFrame
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

DragGUI.Name = "DragGUI"
DragGUI.Parent = MainFrame
DragGUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DragGUI.BackgroundTransparency = 1.000
DragGUI.Size = UDim2.new(0, 230, 0, 75)

TextLabel.Parent = DragGUI
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0, 10, 0.300000012, 0)
TextLabel.Size = UDim2.new(0, 137, 0, 30)
TextLabel.Font = Enum.Font.Ubuntu
TextLabel.Text = "Feather client"
TextLabel.TextColor3 = Color3.fromRGB(200, 230, 230)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.12, Color3.fromRGB(255, 0, 209)), ColorSequenceKeypoint.new(0.22, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.42, Color3.fromRGB(0, 179, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(0, 255, 128)), ColorSequenceKeypoint.new(0.58, Color3.fromRGB(18, 255, 1)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.82, Color3.fromRGB(255, 119, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 72, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
UIGradient_2.Parent = TextLabel

TextLabel_2.Parent = DragGUI
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0, 138, 0.300000012, 0)
TextLabel_2.Size = UDim2.new(0, 60, 0, 30)
TextLabel_2.Font = Enum.Font.Ubuntu
TextLabel_2.Text = "V1"
TextLabel_2.TextColor3 = Color3.fromRGB(200, 230, 230)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.12, Color3.fromRGB(255, 0, 209)), ColorSequenceKeypoint.new(0.22, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.42, Color3.fromRGB(0, 179, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(0, 255, 128)), ColorSequenceKeypoint.new(0.58, Color3.fromRGB(18, 255, 1)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.82, Color3.fromRGB(255, 119, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 72, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
UIGradient_3.Parent = TextLabel_2

-- Scripts:

local function TCUCXO_fake_script() -- TextLabel.Script 
	local script = Instance.new('Script', TextLabel)

	local thing = script.Parent
	local uiGradient = thing:WaitForChild("UIGradient")
	local tweenService = game:GetService("TweenService")

	while true do
		local tween = tweenService:Create(uiGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(-1, 0)})
		tween:Play()
		wait(2)
		uiGradient.Offset = Vector2.new(1, 0)
		local tween2 = tweenService:Create(uiGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(0, 0)})
		tween2:Play()
		wait(0)
	end
end
coroutine.wrap(TCUCXO_fake_script)()
local function XXJKHTE_fake_script() -- TextLabel_2.Script 
	local script = Instance.new('Script', TextLabel_2)

	local thing = script.Parent
	local uiGradient = thing:WaitForChild("UIGradient")
	local tweenService = game:GetService("TweenService")

	while true do
		local tween = tweenService:Create(uiGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(-1, 0)})
		tween:Play()
		wait(2)
		uiGradient.Offset = Vector2.new(1, 0)
		local tween2 = tweenService:Create(uiGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(0, 0)})
		tween2:Play()
		wait(0)
	end
end
coroutine.wrap(XXJKHTE_fake_script)()
local function GFSHF_fake_script() -- DragGUI.LocalScript 
	local script = Instance.new('LocalScript', DragGUI)

	local UserInputService = game:GetService("UserInputService")

	local MainFrame = script.Parent.Parent
	local RepositioningFrame = script.Parent.Parent:WaitForChild("DragGUI")

	local Camera = workspace:WaitForChild("Camera")

	local DragMousePosition
	local FramePosition

	local Draggable = false

	RepositioningFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Draggable = true
			DragMousePosition = Vector2.new(input.Position.X, input.Position.Y)
			FramePosition = Vector2.new(MainFrame.Position.X.Scale, MainFrame.Position.Y.Scale)
		end
	end)

	RepositioningFrame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Draggable = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if Draggable == true then
			local NewPosition = FramePosition + ((Vector2.new(input.Position.X, input.Position.Y) - DragMousePosition) / Camera.ViewportSize)
			MainFrame.Position = UDim2.new(NewPosition.X, 0, NewPosition.Y, 0)
		end
	end)


end
coroutine.wrap(GFSHF_fake_script)()
for i4,v4 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
	if (v4.Name:find("Analytics") or v4.Name:find("Report")) and (v4:IsA("RemoteFunction") or v4:IsA("RemoteEvent")) then
		v4:Remove()
	end
end


if identifyexecutor and identifyexecutor() == "WeAreDevs" then
	getgenv().getcustomasset = function(location) return "rbxasset://"..location end
end


local clients = {
	ChatStrings1 = {
		["IO12GP56P4LGR"] = "Feather"
	},
	ChatStrings2 = {
		["Feather"] = "IO12GP56P4LGR"
	},
	ClientUsers = {}
}




runcode(function()
    local AntiVoiding = false
    local Connection
    local part
    local YPos
    local Enabled = false
    local Mode = {["Value"] = "VeloHop"}
    local AntiVoid = Tabs["World"]:CreateToggle({
        ["Name"] = "AntiVoid",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                if not YPos then
                    local blocks = game:GetService("CollectionService"):GetTagged("block")
                    local blockraycast = RaycastParams.new()
                    blockraycast.FilterType = Enum.RaycastFilterType.Whitelist
					blockraycast.FilterDescendantsInstances = blocks
                    local lowestpos = 99999
                    for i,v in pairs(blocks) do
                        local newray = game:GetService("Workspace"):Raycast(v.Position+Vector3.new(0,600,0),Vector3.new(0,-1000,0),blockraycast)
                        if i % 200 == 0 then
                            task.wait(0.06)
                        end
                        if newray and newray.Position.Y < lowestpos then
                            lowestpos = newray.Position.Y
                        end
                    end
                    YPos = lowestpos - 8
                end
                part = Instance.new("Part")
                part.Anchored = true
                part.Size = Vector3.new(5000,3,5000)
                part.Material = Enum.Material.Neon
                part.Color = Color3.fromRGB(255,65,65)
                part.Transparency = 0.5
                part.Position = Vector3.new(0,YPos,0)
                part.Parent = game:GetService("Workspace")
                Connection = part.Touched:Connect(function(v)
                    if v.Parent.Name == lplr.Name and IsAlive(lplr) and not AntiVoiding then
                        AntiVoiding = true
                            for i = 1,25 do
                                task.wait()
                                lplr.Character:FindFirstChild("HumanoidRootPart").Velocity = lplr.Character:FindFirstChild("HumanoidRootPart").Velocity + Vector3.new(0,6,0)
                            end  
                        end
                        task.wait(0.25)
                        AntiVoiding = false
                end)
            else
                part:Destroy()
                Connection:Disconnect()
                AntiVoiding = false
            end
        end
    })
end)



runcode(function()
    local Value = {["Value"] = 18}
    local Enabled = false
    local Reach = Tabs["Combat"]:CreateToggle({
        ["Name"] = "Reach",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                bedwars["CombatConstant"].RAYCAST_SWORD_CHARACTER_DISTANCE = Value["Value"] - 0.001
            else
                bedwars["CombatConstant"].RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
            end
        end
    })
    Value = Reach:CreateSlider({
        ["Name"] = "Value",
        ["Function"] = function() end,
        ["Min"] = 1,
        ["Max"] = 18,
        ["Default"] = 18,
    })
end)

runcode(function()
    local Value = {["Value"] = 0}
    local Enabled = false
    local Velocity = Tabs["Combat"]:CreateToggle({
        ["Name"] = "Velocity",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                bedwars["KnockbackTable"]["kbDirectionStrength"] = Value["Value"]
				bedwars["KnockbackTable"]["kbUpwardStrength"] = Value["Value"]
            else
                bedwars["KnockbackTable"]["kbDirectionStrength"] = 100
				bedwars["KnockbackTable"]["kbUpwardStrength"] = 100
            end
        end
    })
    Value = Velocity:CreateSlider({
        ["Name"] = "Value",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 100,
        ["Default"] = 0,
        ["Round"] = 1
    })
end)

runcode(function()
    local Enabled = false
    local Sprint = Tabs["Combat"]:CreateToggle({
        ["Name"] = "Sprint",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    repeat
                        task.wait()
                        if not bedwars["SprintController"].sprinting then
                            bedwars["SprintController"]:startSprinting()
                        end
                    until not Enabled
                end)
            else
                bedwars["SprintController"]:stopSprinting()
            end
        end
    })
end)

runcode(function()
    local Connection
    local Enabled = false
    local StaffDetector = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "StaffDetector",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                Connection = game:GetService("Players").PlayerAdded:Connect(function(v)
					if v:IsInGroup(5774246) and v:GetRankInGroup(5774246) >= 100 then
						Client:Get("TeleportToLobby"):SendToServer()
					elseif v:IsInGroup(4199740) and v:GetRankInGroup(4199740) >= 1 then
						Client:Get("TeleportToLobby"):SendToServer()
					end
                end)
                for i,v in pairs(game:GetService("Players"):GetChildren()) do
					if v:IsInGroup(5774246) and v:GetRankInGroup(5774246) >= 100 then
						Client:Get("TeleportToLobby"):SendToServer()
					elseif v:IsInGroup(4199740) and v:GetRankInGroup(4199740) >= 1 then
						Client:Get("TeleportToLobby"):SendToServer()
					end
                end
            else
                Connection:Disconnect()
            end
        end
    })
end)

runcode(function()
    local Enabled = false
    local NoFall = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "NoFall",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    repeat
                        task.wait(0.5)
                        Client:Get("GroundHit"):SendToServer()
                    until not Enabled
                end)
            end
        end
    })
end)

runcode(function()
    local Enabled = false
    local CameraFix = Tabs["Render"]:CreateToggle({
        ["Name"] = "CameraFix",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    repeat
                        task.wait()
                        UserSettings():GetService("UserGameSettings").RotationType = ((cam.CFrame.Position - cam.Focus.Position).Magnitude <= 0.5 and Enum.RotationType.CameraRelative or Enum.RotationType.MovementRelative)
                    until not Enabled
                end)
            end
        end
    })
end)

runcode(function()
    local Connection
    local FOV = {["Value"] = 120}
    local Enabled = false
    local FOVChanger = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "FOVChanger",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                cam.FieldOfView = FOV["Value"]
                Connection = cam:GetPropertyChangedSignal("FieldOfView"):Connect(function()
                    cam.FieldOfView = FOV["Value"]
                end)
            else
                Connection:Disconnect()
                cam.FieldOfView = 75
            end
        end
    })
    FOV = FOVChanger:CreateSlider({
        ["Name"] = "Value",
        ["Function"] = function() end,
        ["Min"] = 30,
        ["Max"] = 120,
        ["Default"] = 120,
        ["Round"] = 1
    })
end)

runcode(function()
    local Speed = {["Value"] = 30}
    local Enabled = false
    local Spider = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "Spider",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    while task.wait() do
                        if not Enabled then return end
                        if IsAlive(lplr) then
                            local param = RaycastParams.new()
                            param.FilterDescendantsInstances = {game:GetService("CollectionService"):GetTagged("block")}
                            param.FilterType = Enum.RaycastFilterType.Whitelist
                            local ray = game:GetService("Workspace"):Raycast(lplr.Character:FindFirstChild("Head").Position-Vector3.new(0,3,0),lplr.Character:FindFirstChild("Humanoid").MoveDirection*3,param)
                            local ray2 = game:GetService("Workspace"):Raycast(lplr.Character:FindFirstChild("Head").Position,lplr.Character:FindFirstChild("Humanoid").MoveDirection*3,param)
                            if ray or ray2 then
                                local velo = Vector3.new(0,Speed["Value"]/100,0)
                                lplr.Character:TranslateBy(velo)
                                local old = lplr.Character:FindFirstChild("HumanoidRootPart").Velocity
                                lplr.Character:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(old.X,velo.Y*70,old.Z)
                            end
                        else
                            task.wait()
                        end
                    end
                end)
            end
        end
    })
    Speed = Spider:CreateSlider({
        ["Name"] = "Speed",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 100,
        ["Default"] = 30,
        ["Round"] = 1
    })
end)

runcode(function()
    local Enabled = false
    local Notifications = {["Enabled"] = true}
    local TPSpeed = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "TPSpeed",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    repeat
                        task.wait(3)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 3
                        spawn(function()
                             if Notifications["Enabled"] then							
				  createnotification("Feather", "Boosted", 4)
                            end
                    end)
                    until not Enabled
                end)
            end
        end
    })
     Notifications = TPSpeed:CreateOptionTog({
        ["Name"] = "Notifications",
        ["Default"] = true,
        ["Func"] = function(v)
            Notifications["Enabled"] = v
        end
    })
end)

runcode(function()
    local SpeedVal = {["Value"] = 1}
    local Enabled = false
    local Mode = {["Value"] = "CFrame"}
    local Speed = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "Speed",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    while task.wait() do
                        if not Enabled then return end
                        if IsAlive(lplr) then
                            local velo = lplr.Character.Humanoid.MoveDirection * (SpeedVal["Value"] *(3))
                            velo = Vector3.new(velo.x / 10, 0, velo.z / 10)
                            lplr.Character:TranslateBy(velo)
                            end
                        end
                end)
            end
        end
    })
    SpeedVal = Speed:CreateSlider({
        ["Name"] = "CFSpeed",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 1,
        ["Default"] = 1,
    })
end)


runcode(function()
    local Connection
    local Connection2
    local flydown = false
    local flyup = false
    local usedballoon = false
    local olddeflate
    local velo
    local Enabled = false
    local Mode = {["Value"] = "Moonsoon"}
    local Fly = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "Fly",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    if lplr.Character:FindFirstChild("InventoryFolder").Value:FindFirstChild("balloon") then
                        usedballoon = true
                        olddeflate = bedwars["BalloonController"].deflateBalloon
                        bedwars["BalloonController"].inflateBalloon()
                        bedwars["BalloonController"].deflateBalloon = function() end
                    end
                    game:GetService("Workspace").Gravity = 0
                    velo = Instance.new("BodyVelocity")
                    velo.MaxForce = Vector3.new(0,9e9,0)
                    velo.Velocity = Vector3.zero
                    velo.Parent = lplr.Character:FindFirstChild("HumanoidRootPart")
                    Connection = uis.InputBegan:Connect(function(input)
                        if input.KeyCode == Enum.KeyCode.Space then
                            flyup = true
                        end
                        if input.KeyCode == Enum.KeyCode.LeftShift then
                            flydown = true
                        end
                    end)
                    Connection2 = uis.InputEnded:Connect(function(input)
                        if input.KeyCode == Enum.KeyCode.Space then
                            flyup = false
                        end
                        if input.KeyCode == Enum.KeyCode.LeftShift then
                            flydown = false
                        end
                    end)
                    spawn(function()
                        while task.wait() do
                            if not Enabled then return end
                            if Mode["Value"] == "Long" then
                                for i = 1,7 do
                                    task.wait()
                                    if not Enabled then return end
                                    velo.Velocity = Vector3.new(0,i*1.30+(flyup and 50 or 0)+(flydown and -50 or 0),0)
                                end
                                for i = 1,7 do
                                    task.wait()
                                    if not Enabled then return end
                                    velo.Velocity = Vector3.new(0,-i*1+(flyup and 50 or 0)+(flydown and -50 or 0),0)
                                end
                            elseif Mode["Value"] == "Funny" then
                                for i = 1,15 do
                                    task.wait(0.01)
                                    if not Enabled then return end
                                    velo.Velocity = Vector3.new(0,i*15,0)
                                end
                            elseif Mode["Value"] == "TP" then
                                for i = 1,15 do
                                    task.wait()
                                    if not Enabled then return end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
                            velo.Velocity = Vector3.new(0,(flyup and 40 or 0)+(flydown and -40 or 0),0)
                            task.wait(0.15)
                            velo.Velocity = Vector3.new(0,0.1,(flyup and 40 or 0)+(flydown and -40 or 0),0)
                             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.3
                            task.wait(0.15)
                            velo.Velocity = Vector3.new(1,0,0,(flyup and 40 or 0)+(flydown and -40 or 0),0)
                              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.2
                            task.wait(0.15)
                            velo.Velocity = Vector3.new(0,0,0.1,(flyup and 40 or 0)+(flydown and -40 or 0),0)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.4
                            task.wait(0.15)
                            velo.Velocity = Vector3.new(0,0,1,(flyup and 40 or 0)+(flydown and -40 or 0),0)
                             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.3
                            task.wait(0.15)
                            velo.Velocity = Vector3.new(0,0,0.1,(flyup and 40 or 0)+(flydown and -40 or 0),0)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.3
                                end
                            elseif Mode["Value"] == "Moonsoon" then
                                for i = 1,10 do
                                    task.wait()
                                    if not Enabled then return end
                                    velo.Velocity = Vector3.new(0,-i*0.7,0)
                                end
                            elseif Mode["Value"] == "Bounce" then
                                for i = 1,15 do
                                    task.wait()
                                    if not Enabled then return end
                                    velo.Velocity = Vector3.new(0,i*1.25+(flyup and 40 or 0)+(flydown and -40 or 0),0)
                                end
                                velo.Velocity = Vector3.new(0,0,0)
                                task.wait(0.05)
                                for i = 1,15 do
                                    task.wait()
                                    if not Enabled then return end
                                    velo.Velocity = Vector3.new(0,-i*1+(flyup and 40 or 0)+(flydown and -40 or 0),0)
                                end
                                task.wait(0.05)
                                velo.Velocity = Vector3.new(0,0,0)
                            else
                                Mode["Value"] = "Long"
                                lib["ToggleFuncs"]["Fly"](true)
                                task.wait(0.1)
                                lib["ToggleFuncs"]["Fly"](true)
                            end
                        end
                    end)
                end)
            else
                game:GetService("Workspace").Gravity = 196.2
                velo:Destroy()
                Connection:Disconnect()
                Connection2:Disconnect()
                flyup = false
                flydown = false
                if usedballoon == true then
                    usedballoon = false
                    bedwars["BalloonController"].deflateBalloon = olddeflate
                    bedwars["BalloonController"].deflateBalloon()
                    olddeflate = nil
                end
            end
        end
    })
    Mode = Fly:CreateDropDown({
        ["Name"] = "Mode",
        ["Function"] = function(v) 
            Mode["Value"] = v
        end,
        ["List"] = {"Long","TP","Funny","Moonsoon","Bounce"},
        ["Default"] = "Moonsoon"
    })
end)

--[[runcode(function()
    function GetBeds()
        local beds = {}
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if string.lower(v.Name) == "bed" and v:FindFirstChild("Covers") ~= nil and v:FindFirstChild("Covers").BrickColor ~= lplr.Team.TeamColor then
                table.insert(beds,v)
            end
        end
        return beds
    end
    function GetPlayers()
        local players = {}
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Team ~= lplr.Team and IsAlive(v) then
                table.insert(players,v)
            end
        end
        return players
    end
    local Enabled = false
    local AutoWin = Tabs["Exploits"]:CreateToggle({
        ["Name"] = "AutoWin",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    if GetMatchState() ~= 1 then
                        repeat task.wait() until GetMatchState() == 1 or not Enabled
                        if not Enabled then return end
                    end
                    local start = tick()
                    local beds = GetBeds()
                    for i,v in pairs(beds) do
                        repeat
                            task.wait(0.01)
                            if lplr:GetAttribute("DenyBlockBreak") == true then
                                lplr:SetAttribute("DenyBlockBreak",nil)
                            end
                            lplr.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame + Vector3.new(0,3,0)
                            local x = math.round(v.Position.X/3)
                            local y = math.round(v.Position.Y/3)
                            local z = math.round(v.Position.Z/3)
                            game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.DamageBlock:InvokeServer({
                                ["blockRef"] = {
                                    ["blockPosition"] = Vector3.new(x,y,z)
                                },
                                ["hitPosition"] = Vector3.new(x,y,z),
                                ["hitNormal"] = Vector3.new(x,y,z)
                            })
                        until not v:FindFirstChild("Covers") or not v or not Enabled
                        if not Enabled then return end
                    end
                    local players = GetPlayers()
                    for i, v in pairs(game:GetService("Players"):GetChildren()) do
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Team ~= game.Players.LocalPlayer.Team then
                print(v.Name)
                repeat wait(0.2)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                until v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild("Humanoid")
            end
        end
                    CreateNotification("AutoWin","Took "..math.abs(start - tick()).." Seconds/Ticks to win Game",5)
                end)
            end
        end
    })
end)--]]


runcode(function()
    local Connection
    local Enabled = false
    local NoClickDelay = Tabs["Utility"]:CreateToggle({
        ["Name"] = "NoNameTag",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                lplr.Character:WaitForChild("Head"):WaitForChild("NameTag"):Destroy()
                Connection = lplr.CharacterAdded:Connect(function(v)
                    v:WaitForChild("Head"):WaitForChild("NameTag"):Destroy()
                end)
            else
                Connection:Disconnect()
            end
        end
    })
end)

runcode(function()
    local MaxStuds = {["Value"] = 18}
    local function ChestStealerFunc()
        for i,v in pairs(game:GetService("CollectionService"):GetTagged("chest")) do
            local mag = (lplr.Character:FindFirstChild("HumanoidRootPart").Position - v.Position).Magnitude
            if mag < MaxStuds["Value"] then
                local chest = v:FindFirstChild("ChestFolderValue")
                chest = chest and chest.Value or nil
                local chestitems = chest and chest:GetChildren() or {}
                if #chestitems > 0 then
                    Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(chest)
                    for i3,v3 in pairs(chestitems) do
                        if v3:IsA("Accessory") then
                            pcall(function()
                                Client:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(v.ChestFolderValue.Value,v3)
                            end)
                        end
                    end
                    Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
                end
            end
        end
    end
    local Enabled = false
    local ChestStealer = Tabs["Utility"]:CreateToggle({
        ["Name"] = "ChestStealer",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    while task.wait(0.01) do
                        if Enabled == false then return end
                        if IsAlive(lplr) then
                            ChestStealerFunc()
                        end
                    end
                end)
            end
        end
    })
    MaxStuds = ChestStealer:CreateSlider({
        ["Name"] = "MaxStuds",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 18,
        ["Default"] = 18,
        ["Round"] = 1
    })
end)


runcode(function()
    local BedwarsSwords = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsSwords
    function hashFunc(vec) 
        return {value = vec}
    end
    local function GetInventory(plr)
        if not plr then 
            return {items = {}, armor = {}}
        end

        local suc, ret = pcall(function() 
            return require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil.getInventory(plr)
        end)

        if not suc then 
            return {items = {}, armor = {}}
        end

        if plr.Character and plr.Character:FindFirstChild("InventoryFolder") then 
            local invFolder = plr.Character:FindFirstChild("InventoryFolder").Value
            if not invFolder then return ret end
            for i,v in next, ret do 
                for i2, v2 in next, v do 
                    if typeof(v2) == 'table' and v2.itemType then
                        v2.instance = invFolder:FindFirstChild(v2.itemType)
                    end
                end
                if typeof(v) == 'table' and v.itemType then
                    v.instance = invFolder:FindFirstChild(v.itemType)
                end
            end
        end

        return ret
    end
    local function getSword()
        local highest, returning = -9e9, nil
        for i,v in next, GetInventory(lplr).items do 
            local power = table.find(BedwarsSwords, v.itemType)
            if not power then continue end
            if power > highest then 
                returning = v
                highest = power
            end
        end
        return returning
    end
    local VMAnim = false
    local HitRemote = Client:Get(bedwars["SwordRemote"])
    local origC0 = game:GetService("ReplicatedStorage").Assets.Viewmodel.RightHand.RightWrist.C0
    local DistVal = {["Value"] = 18}
    local AttackAnim = {["Enabled"] = true}
    local Bhop = {["Enabled"] = false}
    local Enabled = false
    local KillAura = Tabs["Combat"]:CreateToggle({
        ["Name"] = "Aura",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    repeat task.wait() until GetMatchState() ~= 0
                    if not Enabled then return end
                    while task.wait(0.1) do
                        if not Enabled then return end
                        for i,v in pairs(game:GetService("Players"):GetChildren()) do
                            if v.Team ~= lplr.Team and IsAlive(v) and IsAlive(lplr) and not v.Character:FindFirstChildOfClass("ForceField") then
                                local mag = (v.Character:FindFirstChild("HumanoidRootPart").Position - lplr.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
                                if mag < DistVal["Value"] then
                                    local sword = getSword()
                                    spawn(function()
                                        if AttackAnim["Enabled"] then
                                            local anim = Instance.new("Animation")
                                             anim.AnimationId = "rbxassetid://4947108314"
                                              local animator = lplr.Character:FindFirstChild("Humanoid"):FindFirstChild("Animator")
                                              animator:LoadAnimation(anim):Play()
                                              anim:Destroy()
                                             bedwars["ViewmodelController"]:playAnimation(15)
                                        end
                                    end)
				    spawn(function()
                                        if Bhop["Enabled"] then
                                            local character = game.Players.LocalPlayer.Character
                                            local nearest = getNearestPlayer(DistVal["Value"])
                                            if nearest ~= nil and nearest.Name ~= lplr.Name then
                                            character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0,1,0)
                                            task.wait(0.5)
                                          end
                                        end
                                    end)
                                    if sword ~= nil then
                                        bedwars["SwordController"].lastAttack = game:GetService("Workspace"):GetServerTimeNow() - 0.11
                                        local selfrootpos = (oldcloneroot or entity.character.HumanoidRootPart).Position
					local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 5) or Vector3.zero)
                                        HitRemote:SendToServer({
                                            ["weapon"] = sword["tool"],
                                            ["entityInstance"] = v.Character,
                                            ["validate"] = {
                                                ["raycast"] = {
                                                    ["cameraPosition"] = hashFunc(cam.CFrame.Position), 
                                                    ["cursorDirection"] = hashFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
                                                },
                                                ["targetPosition"] = hashFunc(v.Character:FindFirstChild("HumanoidRootPart").Position),
                                                ["selfPosition"] = hashFunc(selfPosition),
                                            }, 
                                            ["chargedAttack"] = {["chargeRatio"] = 0.8},
                                        })
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    })
    DistVal = KillAura:CreateSlider({
        ["Name"] = "Range",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 18,
        ["Default"] = 18,
        ["Round"] = 1
    })
    AttackAnim = KillAura:CreateOptionTog({
        ["Name"] = "Animation",
        ["Default"] = true,
        ["Func"] = function(v)
            AttackAnim["Enabled"] = v
        end
    })
    Bhop = KillAura:CreateOptionTog({
        ["Name"] = "Bhop",
        ["Default"] = true,
        ["Func"] = function(v)
            Bhop["Enabled"] = v
        end
    })
end)

runcode(function()
    local Enabled = false
    local TexturePack = Tabs["Utility"]:CreateToggle({
        ["Name"] = "TexturePack",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                lib["ToggleFuncs"]["TexturePack"](true)
                local obj = game:GetObjects("rbxassetid://12521227304")[1]
                obj.Name = "Part"
                obj.Parent = game:GetService("ReplicatedStorage")
                for i,v in pairs(obj:GetChildren()) do
                    if string.lower(v.Name):find("cross") then
                        for i2,b in pairs(v:GetChildren()) do
                            b:Destroy()
                        end
                    end
                end
                shared.con = game:GetService("ReplicatedStorage").ChildAdded:Connect(function(v)
                    for i,x in pairs(obj:GetChildren()) do
                        x:Clone().Parent = v
                    end
                    shared.con:Disconnect()
                end)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxpeprivate/CometV2/main/Modules/Texture.lua"))()
            end
        end
    })
end)



runcode(function()
    local old
    local Enabled = false
    local NoPingIndicator = Tabs["Render"]:CreateToggle({
        ["Name"] = "NoPingIndicator",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                old = bedwars["PingController"].createIndicator
                bedwars["PingController"].createIndicator = function() end
            else
                bedwars["PingController"].createIndicator = old
                old = nil
            end
        end
    })
end)

runcode(function()
    local Enabled = false
    local Watermark = {["Enabled"] = true}
    local ArrayList = Tabs["Render"]:CreateToggle({
        ["Name"] = "ArrayList",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                shared["Feather-ClientConfigs"].Enabled = true
            else
                shared["Feather-ClientConfigs"].Enabled = false
            end
        end
    })
end)

runcode(function()
    local BreakingMsg = false
    local params = RaycastParams.new()
    params.IgnoreWater = true
    function NukerFunction(part)
        local raycastResult = game:GetService("Workspace"):Raycast(part.Position + Vector3.new(0,24,0),Vector3.new(0,-27,0),params)
        if raycastResult then
            local targetblock = raycastResult.Instance
            for i,v in pairs(targetblock:GetChildren()) do
                if v:IsA("Texture") then
                   print("cool")
                end
            end
            --targetblock.Color = Color3.fromRGB(255,65,65)
            --targetblock.Material = Enum.Material.Neon
            game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.DamageBlock:InvokeServer({
                ["blockRef"] = {
                    ["blockPosition"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3))
                },
                ["hitPosition"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3)),
                ["hitNormal"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3))
            })
            if BreakingMsg == false then
                BreakingMsg = true
                createnotification("Nuker", "Breaking Bed..", 3)
                spawn(function()
                    task.wait(3)
                    BreakingMsg = false
                end)
            end
        end
    end
    function GetBeds()
        local beds = {}
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if string.lower(v.Name) == "bed" and v:FindFirstChild("Covers") ~= nil and v:FindFirstChild("Covers").BrickColor ~= lplr.Team.TeamColor then
                table.insert(beds,v)
            end
        end
        return beds
    end
    local Enabled = false
    local Distance = {["Value"] = 30}
    local Nuker = Tabs["World"]:CreateToggle({
        ["Name"] = "BedNuker",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    while task.wait(0.25) do
                        if not Enabled then return end
                        if IsAlive(lplr) then
                            local beds = GetBeds()
                            for i,v in pairs(beds) do
                                local mag = (v.Position - lplr.Character.PrimaryPart.Position).Magnitude
                                if mag < Distance["Value"] then
                                    NukerFunction(v)
                                end
                            end
                        end
                    end
                end)
            end
        end
    })
    Distance = Nuker:CreateSlider({
        ["Name"] = "Distance",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 30,
        ["Default"] = 30,
        ["Round"] = 10
    })
end)



runcode(function()
    local function CapeFunction(char,texture)
        local hum = char:WaitForChild("Humanoid")
        local torso = nil
        if hum.RigType == Enum.HumanoidRigType.R15 then
            torso = char:WaitForChild("UpperTorso")
        else
            torso = char:WaitForChild("Torso")
        end
        local p = Instance.new("Part",torso.Parent)
        p.Name = "Cape"
        p.Anchored = false
        p.CanCollide = false
        p.TopSurface = 0
        p.FormFactor = "Custom"
        p.BottomSurface = 0
        p.Size = Vector3.new(0.2,0.2,0.2)
        p.Transparency = 1
        local decal = Instance.new("Decal",p)
        decal.Texture = texture
        decal.Face = "Back"
        local msh = Instance.new("BlockMesh",p)
        msh.Scale = Vector3.new(9,17.5,0.5)
        local motor = Instance.new("Motor",p)
        motor.Part0 = p
        motor.Part1 = torso
        motor.MaxVelocity = 0.01
        motor.C0 = CFrame.new(0,2,0) * CFrame.Angles(0,math.rad(90),0)
        motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
        local wave = false
        repeat
            task.wait(1/44)
            decal.Transparency = torso.Transparency
            local ang = 0.1
            local oldmag = torso.Velocity.Magnitude
            local mv = 0.002
            if wave then
                ang = ang + ((torso.Velocity.Magnitude/10) * 0.05) + 0.05
                wave = false
            else
                wave = true
            end
            ang = ang + math.min(torso.Velocity.Magnitude/11,0.5)
            motor.MaxVelocity = math.min((torso.Velocity.Magnitude/111), 0.04)
            motor.DesiredAngle = -ang
            if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
                motor.MaxVelocity = 0.04
            end
            repeat task.wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.Magnitude - oldmag) >= (torso.Velocity.Magnitude/10) + 1
            if torso.Velocity.Magnitude < 0.1 then
                task.wait(0.1)
            end
        until not p or p.Parent ~= torso.Parent
    end
    local Connection
    local Enabled = false
    local Cape = Tabs["Render"]:CreateToggle({
        ["Name"] = "Cape",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    CapeFunction(lplr.Character,getasset("rektsky/assets/cape.png"))
                end)
                Connection = lplr.CharacterAdded:Connect(function(v)
                    task.wait(1.5)
                    spawn(function()
                        CapeFunction(lplr.Character,getasset("rektsky/assets/cape.png"))
                    end)
                end)
            else
                Connection:Disconnect()
                if lplr.Character:FindFirstChild("Cape") then
                    lplr.Character:FindFirstChild("Cape"):Destroy()
                end
            end
        end
    })
end)

runcode(function()
    local Messages = {"Pow!","Thump!","Wham!","Hit!","Smack!","Bang!","Pop!","Boom!"}
    local old
    local Enabled = false
    local FunnyIndicator = Tabs["Render"]:CreateToggle({
        ["Name"] = "FunnyIndicator",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                old = debug.getupvalue(bedwars["DamageIndicator"],10,{Create})
                debug.setupvalue(bedwars["DamageIndicator"],10,{
                    Create = function(self,obj,...)
                        spawn(function()
                            pcall(function()
                                obj.Parent.Text = Messages[math.random(1,#Messages)]
                                obj.Parent.TextColor3 = Color3.fromHSV(tick()%5/5,1,1)
                            end)
                        end)
                        return game:GetService("TweenService"):Create(obj,...)
                    end
                })
            else
                debug.setupvalue(bedwars["DamageIndicator"],10,{
                    Create = old
                })
                old = nil
            end
        end
    })
end)



runcode(function()
    local velo
    local Enabled = false
    local HighJump = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "HighJump",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                local hrp = lplr.Character:FindFirstChild("HumanoidRootPart")
                velo = Instance.new("BodyVelocity")
                velo.Velocity = Vector3.new(0,20,0)
                velo.MaxForce = Vector3.new(0,9e9,0)
                velo.Parent = hrp
                spawn(function()
                    while task.wait() do
                        if not Enabled then return end
                        for i = 1,20 do
                            task.wait()
                            if not Enabled then return end
                            velo.Velocity = velo.Velocity + Vector3.new(0,Val["Value"],0)
                        end
                    end
                end)
            else
                if velo then
                    velo:Destroy()
                    velo = nil
                end
            end
        end
    })
   Val = HighJump:CreateSlider({
        ["Name"] = "Val",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 5,
        ["Default"] = 0.30,
        ["Round"] = 1
    })
end)




runcode(function()
    local Enabled = false
    local AutoPlayAgain = Tabs["Utility"]:CreateToggle({
        ["Name"] = "AutoPlayAgain",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    repeat task.wait(3) until GetMatchState() == 2 or not Enabled
                    if not Enabled then return end
                    game:GetService("ReplicatedStorage"):FindFirstChild("events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events").joinQueue:FireServer({["queueType"] = getQueueType()})
                    return
                end)
            end
        end
    })
end)


runcode(function()
    local Enabled = false
    local NewGravity = {["Value"] = 0}
    local Gravity = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "Gravity",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    while task.wait() do
                        if not Enabled then return end
                        game:GetService("Workspace").Gravity = NewGravity["Value"]
                    end
                end)
            else
                game:GetService("Workspace").Gravity = 196.2
            end
        end
    })
    NewGravity = Gravity:CreateSlider({
        ["Name"] = "New",
        ["Function"] = function(v)
            if Enabled then
                game:GetService("Workspace").Gravity = v
            end
        end,
        ["Min"] = 0,
        ["Max"] = 200,
        ["Default"] = 0,
        ["Round"] = 10
    })
end)

runcode(function()
    local Enabled = false
    local Funnyfly = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "Funnyfly",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                local origy = lplr.Character.HumanoidRootPart.Position.y
				part = Instance.new("Part", workspace)
				part.Size = Vector3.new(1,1,1)
				part.Transparency = 1
				part.Anchored = true
				part.CanCollide = false
				workspace.CurrentCamera.CameraSubject = part
				RunLoops:BindToHeartbeat("FunnyFlyPart", 1, function()
					local pos = lplr.Character.HumanoidRootPart.Position
					part.Position = Vector3.new(pos.x, origy, pos.z)
				end)
				local cf = lplr.Character.HumanoidRootPart.CFrame
				lplr.Character.HumanoidRootPart.CFrame = CFrame.new(cf.x, 300000, cf.z)
				if lplr.Character.HumanoidRootPart.Position.X < 50000 then 
					lplr.Character.HumanoidRootPart.CFrame *= CFrame.new(0, 100000, 0)
				end
			else
				RunLoops:UnbindFromHeartbeat("FunnyFlyPart")
				local pos = lplr.Character.HumanoidRootPart.Position
				local rcparams = RaycastParams.new()
				rcparams.FilterType = Enum.RaycastFilterType.Whitelist
				rcparams.FilterDescendantsInstances = {workspace.Map}
				local rc = workspace:Raycast(Vector3.new(pos.x, 300, pos.z), Vector3.new(0,-1000,0), rcparams)
				if rc and rc.Position then
					lplr.Character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0,3,0)
				end
				workspace.CurrentCamera.CameraSubject = lplr.Character
				if part then part:Destroy() end
				RunLoops:BindToHeartbeat("FunnyFlyVeloEnd", 1, function()
					lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
					lplr.Character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0,3,0)
				end)
				task.wait(1)
				RunLoops:UnbindFromHeartbeat("FunnyFlyVeloEnd")
			end
		end
    })
end)


--[[runcode(function()
    local Enabled = false
    local MidTP = Tabs["Utility"]:CreateToggle({
        ["Name"] = "MidTP",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
               game.Players.LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(0, 900, 0)
                      wait(3.8)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").RespawnView.CFrame
                        wait(0.1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").RespawnView.CFrame
                        wait(0.11)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").RespawnView.CFrame
                        wait(0.11)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").RespawnView.CFrame
                        wait(0.11)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").RespawnView.CFrame
                        wait(0.1)
                end
          end
    })
end)--]]

runcode(function() -- Credits to lxvl xv#6969
	local UserInputService = game:GetService("UserInputService")
	local PlaceAnywhere = false
	local function onInputBegan(input, _gameProcessed)
		if PlaceAnywhere == true then
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				local MouseHit = game:GetService("Players").LocalPlayer:GetMouse().Hit
				local Rounds = {
					X = math.round(MouseHit.X/3),
					Y = math.round(MouseHit.Y/3),
					Z = math.round(MouseHit.Z/3)
				}

				for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
					if (v:IsA("Accessory")) and v:FindFirstChild("Handle") and v:FindFirstChild("Handle"):FindFirstChild("Back") then
						game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.PlaceBlock:InvokeServer({
							["position"] = Vector3.new(Rounds.X, Rounds.Y, Rounds.Z),
							["blockType"] = v.Name,
						})
					end
				end
			end
		end
	end
    local BlockExploit = {["Enabled"] = false}
    local BlockExploit  = Tabs["Utility"]:CreateToggle({
        ["Name"] = "IgonorePlaceRegions",
        ["Callback"] = function(callback)
            if callback then
			PlaceAnywhere = true
			UserInputService.InputBegan:Connect(onInputBegan)
			else
			      PlaceAnywhere = false
			      UserInputService.InputBegan:Connect(onInputBegan)
			end
		end
    })
end)

runcode(function()
    local clone
    local char
    local Enabled = false
    local Blink = Tabs["Render"]:CreateToggle({
        ["Name"] = "Blink",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                settings():GetService("NetworkSettings").IncomingReplicationLag = 99e99
                char = lplr.Character
                char.Archivable = true
                clone = char:Clone()
                clone.Parent = game:GetService("Workspace")
                cam.CameraSubject = clone:FindFirstChild("Humanoid")
                char.Parent = nil
                lplr.Character = clone
                clone:FindFirstChild("Animate").Disabled = true
                clone:FindFirstChild("Animate").Disabled = false
                clone:FindFirstChild("HumanoidRootPart").Anchored = false
                settings():GetService("NetworkSettings").IncomingReplicationLag = 0
            else
                settings():GetService("NetworkSettings").IncomingReplicationLag = 99e99
                clone:Destroy()
                char.Parent = game:GetService("Workspace")
                lplr.Character = char
                cam.CameraSubject = char:FindFirstChild("Humanoid")
                char:FindFirstChild("Animate").Disabled = true
                char:FindFirstChild("Animate").Disabled = false
                settings():GetService("NetworkSettings").IncomingReplicationLag = 0
            end
        end
    })
end)


runcode(function()
    local Connection
    local Enabled = false
    local Noclip = Tabs["Render"]:CreateToggle({
        ["Name"] = "Noclip",
        ["Callback"] = function(Callback)
                 Enabled = Callback
                 if Enabled then
                    Connection = uis.InputBegan:Connect(function(input)
                        if input.KeyCode == Enum.KeyCode.LeftShift then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * (TP["Value"])
                  end
            end)
            else
                Connection:Disconnect()
            end
        end
    })
 TP = Noclip:CreateSlider({
        ["Name"] = "Distance",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 5,
        ["Default"] = 1,
        ["Round"] = 1
    })
end)

runcode(function()
    local JumpConnection
    local infjump = {["Enabled"] = false}
    local Enabled = false
    local infjump = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "InfJump",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                 JumpConnection = uis.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Space then
                    lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                end
            end)
        else
            if JumpConnection then
                JumpConnection:Disconnect()
            end
        end
    end
    })
end)

local players = game:GetService("Players")
runcode(function()
    local Enabled = false
    local Autoreport = Tabs["Render"]:CreateToggle({
        ["Name"] = "Autoreport ",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                task.spawn(function()
					repeat
						task.wait()
						for i,v in pairs(players:GetPlayers()) do 
								task.wait(1)
								bedwars["ClientHandler"]:Get(bedwars["ReportRemote"]):SendToServer(v.UserId)
						end
					until not Enabled
				end)
			end	
		end,
    })
end)

runcode(function()
    local oldsounds = bedwars["GameSound"]
	local newsounds = bedwars["GameSound"]
	newsounds.DAMAGE_1 = "rbxassetid://6361963422"
	newsounds.DAMAGE = "rbxassetid://6361963422"
	newsounds.DAMAGE_2 = "rbxassetid://6361963422"
	newsounds.DAMAGE_3 = "rbxassetid://6361963422"
	newsounds.KILL = "rbxassetid://1053296915"
	newsounds.STATIC_HIT = "rbxassetid://6361963422"
	newsounds.UI_CLICK = "rbxassetid://535716488"
	newsounds.WOOL_BREAK = "rbxassetid://6496157434"
	local sounds = {["Enabled"] = false}
        local Sounds = Tabs["Render"]:CreateToggle({
        ["Name"] = "MC sounds",
        ["Callback"] = function(callback)
            if callback then
			bedwars["Sound"].GameSound = newsounds
		else
			local oldsounds = bedwars["GameSound"]
			end
		end
    })
end)

--[[runcode(function()
    local JumpConnection
    local infjump = {["Enabled"] = false}
    local Enabled = false
    local infjump = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "Jump",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                 getgenv().HopDelay = 50 -- Default Value = 20
getgenv().Boost = true -- Default Value = true
getgenv().BoostStuds = 0.4 -- Default Value = 0.2
getgenv().HopBoost = true -- Default Value = true
getgenv().HopBoostStuds = 1.5 -- Default Value = 1.5
local UIS = game:GetService("UserInputService")
local Enabled = false
            Enabled = not Enabled
            local CHead = game.Players.LocalPlayer.Character.Head.Position
            local CY = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y
            local i = 0
            local UpDebounce = 0
            local DownDebounce = 0
            
            if Enabled then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, 0))
            end
            while Enabled do
                game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                i = i + 1
                
                local AntiFall = Instance.new("Part", game.Workspace)
                local Mark = Instance.new("Part", game.Workspace)
                AntiFall.Name = "CollidePart"
                Mark.Name = "Mark"
                AntiFall.Anchored = true
                Mark.Anchored = true
                AntiFall.Size = Vector3.new(3, 1, 3)
                Mark.Size = Vector3.new(3, 0.01, 3)
                AntiFall.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, CY - 3.499, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
                Mark.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, CHead.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z) + Vector3.new(0, 1, 0)
                AntiFall.Material = Enum.Material.Neon
                Mark.Material = Enum.Material.Neon
                AntiFall.BrickColor = BrickColor.new("Really blue")
                if Mark.Position.Y > game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y then
                    Mark.BrickColor = BrickColor.new("Lime green")
                else
                    Mark.BrickColor = BrickColor.new("Really red")
                end
                Mark.CanCollide = false
                
                if i <= getgenv().HopDelay / 2 and getgenv().Boost then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, -getgenv().BoostStuds))
                end
                
                if i >= getgenv().HopDelay then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 1, 0))
                    if getgenv().HopBoost then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, -getgenv().HopBoostStuds))
                    end
                    i = 0
                end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then
                    UpDebounce = UpDebounce + 1
                    i = getgenv().HopDelay - 5
                    if UpDebounce >= 5 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 3, 0))
                        CY = CY + 3
                        UpDebounce = 0
                    else
                        CY = CY - 0.1
                    end
                end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
                    if CY >= game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y - 5 then
                        DownDebounce = DownDebounce + 1
                        i = getgenv().HopDelay - 5
                        if DownDebounce >= 5 then
                            CY = CY - 3
                            DownDebounce = 0
                        else
                            CY = CY + 0.1
                        end
                    end
                end
	else
                wait()
                AntiFall:Destroy()
                Mark:Destroy()
            end
            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
    })
end)--]]

runcode(function()
        local Expand = {["Value"] = 1}
        local function getwool()
        for i,v in pairs(lplr.Character:FindFirstChild("InventoryFolder").Value:GetChildren()) do
            if string.lower(v.Name):find("wool") then
                return {
                    Obj = v,
                    Amount = v:GetAttribute("Amount")
                }
            end
        end
        return nil
    end
    local function getwoolamount()
        local value = 0
        for i,v in pairs(lplr.Character:FindFirstChild("InventoryFolder").Value:GetChildren()) do
            if string.lower(v.Name):find("wool") then
                value = value + v:GetAttribute("Amount")
            end
        end
        return value
    end
    local function getpos()
        local primpart = lplr.Character.PrimaryPart
        local x = math.round(primpart.Position.X/1)
        local y = math.round(primpart.Position.Y/1)
        local z = math.round(primpart.Position.Z/1)
        local realexpand = Expand["Value"] + 1
        return Vector3.new(x,y,z) + (lplr.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * math.round(Expand["Value"]))
    end
    local ShowAmount = {["Enabled"] = false}
    local Scaffold = Tabs["Utility"]:CreateToggle({
        ["Name"] = "Scaffold",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                spawn(function()
                    while task.wait() do
                        if not Enabled then return end
                        if IsAlive(lplr) then
                            if getwool() ~= nil then
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.PlaceBlock:InvokeServer({
                                    ["position"] = getpos(),
                                    ["blockType"] = getwool().Obj.Name
                                })
                            end
                        end
                    end
                end)
            end
        end
    })
    Expand = Scaffold:CreateSlider({
        ["Name"] = "Expand",
        ["Function"] = function() end,
        ["Min"] = 1,
        ["Max"] = 10,
        ["Default"] = 1,
        ["Round"] = 1
    })
end)

runcode(function()
	function HasA()
        if IsAlive(lplr) and lplr.Character:FindFirstChild("InventoryFolder").Value:FindFirstChild("hang_glider") then
            return true
        end
        return false
    end
        local AnticheatDisabler = Tabs["Render"]:CreateToggle({
        ["Name"] = "AnticheatDisabler",
        ["Callback"] = function(callback)
            if callback then
	     if not HasA() then
                    lib["ToggleFuncs"]["AnticheatDisabler"](true)
		    createnotification("AnticheatDisabler", "You need an hang glider or to be alive....", 3)
                    return
                end
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.HangGliderUse:FireServer()
		   wait(1)
		   for i,v in pairs(game:GetService("Workspace").Gliders:GetChildren()) do
                      v:Remove()
		 end
	     end
	end
    })
end)





runcode(function()
	local items = {"iron", "emerald", "diamond"}
            local getshops = function()
                local shops = {}
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name:find("item_shop") or v.Name:find("upgrade_shop") then
                        table.insert(shops, v)
                    end
                end
                return shops
            end
            local isnearshop = function()
                local shops = getshops()
                for i,v in pairs(shops) do
                    local mag = (lplr.Character.HumanoidRootPart.Position - v.Position).Magnitude
                    if mag < 20 then
                        return true
                    end
                end
                return false
            end
            local getinv = function()
                return lplr.Character.InventoryFolder.Value
            end
            local getpersonal = function()
                return game:GetService("ReplicatedStorage").Inventories:FindFirstChild(lplr.Name.."_personal")
            end
            local getitems = function()
                local personal = getpersonal()
                local inv = getinv()
                for i, item in pairs(items) do
                    if personal:FindFirstChild(item) then
                        Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(personal)
                        Client:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(personal, personal[item])
                        Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
                    end
                end
            end
            local takeitems = function()
                local personal = getpersonal()
                local inv = getinv()
                for i, item in pairs(items) do
                    if inv:FindFirstChild(item) then
                        Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(personal)
                        Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(personal, inv[item])
                        Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
                    end
                end
            end
        local AnticheatDisabler = Tabs["Utility"]:CreateToggle({
        ["Name"] = "Auto Bank",
        ["Callback"] = function(Callback)
             Enabled = Callback
		if Enabled then
                    spawn(function()
                            repeat
                                task.wait(0.1)
                                if IsAlive(lplr) then
                                    if isnearshop() then
                                        getitems()
                                    else
                                        takeitems()
                                    end
                                end
                            until not Enabled
                        end)
                    end
                end
    })
end)
--credits to spring
game.Players.PlayerAdded:Connect(function(plr)
	if checkstate(plr) then
		repstorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." "..clients.ChatStrings2.Feather, "All")
	end
end)

for i,v in pairs(game.Players:GetPlayers()) do
	if checkstate(v) then
		repstorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..v.Name.." "..clients.ChatStrings2.Feather, "All")
	end
end

if checkstate(lplr) then
	local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
	local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");

	local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering");

	-- main
	onMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
		local speaker, message = players[messageData.FromSpeaker], messageData.Message
		if message == "/w "..lplr.Name.." "..clients.ChatStrings2.Feather then
                        createnotification("Feather", speaker.Name.." is using Feather!", 60)
		end
	end);
end


if checkstate(lplr) then
    local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
	local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");

    local function onMessageDoneFiltering(msg)
	local args = {
		[1] = msg,
		[2] = "All"
	}
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
  end

	-- main
	onMessageDoneFiltering.Chatted:Connect(function(msg)
		 if msg == ";kick default" then
                    game:GetService("Players").LocalPlayer:kick("l")
              end
	end);
  end

update_tag_meta()


--[[for i, v in pairs(game:GetService("Players"):GetChildren()) do
    if game:GetService("Players").LocalPlayer ~= v then
        if checkstate(lplr) then
            v.Chatted:Connect(function(msg)
                if msg == ";kick default" then
                    game:GetService("Players").LocalPlayer:kick("l")
                  end
                 end
              end)--]]

