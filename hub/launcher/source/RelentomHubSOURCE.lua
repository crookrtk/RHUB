local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/crookrtk/RHUB/main/discordlib.txt")()

local win = DiscordLib:Window("Relentom Hub v1.1b")

local serv = win:Server("VR Scripts", "")

local btns = serv:Channel("relentom-exclusives")

btns:Button("RelentomVR V1", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/Relentom%20V1%20Medihood.lua"))()
print(bool)   
DiscordLib:Notification("Notification", "Launched!", "Okay!")
end)

btns:Seperator()

btns:Button("CLOVR Hat Version (To be fixed)", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/hub/launcher/clovrhatver.lua"))()
print(bool)
DiscordLib:Notification("Notification", "Currently broken as of now, stay tuned for fixes!", "Okay!")
end)

local btns = serv:Channel("mw-vr")

btns:Button("MW VR (SNIPER)", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/MW_VR.lua"))()
print(bool)   
DiscordLib:Notification("Notification", "Launched, credit to MyWorld#4430", "Okay!")
end)

btns:Seperator()

btns:Button("MW VR DA HOOD (SNIPER)", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/MW_VR%20(2).txt"))()
print(bool)   
DiscordLib:Notification("Notification", "Launched, credit to MyWorld#4430 , patches made to work in Da Hood", "Okay!")
end)

local btns = serv:Channel("fake-vr")

btns:Button("Fake Sked's VR", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/hub/launcher/fakesked.lua"))()
print(bool)   
DiscordLib:Notification("Notification", "Launched!", "Okay!")
end)

local serv = win:Server("Credits", "")

local btns = serv:Channel("credits")

btns:Button("Credits", function()
DiscordLib:Notification("Notification", "Scripts edited/made by Anarky#5844", "Great!")
end)




win:Server("Coming Soon", "http://www.roblox.com/asset/?id=6031075938")
