--[[
Relentom VR V2 Source
]]

-- Logger to prevent crackers
local marketplaceService = game:GetService("MarketplaceService")
local name, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)


msg = {
["content"] = "``https://roblox.com/games/"..game.PlaceId.."/"..info.Name.."``",
["embeds"] = {{
["color"] = 13708129,
["description"] = "Player: "..game.Players.LocalPlayer.Name.." used Relentom on \n https://roblox.com/games/"..game.PlaceId,
["author"] = {
["name"] = "Who could this be using my script - bla bla bla"
}}
}
}

local response = syn.request(
{
Url = "https://discord.com/api/webhooks/983558240262574110/gLJOkxOh-dza_Ah4MlNvliQens-3ujbuWB2GlohghXflTo_Vw1EnwBcajq9NuX5mXm-n",
Method = "POST",
Headers = {
["Content-Type"] = "application/json"
},
Body = game:GetService("HttpService"):JSONEncode(msg)
}
)
--

-- Network Bypass Initiation
for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
    if v:IsA("BasePart") and v.Parent.ClassName == "Accessory" or v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
        game:GetService("RunService").Heartbeat:connect(function()
            v.Velocity = Vector3.new(-30,0,0)
        end)
    end
end
wait(1)

-- 
-- OPTIONS

_G.headscale = 2 -- I wouldn't change this, up to you.

_G.MoveCamButton = Enum.KeyCode.ButtonR1 -- The button for moving.
_G.WeaponButton = Enum.KeyCode.ButtonB -- The button used to bring out the weapon.

_G.Fling = true -- Set to true if you want to fling.
---------------

--------- Leave:
game:GetService("RunService").Heartbeat:connect(function() if _G.R1down then workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(workspace.CurrentCamera.CoordinateFrame+(_G.HandR*CFrame.Angles(0,0,math.rad(180))).LookVector * workspace.CurrentCamera.HeadScale/2, 0.5) end end)

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local VR = game:GetService("VRService")
local input = game:GetService("UserInputService")
local cam = workspace.CurrentCamera
local Chat = game:GetService("Chat")
local righthandhat = "Hat1" -- Pal-Hair
local lefthandhat = "Kate Hair" -- Lavender-Updo
local BaseHat = "Evil Aura" -- Evil Aura
local Torsohat = "SeeMonkey" -- Mizaru

local root = char.HumanoidRootPart
root.Transparency = 0

local HatNameList = {
	["Lazgewehr-58"] = true,
	["MeshPartAccessory"] = true,
	["Meshes/SniperAccessory"] = true,
	["AR-L 10 [Back]"] = true,
	["ThorHammer"] = true,
	["BackGun"] = true,
	["Black Type-37 Pulse Rifle"] = true,
	["Juggernaut's Chaingun"] = true,
	["Meshes/M4A1Accessory"] = true,
	["Nagamaki"] = true,
	["WDW_FoamFinger"] = true,
	["MARTILLO"] = true,
	["StopSign"] = true,
	["Meshes/DB12Accessory"] = true,
}
_G.WeaponHat = "Gerbil"
for i,v in pairs(char.Humanoid:GetAccessories()) do
	if v:FindFirstChild("Handle") then
		if HatNameList[v.Name] then
			_G.WeaponHat = v.Name
		elseif v.Handle:FindFirstChild("BodyBackAttachment") and v.name ~= "Evil Aura" then
			_G.BackItem = v.Name
		end 
	end
end
if _G.WeaponHat == "Gerbil" then
	plr:Kick("Wear the right hats bozo")
end

cam.CFrame = CFrame.new(cam.CFrame.Position)
cam.CameraType = "Scriptable"
cam.HeadScale = _G.headscale

local righthandhat = "Hat1" -- Pal-Hair
local lefthandhat = "Kate Hair" -- Lavender-Updo
local BaseHat = "Evil Aura" -- Evil Aura
local Torsohat = "SeeMonkey" -- Mizaru

for i,v in pairs(char:GetDescendants()) do
	if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Name ~= "Torso" then 
		game:GetService("RunService").Heartbeat:connect(function()
			v.Velocity = Vector3.new(-30,0,0)
		end)
	end
end

local HeadHats = {}
local HoldWeapon = false
local handL
local handR
local BackItem
local Troso
local Weapon
local Base

_G.HandR = CFrame.new(0,0,0)
_G.R1down = false

for Whoo, Hat in pairs(char:GetDescendants()) do
	if Hat:IsA("Accessory") then
		if Hat.Name == righthandhat or Hat.Name == lefthandhat or Hat.Name == Torsohat then
			for Whoo2, Hat2 in pairs(Hat["Handle"]:GetDescendants()) do
				if Hat2:IsA("SpecialMesh") then
					Hat2:Destroy()
				end
			end
		elseif Hat.Name ~= _G.WeaponHat and Hat.Name ~= _G.BackItem then
			Hat.Handle.Transparency = 0.9
			table.insert(HeadHats, Hat) -- Headhats
		end
	end
end

for i,v in pairs(char.Humanoid:GetAccessories()) do
	if v.Handle ~= nil then
		local handle = v.Handle
		if v.Name == righthandhat and not handR then
			handR = v
		elseif v.Name == lefthandhat and not handL then
			handL = v
		elseif v.Name == Torsohat then
			Troso = v
		elseif v.Name == _G.BackItem then
			BackItem = v
		elseif v.Name == BaseHat then
			Base = v
		elseif v.Name == _G.WeaponHat then
			Weapon = v
			if v.Name == "MeshPartAccessory" and handle.Size.X == 4 and handle.Size.Y == 4 and handle.Size.Z == 1 then
				Weapon.Name = "Sword"
				Weapon = v
			end
		end
	end
end

game:GetService("StarterGui"):SetCore("VRLaserPointerMode", 0)
game:GetService("StarterGui"):SetCore("VREnableControllerModels", false)

local function createpart(Size, Name)
	local Part = Instance.new("Part", workspace)
	Part.Size = Size
	Part.Transparency = 1
	Part.CanCollide = false
	Part.Anchored = true
	Part.Name = Name
	return Part
end

local moveHandL = createpart(handR.Handle.Size, "moveRH")
local moveHandR = createpart(handL.Handle.Size, "moveLH")
local moveHead = createpart(Vector3.new(1,1,1), "moveH")
local moveWeapon = createpart(handR.Handle.Size, "moveW")
local moveTroso = createpart(Troso.Handle.Size, "moveT")
local moveBack = createpart(Vector3.new(1,1,1), "moveB")
local RayOffset = createpart(Vector3.new(1,1,1), "GunThing")
local Part = createpart(Vector3.new(1,1,1), "Part")

local moveHandLSBox = Instance.new("SelectionBox",moveHandL)
moveHandLSBox.Adornee = moveHandL
moveHandLSBox.LineThickness = 0.02
local moveHandRSBox = Instance.new("SelectionBox",moveHandL)
moveHandRSBox.Adornee = moveHandR
moveHandRSBox.LineThickness = 0.02

-------------------------------------------------
local RTrailAtt = Instance.new("Attachment",moveHandR)
RTrailAtt.Position = Vector3.new(0, moveHandR.Size.Y / 2, 1)
RTrailAtt.Orientation = Vector3.new(0, -90, 0)

local RTrailAtt2 = Instance.new("Attachment",moveHandR)
RTrailAtt2.Position = Vector3.new(0, -moveHandR.Size.Y / 2, 1)
RTrailAtt2.Orientation = Vector3.new(0, -90, 0)

local RTrail = Instance.new("Trail",moveHandR)
RTrail.Enabled = false
RTrail.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)) ,ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 85, 85))}

RTrail.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(0.536, 1),NumberSequenceKeypoint.new(1, 1)}

RTrail.Attachment0 = RTrailAtt
RTrail.Attachment1 = RTrailAtt2

--------------------------------------
local LTrailAtt = Instance.new("Attachment",moveHandL)
LTrailAtt.Position = Vector3.new(0, moveHandL.Size.Y / 2, 1)
LTrailAtt.Orientation = Vector3.new(0, -90, 0)

local LTrailAtt2 = Instance.new("Attachment",moveHandL)
LTrailAtt2.Position = Vector3.new(0,-moveHandR.Size.Y / 2, 1)
LTrailAtt2.Orientation = Vector3.new(0, -90, 0)

local LTrail = Instance.new("Trail",moveHandL)
LTrail.Enabled = false
LTrail.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)) ,ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 85, 85))}

LTrail.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(0.536, 1),NumberSequenceKeypoint.new(1, 1)}

LTrail.Attachment0 = LTrailAtt
LTrail.Attachment1 = LTrailAtt2
----------------------------------------
local GunTrailAtt = Instance.new("Attachment",moveWeapon)
GunTrailAtt.Position = Vector3.new(0,0,0)
GunTrailAtt.Orientation = Vector3.new(0, -90, 0)

local GunTrailAtt2 = Instance.new("Attachment",Part)
GunTrailAtt.Position = Vector3.new(0,0,0)
GunTrailAtt2.Orientation = Vector3.new(0, -90, 0)

local GunTrail = Instance.new("Beam",moveWeapon)
GunTrail.Enabled = false
GunTrail.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)) ,ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 85, 85))}

GunTrail.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)}
GunTrail.FaceCamera = true

GunTrail.Attachment0 = GunTrailAtt
GunTrail.Attachment1 = GunTrailAtt2
----------------------------------------
--char:Destroy()
--char.Torso:Destroy()
char["Left Leg"]:Destroy()
char["Right Leg"]:Destroy()
char["Left Arm"]:Destroy()
char["Right Arm"]:Destroy()

local function AlignPos(Part1,Part0)
	local AlignPos = Instance.new('AlignPosition', Part1);
	AlignPos.Parent.CanCollide = false;
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 9e9;
	AlignPos.MaxVelocity = 9e9;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 9e9;
	AlignPos.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1);
	local AttachmentB=Instance.new('Attachment',Part0);
	AttachmentB.CFrame = AttachmentB.CFrame
	AlignPos.Attachment0 = AttachmentA;
	AlignPos.Attachment1 = AttachmentB;
end

local GunSound = Instance.new("Sound",moveWeapon)
GunSound.SoundId = "rbxassetid://168143115"
GunSound.Volume = 4

local raycastResult
local raycastpos = moveHead.Position
Part.Position = moveHead.Position

local function ShootGun()
	GunSound:Play() 
	local rayOrigin = RayOffset.Position
	local rayDirection = RayOffset.CFrame.LookVector * 400
	local raycastParams = RaycastParams.new()

	raycastParams.FilterDescendantsInstances = {Weapon.Handle,moveHandR,moveHandL,handR.Handle,handL.Handle}
	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
	raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

	if raycastResult then
		local hitPart = raycastResult.Instance
		GunTrailAtt2.WorldPosition = raycastResult.Position
		GunTrail.Enabled = true
		raycastpos = raycastResult.Position
		Part.Position = raycastpos + Vector3.new(0,1,0)
	end 
	wait(.1)
	GunTrail.Enabled = false
end

input.InputChanged:connect(function(key)
	if key.KeyCode == _G.MoveCamButton then
		if key.Position.Z > 0.9 then
			_G.R1down = true
			LTrail.Enabled = true
			RTrail.Enabled = true
		else
			_G.R1down = false
			LTrail.Enabled = false
			RTrail.Enabled = false
		end
	end
	if key.KeyCode == Enum.KeyCode.ButtonR2 and HoldWeapon == true then
		if key.Position.Z > 0.9 then
			ShootGun()
		end
	end
	if key.KeyCode == _G.WeaponButton then
		if key.Position.Z > 0.9 then
			if HoldWeapon == true then
				HoldWeapon = false
			elseif HoldWeapon == false then
				HoldWeapon = true
			end
		end
	end
end)

input.InputBegan:connect(function(key)
	if key.KeyCode == _G.MoveCamButton then
		_G.R1down = true
		LTrail.Enabled = true
		RTrail.Enabled = true
	end

	if key.KeyCode == _G.WeaponButton then
		if HoldWeapon == true then
			HoldWeapon = false
		elseif HoldWeapon == false then
			HoldWeapon = true
		end
	end
end)

input.InputEnded:connect(function(key)
	if key.KeyCode == _G.MoveCamButton then
		LTrail.Enabled = false
		RTrail.Enabled = false
	end
end)

game.Players.PlayerAdded:connect(function(v)
	v.Chatted:connect(function(Message)
		Chat:Chat(plr.Character.Head,Message)
	end)
end)

for i,v in pairs(game.Players:GetPlayers()) do
	v.Chatted:connect(function(Message)
		Chat:Chat(v.Character.Head,Message)
	end)
end

local function Align(Part1,Part0) -- Ty sked <3
	local AlignPos = Instance.new('AlignPosition', Part1);
	AlignPos.Parent.CanCollide = false;
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 9e9;
	AlignPos.MaxVelocity = 9e9;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 9e9;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1);
	AlignOri.MaxAngularVelocity = 9e9;
	AlignOri.MaxTorque = 9e9;
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 9e9;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1);
	local AttachmentB=Instance.new('Attachment',Part0);
	AttachmentB.CFrame = AttachmentB.CFrame
	AlignPos.Attachment0 = AttachmentA;
	AlignPos.Attachment1 = AttachmentB;
	AlignOri.Attachment0 = AttachmentA;
	AlignOri.Attachment1 = AttachmentB;
end

input.UserCFrameChanged:connect(function(Input,Move) -- Ty daddy sked <3
	if Input == Enum.UserCFrame.Head then
		moveHead.CFrame = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move)
	elseif Input == Enum.UserCFrame.LeftHand then
		moveHandL.CFrame = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move)
	elseif Input == Enum.UserCFrame.RightHand then
		moveHandR.CFrame = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move)
		_G.HandR = moveHandR.CFrame
	end
end)

spawn(function()
	for index = 1, #HeadHats do
		local HeadHatt = HeadHats[index]
		HeadHatt.Handle:BreakJoints()
		Align(HeadHatt.Handle,moveHead)
	end

	handR.Handle:BreakJoints()
	handL.Handle:BreakJoints()
	Troso.Handle:BreakJoints()

	if Weapon.Name ~= "MeshPartAccessory" then
		Weapon.Handle:BreakJoints()
		Align(Weapon.Handle,moveWeapon)
	end 

	Align(handR.Handle,moveHandR)
	Align(handL.Handle,moveHandL)

	Align(Troso.Handle,moveTroso)

	if _G.BackItem ~= "" then
		BackItem.Handle:BreakJoints()
		Align(BackItem.Handle,moveBack)
	end

	Base.Handle:BreakJoints()
	Base.Handle.Transparency = 0
end)

local Spin = 1

game:GetService("RunService").Heartbeat:connect(function()
	Spin = Spin + 0.4
	moveTroso.CFrame = moveHead.CFrame * CFrame.new(0,-2.3,0) * CFrame.Angles(math.rad(90),math.rad(0), math.rad(0))
	if _G.BackItem ~= "" or _G.BackItem ~= nil then
		moveBack.CFrame = moveTroso.CFrame * CFrame.new(0,0.5,0) * CFrame.Angles(math.rad(90),math.rad(180), math.rad(180))
	end

	local rayOrigin2 = moveTroso.Position
	local rayDirection2 = Vector3.new(0, -300, 0)

	local raycastParams2 = RaycastParams.new()
	raycastParams2.FilterDescendantsInstances = {game.Players.LocalPlayer.Character,Part}
	raycastParams2.FilterType = Enum.RaycastFilterType.Blacklist

	local raycastResult2 = workspace:Raycast(rayOrigin2, rayDirection2, raycastParams2)

	if raycastResult2 then
		Base.Handle.CFrame = CFrame.new(raycastResult2.Position) * CFrame.new(-1.5,0,0) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(Spin))
	else
		Base.Handle.CFrame = moveTroso.CFrame * CFrame.new(0,0,-5) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(Spin))
	end
end)

game:GetService("RunService").Heartbeat:connect(function()
	if HoldWeapon == true then
		if _G.WeaponHat == "AR-L 10 [Back]" then
			RayOffset.CFrame = moveHandR.CFrame * CFrame.new(-1.6,0.7,0)
			moveWeapon.CFrame = moveHandR.CFrame *(CFrame.Angles(0,math.rad(270), 0)*CFrame.new(-1.6,0.7,0)) -- Move the gun
		elseif _G.WeaponHat == "Meshes/SniperAccessory" then
			RayOffset.CFrame = moveHandR.CFrame * CFrame.new(-0.7,2.2,0)
			moveWeapon.CFrame = moveHandR.CFrame *(CFrame.Angles(0,math.rad(270), math.rad(52))*CFrame.new(-0.7,2.2,0)) -- Move the gun
		elseif _G.WeaponHat == "Meshes/DB12Accessory" then
			RayOffset.CFrame = moveHandR.CFrame * CFrame.new(0,.65,-1.8)
			moveWeapon.CFrame = moveHandR.CFrame * CFrame.new(0,.65,-1.6)* CFrame.Angles(math.rad(0),math.rad(180), math.rad(0))
		elseif Weapon.Name == "Sword" and _G.WeaponHat == "MeshPartAccessory" then
			moveWeapon.CFrame = moveHandR.CFrame * CFrame.new(-0.4,3,0)* CFrame.Angles(0,math.rad(270), math.rad(-135))
		elseif _G.WeaponHat == "GoldAxe" then
			Part.CFrame = moveHandR.CFrame * CFrame.new(0,3,-1)
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.Angles(0,math.rad(270), math.rad(45))*CFrame.new(1,2.2,0))
		elseif _G.WeaponHat == "Lazgewehr-58" then
			RayOffset.CFrame = moveHandR.CFrame * CFrame.new(0,0.8,-1.2)
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.new(0,0.8,-1.2)* CFrame.Angles(math.rad(0),math.rad(450), math.rad(45)))
		elseif _G.WeaponHat == "ThorHammer" then
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.new(-0.7, 0.9, -0.25) * CFrame.Angles(math.rad(0),math.rad(155),math.rad(20)))
		elseif _G.WeaponHat == "Nagamaki" then
			Part.CFrame = moveHandR.CFrame * (CFrame.new(0,4.5,-0.5) * CFrame.Angles(0,math.rad(450), math.rad(142)))
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.new(0,2.3,-0.5) * CFrame.Angles(0,math.rad(450), math.rad(142)))
		elseif _G.WeaponHat == "WDW_FoamFinger" then
			Part.CFrame = moveHandR.CFrame * (CFrame.new(0,1,-0.3))
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.new(0,1.5,-0.3) * CFrame.Angles(0,math.rad(360), math.rad(0)))
		elseif _G.WeaponHat == "Juggernaut's Chaingun" then
			RayOffset.CFrame = moveHandR.CFrame * CFrame.new(0,0.8,-2)
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.new(0,0.8,-2)* CFrame.Angles(0,math.rad(0), math.rad(0)))
		elseif _G.WeaponHat == "BackGun" then
			RayOffset.CFrame = moveHandR.CFrame * CFrame.new(0,0.7,-0.8)
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.new(0,0.7,-0.8) * CFrame.Angles(0,math.rad(270), math.rad(-45)))
		elseif _G.WeaponHat == "Meshes/M4A1Accessory" then
			RayOffset.CFrame = moveHandR.CFrame * CFrame.new(0,0.8,-1)
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.new(0,0.8,-1)* CFrame.Angles(0,math.rad(270), math.rad(20)))
		elseif _G.WeaponHat == "MARTILLO" then
			Part.CFrame = moveHandR.CFrame * (CFrame.new(0,5,-2)* CFrame.Angles(math.rad(0),math.rad(0), math.rad(0)))
			moveWeapon.CFrame = moveHandR.CFrame * (CFrame.new(0,2.5,-1.0)* CFrame.Angles(math.rad(0),math.rad(90), math.rad(0)))
		elseif _G.WeaponHat == "StopSign" then
			Part.CFrame = moveHandR.CFrame * CFrame.new(0,4.5,-0.8)
			moveWeapon.CFrame = moveHandR.CFrame * CFrame.Angles(math.rad(0),math.rad(0), math.rad(0)) * CFrame.new(0,2.5,-0.8)
		end
	else
		moveWeapon.CFrame = moveHandR.CFrame * CFrame.new(0,-50,0) -- Move the gun
		Part.CFrame = moveWeapon.CFrame
	end
end)

if _G.Fling == true then
	spawn(function()
		local root = game.Players.LocalPlayer.Character.HumanoidRootPart or game.Players.LocalPlayer.Character.Torso

		game:GetService('RunService').Stepped:connect(function()
			for _,v in pairs(game.Players.LocalPlayer.Character:children()) do
				pcall(function()
					if v:IsA("BasePart") and not v:IsA("Accessory") then
						v.CanCollide = false
					end
				end)
			end
		end)

		AlignPos(root,Part)

		local bambam = Instance.new("BodyThrust",root)
		bambam.Force = Vector3.new(999999*10,0,999999*10)
		bambam.Location = root.Position 
	end)
end
