
local g = game.Players.LocalPlayer.Character:FindFirstChild("METALXLIGHTSEER77Accessory").Handle
g.AccessoryWeld:Destroy()
g.Anchored = false
local sRot = 0.1
 
local s = game.Players.LocalPlayer.Character:FindFirstChild("Giant Sword Catcher").Handle
s.AccessoryWeld:Destroy()
s.Anchored = false
local sRot = 0.1

local m = game.Players.LocalPlayer.Character:FindFirstChild("SeeMonkey").Handle
m.Mesh:Destroy()
m.AccessoryWeld:Destroy()
m.Anchored = false
local sRot = 0.1

local r = game.Players.LocalPlayer.Character:FindFirstChild("RockAccessory").Handle
r.AccessoryWeld:Destroy()
r.SpecialMesh:Destroy()
r.Anchored = false
local rRot = 0.1
local buldist = 1

local f = game.Players.LocalPlayer.Character:FindFirstChild("FireMohawk").Handle
f.AccessoryWeld:Destroy()
f.Anchored = false
f.Mesh:Destroy()

local h = game.Players.LocalPlayer.Character:FindFirstChild("BladeMasterAccessory").Handle
h.AccessoryWeld:Destroy()
h.Anchored = false


game:GetService("RunService").RenderStepped:Connect(function(dt)
    sRot = sRot + -24*dt
    s.Anchored = true
    s.Velocity = Vector3.new(0,0,0)
    s.Anchored = false
    
    m.Anchored = true
    m.Velocity = Vector3.new(0,0,0)
    m.Anchored = false
    m.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("MediHood").Handle.CFrame * CFrame.new(0,-2,0) * CFrame.Angles(math.rad(90),0,0)
    
    g.Anchored = true
    g.Velocity = Vector3.new(0,0,0)
    g.Anchored = false
    
    rRot = rRot + -2*dt
    r.Anchored = true
    r.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("Pal Hair").Handle.CFrame * CFrame.new(0,0,buldist*-1) * CFrame.Angles(math.rad(rRot), -rRot, rRot)
    r.Velocity = Vector3.new(0,0,0)
    r.Anchored = false
    
    f.Anchored = true
    f.Velocity = Vector3.new(0,0,0)
    f.Anchored = false
    
    h.Anchored = true
    h.Velocity = Vector3.new(0,0,0)
    h.Anchored = false
    
end)
 



local options = {}



options.headscale = 1.7 
options.forcebubblechat = true

options.headhat = "MediHood" 
options.righthandhat = "Pal Hair" 
options.lefthandhat = "LavanderHair"

options.righthandrotoffset = Vector3.new(0,0,0)
options.lefthandrotoffset = Vector3.new(0,0,0)
options.headrotoffset = Vector3.new(0,0,0)

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
    if v:IsA("BasePart") and v.Parent.ClassName == "Accessory" or v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
        game:GetService("RunService").Heartbeat:connect(function()
            v.Velocity = Vector3.new(-30,0,0)
        end)
    end
end
wait(1)
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character

local VR = game:GetService("VRService")
local input = game:GetService("UserInputService")

local cam = workspace.CurrentCamera

cam.CameraType = "Scriptable"

cam.HeadScale = options.headscale

game:GetService("StarterGui"):SetCore("VRLaserPointerMode", 0)
game:GetService("StarterGui"):SetCore("VREnableControllerModels", false)


local function createpart(size, name)
    local Part = Instance.new("Part", char)
    Part.CFrame = char.HumanoidRootPart.CFrame
    Part.Size = size
    Part.Transparency = 1
    Part.CanCollide = false
    Part.Anchored = true
    Part.Name = name
    return Part
end

local moveHandL = createpart(Vector3.new(1,1,2), "moveRH")
local moveHandR = createpart(Vector3.new(1,1,2), "moveLH")
local moveHead = createpart(Vector3.new(1,1,1), "moveH")

local handL
local handR
local head
local R1down = false

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

for i,v in pairs(char.Humanoid:GetAccessories()) do
    if v:FindFirstChild("Handle") then
        local handle = v.Handle
        
        if v.Name == options.righthandhat and not handR then
            handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
            handR = v
        elseif v.Name == options.lefthandhat and not handL then
            handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
            handL = v
        elseif v.Name == options.headhat and not head then
            handle.Transparency = 1
            head = v
        end
    end
end

char.Humanoid.AnimationPlayed:connect(function(anim)
    anim:Stop()
end)

for i,v in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
    v:AdjustSpeed(0)
end

local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
torso.Anchored = true
char.HumanoidRootPart.Anchored = true

workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position)

input.UserCFrameChanged:connect(function(part,move)
    if part == Enum.UserCFrame.Head then

        moveHead.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move)
    elseif part == Enum.UserCFrame.LeftHand then

        moveHandL.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move*CFrame.Angles(math.rad(options.righthandrotoffset.X),math.rad(options.righthandrotoffset.Y),math.rad(options.righthandrotoffset.Z)))
    elseif part == Enum.UserCFrame.RightHand then

        moveHandR.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move*CFrame.Angles(math.rad(options.righthandrotoffset.X),math.rad(options.righthandrotoffset.Y),math.rad(options.righthandrotoffset.Z)))
    end
end)

local function Align(Part1,Part0,CFrameOffset) 
    local AlignPos = Instance.new('AlignPosition', Part1);
    AlignPos.Parent.CanCollide = false;
    AlignPos.ApplyAtCenterOfMass = true;
    AlignPos.MaxForce = 67752;
    AlignPos.MaxVelocity = math.huge/9e110;
    AlignPos.ReactionForceEnabled = false;
    AlignPos.Responsiveness = 200;
    AlignPos.RigidityEnabled = false;
    local AlignOri = Instance.new('AlignOrientation', Part1);
    AlignOri.MaxAngularVelocity = math.huge/9e110;
    AlignOri.MaxTorque = 67752;
    AlignOri.PrimaryAxisOnly = false;
    AlignOri.ReactionTorqueEnabled = false;
    AlignOri.Responsiveness = 200;
    AlignOri.RigidityEnabled = false;
    local AttachmentA=Instance.new('Attachment',Part1);
    local AttachmentB=Instance.new('Attachment',Part0);
    AttachmentB.CFrame = AttachmentB.CFrame * CFrameOffset
    AlignPos.Attachment0 = AttachmentA;
    AlignPos.Attachment1 = AttachmentB;
    AlignOri.Attachment0 = AttachmentA;
    AlignOri.Attachment1 = AttachmentB;
end

head.Handle:BreakJoints()
handR.Handle:BreakJoints()
handL.Handle:BreakJoints()

Align(head.Handle,moveHead,CFrame.new(0,0,0))
Align(handR.Handle,moveHandR,CFrame.new(0,0,0))
Align(handL.Handle,moveHandL,CFrame.new(0,0,0))

input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR1 then
        if key.Position.Z > 0.9 then
            R1down = true
        else
            R1down = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR1 then
        R1down = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR1 then
        R1down = false
    end
end)



L1down = false
input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonL1 then
        if key.Position.Z > 0.9 then
            L1down = true
        else
            L1down = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonL1 then
        L1down = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonL1 then
        L1down = false
    end
end)



Xdown = false
input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonX then
        if key.Position.Z > 0.9 then
            Xdown = true
        else
            Xdown = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonX then
        Xdown = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonX then
        Xdown = false
    end
end)

R2down = false
input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR2 then
        if key.Position.Z > 0.9 then
            R2down = true
        else
            R2down = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR2 then
        R2down = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR2 then
        R2down = false
    end
end)

Adown = false
input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonA then
        if key.Position.Z > 0.9 then
            Adown = true
        else
            Adown = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonA then
        Adown = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonA then
        Adown = false
    end
end)


L2down = false
input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonL2 then
        if key.Position.Z > 0.9 then
            L2down = true
        else
            L2down = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonL2 then
        L2down = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonL2 then
        L2down = false
    end
end)


R1down = false
input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR1 then
        if key.Position.Z > 0.9 then
            R1down = true
        else
            R1down = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR1 then
        R1down = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonR1 then
        R1down = false
    end
end)


Bdown = false
input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonB then
        if key.Position.Z > 0.9 then
            Bdown = true
        else
            Bdown = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonB then
        Bdown = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonB then
        Bdown = false
    end
end)

Ydown = false
input.InputChanged:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonY then
        if key.Position.Z > 0.9 then
            Ydown = true
        else
            Ydown = false
        end
    end
end)

input.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonY then
        Ydown = true
    end
end)

input.InputEnded:connect(function(key)
    if key.KeyCode == Enum.KeyCode.ButtonY then
        Ydown = false
    end
end)



local b = Instance.new("Sound")

b.Name = "Sound"
b.SoundId = "https://web.roblox.com/asset/?id=3096150128"
b.Volume = 1
b.Looped = false
b.archivable = false
b.TimePosition = .024
 
b.Parent = game.Players.LocalPlayer.Character.METALXLIGHTSEER77Accessory.Handle



game:GetService("RunService").RenderStepped:connect(function()
    if Ydown or Bdown then
        cam.CFrame = cam.CFrame:Lerp(cam.CoordinateFrame + (moveHandR.CFrame*CFrame.Angles(-math.rad(options.headrotoffset.X),-math.rad(options.headrotoffset.Y),math.rad(180-options.headrotoffset.X))).LookVector * cam.HeadScale/2, 0.5)
    end
    if L1down == false and Xdown == false and L2down == false then
        s.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("LavanderHair").Handle.CFrame * CFrame.new(0,2.5,-1.3) * CFrame.Angles(math.rad(55), 55, 55.356)
    else
        if Xdown == false  and L2down == false then
            s.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("LavanderHair").Handle.CFrame * CFrame.new(0,0,-1.1) * CFrame.Angles(math.rad(0), 59.7, sRot)
        else
            if Xdown == false then
                s.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("LavanderHair").Handle.CFrame * CFrame.new(0,0,-1.1) * CFrame.Angles(math.rad(0), 59.7, -sRot)
            else
                s.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("MediHood").Handle.CFrame * CFrame.new(-1.5,-5,.6) * CFrame.Angles(math.rad(0), 59.7, 45)
            end
        end
    end
    
    if R1down == false then   
        if R2down == true then
            if Adown == false then
                r.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("Pal Hair").Handle.CFrame * CFrame.new(0,.5,buldist*-1) * CFrame.Angles(math.rad(rRot), -rRot, rRot)
                buldist = buldist + 3.7
                if buldist > 55 then
                    buldist = -1
                end
            end
        else
            buldist = 0
            r.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("MediHood").Handle.CFrame * CFrame.new(0,5,-35) * CFrame.Angles(math.rad(0), 0, 0)
        
        end
    end
    
    if R1down == true then
        h.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("Pal Hair").Handle.CFrame * CFrame.new(0,2,-.7) * CFrame.Angles(math.rad(180),0,44.85)
        f.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("Pal Hair").Handle.CFrame * CFrame.new(0,4,-.6) * CFrame.Angles(math.rad(0), 55, 55)
    else
        h.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("MediHood").Handle.CFrame * CFrame.new(0,-1.6,.9) * CFrame.Angles(math.rad(0),0,0.34)
        f.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("MediHood").Handle.CFrame * CFrame.new(-0.6,-3,.9) * CFrame.Angles(math.rad(0), 0, 45)
    end
    
    
        if Adown == true or R1down == true then
            g.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("MediHood").Handle.CFrame * CFrame.new(1.5,-5,.6) * CFrame.Angles(math.rad(0), 59.7, 45)
        else
            g.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("Pal Hair").Handle.CFrame * CFrame.new(0,0.5,-0.84) * CFrame.Angles(math.rad(90), -89.5, 45)
        end
end)

