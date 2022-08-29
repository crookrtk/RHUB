local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/crookrtk/RHUB/main/discordlib.txt")()

local win = DiscordLib:Window("Relentom Hub v1.0b")

local serv = win:Server("Scripts", "")

local btns = serv:Channel("vr-section")

btns:Button("RelentomVR V1", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/Relentom%20V1%20Medihood.lua"))()
print(bool)   
DiscordLib:Notification("Notification", "Launched!", "Okay!")
end)

btns:Seperator()

btns:Button("MW VR", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/MW_VR.lua"))()
print(bool)   
DiscordLib:Notification("Notification", "Launched, credit to MyWorld#4430", "Okay!")
end)

btns:Seperator()

btns:Button("MW VR DA HOOD", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/MW_VR%20(2).txt"))()
print(bool)   
DiscordLib:Notification("Notification", "Launched, credit to MyWorld#4430 , patches made to work in Da Hood", "Okay!")
end)

btns:Seperator()

btns:Button("CLOVR Hat Version (Broken?)", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/RHUB/main/hub/launcher/clovrhatver.lua"))()
print(bool)
DiscordLib:Notification("Notification", "Launched, be sure you are wearing the right hats!", "Okay!")
end)

btns:Seperator()

btns:Button("AnarksVR", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/anarksVR/main/forloadstring.lua"))()
print(bool)
DiscordLib:Notification("Notification", "Launched, FULL Credit to saucekid, as this is just my fixed version of the script!", "Okay!")
end)

local tgls = serv:Channel("coming-soon")

tgls:Toggle("Coming Soon",false, function(bool)
print(bool)
end)

local sldrs = serv:Channel("coming-soon")

local sldr = sldrs:Slider("Coming Soon", 0, 1000, 400, function(t)
print(t)
end)

sldrs:Button("Change to 50", function()
sldr:Change(50)
end)

local drops = serv:Channel("coming-soon")


local drop = drops:Dropdown("Coming Soon",{"Option 1","Option 2","Option 3","Option 4","Option 5"}, function(bool)
print(bool)
end)

drops:Button("Clear", function()
drop:Clear()
end)

drops:Button("Add option", function()
drop:Add("Option")
end)

local clrs = serv:Channel("coming-soon")

clrs:Colorpicker("ESP Color", Color3.fromRGB(255,1,1), function(t)
print(t)
end)

local textbs = serv:Channel("coming-soon")

textbs:Textbox("Coming Soon", "Type here!", true, function(t)
print(t)
end)

local lbls = serv:Channel("coming-soon")

lbls:Label("This is just a label.")

local bnds = serv:Channel("coming-soon")

bnds:Bind("Coming Soon", Enum.KeyCode.RightShift, function()
print("Killed everyone!")
end)

local serv = win:Server("Credits", "")

local btns = serv:Channel("credits")

btns:Button("Credits", function()
DiscordLib:Notification("Notification", "Scripts edited/made by Anarky#5844", "Great!")
end)




win:Server("Coming Soon", "http://www.roblox.com/asset/?id=6031075938")