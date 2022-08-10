-- RLENTM ClovrVR Hat Fixed
_G.gunAutoEquip = false
_G.swordAutoEquip = false
_G.changeSomeStuff = false
_G.knifeMode = false

--[--Universal--]--
_G.leftHand = false
_G.flinging = false
_G.toolHolding = true
_G.bodyTransparency = 0
_G.hatTransparency = 0
--Hat CLOVR
_G.hideCharacter = false
_G.hideCharacterPosition = {50000000, 0, 50000000}
_G.hatCLOVR = true
--Loadout
_G.primaryWeapon = false
_G.secondaryWeapon = false
_G.dualWieldGuns = false
_G.dualWieldMelee = false
--Cooldown
_G.sniperShootCooldown = 0.5
_G.pistolShootCooldown = 0.25
--Bullet Stuff
_G.bulletColor = {255, 255, 255}
_G.sniperLifetime = 10
_G.automaticLifetime = 5
_G.pistolLifetime = 2.5

--[--Velocity--]--
_G.bodyVelocity = {-17.7, 0, -17.7} 
_G.flingPartVelocity = {-17.7, 0, -17.7}
_G.hatVelocity = {-17.7, 0, -17.7}
_G.toolVelocity = {-17.7, 0, -17.7}
--Velocity is not recommended to be (-17.7, 0, -17.7) in R15 since body parts often fall in R15.
--[[--------------------------]]--

loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/chv.lua"))()
