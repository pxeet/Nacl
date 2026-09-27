-- [[ luacid.dev ]] v0.2.14 decompiled at 2026-09-26T15:35:39Z
-- Luau bytecode version: 6 | Luau type version: 3
if not game:IsLoaded() then
    pcall(function()
        repeat
            task.wait()
        until game.Loaded:Wait()
    end)
end

repeat
    task.wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

repeat
    task.wait()
    local isKeyVerified = getgenv().isKeyVerified
until typeof(isKeyVerified) == "function" and getgenv().isKeyVerified()

if _G.BonkHubCleanup and type(_G.BonkHubCleanup) == "function" then
    pcall(_G.BonkHubCleanup)
end

local CoreGui: CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("BONKLIB") then
    pcall(function()
        CoreGui.BONKLIB:Destroy()
    end)
end

if CoreGui:FindFirstChild("Watermark") then
    pcall(function()
        CoreGui.Watermark:Destroy()
    end)
end

if CoreGui:FindFirstChild("BonkHub_BlackScreen") then
    pcall(function()
        CoreGui.BonkHub_BlackScreen:Destroy()
    end)
end

_G.Runing = true
local tbl1 = {}
local tbl2 = {}

local function func1<T>(arg1: T): T
    if arg1 then
        table.insert(tbl1, arg1)
    end

    return arg1
end

local function func2(arg1)
    local var1 = task.spawn(function()
        if setthreadidentity then
            pcall(setthreadidentity, 7)
        end

        if set_thread_identity then
            pcall(set_thread_identity, 7)
        end

        local success, result = pcall(arg1)

        if not success then
            warn("[BonkHub Task Error]: " .. tostring(result))
        end
    end)

    table.insert(tbl2, var1)

    return var1
end

local function f4(arg1)
    local str1 = tostring(arg1)

    if str1:find("capability Plugin") or str1:find("cannot access 'Instance'") then
        return
    end

    local var1 = debug.traceback("", 2)
    local var2 = tostring(arg1):match(":(%d+):") or var1:match(":(%d+):") or "?"
    local gsub = var1.gsub
    warn(string.format("\tBonkHub say!\n\t\n\tTime   : %s\n\tLine   : %s\n\tError  : %s\n\tTrace  :\n\t%s\n\t", os.date("%H:%M:%S"), var2, tostring(arg1), gsub(var1, "\n", "\n  | ")))
end

local function Callback(arg1, ...)
    local tbl3 = { ... }

    local success, result = xpcall(function()
        return arg1(table.unpack(tbl3))
    end, f4)

    return success, result
end

local function f6() -- Luacid: Inlined by compiler; 6 call sites recovered
    return getgenv()
end

local function f7(arg1, arg2, arg3) -- Luacid: unused: defined but never referenced
    return if type(arg2) == arg1 then arg2 else arg3
end

local cloneref = cloneref

local var1 = type(cloneref) ~= "function" and function(...)
    return ...
end or cloneref

local var2 = setmetatable({}, {
    __index = function(_, className: string)
        return var1(game:GetService(className))
    end
})

local ReplicatedStorage = var2.ReplicatedStorage
local Players = var2.Players
local StarterGui = var2.StarterGui
local VirtualInputManager = var2.VirtualInputManager
local VirtualUser = var2.VirtualUser
local TeleportService = var2.TeleportService
local Lighting = var2.Lighting
local TweenService = var2.TweenService
local RunService = var2.RunService
local HttpService = var2.HttpService
local CoreGui2 = var2.CoreGui
local UserInputService = var2.UserInputService
local ProximityPromptService = var2.ProximityPromptService
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 15)
local Backpack = LocalPlayer:WaitForChild("Backpack", 15)
local SavedData = LocalPlayer:WaitForChild("SavedData", 15) or LocalPlayer:FindFirstChild("SavedData")
local Character = LocalPlayer.Character
local var3 = Character and Character:FindFirstChildOfClass("Humanoid")
local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

local function f8(character: Model)
    Character = character
    var3 = character:WaitForChild("Humanoid", 5) or character:FindFirstChildOfClass("Humanoid")
    HumanoidRootPart = character:WaitForChild("HumanoidRootPart", 5) or character:FindFirstChild("HumanoidRootPart")
    Backpack = LocalPlayer:WaitForChild("Backpack", 5) or LocalPlayer:FindFirstChild("Backpack")
end

if Character then
    f8(Character)
end

func1(LocalPlayer.CharacterAdded:Connect(f8))
local var4 = getexecutorname and getexecutorname() or identifyexecutor and identifyexecutor() or "Unknown"

for _, v in ipairs({ "xeno", "solara" }) do
    if var4:lower():find(v) then
        LocalPlayer:Kick("executor not supported please check")
    end
end

function DeleteWorkspace()
    Callback(function()
        if not isfolder("BONKHUB") then
            return
        end

        local bindableFunction: BindableFunction = Instance.new("BindableFunction")

        function bindableFunction.OnInvoke(arguments)
            if arguments ~= "Yes" then
                return
            end

            delfolder("BONKHUB")
            task.wait(0.5)
            StarterGui:SetCore("SendNotification", {
                Title = "Notify !",
                Text = "Deleted ! | Rejoining !",
                Icon = "rbxassetid://11262159835",
                Duration = 5
            })
            task.wait(0.5)
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end

        StarterGui:SetCore("SendNotification", {
            Title = "Delete Workspace ! !",
            Text = "Delete for Fix Bug !",
            Icon = "rbxassetid://11262159835",
            Callback = bindableFunction,
            Button1 = "Yes",
            Button2 = "No"
        })
    end)
end

local tbl3 = {}

for i = 1, 64 do
    tbl3[("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(i, i)] = i - 1
end

function Hop()
    local PlaceId = game.PlaceId
    local tbl4 = {}
    local str1 = ""
    local hour = os.date("!*t").hour
    local var5 = nil

    if not Callback(function()
        tbl4 = HttpService:JSONDecode(readfile("NotSameServers.json"))
    end) then
        table.insert(tbl4, hour)

        Callback(function()
            writefile("NotSameServers.json", HttpService:JSONEncode(tbl4))
        end)
    end

    local function f9()
        local var6 = if str1 == "" then HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")) else HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. str1))

        if var6.nextPageCursor and var6.nextPageCursor ~= "null" and var6.nextPageCursor ~= nil then
            str1 = var6.nextPageCursor
        end

        local num1 = 0
        local num2 = 0

        for _, v in pairs(var6.data) do
            num1 += 1
            local str2 = tostring(v.id)

            if not (tonumber(v.maxPlayers) > tonumber(v.playing)) then
                continue
            end

            local bool1

            if num1 ~= 1 and tonumber(v.playing) < var5 or num1 == 1 then
                var5 = tonumber(v.playing)
                bool1 = true

                for _, v2 in pairs(tbl4) do
                    if num2 ~= 0 then
                        if str2 == tostring(v2) then
                            bool1 = false
                        end
                    elseif tonumber(hour) ~= tonumber(v2) then
                        Callback(function()
                            delfile("NotSameServers.json")
                            tbl4 = {}
                            table.insert(tbl4, hour)
                        end)
                    end

                    num2 += 1
                end

                if bool1 == true then
                    table.insert(tbl4, str2)
                    task.wait()

                    Callback(function()
                        writefile("NotSameServers.json", HttpService:JSONEncode(tbl4))
                        task.wait()
                        TeleportService:TeleportToPlaceInstance(PlaceId, str2, LocalPlayer)
                    end)

                    task.wait(4)
                end
            elseif num1 == 1 then
                bool1 = true

                for _, v2 in pairs(tbl4) do
                    if num2 ~= 0 then
                        if str2 == tostring(v2) then
                            bool1 = false
                        end
                    elseif tonumber(hour) ~= tonumber(v2) then
                        Callback(function()
                            delfile("NotSameServers.json")
                            tbl4 = {}
                            table.insert(tbl4, hour)
                        end)
                    end

                    num2 += 1
                end

                if bool1 == true then
                    table.insert(tbl4, str2)
                    task.wait()

                    Callback(function()
                        writefile("NotSameServers.json", HttpService:JSONEncode(tbl4))
                        task.wait()
                        TeleportService:TeleportToPlaceInstance(PlaceId, str2, LocalPlayer)
                    end)

                    task.wait(4)
                end
            end
        end
    end

    func2(function()
        while task.wait() do
            Callback(function()
                f9()

                if str1 ~= "" then
                    f9()
                end
            end)
        end
    end)
end

local str1 = "Ride A Pet"

Callback(function()
    local productInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

    if productInfo and productInfo.Name and productInfo.Name ~= "" then
        str1 = productInfo.Name

        return
    end

    if game.Name and game.Name ~= "" then
        str1 = game.Name
    end
end)

local var5 = str1:gsub("[<>:\"/\\|%?%*]", "_")
local var6 = "BONKHUB/" .. var5
_G.SettingConfig = {
    Configs = {
        Language = "en",
        JobId = "",
        WhiteScreen = false,
        BlackScreen = false,
        AntiAFK = false,
        AutoRejoin = false,
        AutoFarm = false,
        BoostFps = false,
        FpsCap = 60,
        TweenSpeed = 200,
        HomeSpeed = 800,
        HomeDiveDepth = 300,
        AutoPickup = false,
        PickupRarities = {},
        PickupEggs = {},
        PickupMinWeight = 0,
        RareEggSniping = false,
        AutoServerHopNoEggs = false,
        KaitunMode = false,
        KaitunSmartEggs = true,
        KaitunAutoPlace = true,
        KaitunAutoHatch = true,
        KaitunAutoCollectIncome = true,
        KaitunAutoUpgradeLuck = true,
        KaitunAutoEquipBest = true,
        KaitunAutoRideBest = true,
        KaitunAutoClaimRewards = true,
        AutoPlace = false,
        PlaceRarities = {},
        PlaceEggs = {},
        PlaceMinWeight = 0,
        AutoHatch = false,
        AutoEquipBest = false,
        AutoSkipGrowth = false,
        AutoSwapBestPets = false,
        AutoRidePet = false,
        PetWhitelist = {},
        AutoFeed = false,
        FeedFoods = { "Grass", "Bone", "Meat" },
        FeedBestOnly = false,
        FeedAboveIncome = false,
        FeedMinIncome = 0,
        FeedAboveAge = false,
        FeedMinAge = 1,
        FeedRarities = {},
        AutoSell = false,
        SellPets = {},
        SellRarities = { "Common" },
        SellUnlisted = false,
        SellMinWeight = 0,
        AutoUnlockNests = false,
        AutoHatchLuck = false,
        AutoClaimIndex = false,
        AutoRebirth = false,
        AutoCollectPetIncome = true,
        AutoClaimGroupReward = true,
        AutoClaimOffline = false,
        AutoFavoriteRare = false,
        FavoriteRarities = { "Mythic", "Divine", "Ethereal" },
        AutoClaimEvent = false,
        AutoActivateRadar = false,
        AutoPlaceLanterns = false,
        WeatherWebhookAlert = false,
        AutoBuyFood = false,
        BuyFood = { "Grass" },
        AutoBuyGears = false,
        BuyGears = {},
        AutoBuyBasket = false,
        EggEsp = false,
        EspShowDistance = false,
        EspShowRarity = false,
        WebhookUrl = "",
        WebhookEnabled = false,
        WebhookOnHatch = false,
        WebhookHatchMinRarity = "Common",
        WebhookOnRareEgg = false,
        WebhookOnEggReturned = false,
        WebhookPeriodicReport = false,
        WebhookReportInterval = 10,
        WebhookShowUser = false,
        WebhookShowJobId = false,
        WalkSpeedEnabled = false,
        WalkSpeed = 32,
        InfJump = false,
        NoClip = false,
        Fly = false,
        FlySpeed = 60,
        InstantProximityPrompt = false,
        AutoSkipLoadingScreen = false
    }
}
local SettingConfig = _G.SettingConfig
f6().Setting = SettingConfig
local SettingConfig2 = _G.SettingConfig
f6().SettingConfig = SettingConfig2
local Configs = _G.SettingConfig.Configs

local function _f9() -- Luacid: Inlined by compiler; 2 call sites recovered
    if _G.SaveNoUser or f6().SaveNoUser then
        return var6 .. "/config.json"
    end

    return var6 .. "/config-" .. LocalPlayer.Name .. ".json"
end

function Load(): boolean
    if not (readfile and writefile and isfile and isfolder and makefolder) then
        return false
    end

    if not isfolder("BONKHUB") then
        makefolder("BONKHUB")
    end

    if not isfolder(var6) then
        makefolder(var6)
    end

    local var7 = _f9()

    if not isfile(var7) then
        local bool1, var8 = Callback(function()
            return HttpService:JSONEncode(_G.SettingConfig)
        end)

        if bool1 then
            writefile(var7, var8)
        end
    else
        local bool1, var8 = Callback(function()
            return HttpService:JSONDecode(readfile(var7))
        end)

        if bool1 and type(var8) == "table" then
            for k, v in pairs(var8) do
                if k == "Configs" and type(v) == "table" then
                    for k2, v2 in pairs(v) do
                        _G.SettingConfig.Configs[k2] = v2
                    end
                else
                    _G.SettingConfig[k] = v
                end
            end
        end
    end

    return true
end

function Save(): boolean
    if not (readfile and writefile and isfile and isfolder and makefolder) then
        return false
    end

    if not isfolder("BONKHUB") then
        makefolder("BONKHUB")
    end

    if not isfolder(var6) then
        makefolder(var6)
    end

    local var7 = _f9()

    local bool1, var8 = Callback(function()
        return HttpService:JSONEncode(_G.SettingConfig)
    end)

    if bool1 then
        writefile(var7, var8)
    end

    return true
end

_G.Save = Save
_G.Load = Load
Load()
Save()

func2(function()
    func1(LocalPlayer.Idled:Connect(function()
        if not _G.SettingConfig or not _G.SettingConfig.Configs or not _G.SettingConfig.Configs.AntiAFK then
            return
        end

        Callback(function()
            VirtualUser:Button2Down(Vector2.zero, workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.zero, workspace.CurrentCamera.CFrame)
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        end)
    end))
end)

func2(function()
    local RobloxPromptGui = CoreGui2:WaitForChild("RobloxPromptGui", 10)
    local promptOverlay = RobloxPromptGui and RobloxPromptGui:WaitForChild("promptOverlay", 10)

    if promptOverlay then
        func1(promptOverlay.ChildAdded:Connect(function(child: Instance)
            if _G.SettingConfig and _G.SettingConfig.Configs and _G.SettingConfig.Configs.AutoRejoin and child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
                TeleportService:Teleport(game.PlaceId)
            end
        end))
    end

    while task.wait(1) do
        if not (_G.SettingConfig and _G.SettingConfig.Configs and _G.SettingConfig.Configs.AutoRejoin) then
            continue
        end

        local RobloxPromptGui2 = CoreGui2:FindFirstChild("RobloxPromptGui")
        local promptOverlay2 = RobloxPromptGui2 and RobloxPromptGui2:FindFirstChild("promptOverlay")

        if not promptOverlay2 then
            continue
        end

        for _, child in pairs(promptOverlay2:GetChildren()) do
            if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") then
                TeleportService:Teleport(game.PlaceId)
                task.wait(5)
            end
        end
    end
end)

print(string.format("[BonkHub] Initializing for %s with %s", str1, var4))

local function func4()
    Callback(function()
        if not PlayerGui then
            return
        end

        local Loading = PlayerGui:FindFirstChild("Loading")

        if not Loading then
            return
        end

        if VirtualInputManager then
            Callback(function()
                VirtualInputManager:SendMouseButtonEvent(400, 400, 0, true, game, 0)
                task.wait(0.04)
                VirtualInputManager:SendMouseButtonEvent(400, 400, 0, false, game, 0)
            end)
        end

        local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
        local Reusable = Remotes and Remotes:FindFirstChild("Reusable")
        local GameLoaded = Reusable and Reusable:FindFirstChild("GameLoaded")

        if GameLoaded then
            Callback(function()
                GameLoaded:FireServer()
            end)
        end

        LocalPlayer:SetAttribute("GameLoaded", true)
        local CurrentCamera = workspace.CurrentCamera

        if CurrentCamera and CurrentCamera.CameraType ~= Enum.CameraType.Custom then
            CurrentCamera.CameraType = Enum.CameraType.Custom

            if var3 then
                CurrentCamera.CameraSubject = var3
            end

            CurrentCamera.FieldOfView = 70
        end

        local Main = PlayerGui:FindFirstChild("Main")

        if Main then
            Main.Enabled = true
        end

        local BackpackGui = PlayerGui:FindFirstChild("BackpackGui")

        if BackpackGui then
            BackpackGui.Enabled = true
        end

        Loading.Enabled = false
        Loading:Destroy()
    end)
end

if Configs.AutoSkipLoadingScreen then
    func4()
end

func2(function()
    if PlayerGui then
        func1(PlayerGui.ChildAdded:Connect(function(child: Instance)
            if child.Name == "Loading" and Configs.AutoSkipLoadingScreen then
                task.wait(0.1)
                func4()
            end
        end))
    end

    while task.wait(1) do
        if Configs.AutoSkipLoadingScreen and PlayerGui and PlayerGui:FindFirstChild("Loading") then
            func4()
        end
    end
end)

local General = nil

Callback(function()
    General = require(ReplicatedStorage.GameServices.General)
end)

local DialogueModule = nil

Callback(function()
    DialogueModule = require(ReplicatedStorage.Dialogue.Modules.DialogueModule)
end)

local var7 = nil
local GameData = ReplicatedStorage:WaitForChild("GameData", 15)
local var8 = not (GameData and GameData:FindFirstChild("Eggs")) and {} or require(GameData.Eggs) or {}
local var9 = not (GameData and GameData:FindFirstChild("Foods")) and {} or require(GameData.Foods) or {}
local var10 = not (GameData and GameData:FindFirstChild("EggBaskets")) and {} or require(GameData.EggBaskets) or {}
local var11 = not (GameData and GameData:FindFirstChild("Nests")) and {} or require(GameData.Nests) or {}
local var12 = not (GameData and GameData:FindFirstChild("Pets")) and {} or require(GameData.Pets) or {}
local var13 = not (GameData and GameData:FindFirstChild("Shop")) and {} or require(GameData.Shop) or {}
local var14 = not (GameData and GameData:FindFirstChild("Rebirths")) and {} or require(GameData.Rebirths) or {}
local var15 = not (GameData and GameData:FindFirstChild("Mutations")) and {} or require(GameData.Mutations) or {}
local var16 = not (GameData and GameData:FindFirstChild("Lanterns")) and {} or require(GameData.Lanterns) or {}
local var17 = not (GameData and GameData:FindFirstChild("Radars")) and {} or require(GameData.Radars) or {}
local var18 = not (GameData and GameData:FindFirstChild("Weather")) and {} or require(GameData.Weather) or {}
local var19 = not (GameData and GameData:FindFirstChild("Spawns")) and {} or require(GameData.Spawns) or {}

if GameData and GameData:FindFirstChild("IndexRewards") then
    require(GameData.IndexRewards)
end

if GameData and GameData:FindFirstChild("General") then
    require(GameData.General)
end

local var20 = not (ReplicatedStorage:FindFirstChild("GameServices") and ReplicatedStorage.GameServices:FindFirstChild("PetAging")) and {} or require(ReplicatedStorage.GameServices.PetAging) or {}
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 15)
local Game = Remotes:WaitForChild("Game", 15)
local Reusable = Remotes:WaitForChild("Reusable", 15)
local Plot = Game:WaitForChild("Plot", 15)
local Hatch = Game:WaitForChild("Hatch", 15)
local PlacePet = Game:WaitForChild("PlacePet", 15)
local PickupPet = Game:WaitForChild("PickupPet", 15)
local FeedPet = Game:WaitForChild("FeedPet", 15)
local EggPlaced = Game:WaitForChild("EggPlaced", 15)
local BuyWithCash = Game:WaitForChild("BuyWithCash", 15)
local ClaimIndexReward = Game:WaitForChild("ClaimIndexReward", 15)
local Rebirth = Game:WaitForChild("Rebirth", 15)
local Nests = Plot:WaitForChild("Nests", 15)
local Upgrades = Plot:WaitForChild("Upgrades", 15)
local Mounting = Game:WaitForChild("Mounting", 15)
Game:WaitForChild("PetDismount", 15)
local SkipGrowth = Game:WaitForChild("SkipGrowth", 15)
local OfflineEarnings = Game:WaitForChild("OfflineEarnings", 15)
local var21 = OfflineEarnings
local FavoritePet = Game:WaitForChild("FavoritePet", 15)
local ClaimEventReward = Game:FindFirstChild("ClaimEventReward") or Reusable:FindFirstChild("ClaimEventReward")
local ActivateRadar = Game:WaitForChild("ActivateRadar", 15)
local PlaceLantern = Game:WaitForChild("PlaceLantern", 15)
Game:WaitForChild("BasketDrop", 15)
local AddWeather = Game:WaitForChild("AddWeather", 15)
local EggPickup = Game:WaitForChild("EggPickup", 15)
local TeleportToPlot = Game:FindFirstChild("TeleportToPlot")
local PetCollect = Game:FindFirstChild("PetCollect")
local ClaimGroupReward = Reusable:FindFirstChild("ClaimGroupReward")
local Remotes2 = ReplicatedStorage:FindFirstChild("Dialogue") and ReplicatedStorage.Dialogue:FindFirstChild("Remotes")
local DialogueSelect = Remotes2 and Remotes2:FindFirstChild("DialogueSelect")
local var22 = nil

Callback(function()
    local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts", 5)
    local EggHatching = PlayerScripts and PlayerScripts:WaitForChild("Game", 5):WaitForChild("EggHatching", 5)
    local HatchInteraction = EggHatching and EggHatching:WaitForChild("HatchInteraction", 5)

    if HatchInteraction then
        var22 = require(HatchInteraction)
    end
end)

local tbl4: {Common: number, Divine: number, Epic: number, Ethereal: number, Legendary: number, Mythic: number, Rare: number, Uncommon: number} = {
    Divine = 8,
    Ethereal = 7,
    Mythic = 6,
    Legendary = 5,
    Epic = 4,
    Rare = 3,
    Uncommon = 2,
    Common = 1
}
local tbl5: {Common: Color3, Divine: Color3, Epic: Color3, Ethereal: Color3, Legendary: Color3, Mythic: Color3, Rare: Color3, Uncommon: Color3} = {
    Divine = Color3.fromRGB(255, 215, 0),
    Ethereal = Color3.fromRGB(163, 53, 238),
    Mythic = Color3.fromRGB(255, 60, 60),
    Legendary = Color3.fromRGB(255, 140, 0),
    Epic = Color3.fromRGB(155, 89, 182),
    Rare = Color3.fromRGB(0, 150, 255),
    Uncommon = Color3.fromRGB(50, 205, 50),
    Common = Color3.fromRGB(220, 220, 220)
}
local tbl6: {Common: number, Divine: number, Epic: number, Ethereal: number, Legendary: number, Mythic: number, Rare: number, Uncommon: number} = {
    Divine = 16766720,
    Ethereal = 10695662,
    Mythic = 16727100,
    Legendary = 16747520,
    Epic = 10181046,
    Rare = 3447003,
    Uncommon = 3066993,
    Common = 12370112
}
local tbl7 = {}
local tbl8 = {}

for _, v in pairs(var8) do
    if v.Rarity and not tbl8[v.Rarity] then
        tbl8[v.Rarity] = true
        table.insert(tbl7, v.Rarity)
    end
end

for k in pairs(var19) do
    if not tbl8[k] then
        tbl8[k] = true
        table.insert(tbl7, k)
    end
end

if #tbl7 == 0 then
    tbl7 = {
        "Common",
        "Uncommon",
        "Rare",
        "Epic",
        "Legendary",
        "Mythic",
        "Ethereal",
        "Divine"
    }
else
    table.sort(tbl7, function(arg1, arg2): boolean
        return (tbl4[arg1] or 0) < (tbl4[arg2] or 0)
    end)
end

local Values = {}

for k in pairs(var8) do
    table.insert(Values, k)
end

table.sort(Values)
local tbl9 = {}

for k in pairs(var12) do
    table.insert(tbl9, k)
end

table.sort(tbl9)
local tbl11 = {}
local tbl12 = {}

for k in pairs(var9) do
    if not tbl12[k] then
        tbl12[k] = true
        table.insert(tbl11, k)
    end
end

if var13.Food then
    for k in pairs(var13.Food) do
        if not tbl12[k] then
            tbl12[k] = true
            table.insert(tbl11, k)
        end
    end
end

if #tbl11 == 0 then
    tbl11 = {
        "Grass",
        "Bone",
        "Meat",
        "Dragonfruit",
        "Magic Apple"
    }
else
    table.sort(tbl11)
end

local tbl13 = {}
local tbl14 = {}

if var13.Gears then
    for k in pairs(var13.Gears) do
        if not tbl14[k] then
            tbl14[k] = true
            table.insert(tbl13, k)
        end
    end
end

for k in pairs(var17) do
    if not tbl14[k] then
        tbl14[k] = true
        table.insert(tbl13, k)
    end
end

if #tbl13 == 0 then
    tbl13 = {
        "Advanced Radar",
        "Angelic Radar",
        "Eternal Radar",
        "Jewel Radar",
        "Magic Radar",
        "Royal Radar"
    }
else
    table.sort(tbl13)
end

local tbl15 = {}

for k in pairs(var16) do
    table.insert(tbl15, k)
end

table.sort(tbl15)
local tbl16 = {}

if var18.Data then
    for k in pairs(var18.Data) do
        table.insert(tbl16, k)
    end

    table.sort(tbl16)
end

local tbl17 = {
    startTime = os.clock(),
    startCash = 0,
    eggsFarmed = 0,
    petsHatched = 0
}

func2(function()
    task.wait(2)
    local var23 = SavedData
    local var24 = SavedData

    if var23 then
        var24 = SavedData:FindFirstChild("Cash")
    end

    if var24 then
        local tbl18 = tbl17
        local CashValue = var23.Cash.Value
        tbl18.startCash = tonumber(CashValue) or 0
    end
end)

local function func5(): number
    local var23 = SavedData
    local var24 = SavedData

    if var23 then
        var24 = SavedData:FindFirstChild("Cash")
    end

    if not var24 then
        return 0
    end

    return (math.max(0, (tonumber(var23.Cash.Value) or 0) - tbl17.startCash))
end

local function func6(arg1)
    local _02d = math.floor(arg1 or 0)

    return string.format("%02d:%02d:%02d", math.floor(_02d / 3600), math.floor(_02d % 3600 / 60), _02d % 60)
end

local function func7(arg1): string
    local num1 = tonumber(arg1) or 0

    if num1 >= 1000000000 then
        return string.format("%.2fB", num1 / 1000000000)
    end

    if num1 >= 1000000 then
        return string.format("%.2fM", num1 / 1000000)
    end

    if num1 >= 1000 then
        return string.format("%.1fK", num1 / 1000)
    end

    return (tostring((math.floor(num1))))
end

local function func8(arg1, arg2)
    if not (arg1 and arg2) then
        return false
    end

    if type(arg1) ~= "table" then
        return false
    end

    if arg1[arg2] == true then
        return true
    end

    for _, v in pairs(arg1) do
        if v == arg2 then
            return true
        end
    end

    return false
end

local function func9(arg1)
    if not arg1 or type(arg1) ~= "table" then
        return false
    end

    for k, v in pairs(arg1) do
        if v == true then
            return true
        end

        if type(k) == "number" and v ~= false and v ~= nil then
            return true
        end
    end

    return false
end

local function func10(arg1)
    if not arg1 then
        return {}
    end

    local result = {}

    for k, v in pairs(arg1) do
        if type(k) == "string" and v == true then
            table.insert(result, k)
        elseif type(v) == "string" then
            table.insert(result, v)
        end
    end

    return result
end

local connection = nil
local connection2 = nil

local tbl18 = {
    GetDistance = function(arg1, arg2)
        if typeof(arg1) == "Instance" then
            if arg1:IsA("BasePart") then
                arg1 = arg1.Position
            elseif arg1:IsA("Model") then
                arg1 = arg1:GetPivot().Position
            else
                arg1 = HumanoidRootPart and HumanoidRootPart.Position or Vector3.zero
            end
        elseif typeof(arg1) == "CFrame" then
            arg1 = arg1.Position
        elseif typeof(arg1) ~= "Vector3" then
            arg1 = HumanoidRootPart and HumanoidRootPart.Position or Vector3.zero
        end

        if typeof(arg2) == "Instance" then
            if arg2:IsA("BasePart") then
                arg2 = arg2.Position
            else
                if not arg2:IsA("Model") then
                    return 0
                end

                arg2 = arg2:GetPivot().Position
            end
        elseif typeof(arg2) == "CFrame" then
            arg2 = arg2.Position
        elseif typeof(arg2) ~= "Vector3" then
            return 0
        end

        return (arg2 - arg1).Magnitude
    end,
    SetNoclip = function(arg1)
        if arg1 then
            if connection2 then
                return
            end

            connection2 = RunService.Stepped:Connect(function()
                if not Character then
                    return
                end

                for _, descendant in ipairs(Character:GetDescendants()) do
                    if descendant:IsA("BasePart") and descendant.CanCollide and descendant.Name ~= "PartTele" then
                        descendant.CanCollide = false
                    end
                end
            end)

            return
        end

        if connection2 then
            connection2:Disconnect()
            connection2 = nil
        end

        if not Character then
            return
        end

        for _, descendant in ipairs(Character:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.Name ~= "PartTele" and (descendant.Name == "HumanoidRootPart" or descendant.Name == "UpperTorso" or descendant.Name == "LowerTorso" or descendant.Name == "Torso" or descendant.Name == "Head") then
                descendant.CanCollide = true
            end
        end
    end
}

var7 = {
    currentOwner = nil,
    startTime = 0,
    maxTimeout = 8,
    CanStart = function(arg1): boolean
        if not var7.currentOwner then
            return true
        end

        local startTime = var7.startTime

        if not (os.clock() - startTime > var7.maxTimeout) then
            return var7.currentOwner == arg1
        end

        var7.currentOwner = nil

        return true
    end,
    Claim = function(currentOwner, arg2): boolean
        if not var7.CanStart(currentOwner) then
            return false
        end

        var7.currentOwner = currentOwner
        var7.startTime = os.clock()
        var7.maxTimeout = arg2 or 8

        return true
    end,
    Release = function(arg1)
        if var7.currentOwner == arg1 then
            var7.currentOwner = nil
            var7.startTime = 0
        end
    end,
    IsBusy = function(arg1): boolean
        return not var7.CanStart(arg1)
    end
}

local num1 = 0
local bool1 = false
local var23 = nil

function StopTween()
    num1 += 1
    bool1 = true

    if var23 then
        Callback(function()
            var23:Cancel()
        end)

        var23 = nil
    end

    if connection then
        Callback(function()
            connection:Disconnect()
        end)

        connection = nil
    end

    if Character and Character:FindFirstChild("PartTele") then
        Callback(function()
            Character.PartTele:Destroy()
        end)
    end

    if HumanoidRootPart then
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end

    if not Configs.NoClip then
        tbl18.SetNoclip(false)
    end
end

function tbl18.TweenWaypoints(arg1, arg2)
    if not (Character and HumanoidRootPart and var3) then
        return
    end

    if not arg1 or #arg1 == 0 then
        return
    end

    arg2 = arg2 or Configs.TweenSpeed or 200
    arg2 = arg2 <= 0 and 200 or arg2
    StopTween()
    bool1 = false
    local num2 = num1
    local PartTele = Character:FindFirstChild("PartTele")

    if not PartTele then
        PartTele = Instance.new("Part")
        PartTele.Size = Vector3.new(4, 1, 4)
        PartTele.Name = "PartTele"
        PartTele.Anchored = true
        PartTele.Transparency = 1
        PartTele.CanCollide = false
        PartTele.CanQuery = false
        PartTele.CanTouch = false
        PartTele.Position = HumanoidRootPart.Position
        PartTele.Parent = Character
    end

    PartTele.CFrame = HumanoidRootPart.CFrame

    connection = RunService.Heartbeat:Connect(function()
        local PartTele2 = Character and Character:FindFirstChild("PartTele")

        if HumanoidRootPart and PartTele2 then
            HumanoidRootPart.CFrame = PartTele2.CFrame
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
            HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    tbl18.SetNoclip(true)

    for _, v in ipairs(arg1) do
        if bool1 or num1 ~= num2 or not (Character and Character.Parent and HumanoidRootPart) then
            break
        end

        if typeof(v) == "Vector3" then
            v = CFrame.new(v)
        elseif typeof(v) ~= "CFrame" then
            if typeof(v) == "Instance" then
                v = v:IsA("BasePart") and v.CFrame or v:GetPivot()
            elseif type(v) == "table" and v.Position then
                v = CFrame.new(v.Position)
            else
                v = nil
            end
        end

        if not v then
            continue
        end

        local Magnitude = (v.Position - PartTele.Position).Magnitude

        if Magnitude > 1 then
            local time = math.max(0.04, Magnitude / arg2)
            local var24 = TweenService:Create(PartTele, TweenInfo.new(time, Enum.EasingStyle.Linear), { CFrame = v })
            var23 = var24
            var24:Play()
            local bool2 = false

            local connection3 = var24.Completed:Connect(function()
                bool2 = true
            end)

            local num3 = os.clock() + time + 1.2

            while not bool2 and os.clock() < num3 do
                task.wait(0.03)

                if bool1 or num1 ~= num2 or not (Character and Character.Parent and HumanoidRootPart) then
                    break
                end
            end

            if connection3 then
                connection3:Disconnect()
            end

            if var23 == var24 then
                var23 = nil
            end
        else
            PartTele.CFrame = v
        end
    end

    if connection then
        connection:Disconnect()
        connection = nil
    end

    if Character and Character:FindFirstChild("PartTele") then
        Callback(function()
            Character.PartTele:Destroy()
        end)
    end

    if not Configs.NoClip then
        tbl18.SetNoclip(false)
    end

    local var24 = arg1[#arg1]

    if typeof(var24) ~= "CFrame" then
        if typeof(var24) == "Vector3" then
            var24 = CFrame.new(var24)
        elseif typeof(var24) == "Instance" then
            var24 = var24:IsA("BasePart") and var24.CFrame or var24:GetPivot()
        elseif type(var24) == "table" and var24.Position then
            var24 = CFrame.new(var24.Position)
        else
            var24 = nil
        end
    end

    if not bool1 and num1 == num2 and HumanoidRootPart and var24 then
        HumanoidRootPart.CFrame = var24
        Character:PivotTo(var24)
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end
end

function tbl18.TweenToEgg(arg1, arg2)
    if not (Character and HumanoidRootPart and var3) then
        return
    end

    if not arg1 then
        return
    end

    local Position = arg1.Position
    local vec3: Vector3 = Vector3.new(Position.X, Position.Y + 3.2, Position.Z)
    local cFrame: CFrame = CFrame.new(vec3)
    StopTween()
    bool1 = false
    local num2 = num1
    local HumanoidRootPartPosition = HumanoidRootPart.Position
    local Magnitude = Vector2.new(vec3.X - HumanoidRootPartPosition.X, vec3.Z - HumanoidRootPartPosition.Z).Magnitude
    local PartTele: Part = Instance.new("Part")
    PartTele.Size = Vector3.new(4, 1, 4)
    PartTele.Name = "PartTele"
    PartTele.Anchored = true
    PartTele.Transparency = 1
    PartTele.CanCollide = false
    PartTele.CanQuery = false
    PartTele.CanTouch = false
    PartTele.CFrame = HumanoidRootPart.CFrame
    PartTele.Parent = Character

    connection = RunService.Heartbeat:Connect(function()
        local PartTele2 = Character and Character:FindFirstChild("PartTele")

        if HumanoidRootPart and PartTele2 then
            HumanoidRootPart.CFrame = PartTele2.CFrame
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
            HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    tbl18.SetNoclip(true)
    local var24 = arg2 or Configs.TweenSpeed or 200
    local var25 = var24 <= 0 and 200 or var24

    if Magnitude > 20 then
        local y = math.max(HumanoidRootPartPosition.Y, vec3.Y) + 14
        local tbl19 = {}
        local vec3_2: Vector3 = Vector3.new(HumanoidRootPartPosition.X, y, HumanoidRootPartPosition.Z)
        local vec3_3: Vector3 = Vector3.new(vec3.X, y, vec3.Z)
        tbl19[1] = vec3_2
        tbl19[2] = vec3_3
        tbl19[3] = vec3

        for _, v in ipairs(tbl19) do
            local bool2 = bool1

            if not bool1 then
                bool2 = num1 ~= num2
            end

            if bool2 or not (Configs.AutoPickup or Configs.KaitunMode) or not (Character and Character.Parent and HumanoidRootPart) then
                break
            end

            local cFrame2: CFrame = CFrame.new(v)
            local Magnitude2 = (cFrame2.Position - PartTele.Position).Magnitude

            if Magnitude2 > 1 then
                local time = math.max(0.04, Magnitude2 / var25)
                local var26 = TweenService:Create(PartTele, TweenInfo.new(time, Enum.EasingStyle.Linear), { CFrame = cFrame2 })
                var23 = var26
                var26:Play()
                local bool3 = false

                local connection3 = var26.Completed:Connect(function()
                    bool3 = true
                end)

                local num3 = os.clock() + time + 1.2

                while not bool3 and os.clock() < num3 do
                    task.wait(0.03)

                    if bool1 or num1 ~= num2 or not (Configs.AutoPickup or Configs.KaitunMode) or not (Character and Character.Parent and HumanoidRootPart) then
                        break
                    end
                end

                if connection3 then
                    connection3:Disconnect()
                end

                if var23 == var26 then
                    var23 = nil
                end
            else
                PartTele.CFrame = cFrame2
            end
        end
    else
        local time = math.max(0.04, (vec3 - HumanoidRootPartPosition).Magnitude / var25)
        local var26 = TweenService:Create(PartTele, TweenInfo.new(time, Enum.EasingStyle.Linear), { CFrame = cFrame })
        var23 = var26
        var26:Play()
        local bool2 = false

        local connection3 = var26.Completed:Connect(function()
            bool2 = true
        end)

        local num3 = os.clock() + time + 1.2

        while not bool2 and os.clock() < num3 do
            task.wait(0.03)

            if bool1 or num1 ~= num2 or not (Configs.AutoPickup or Configs.KaitunMode) or not (Character and Character.Parent and HumanoidRootPart) then
                break
            end
        end

        if connection3 then
            connection3:Disconnect()
        end

        if var23 == var26 then
            var23 = nil
        end
    end

    if connection then
        connection:Disconnect()
        connection = nil
    end

    if Character and Character:FindFirstChild("PartTele") then
        Callback(function()
            Character.PartTele:Destroy()
        end)
    end

    if not Configs.NoClip then
        tbl18.SetNoclip(false)
    end

    if not bool1 and num1 == num2 and (Configs.AutoPickup or Configs.KaitunMode) and HumanoidRootPart then
        HumanoidRootPart.CFrame = cFrame
        Character:PivotTo(cFrame)
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end
end

function TP(arg1, arg2)
    if not arg1 then
        return
    end

    tbl18.TweenWaypoints({ arg1 }, arg2)
end

function tbl18.firePrompt(ProximityPrompt): boolean
    if not ProximityPrompt then
        return false
    end

    ProximityPrompt.Enabled = true
    ProximityPrompt.HoldDuration = 0
    ProximityPrompt.RequiresLineOfSight = false
    ProximityPrompt.MaxActivationDistance = 50

    if typeof(fireproximityprompt) == "function" then
        Callback(fireproximityprompt, ProximityPrompt, 0)
    end

    if ProximityPrompt.InputHoldBegin and ProximityPrompt.InputHoldEnd then
        ProximityPrompt:InputHoldBegin()
        task.wait(0.05)
        ProximityPrompt:InputHoldEnd()
    end

    local var24 = getconnections and getconnections(ProximityPrompt.Triggered)

    if var24 then
        for _, v in ipairs(var24) do
            if v.Function then
                Callback(v.Function, LocalPlayer)
            end
        end
    end

    return true
end

function tbl18.GetPlot()
    if General and General.GetPlot then
        local bool2, var24 = Callback(General.GetPlot, General, LocalPlayer)

        if bool2 and var24 then
            return var24
        end
    end

    local Plots = workspace:FindFirstChild("Plots")

    if Plots then
        for _, child in ipairs(Plots:GetChildren()) do
            local Data = child:FindFirstChild("Data")
            local Owner = Data and Data:FindFirstChild("Owner")
            local bool2

            if Owner then
                bool2 = Owner.Value == LocalPlayer

                if not bool2 then
                    local LocalPlayerName = LocalPlayer.Name
                    bool2 = tostring(Owner.Value) == LocalPlayerName
                end
            else
                bool2 = Owner
            end

            if bool2 then
                return child
            end

            local UserId = LocalPlayer.UserId

            if child:GetAttribute("NestsOwnerLoaded") == UserId or tostring(child:GetAttribute("NestsOwnerLoaded")) == tostring(LocalPlayer.UserId) then
                return child
            end

            local UserId2 = LocalPlayer.UserId

            if child:GetAttribute("Owner") == UserId2 or tostring(child:GetAttribute("Owner")) == tostring(LocalPlayer.UserId) then
                return child
            end
        end
    end

    return nil
end

function tbl18.IsEggBreakingUIVisible(): boolean
    local var24 = PlayerGui or LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui")

    if not var24 then
        return false
    end

    local EggBreaking = var24:FindFirstChild("EggBreaking")

    if not (EggBreaking and EggBreaking.Enabled) then
        return false
    end

    local EggBreaking2 = EggBreaking:FindFirstChild("EggBreaking")

    if EggBreaking2 and EggBreaking2.Visible == true then
        return true
    end

    local FirstTime = EggBreaking:FindFirstChild("FirstTime")

    return FirstTime and FirstTime.Visible == true and true or false
end

function tbl18.TeleportHome(arg1)
    local plot = tbl18.GetPlot()
    local Baseplate = plot and plot:FindFirstChild("Baseplate")

    if not Baseplate then
        return false
    end

    if HumanoidRootPart and (HumanoidRootPart.Position - Baseplate.Position).Magnitude <= 30 then
        return true
    end

    if not tbl18.HasCarriedEgg() and TeleportToPlot then
        Callback(function()
            TeleportToPlot:FireServer()
        end)

        task.wait(0.2)

        if HumanoidRootPart and (HumanoidRootPart.Position - Baseplate.Position).Magnitude <= 35 then
            return true
        end
    end

    tbl18.DiveHome(arg1 or 800)

    return true
end

function tbl18.DiveHome(arg1): boolean
    local plot = tbl18.GetPlot()
    local Baseplate = plot and plot:FindFirstChild("Baseplate")

    if not Baseplate then
        return false
    end

    if not (HumanoidRootPart and Character) then
        return false
    end

    local BaseplatePosition = Baseplate.Position
    local HumanoidRootPartPosition = HumanoidRootPart.Position
    local Magnitude = (HumanoidRootPartPosition - BaseplatePosition).Magnitude
    local Magnitude2 = Vector2.new(HumanoidRootPartPosition.X - BaseplatePosition.X, HumanoidRootPartPosition.Z - BaseplatePosition.Z).Magnitude

    if Magnitude <= 25 or Magnitude2 <= 20 and math.abs(HumanoidRootPartPosition.Y - BaseplatePosition.Y) <= 15 then
        return true
    end

    arg1 = arg1 or Configs.HomeSpeed or 800
    local y = math.max(HumanoidRootPartPosition.Y, BaseplatePosition.Y) + 18
    local tbl19 = {}
    local vec3: Vector3 = Vector3.new(HumanoidRootPartPosition.X, y, HumanoidRootPartPosition.Z)
    local vec3_2: Vector3 = Vector3.new(BaseplatePosition.X, y, BaseplatePosition.Z)
    local var24 = Baseplate.CFrame + Vector3.new(0, 3.5, 0)
    tbl19[1] = vec3
    tbl19[2] = vec3_2
    tbl19[3] = var24
    StopTween()
    bool1 = false
    local num2 = num1
    local PartTele = Character:FindFirstChild("PartTele")

    if not PartTele then
        PartTele = Instance.new("Part")
        PartTele.Size = Vector3.new(4, 1, 4)
        PartTele.Name = "PartTele"
        PartTele.Anchored = true
        PartTele.Transparency = 1
        PartTele.CanCollide = false
        PartTele.CanQuery = false
        PartTele.CanTouch = false
        PartTele.Position = HumanoidRootPart.Position
        PartTele.Parent = Character
    end

    PartTele.CFrame = HumanoidRootPart.CFrame

    connection = RunService.Heartbeat:Connect(function()
        local PartTele2 = Character and Character:FindFirstChild("PartTele")

        if HumanoidRootPart and PartTele2 then
            HumanoidRootPart.CFrame = PartTele2.CFrame
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
            HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    tbl18.SetNoclip(true)

    for _, v in ipairs(tbl19) do
        if bool1 or num1 ~= num2 or not (Character and Character.Parent and HumanoidRootPart) then
            break
        end

        if typeof(v) == "Vector3" then
            v = CFrame.new(v) or v
        end

        local Magnitude3 = (v.Position - PartTele.Position).Magnitude

        if Magnitude3 > 1 then
            local time = math.max(0.04, Magnitude3 / arg1)
            local var25 = TweenService:Create(PartTele, TweenInfo.new(time, Enum.EasingStyle.Linear), { CFrame = v })
            var23 = var25
            var25:Play()
            local bool2 = false

            local connection3 = var25.Completed:Connect(function()
                bool2 = true
            end)

            local num3 = os.clock() + time + 1.2

            while not bool2 and os.clock() < num3 do
                task.wait(0.03)

                if bool1 or num1 ~= num2 or not (Character and Character.Parent and HumanoidRootPart) then
                    break
                end
            end

            if connection3 then
                connection3:Disconnect()
            end

            if var23 == var25 then
                var23 = nil
            end
        else
            PartTele.CFrame = v
        end
    end

    if connection then
        connection:Disconnect()
        connection = nil
    end

    if Character and Character:FindFirstChild("PartTele") then
        Callback(function()
            Character.PartTele:Destroy()
        end)
    end

    if not Configs.NoClip then
        tbl18.SetNoclip(false)
    end

    if not bool1 and num1 == num2 and HumanoidRootPart then
        local var25 = Baseplate.CFrame + Vector3.new(0, 3.5, 0)
        HumanoidRootPart.CFrame = var25
        Character:PivotTo(var25)
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end

    return true
end

function tbl18.GetBasketEggCount(): number
    local Basket = LocalPlayer:FindFirstChild("Basket")

    return if Basket then #Basket:GetChildren() else 0
end

function tbl18.IsBasketFull(): boolean
    local basketEggCount = tbl18.GetBasketEggCount()
    local EquippedEggBasketValue = SavedData and SavedData:FindFirstChild("EquippedEggBasket") and SavedData.EquippedEggBasket.Value or "Wooden"
    local Capacity = var10 and var10[EquippedEggBasketValue] and var10[EquippedEggBasketValue].Capacity or 1

    return not (Capacity == "inf" or Capacity == math.huge) and (tonumber(Capacity) or 1) <= basketEggCount
end

function tbl18.GetHeldEggTool()
    if Character then
        for _, child in ipairs(Character:GetChildren()) do
            if child:IsA("Tool") and (child:HasTag("Egg") or child.Name:lower():find("egg") or child:GetAttribute("Egg") ~= nil) then
                return child
            end
        end
    end

    return nil
end

function tbl18.GetBackpackEggTool()
    if Backpack then
        for _, child in ipairs(Backpack:GetChildren()) do
            if child:IsA("Tool") and (child:HasTag("Egg") or child.Name:lower():find("egg") or child:GetAttribute("Egg") ~= nil) then
                return child
            end
        end
    end

    return nil
end

function tbl18.GetCarriedEggTool()
    local heldEggTool = tbl18.GetHeldEggTool()

    if heldEggTool then
        return heldEggTool, true
    end

    local backpackEggTool = tbl18.GetBackpackEggTool()

    if backpackEggTool then
        return backpackEggTool, false
    end

    return nil, false
end

function tbl18.HasCarriedEgg(): boolean
    return if tbl18.GetCarriedEggTool() then true else tbl18.GetBasketEggCount() > 0
end

local num2 = 0
local str2 = "Plot Nest"

local function f21(embeds)
    if not Configs.WebhookEnabled then
        return
    end

    local WebhookUrl = Configs.WebhookUrl

    if not WebhookUrl or WebhookUrl == "" then
        return
    end

    local bool2, Body = Callback(HttpService.JSONEncode, HttpService, {
        username = "BONK HUB | " .. str1,
        avatar_url = "https://i.imgur.com/G5K5z2S.png",
        embeds = embeds
    })

    if not bool2 then
        return
    end

    local request = syn and syn.request or http and http.request or request or http_request

    if not request then
        return
    end

    Callback(request, {
        Url = WebhookUrl,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = Body
    })
end

local function f22()
    if not Configs.WebhookShowUser then
        return ({
            name = "BONK HUB | Automation Suite",
            icon_url = "https://i.imgur.com/G5K5z2S.png"
        } :: {icon_url: string, name: string})
    end

    local LocalPlayerName = LocalPlayer.Name
    local DisplayName = LocalPlayer.DisplayName or LocalPlayerName
    local str3 = tostring(LocalPlayer.UserId)

    return ({
        name = string.format("%s (@%s)", DisplayName, LocalPlayerName),
        icon_url = string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%s&width=420&height=420&format=png", str3),
        url = string.format("https://www.roblox.com/users/%s/profile", str3)
    } :: {icon_url: string, name: string, url: string})
end

local tbl19: {Common: string, Divine: string, Epic: string, Ethereal: string, Legendary: string, Mythic: string, Rare: string, Uncommon: string} = {
    Divine = "👑",
    Ethereal = "🌌",
    Mythic = "🔥",
    Legendary = "⭐",
    Epic = "🔮",
    Rare = "💎",
    Uncommon = "🍀",
    Common = "⚪"
}

local function f23()
    local RenderedEggs = workspace:FindFirstChild("RenderedEggs")
    local byRarity = {
        Divine = {},
        Ethereal = {},
        Mythic = {},
        Legendary = {},
        Epic = {},
        Rare = {},
        Uncommon = {},
        Common = {}
    }
    local closest = {}
    local HumanoidRootPartPosition = HumanoidRootPart and HumanoidRootPart.Position or Vector3.zero
    local num3 = 0

    if RenderedEggs then
        for _, child in ipairs(RenderedEggs:GetChildren()) do
            local var24 = var8[child.Name]
            local Rarity = var24 and var24.Rarity or "Common"
            num3 += 1

            if not byRarity[Rarity] then
                byRarity[Rarity] = {}
            end

            byRarity[Rarity][child.Name] = (byRarity[Rarity][child.Name] or 0) + 1
            local var25 = child:FindFirstChildWhichIsA("BasePart") or child.PrimaryPart

            if not var25 then
                continue
            end

            local num4 = math.floor((var25.Position - HumanoidRootPartPosition).Magnitude)

            if not closest[child.Name] or num4 < closest[child.Name] then
                closest[child.Name] = num4
            end
        end
    end

    return {
        total = num3,
        byRarity = byRarity,
        closest = closest
    }
end

local function func11()
    local tbl20 = f23()
    local fields = {}
    local tbl22: {string} = {
        "Divine",
        "Ethereal",
        "Mythic",
        "Legendary",
        "Epic",
        "Rare",
        "Uncommon",
        "Common"
    }
    local str3 = ""

    for _, v in ipairs(tbl22) do
        local var24 = tbl20.byRarity[v]
        local num3 = 0

        if var24 then
            for _, v2 in pairs(var24) do
                num3 += v2
            end
        end

        if num3 > 0 then
            str3 ..= string.format("%s **%s**: %d | ", tbl19[v] or "🥚", v, num3)
        end
    end

    if str3 ~= "" then
        table.insert(fields, {
            name = "📊 Rarity Distribution",
            value = str3:sub(1, -4),
            inline = false
        })
    end

    for _, v in ipairs(tbl22) do
        local var24 = tbl20.byRarity[v]

        if not (var24 and next(var24)) then
            continue
        end

        local num3 = 0
        local str4 = ""

        for k, v2 in pairs(var24) do
            num3 += v2
            local var25 = tbl20.closest[k]
            local str5 = var25 and string.format(" *(nearest: %dm)*", var25) or ""
            local var26 = var8[k]
            local str6 = not (var26 and var26.Luck and var26.Luck > 0) and "" or string.format(" [Luck: +%d%%]", var26.Luck)
            str4 ..= string.format("• **%s** x%d%s%s\n", k, v2, str5, str6)
        end

        table.insert(fields, {
            name = string.format("%s %s Eggs (%d spawned)", tbl19[v] or "🥚", v, num3),
            value = str4,
            inline = false
        })
    end

    local plot = tbl18.GetPlot()
    local str4 = not (plot and plot:FindFirstChild("Eggs")) and "Active" or string.format("%d Eggs Growing on Plot", #plot.Eggs:GetChildren())
    local date = os.date
    local str5 = string.format("• **Total Eggs in World:** %d\n• **Active Players:** %d / 12\n• **Player Plot Status:** %s\n• **Map Time:** %s", tbl20.total, #Players:GetPlayers(), str4, date("%H:%M:%S"))

    if Configs.WebhookShowJobId then
        local tostring2 = tostring
        local JobId = game.JobId
        local format = string.format
        local str6 = tostring(game.JobId)
        local PlaceId = game.PlaceId
        str5 ..= format("\n• **Job ID:** `%s`\n• **Quick Join Code:**\n```js\nRoblox.GameLauncher.joinGameInstance(%s, \"%s\")\n```", str6, tostring(PlaceId), (tostring2(JobId)))
    end

    table.insert(fields, {
        name = "🌐 World & Server Diagnostics",
        value = str5,
        inline = false
    })
    f21({
        {
            title = "🗺️ Server Eggs Live Radar Scanner | BONK HUB",
            description = string.format("📡 Complete map scan finished. Currently **%d eggs** active in the world.", tbl20.total),
            color = 3447003,
            author = f22(),
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            footer = {
                text = "BONK HUB | " .. str1 .. " • Live Radar Scanner"
            },
            fields = fields
        }
    })
end

local function f24(arg1, arg2)
    if not Configs.WebhookOnHatch then
        return
    end

    local name = type(arg1) == "table" and arg1.name or tostring(arg1 or "Unknown")
    local var24 = var12[name]
    local Rarity = var24 and var24.Rarity or "Common"

    if (tbl4[Rarity] or 1) < (tbl4[Configs.WebhookHatchMinRarity or "Common"] or 1) then
        return
    end

    local var25 = type(arg1) ~= "table" and 0 or arg1.weight or 0
    local dispWeight = type(arg1) == "table" and arg1.dispWeight or math.floor(var25) .. " KG"
    local mutation = if type(arg1) == "table" then arg1.mutation or nil else nil
    local var26 = type(arg1) ~= "table" and 1 or arg1.age or 1
    local color = tbl6[Rarity] or 5814783
    local var28 = SavedData
    local var29 = SavedData

    if var28 then
        var29 = SavedData:FindFirstChild("Cash")
    end

    local CashValue = var29 and var28.Cash.Value or 0
    local num3 = func5()
    local startTime = tbl17.startTime
    local num4 = math.max(1, os.clock() - startTime)
    local var30 = func6(num4)
    local num5 = math.floor(num3 / num4 * 3600)
    local num6 = math.floor(tbl17.petsHatched / num4 * 3600)
    local plot = tbl18.GetPlot()
    local var31 = plot and plot:FindFirstChild("Pets") and #plot.Pets:GetChildren() or 0
    local MaxPets = LocalPlayer:GetAttribute("MaxPets") or 5
    local var32 = arg2 and var8[arg2]
    local Rarity2 = var32 and var32.Rarity or "Common"
    local Luck = var32 and var32.Luck or 0
    local str3 = var24 and var24.SampleSize and "1 in " .. func7(var24.SampleSize) or "Standard"
    local str4 = mutation and "⚡ **" .. tostring(mutation) .. "**" or "None"
    local fields = {}
    local tbl21: {inline: boolean, name: string, value: string} = {
        name = "🐾 Hatched Pet Overview",
        value = string.format(
            "• **Name:** %s\n• **Rarity:** %s **%s**\n• **Mutation:** %s\n• **Weight:** **%s** (Base: %.2f)\n• **Age / Level:** Lvl %d\n• **Hatch Odds:** %s",
            name,
            tbl19[Rarity] or "✨",
            Rarity,
            str4,
            dispWeight,
            tonumber(var25) or 0,
            tonumber(var26) or 1,
            str3
        ),
        inline = false
    }
    local tbl22: {inline: boolean, name: string, value: string} = {
        name = "⚡ Pet Base Stats",
        value = string.format("• **Income:** +$%s / tick\n• **Speed:** %d\n• **Jump Power:** %d", func7(var24 and var24.Income or 0), tonumber(var24 and var24.Speed or 0), (tonumber(var24 and var24.JumpPower or 0))),
        inline = true
    }
    local tbl23: {inline: boolean, name: string, value: string} = {
        name = "🥚 Nest & Egg Source",
        value = string.format("• **Source:** %s\n• **Egg Rarity:** %s\n• **Egg Luck:** +%d%%\n• **Hatch #:** %d of session", arg2 or "Plot Nest", Rarity2, Luck, tbl17.petsHatched),
        inline = true
    }
    local tbl24: {inline: boolean, name: string, value: string} = {
        name = "💰 Economy Status",
        value = string.format("• **Cash Balance:** $%s\n• **Session Profit:** +$%s\n• **Earning Rate:** +$%s / hr", func7(CashValue), func7(num3), func7(num5)),
        inline = true
    }
    local tbl25: {inline: boolean, name: string, value: string} = {
        name = "📈 Session Analytics",
        value = string.format("• **Total Hatched:** %d (~%d/hr)\n• **Eggs Farmed:** %d\n• **Ranch Space:** %d / %d Pets", tbl17.petsHatched, num6, tbl17.eggsFarmed, var31, MaxPets),
        inline = true
    }
    local tbl26: {inline: boolean, name: string, value: string} = {
        name = "⏱️ Session Uptime",
        value = string.format("• **Elapsed:** %s\n• **Client:** %s", var30, var4),
        inline = true
    }
    fields[1] = tbl21
    fields[2] = tbl22
    fields[3] = tbl23
    fields[4] = tbl24
    fields[5] = tbl25
    fields[6] = tbl26
    f21({
        {
            title = string.format("%s Pet Hatched: %s%s [%s] | BONK HUB", (Rarity == "Divine" or Rarity == "Ethereal" or Rarity == "Mythic") and "🔥" or "🐣", mutation and "[" .. tostring(mutation) .. "] " or "", name, Rarity),
            description = string.format("🎉 **Congratulations!** Successfully hatched **%s** from **%s**!", name, arg2 or "Egg"),
            color = color,
            author = f22(),
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            footer = {
                text = "BONK HUB | " .. str1 .. " • Auto Hatch Alert"
            },
            fields = fields
        }
    })
end

local function f25(arg1, arg2)
    if not Configs.WebhookOnEggReturned then
        return
    end

    local var24 = var8[arg1]
    local Rarity = var24 and var24.Rarity or "Common"
    local color = tbl6[Rarity] or 3066993
    local var26 = SavedData
    local var27 = SavedData

    if var26 then
        var27 = SavedData:FindFirstChild("Cash")
    end

    local CashValue = var27 and var26.Cash.Value or 0
    local num3 = func5()
    local startTime = tbl17.startTime
    local num4 = math.max(1, os.clock() - startTime)
    local var28 = func6(num4)
    local num5 = math.floor(tbl17.eggsFarmed / num4 * 3600)
    local fields = {}
    local tbl21: {inline: boolean, name: string, value: string} = {
        name = "🥚 Returned Egg Details",
        value = string.format("• **Egg Name:** %s\n• **Rarity Tier:** %s **%s**\n• **Incubation Time:** %ds\n• **Target Spot:** %s", arg1, tbl19[Rarity] or "🥚", Rarity, var24 and var24.GrowthTime or 0, (tostring(arg2 or "Plot Ground"))),
        inline = false
    }
    local tbl22: {inline: boolean, name: string, value: string} = {
        name = "🏡 Ranch Nest Status",
        value = string.format("• **Plot Eggs:** Growing\n• **Total Farmed:** %d eggs (~%d/hr)\n• **Session Net Profit:** +$%s", tbl17.eggsFarmed, num5, func7(num3)),
        inline = true
    }
    local tbl23: {inline: boolean, name: string, value: string} = {
        name = "💰 Current Balance",
        value = string.format("• **Cash:** $%s\n• **Session Uptime:** %s", func7(CashValue), var28),
        inline = true
    }
    fields[1] = tbl21
    fields[2] = tbl22
    fields[3] = tbl23

    if Configs.WebhookShowJobId then
        table.insert(fields, {
            name = "🔑 Server Identifier",
            value = string.format("`%s`", (tostring(game.JobId))),
            inline = false
        })
    end

    f21({
        {
            title = string.format("🥚 Egg Secured in Ranch: %s [%s] | BONK HUB", arg1, Rarity),
            description = string.format("🏡 Successfully brought **%s** (%s) back to base and secured on your Plot!", arg1, Rarity),
            color = color,
            author = f22(),
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            footer = {
                text = "BONK HUB | " .. str1 .. " • Egg Return Notification"
            },
            fields = fields
        }
    })
end

local function func12()
    if not Configs.WebhookPeriodicReport then
        return
    end

    local var24 = SavedData
    local var25 = SavedData

    if var24 then
        var25 = SavedData:FindFirstChild("Cash")
    end

    local CashValue = var25 and var24.Cash.Value or 0
    local num3 = func5()
    local startTime = tbl17.startTime
    local num4 = math.max(1, os.clock() - startTime)
    local var26 = func6(num4)
    local num5 = math.floor(num3 / num4 * 3600)
    local num6 = math.floor(tbl17.eggsFarmed / num4 * 3600)
    local num7 = math.floor(tbl17.petsHatched / num4 * 3600)
    local plot = tbl18.GetPlot()
    local num8 = plot and plot:FindFirstChild("Pets") and #plot.Pets:GetChildren() or 0
    local MaxPets = LocalPlayer:GetAttribute("MaxPets") or 5
    local tbl20 = f23()
    local str3 = ""

    if plot and plot:FindFirstChild("Pets") then
        for _, child in ipairs(plot.Pets:GetChildren()) do
            local var27 = var12[child.Name]
            local Rarity = var27 and var27.Rarity or "Common"
            local num9 = tonumber(child:GetAttribute("Weight")) or 0
            local Mutation = child:GetAttribute("Mutation")
            str3 ..= string.format("• %s **%s**%s (%.1f KG | +$%d/t)\n", tbl19[Rarity] or "🐾", child.Name, Mutation and " [" .. tostring(Mutation) .. "]" or "", num9, var27 and var27.Income or 0)
        end
    end

    local value = str3 == "" and "No pets placed yet." or str3
    local var27 = SavedData

    if var24 then
        var27 = SavedData:FindFirstChild("Rebirths")
    end

    local RebirthsValue = var27 and var24.Rebirths.Value or 0
    local var28 = SavedData

    if var24 then
        var28 = SavedData:FindFirstChild("EquippedEggBasket")
    end

    local EquippedEggBasketValue = var28 and var24.EquippedEggBasket.Value or "Wooden"
    local var29 = SavedData

    if var24 then
        var29 = SavedData:FindFirstChild("HatchUpgrades")
    end

    local HatchUpgradesValue = var29 and var24.HatchUpgrades.Value or 0
    local fields = {}
    local tbl22: {inline: boolean, name: string, value: string} = {
        name = "💰 Financial Audit",
        value = string.format("• **Current Balance:** $%s\n• **Session Net Profit:** +$%s\n• **Income Generation:** +$%s / hour", func7(CashValue), func7(num3), func7(num5)),
        inline = true
    }
    local tbl23: {inline: boolean, name: string, value: string} = {
        name = "🚜 Farm Performance",
        value = string.format("• **Eggs Farmed:** %d (~%d/hr)\n• **Pets Hatched:** %d (~%d/hr)", tbl17.eggsFarmed, num6, tbl17.petsHatched, num7),
        inline = true
    }
    local tbl24 = { name = "👤 Character Progression" }
    local format = string.format
    local str5 = tostring(RebirthsValue)
    local tostring2 = tostring
    tbl24.value = format("• **Rebirths:** %s\n• **Basket:** %s\n• **Hatch Upgrades:** %s / 50", str5, tostring(EquippedEggBasketValue), (tostring2(HatchUpgradesValue)))
    tbl24.inline = true
    local tbl25 = {
        name = string.format("🏡 Ranch Livestock (%d / %d Pets)", num8, MaxPets),
        value = value,
        inline = false
    }
    local tbl26: {inline: boolean, name: string, value: string} = {
        name = "🗺️ World Overview",
        value = string.format("• **Server Eggs Spawned:** %d eggs\n• **Players Online:** %d\n• **Uptime:** %s", tbl20.total, #Players:GetPlayers(), var26),
        inline = false
    }
    fields[1] = tbl22
    fields[2] = tbl23
    fields[3] = tbl24
    fields[4] = tbl25
    fields[5] = tbl26

    if Configs.WebhookShowJobId then
        table.insert(fields, {
            name = "🔑 Server Identifier",
            value = string.format("`%s`", (tostring(game.JobId))),
            inline = false
        })
    end

    f21({
        {
            title = "📊 BonkHub Session Farming Report & Analytics",
            description = "Comprehensive periodic telemetry update from active automation session.",
            color = 3066993,
            author = f22(),
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            footer = {
                text = "BONK HUB | " .. str1 .. " • Periodic Status Report"
            },
            fields = fields
        }
    })
end

local function func13()
    local tbl20 = {
        title = "🧪 BonkHub Detailed Webhook Test | Connection Verified",
        description = "✅ Your Discord Webhook is fully connected and ready to receive ultra-detailed farming notifications, hatch alerts, and live server radar updates!",
        color = 5814783,
        author = f22(),
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        footer = {
            text = "BONK HUB | " .. str1 .. " • Webhook Diagnostics"
        }
    }
    local fields = {}
    local tbl22 = {
        name = "🎮 Game",
        value = str1,
        inline = true
    }
    local tbl23: {inline: boolean, name: string, value: string} = {
        name = "👤 Player",
        value = string.format("%s (@%s)", LocalPlayer.DisplayName, LocalPlayer.Name),
        inline = true
    }
    fields[1] = {
        name = "⚡ Integration Status",
        value = "🟢 **ONLINE & READY**",
        inline = true
    }
    fields[2] = tbl22
    fields[3] = tbl23
    fields[4] = {
        name = "📡 Telemetry Features",
        value = "• 🐣 **Pet Hatch Alerts** (Detailed with KG, Mutations, Odds & Rates)\n• 🗺️ **Server Eggs Live Radar** (Breakdown of all eggs & distances)\n• 📊 **Periodic Farming Summary** (Financials, Top Pets, Ranch Status)\n• 🚨 **Rare Egg Radar Alert** (Instant snipe notification)",
        inline = false
    }
    tbl20.fields = fields
    f21({ tbl20 })
end

local function f26(child: Instance)
    if not (child and child:IsA("Tool")) then
        return
    end

    func2(function()
        task.wait(0.12)
        local PetKey = child:GetAttribute("PetKey")

        if not PetKey or child:GetAttribute("HatchNotified") then
            return
        end

        child:SetAttribute("HatchNotified", true)

        if not (os.clock() - num2 <= 6) then
            return
        end

        local PetName = child:GetAttribute("PetName") or child.Name:match("^(.-)%s*%[") or child.Name
        local weight = tonumber(child:GetAttribute("Weight")) or 0
        local Mutation = child:GetAttribute("Mutation")
        local age = tonumber(child:GetAttribute("Age")) or 1
        f24({
            name = PetName,
            weight = weight,
            dispWeight = child.Name:match("%[([^%]]+)%]") or math.floor(weight) .. " KG",
            mutation = Mutation,
            age = age,
            petKey = PetKey
        }, str2)
    end)
end

func2(function()
    if Backpack then
        func1(Backpack.ChildAdded:Connect(f26))
    end

    if Character then
        func1(Character.ChildAdded:Connect(f26))
    end

    func1(LocalPlayer.CharacterAdded:Connect(function(character: Model)
        func1(character.ChildAdded:Connect(f26))
    end))
end)

func2(function()
    local num3 = os.clock()

    while task.wait(10) do
        if not Configs.WebhookEnabled or not Configs.WebhookPeriodicReport or Configs.WebhookUrl == "" then
            continue
        end

        local WebhookReportInterval = Configs.WebhookReportInterval or 10

        if os.clock() - num3 >= WebhookReportInterval * 60 then
            num3 = os.clock()
            Callback(func12)
        end
    end
end)

local var24 = nil

local function func14(arg1)
    if not arg1 then
        if var24 then
            Callback(function()
                var24:Destroy()
            end)

            var24 = nil
        end

        local BonkHub_BlackScreen = CoreGui2:FindFirstChild("BonkHub_BlackScreen")

        if BonkHub_BlackScreen then
            Callback(function()
                BonkHub_BlackScreen:Destroy()
            end)
        end

        return
    end

    if CoreGui2:FindFirstChild("BonkHub_BlackScreen") or var24 then
        return
    end

    local BonkHub_BlackScreen: ScreenGui = Instance.new("ScreenGui")
    BonkHub_BlackScreen.Name = "BonkHub_BlackScreen"
    BonkHub_BlackScreen.DisplayOrder = 999999
    BonkHub_BlackScreen.IgnoreGuiInset = true
    BonkHub_BlackScreen.ResetOnSpawn = false
    local frame: Frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 0
    frame.Parent = BonkHub_BlackScreen
    local textLabel: TextLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, 50)
    textLabel.Position = UDim2.new(0, 0, 0.5, -25)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
    textLabel.Text = "BONK HUB GPU Saver Active | Press Right Control to toggle UI"
    textLabel.TextSize = 16
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = frame
    BonkHub_BlackScreen.Parent = CoreGui2
    var24 = BonkHub_BlackScreen
end

local tbl20 = {
    GlobalShadows = Lighting.GlobalShadows,
    FogEnd = Lighting.FogEnd,
    Brightness = Lighting.Brightness
}
local connection3 = nil

local function func15(arg1)
    Callback(function()
        if connection3 then
            connection3:Disconnect()
            connection3 = nil
        end

        if not arg1 then
            Lighting.GlobalShadows = tbl20.GlobalShadows == nil or tbl20.GlobalShadows or true
            Lighting.FogEnd = tbl20.FogEnd or 100000
            Lighting.Brightness = tbl20.Brightness or 2

            for _, child in ipairs(Lighting:GetChildren()) do
                if child:IsA("PostProcessEffect") or child:IsA("BloomEffect") or child:IsA("BlurEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("SunRaysEffect") or child:IsA("DepthOfFieldEffect") then
                    child.Enabled = true
                end
            end

            for _, descendant in ipairs(workspace:GetDescendants()) do
                if LocalPlayer.Character and (descendant == LocalPlayer.Character or descendant:IsDescendantOf(LocalPlayer.Character)) then
                    continue
                end

                if descendant:IsA("ParticleEmitter")
                    or descendant:IsA("Trail")
                    or descendant:IsA("Smoke")
                    or descendant:IsA("Fire")
                    or descendant:IsA("Sparkles")
                    or descendant:IsA("Explosion")
                    or descendant:IsA("Beam")
                    or descendant:IsA("Highlight")
                then
                    descendant.Enabled = true
                elseif descendant:IsA("BasePart") then
                    descendant.CastShadow = true
                end
            end

            return
        end

        Callback(function()
            if setfpscap then
                setfpscap(240)
            end

            settings().Rendering.QualityLevel = 1
        end)

        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9000000000
        Lighting.Brightness = 1

        for _, child in ipairs(Lighting:GetChildren()) do
            if child:IsA("PostProcessEffect") or child:IsA("BloomEffect") or child:IsA("BlurEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("SunRaysEffect") or child:IsA("DepthOfFieldEffect") then
                child.Enabled = false
            end
        end

        for _, descendant in ipairs(workspace:GetDescendants()) do
            if LocalPlayer.Character and (descendant == LocalPlayer.Character or descendant:IsDescendantOf(LocalPlayer.Character)) then
                continue
            end

            if descendant:IsA("Highlight")
                or descendant:IsA("ParticleEmitter")
                or descendant:IsA("Trail")
                or descendant:IsA("Smoke")
                or descendant:IsA("Fire")
                or descendant:IsA("Sparkles")
                or descendant:IsA("Explosion")
                or descendant:IsA("Beam")
            then
                descendant.Enabled = false
            elseif descendant:IsA("BasePart") then
                descendant.CastShadow = false
            end
        end

        if workspace.Terrain then
            workspace.Terrain.WaterWaveSize = 0
            workspace.Terrain.WaterWaveSpeed = 0
            workspace.Terrain.WaterReflectance = 0
            workspace.Terrain.WaterTransparency = 0
        end

        connection3 = workspace.DescendantAdded:Connect(function(descendant: Instance)
            if not Configs.BoostFps then
                return
            end

            task.wait()

            Callback(function()
                local isHighlight = descendant:IsA("Highlight") and not (LocalPlayer.Character and descendant:IsDescendantOf(LocalPlayer.Character))

                if isHighlight
                    or descendant:IsA("ParticleEmitter")
                    or descendant:IsA("Trail")
                    or descendant:IsA("Smoke")
                    or descendant:IsA("Fire")
                    or descendant:IsA("Sparkles")
                    or descendant:IsA("Explosion")
                    or descendant:IsA("Beam")
                then
                    descendant.Enabled = false
                elseif descendant:IsA("BasePart") then
                    descendant.CastShadow = false
                end
            end)
        end)
    end)
end

local function f27(instance: Instance?): number
    if not instance then
        return 0
    end

    local var25 = var12[instance:GetAttribute("PetName") or instance.Name:match("^(.-)%s*%[") or instance.Name]
    local num3 = var25 and tonumber(var25.Income) or 0
    local num4 = tonumber(instance:GetAttribute("Weight")) or 1
    local Mutation = instance:GetAttribute("Mutation")
    local SpawnMutation = instance:GetAttribute("SpawnMutation")
    local num5 = 1

    if var15 and type(var15.CombinedFactor) == "function" then
        Callback(function()
            num5 = var15.CombinedFactor(Mutation, SpawnMutation) or 1
        end)
    end

    local num6 = math.floor(num3 * num4 / (var20 and var20.WeightStandardKG or 1)) * num5

    if num6 <= 0 then
        num6 = math.floor(num4 * 10)
    end

    return (math.floor(num6))
end

local function func3(Title, Description, arg3)
    Callback(function()
        if Library and type(Library.Notification) == "function" then
            Library:Notification({
                Title = Title,
                Description = Description,
                Duration = arg3 or 3
            })

            return
        end

        if not StarterGui or type(StarterGui.SetCore) ~= "function" then
            return
        end

        StarterGui:SetCore("SendNotification", {
            Title = Title,
            Text = Description,
            Duration = arg3 or 3
        })
    end)
end

local tbl21 = {}

local function f28()
    local plot = tbl18.GetPlot()

    if not (plot and plot:FindFirstChild("Baseplate")) then
        return {
            plot = nil,
            emptyNests = {},
            emptyBaseplateSlots = {},
            hasSpace = false,
            totalAvailable = 0,
            isFull = true,
            occupiedEggsCount = 0
        }
    end

    local Baseplate = plot.Baseplate
    local BaseplatePosition = Baseplate.Position
    local BaseplateSize = Baseplate.Size
    local var25 = not plot:FindFirstChild("Eggs") and {} or plot.Eggs:GetChildren() or {}
    local occupiedEggsCount = #var25

    if occupiedEggsCount >= 10 then
        return {
            plot = plot,
            baseplate = Baseplate,
            emptyNests = {},
            emptyBaseplateSlots = {},
            hasSpace = false,
            totalAvailable = 0,
            occupiedEggsCount = occupiedEggsCount,
            isFull = true
        }
    end

    local num4 = math.max(0, 10 - occupiedEggsCount)
    local var26 = not plot:FindFirstChild("Nests") and {} or plot.Nests:GetChildren() or {}
    local tbl22 = {}

    for _, v in ipairs(var26) do
        if v:GetAttribute("Unlocked") == true then
            table.insert(tbl22, v)
        end
    end

    if #tbl22 == 0 and #var26 > 0 then
        table.insert(tbl22, var26[1])
    end

    local emptyNests = {}

    for _, nest in ipairs(tbl22) do
        if num4 <= #emptyNests then
            break
        end

        local bool2 = nest:GetAttribute("Occupied") == true
        local pivotPosition = nest:FindFirstChild("Model") and nest.Model:GetPivot().Position or nest:GetPivot().Position
        local bool3 = false

        for _, v2 in ipairs(var25) do
            if (v2:GetPivot().Position - pivotPosition).Magnitude < 8 then
                bool3 = true
                break
            end
        end

        if bool2 or bool3 then
            continue
        end

        table.insert(emptyNests, {
            type = "Nest",
            nest = nest,
            id = tostring(nest.Name),
            pos = pivotPosition + Vector3.new(0, 2.5, 0)
        })
    end

    local emptyBaseplateSlots = {}
    local num5 = num4 - #emptyNests

    if num5 > 0 then
        local tbl25 = {}

        for _, v in ipairs(var25) do
            table.insert(tbl25, v:GetPivot().Position)
        end

        for _, v in ipairs(var26) do
            table.insert(tbl25, v:GetPivot().Position)
        end

        local HatchUpgrade = plot:FindFirstChild("HatchUpgrade")

        if HatchUpgrade then
            table.insert(tbl25, HatchUpgrade:GetPivot().Position)
        end

        local num6 = math.floor((BaseplateSize.X / 2 - 8) / 8) * 8
        local num7 = math.floor((BaseplateSize.Z / 2 - 8) / 8) * 8

        for i = -num6, num6, 8 do
            if num5 <= #emptyBaseplateSlots then
                break
            end

            for j = -num7, num7, 8 do
                if num5 <= #emptyBaseplateSlots then
                    break
                end

                local vec3: Vector3 = Vector3.new(BaseplatePosition.X + i, BaseplatePosition.Y + 0.5, BaseplatePosition.Z + j)
                local bool2 = false

                for _, v in ipairs(tbl25) do
                    if Vector2.new(vec3.X - v.X, vec3.Z - v.Z).Magnitude < 6.5 then
                        bool2 = true
                        break
                    end
                end

                if not bool2 then
                    table.insert(emptyBaseplateSlots, {
                        type = "Baseplate",
                        pos = vec3
                    })
                end
            end
        end
    end

    local totalAvailable = #emptyNests + #emptyBaseplateSlots

    return {
        plot = plot,
        baseplate = Baseplate,
        emptyNests = emptyNests,
        emptyBaseplateSlots = emptyBaseplateSlots,
        hasSpace = totalAvailable > 0 and occupiedEggsCount < 10,
        totalAvailable = totalAvailable,
        occupiedEggsCount = occupiedEggsCount,
        isFull = occupiedEggsCount >= 10
    }
end

local function func17()
    local plot = tbl18.GetPlot()

    if not plot then
        return false
    end

    if (plot:FindFirstChild("Eggs") and #plot.Eggs:GetChildren() or 0) >= 10 then
        return false
    end

    local var25 = f28()

    if not var25.hasSpace or var25.totalAvailable <= 0 then
        return false
    end

    if not (HumanoidRootPart and var3) then
        return false
    end

    local carriedEggTool, _ = tbl18.GetCarriedEggTool()
    local basketEggCount = tbl18.GetBasketEggCount()

    if not carriedEggTool and basketEggCount == 0 then
        return false
    end

    if (HumanoidRootPart.Position - var25.baseplate.Position).Magnitude > 35 then
        tbl18.TeleportHome()
        task.wait(0.2)
    end

    local bool2 = false

    for _, emptyNest in ipairs(var25.emptyNests) do
        if (plot:FindFirstChild("Eggs") and #plot.Eggs:GetChildren() or 0) >= 10 then
            break
        end

        local carriedEggTool2, carriedEggTool3 = tbl18.GetCarriedEggTool()
        local basketEggCount2 = tbl18.GetBasketEggCount()
        local bool3 = not carriedEggTool2

        if bool3 and basketEggCount2 == 0 then
            break
        end

        if bool3 and basketEggCount2 > 0 then
            task.wait(0.3)
            carriedEggTool2, carriedEggTool3 = tbl18.GetCarriedEggTool()
        end

        if not carriedEggTool2 then
            break
        end

        if not carriedEggTool3 and carriedEggTool2.Parent == Backpack and var3 then
            var3:EquipTool(carriedEggTool2)
            task.wait(0.2)
            local _
            carriedEggTool2, _ = tbl18.GetCarriedEggTool()
        end

        if not carriedEggTool2 or carriedEggTool2.Parent ~= Character and carriedEggTool2.Parent ~= Backpack then
            continue
        end

        if carriedEggTool2.Parent == Backpack and var3 then
            var3:EquipTool(carriedEggTool2)
            task.wait(0.15)
        end

        local EggName = carriedEggTool2:GetAttribute("EggName") or carriedEggTool2.Name
        local nest = emptyNest.nest
        TP(CFrame.new(emptyNest.pos))
        task.wait(0.1)
        local PlacePromptAnchor = nest and nest:FindFirstChild("PlacePromptAnchor")
        local var26 = PlacePromptAnchor and PlacePromptAnchor:FindFirstChildOfClass("ProximityPrompt")

        if var26 then
            var26.HoldDuration = 0
            tbl18.firePrompt(var26)
        end

        Callback(function()
            EggPlaced:FireServer({
                NestId = emptyNest.id
            })
        end)

        tbl17.eggsFarmed += 1
        Callback(f25, EggName or "Egg", emptyNest.id)
        task.wait(0.3)
        bool2 = true
    end

    local var26 = f28()

    if var26.hasSpace and var26.totalAvailable > 0 then
        for _, emptyBaseplateSlot in ipairs(var26.emptyBaseplateSlots) do
            if (plot:FindFirstChild("Eggs") and #plot.Eggs:GetChildren() or 0) >= 10 then
                break
            end

            local carriedEggTool2, carriedEggTool3 = tbl18.GetCarriedEggTool()
            local basketEggCount2 = tbl18.GetBasketEggCount()
            local bool3 = not carriedEggTool2

            if bool3 and basketEggCount2 == 0 then
                break
            end

            if bool3 and basketEggCount2 > 0 then
                task.wait(0.3)
                carriedEggTool2, carriedEggTool3 = tbl18.GetCarriedEggTool()
            end

            if not carriedEggTool2 then
                break
            end

            if not carriedEggTool3 and carriedEggTool2.Parent == Backpack and var3 then
                var3:EquipTool(carriedEggTool2)
                task.wait(0.2)
                local _
                carriedEggTool2, _ = tbl18.GetCarriedEggTool()
            end

            if not carriedEggTool2 or carriedEggTool2.Parent ~= Character and carriedEggTool2.Parent ~= Backpack then
                continue
            end

            if carriedEggTool2.Parent == Backpack and var3 then
                var3:EquipTool(carriedEggTool2)
                task.wait(0.15)
            end

            local EggName = carriedEggTool2:GetAttribute("EggName") or carriedEggTool2.Name
            TP(CFrame.new(emptyBaseplateSlot.pos + Vector3.new(0, 2, 0)))
            task.wait(0.1)

            Callback(function()
                EggPlaced:FireServer({
                    PlantPosition = emptyBaseplateSlot.pos
                })
            end)

            tbl17.eggsFarmed += 1
            Callback(f25, EggName or "Egg", "Plot Baseplate")
            task.wait(0.3)
            bool2 = true
        end
    end

    if var3 and tbl18.GetHeldEggTool() then
        var3:UnequipTools()
    end

    return bool2
end

local function func18()
    local plot = tbl18.GetPlot()

    if not (plot and plot:FindFirstChild("Eggs")) then
        return false
    end

    local num3 = os.clock()
    local serverTimeNow = workspace:GetServerTimeNow()
    local bool2 = false

    for _, child in ipairs(plot.Eggs:GetChildren()) do
        local EggKey = child:GetAttribute("EggKey")

        if not EggKey or num3 - (tbl21[EggKey] or 0) < 2.5 or child:HasTag("Hatching") then
            continue
        end

        local PlaceTimeValue = child:FindFirstChild("EggData") and child.EggData:FindFirstChild("PlaceTime") and child.EggData.PlaceTime.Value or 0
        local GrowthTime = (not var8 and {} or var8[child.Name] or {}).GrowthTime or 0
        local bool3 = GrowthTime > 0 and GrowthTime <= serverTimeNow - PlaceTimeValue
        local var25 = child:FindFirstChildWhichIsA("ProximityPrompt", true)

        if not (var25 and var25.Enabled or bool3) then
            continue
        end

        tbl21[EggKey] = num3
        local pivotPosition = child:GetPivot().Position
        local Baseplate = plot:FindFirstChild("Baseplate")
        local var26 = Baseplate and HumanoidRootPart and (HumanoidRootPart.Position - Baseplate.Position).Magnitude <= 45

        if HumanoidRootPart and (HumanoidRootPart.Position - pivotPosition).Magnitude > 8 and (var26 or not var7.IsBusy("TryHatch")) then
            TP(CFrame.new(pivotPosition + Vector3.new(0, 3, 2)))
            task.wait(0.15)
        end

        Callback(function()
            Hatch:FireServer({ EggKey = EggKey })
        end)

        if var22 and var22.Request then
            Callback(var22.Request, child)
        end

        if var25 then
            var25.HoldDuration = 0
            tbl18.firePrompt(var25)
            local var27 = getconnections and getconnections(var25.Triggered)

            if var27 then
                for _, v in ipairs(var27) do
                    if v.Function then
                        Callback(v.Function, LocalPlayer)
                    end
                end
            end
        end

        tbl17.petsHatched += 1
        num2 = os.clock()
        str2 = child.Name
        local petsHatched = tbl17.petsHatched

        task.delay(1.8, function()
            if str2 == child.Name and os.clock() - num2 >= 1.5 and tbl17.petsHatched == petsHatched then
                f24(child.Name, child.Name)
            end
        end)

        task.wait(0.2)
        bool2 = true
    end

    return bool2
end

local function f29()
    local plot = tbl18.GetPlot()

    if not (plot and plot:FindFirstChild("Nests")) then
        return false
    end

    local var25 = SavedData
    local var26 = SavedData

    if var25 then
        var26 = SavedData:FindFirstChild("Cash")
    end

    local var27 = if var26 then tonumber(var25.Cash.Value) or 0 else 0
    local Prices = var11 and var11.Prices or {
        0,
        1000,
        5000,
        100000,
        1000000
    }

    for i = 1, #Prices do
        local var28 = plot.Nests:FindFirstChild((tostring(i)))

        if not var28 or var28:GetAttribute("Unlocked") == true then
            continue
        end

        if not ((Prices[i] or 999999999) <= var27) then
            return false
        end

        Nests:FireServer(i)
        task.wait(0.4)

        return true
    end

    return false
end

local num3 = 0

local function f30()
    if os.clock() - num3 < 2.5 then
        return
    end

    num3 = os.clock()
    local plot = tbl18.GetPlot()

    if not plot or not plot:FindFirstChild("Baseplate") or not HumanoidRootPart or not var3 then
        return
    end

    local MaxPets = LocalPlayer:GetAttribute("MaxPets") or 5
    local tbl22 = {}

    local bool2, var25 = Callback(function()
        return require(LocalPlayer.PlayerScripts.Game.Pets.PetRenderer)
    end)

    if bool2 and var25 and type(var25.GetAll) == "function" then
        for _, v in pairs(var25.GetAll()) do
            if v.OwnerUserId ~= LocalPlayer.UserId or not (v.Model and v.Model.Parent) then
                continue
            end

            local PetName = v.Model:GetAttribute("PetName") or v.Model.Name
            local income = tonumber(v.DisplayIncome) or f27(v.Model)
            local weight = tonumber(v.Model:GetAttribute("Weight")) or 0
            table.insert(tbl22, {
                model = v.Model,
                key = v.PetKey,
                name = PetName,
                income = income,
                weight = weight,
                placed = true,
                favorited = v.Model:GetAttribute("Favorited") == true or func8(Configs.PetWhitelist or {}, PetName)
            })
        end
    end

    if #tbl22 == 0 and plot:FindFirstChild("Pets") then
        for _, model in ipairs(plot.Pets:GetChildren()) do
            local PetKey = model:GetAttribute("PetKey")

            if not PetKey then
                continue
            end

            local PetName = model:GetAttribute("PetName") or model.Name
            local income = f27(model)
            local weight = tonumber(model:GetAttribute("Weight")) or 0
            table.insert(tbl22, {
                model = model,
                key = PetKey,
                name = PetName,
                income = income,
                weight = weight,
                placed = true,
                favorited = model:GetAttribute("Favorited") == true or func8(Configs.PetWhitelist or {}, PetName)
            })
        end
    end

    local tbl23 = {}

    if Backpack then
        for _, tool in ipairs(Backpack:GetChildren()) do
            if not (tool:IsA("Tool") and tool:HasTag("Pet")) then
                continue
            end

            local PetKey = tool:GetAttribute("PetKey")

            if not PetKey then
                continue
            end

            local PetName = tool:GetAttribute("PetName") or tool.Name:match("^(.-)%s*%[") or tool.Name
            local income = f27(tool)
            local weight = tonumber(tool:GetAttribute("Weight")) or 0
            table.insert(tbl23, {
                tool = tool,
                key = PetKey,
                name = PetName,
                income = income,
                weight = weight,
                placed = false,
                favorited = tool:GetAttribute("Favorited") == true or func8(Configs.PetWhitelist or {}, PetName)
            })
        end
    end

    local tbl24 = {}

    for _, v in ipairs(tbl22) do
        table.insert(tbl24, v)
    end

    for _, v in ipairs(tbl23) do
        table.insert(tbl24, v)
    end

    if #tbl24 == 0 then
        return
    end

    table.sort(tbl24, function(arg1, arg2): boolean
        if arg1.income == arg2.income then
            return arg1.weight > arg2.weight
        end

        return arg1.income > arg2.income
    end)

    local tbl25 = {}
    local num4 = math.min(MaxPets, #tbl24)

    for i = 1, num4 do
        tbl25[tbl24[i].key] = tbl24[i]
    end

    local bool3 = false

    for _, v in ipairs(tbl22) do
        if not (tbl25[v.key] or v.favorited) then
            PickupPet:FireServer(v.key)
            task.wait(0.2)
            bool3 = true
        end
    end

    local BaseplatePosition = plot.Baseplate.Position
    local bool4 = false

    for i = 1, num4 do
        local var26 = tbl24[i]

        if var26.placed or not var26.tool or var26.tool.Parent ~= Backpack then
            continue
        end

        if (HumanoidRootPart.Position - BaseplatePosition).Magnitude > 40 then
            if var7.IsBusy("SwapBestPets") then
                return
            end

            var7.Claim("SwapBestPets", 6)
            TP(BaseplatePosition + Vector3.new(0, 3, 0))
            task.wait(0.2)
        end

        var3:EquipTool(var26.tool)
        local num5 = os.clock()

        while var26.tool.Parent ~= Character and os.clock() - num5 < 1.2 do
            task.wait(0.04)
        end

        if var26.tool.Parent == Character then
            local random = math.random
            PlacePet:FireServer(var26.key, BaseplatePosition + Vector3.new(math.random(-12, 12), 2, random(-12, 12)))
            task.wait(0.25)
            bool4 = true
        end
    end

    if bool4 or bool3 then
        var3:UnequipTools()
    end

    var7.Release("SwapBestPets")

    Callback(function()
        local Main = PlayerGui:FindFirstChild("Main")
        local PetsTracker = Main and Main:FindFirstChild("PetsTracker")
        local PlaceBest = PetsTracker and PetsTracker:FindFirstChild("PlaceBest")

        if not PlaceBest then
            return
        end

        if typeof(firesignal) == "function" then
            firesignal(PlaceBest.Activated)

            return
        end

        PlaceBest:Activate()
    end)
end

local str3 = ""

local function f31(value)
    if not Configs.WebhookEnabled or not Configs.WebhookUrl or Configs.WebhookUrl == "" or str3 == value then
        return
    end

    str3 = value
    local Description = (not (var18 and var18.Data) and {} or var18.Data[value] or {}).Description or "A rare storm has hit the server! All newly spawned eggs get exclusive mutations!"
    local tbl22 = {
        username = "BONK HUB | Weather Watcher",
        avatar_url = "https://i.imgur.com/8Q5FwL0.png",
        embeds = {
            {
                title = "⛈️ [WEATHER ALERT] " .. value .. " Storm Active!",
                description = Description,
                color = value == "Eternal" and 10111233 or value == "Dreadful" and 10181046 or value == "Volt" and 7161433 or 16766720,
                fields = {
                    {
                        name = "⚡ Weather Type",
                        value = value,
                        inline = true
                    },
                    {
                        name = "🎁 Mutation Bonus",
                        value = ({
                            Thunder = "Shocked",
                            Volt = "Volted",
                            Dreadful = "Void",
                            Gigantuar = "Gigantuar (Big Eggs)",
                            Raging = "Rage",
                            Eternal = "Eternal"
                        })[value] or "Enhanced",
                        inline = true
                    },
                    {
                        name = "🗺️ Map Action",
                        value = "Egg farming now yields guaranteed event mutations!",
                        inline = false
                    }
                },
                footer = {
                    text = "BONK HUB | " .. str1 .. " Telemetry"
                },
                timestamp = DateTime.now():ToIsoDate()
            }
        }
    }
    local Body = HttpService:JSONEncode(tbl22)
    local request = syn and syn.request or http and http.request or request or http_request

    if not request then
        return
    end

    request({
        Url = Configs.WebhookUrl,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = Body
    })
end

local tbl22 = {}
local tbl23 = {}
local var25 = setmetatable({}, { __mode = "k" })

func2(function()
    local num4 = 0

    while task.wait(0.25) do
        if not Configs.AutoPickup or Configs.KaitunMode or var7.IsBusy("AutoPickup") then
            continue
        end

        Callback(function()
            if not (HumanoidRootPart and var3) then
                return
            end

            if not Configs.AutoPickup then
                StopTween()

                return
            end

            local plot = tbl18.GetPlot()
            local Eggs = plot and plot:FindFirstChild("Eggs")
            local num5 = Eggs and #Eggs:GetChildren() or 0

            if Configs.AutoHatch then
                func18()
                num5 = Eggs and #Eggs:GetChildren() or 0
            end

            if not Configs.AutoPickup then
                StopTween()

                return
            end

            local var26 = f28()
            local basketEggCount = tbl18.GetBasketEggCount()
            local var27 = tbl18.IsBasketFull()
            local carriedEggTool = tbl18.GetCarriedEggTool()
            local bool2 = carriedEggTool ~= nil or basketEggCount > 0
            local hasSpace = var26.hasSpace

            if hasSpace then
                if not (num5 < 10) then
                    bool2 = false
                end
            else
                bool2 = hasSpace
            end

            if bool2 and (tbl18.IsEggBreakingUIVisible() or var27 or basketEggCount > 0 or carriedEggTool) then
                if not var7.IsBusy("AutoPickup") then
                    var7.Claim("AutoPickup", 10)
                    tbl18.TeleportHome(800)

                    if not Configs.AutoPickup then
                        var7.Release("AutoPickup")
                        StopTween()

                        return
                    end

                    task.wait(0.15)
                    func17()

                    if Configs.AutoHatch then
                        func18()
                    end

                    task.wait(0.15)
                    var7.Release("AutoPickup")
                end
            elseif (not var26.hasSpace or num5 >= 10) and var27 then
                local baseplate = var26.baseplate or plot and plot:FindFirstChild("Baseplate")

                if not (baseplate and HumanoidRootPart and (HumanoidRootPart.Position - baseplate.Position).Magnitude <= 35 or var7.IsBusy("AutoPickup")) then
                    var7.Claim("AutoPickup", 6)
                    tbl18.TeleportHome(800)
                    var7.Release("AutoPickup")
                end

                if Configs.AutoHatch then
                    func18()
                end

                var7.Release("AutoPickup")
                task.wait(1.5)

                return
            end

            if not Configs.AutoPickup then
                StopTween()

                return
            end

            local RenderedEggs = workspace:FindFirstChild("RenderedEggs")

            if not RenderedEggs then
                return
            end

            local tbl24 = {}
            local HumanoidRootPartPosition = HumanoidRootPart.Position
            local num6 = os.clock()

            for k, v in pairs(tbl23) do
                if v <= num6 or not (k and k.Parent) then
                    tbl23[k] = nil
                end
            end

            for _, egg in ipairs(RenderedEggs:GetChildren()) do
                if tbl23[egg] and num6 < tbl23[egg] then
                    continue
                end

                local var28 = var25[egg]

                if not (var28 and var28.Parent) then
                    var28 = egg:FindFirstChildWhichIsA("ProximityPrompt", true)

                    if var28 then
                        var25[egg] = var28
                    end
                end

                if not (var28 and var28.Parent) then
                    continue
                end

                local var29 = var8[egg.Name]
                local Rarity = var29 and var29.Rarity or "Common"
                local bool3 = not func9(Configs.PickupRarities) or func8(Configs.PickupRarities, Rarity)
                local bool4 = not func9(Configs.PickupEggs) or func8(Configs.PickupEggs, egg.Name)

                if not (bool3 and bool4) then
                    continue
                end

                local Parent = var28.Parent
                local ParentPosition = Parent:IsA("BasePart") and Parent.Position or Parent:IsA("Attachment") and Parent.WorldPosition or egg:GetPivot().Position
                local Magnitude = (ParentPosition - HumanoidRootPartPosition).Magnitude
                local rank = tbl4[Rarity] or 1
                table.insert(tbl24, {
                    egg = egg,
                    prompt = var28,
                    promptParent = Parent,
                    eggPos = ParentPosition,
                    dist = Magnitude,
                    score = Configs.RareEggSniping and rank * 10000 - Magnitude or -Magnitude,
                    rarity = Rarity,
                    rank = rank
                })
            end

            if not Configs.AutoPickup then
                StopTween()

                return
            end

            if not (#tbl24 > 0) then
                tbl23 = {}

                if func9(Configs.PickupRarities) and #RenderedEggs:GetChildren() > 0 and os.clock() - num4 > 20 then
                    num4 = os.clock()
                    func3("Auto Pickup", "No eggs match selected filter on map! Waiting for spawn...", 3)
                end

                if Configs.AutoServerHopNoEggs then
                    Hop()
                    task.wait(5)
                end

                return
            end

            table.sort(tbl24, function(arg1, arg2): boolean
                return arg1.score > arg2.score
            end)

            local var28 = tbl24[1]

            if not var28 or not var28.prompt or not var28.prompt.Parent then
                return
            end

            local promptParent = var28.promptParent or var28.prompt.Parent
            local eggPos = var28.eggPos or promptParent:IsA("BasePart") and promptParent.Position or var28.egg:GetPivot().Position
            local cFrame: CFrame = CFrame.new(eggPos.X, eggPos.Y, eggPos.Z)
            var7.Claim("AutoPickup", 12)
            tbl18.TweenToEgg(cFrame)

            if not Configs.AutoPickup then
                var7.Release("AutoPickup")
                StopTween()

                return
            end

            task.wait(0.08)
            local basketEggCount2 = tbl18.GetBasketEggCount()
            local heldEggTool = tbl18.GetHeldEggTool()
            var28.prompt.HoldDuration = 0
            var28.prompt.RequiresLineOfSight = false
            var28.prompt.MaxActivationDistance = 50
            var28.prompt.Enabled = true
            tbl18.firePrompt(var28.prompt)
            local var29 = getconnections and getconnections(var28.prompt.Triggered)

            if var29 then
                for _, v in ipairs(var29) do
                    if v.Function then
                        Callback(v.Function, LocalPlayer)
                    end
                end
            end

            if EggPickup then
                Callback(function()
                    EggPickup:FireServer(var28.egg.Name)
                end)
            end

            tbl23[var28.egg] = os.clock() + 3
            local num7 = os.clock()
            local bool3

            while true do
                if not (os.clock() - num7 < 1.2) then
                    bool3 = false
                    break
                end

                if not Configs.AutoPickup then
                    var7.Release("AutoPickup")
                    StopTween()

                    return
                end

                task.wait(0.08)
                local heldEggTool2 = tbl18.GetHeldEggTool()
                local basketEggCount3 = tbl18.GetBasketEggCount()

                if heldEggTool2 and not heldEggTool or basketEggCount2 < basketEggCount3 then
                    bool3 = true
                    break
                end
            end

            if not (bool3 or var28.prompt and var28.prompt.Parent and var28.egg and var28.egg.Parent) then
                bool3 = true
            end

            if bool3 or tbl18.GetHeldEggTool() or basketEggCount2 < tbl18.GetBasketEggCount() then
                tbl22[var28.egg] = nil
                tbl23[var28.egg] = os.clock() + 90
                tbl17.eggsFarmed += 1
                local eggsFarmed = tbl17.eggsFarmed

                task.delay(1.5, function()
                    if tbl17.eggsFarmed == eggsFarmed then
                        Callback(SendEggWebhook, var28.egg.Name, var28.rarity)
                    end
                end)
            else
                local var30 = (tbl22[var28.egg] or 0) + 1
                tbl22[var28.egg] = var30

                if var30 >= 2 then
                    tbl23[var28.egg] = os.clock() + 30
                    tbl22[var28.egg] = nil
                else
                    tbl23[var28.egg] = os.clock() + 2
                end
            end

            if not Configs.AutoPickup then
                var7.Release("AutoPickup")
                StopTween()

                return
            end

            if tbl18.IsEggBreakingUIVisible() or tbl18.IsBasketFull() then
                local var30 = f28()
                local num8 = Eggs and #Eggs:GetChildren() or 0

                if var30.hasSpace and num8 < 10 then
                    tbl18.TeleportHome(800)

                    if not Configs.AutoPickup then
                        var7.Release("AutoPickup")
                        StopTween()

                        return
                    end

                    task.wait(0.15)
                    func17()

                    if Configs.AutoHatch then
                        func18()
                    end
                end
            end

            var7.Release("AutoPickup")
        end)
    end
end)

local str4 = "Idle"

func2(function()
    local num4 = 0
    local num5 = 0
    local num6 = 0
    local num7 = 0

    while task.wait(0.35) do
        if not (Configs.KaitunMode and _G.Runing) then
            continue
        end

        Callback(function()
            if not (HumanoidRootPart and var3) then
                return
            end

            if not (Configs.KaitunMode and _G.Runing) then
                StopTween()

                return
            end

            local plot = tbl18.GetPlot()

            if not plot then
                str4 = "Waiting for plot to load..."

                return
            end

            if Configs.KaitunAutoHatch then
                func18()
            end

            if not (Configs.KaitunMode and _G.Runing) then
                StopTween()

                return
            end

            local num8 = os.clock()

            if Configs.KaitunAutoCollectIncome and num8 - num4 >= 3 and PetCollect and plot:FindFirstChild("Pets") then
                num4 = num8

                for _, child in ipairs(plot.Pets:GetChildren()) do
                    local PetKey = child:GetAttribute("PetKey")

                    if PetKey then
                        Callback(function()
                            PetCollect:FireServer(PetKey)
                        end)
                    end
                end
            end

            if Configs.KaitunAutoUpgradeLuck and num8 - num5 >= 4 and Upgrades then
                num5 = num8

                Callback(function()
                    LocalPlayer:SetAttribute("Setting_LuckMultiplier", true)
                    Upgrades:FireServer("Max")
                end)
            end

            if Configs.KaitunAutoEquipBest and num8 - num6 >= 6 then
                num6 = num8
                Callback(f30)

                if Configs.KaitunAutoRideBest and not LocalPlayer:GetAttribute("IsRiding") then
                    local Pets = plot:FindFirstChild("Pets")

                    if Pets and #Pets:GetChildren() > 0 then
                        local var26 = Pets:GetChildren()[1]
                        local RidePrompt = var26:FindFirstChild("RidePrompt", true) or var26:FindFirstChild("Ride", true) or var26:FindFirstChildWhichIsA("ProximityPrompt", true)

                        if RidePrompt then
                            tbl18.firePrompt(RidePrompt)
                        end

                        if Mounting then
                            Callback(function()
                                Mounting:FireServer()
                            end)
                        end
                    end
                end
            end

            if Configs.KaitunAutoClaimRewards and num8 - num7 >= 25 then
                num7 = num8

                Callback(function()
                    if ClaimGroupReward then
                        ClaimGroupReward:FireServer()
                    end

                    if ClaimIndexReward then
                        ClaimIndexReward:FireServer()
                    end

                    if var21 then
                        var21:FireServer()
                    end
                end)
            end

            if not (Configs.KaitunMode and _G.Runing) then
                StopTween()

                return
            end

            local num9 = plot:FindFirstChild("Eggs") and #plot.Eggs:GetChildren() or 0
            local var26 = f28().hasSpace and num9 < 10
            local var27 = tbl18.HasCarriedEgg()

            if var26 and var27 and Configs.KaitunAutoPlace then
                str4 = string.format("🚚 Filling plot slots (%d/10)...", num9)
                tbl18.TeleportHome(800)

                if not (Configs.KaitunMode and _G.Runing) then
                    StopTween()

                    return
                end

                task.wait(0.15)
                func17()

                if Configs.KaitunAutoHatch then
                    func18()
                end

                task.wait(0.15)

                return
            end

            if not (Configs.KaitunMode and _G.Runing) then
                StopTween()

                return
            end

            local RenderedEggs = workspace:FindFirstChild("RenderedEggs")

            if not RenderedEggs or #RenderedEggs:GetChildren() == 0 then
                str4 = "🔍 Waiting for eggs to spawn on map..."

                return
            end

            local tbl24 = {}
            local HumanoidRootPartPosition = HumanoidRootPart.Position

            for _, egg in ipairs(RenderedEggs:GetChildren()) do
                local var28 = var25[egg]

                if not (var28 and var28.Parent) then
                    var28 = egg:FindFirstChildWhichIsA("ProximityPrompt", true)

                    if var28 then
                        var25[egg] = var28
                    end
                end

                if not (var28 and var28.Parent) then
                    continue
                end

                local var29 = var8 and var8[egg.Name]
                local Rarity = var29 and var29.Rarity or "Common"
                local var30 = tbl4[Rarity] or 1
                local Parent = var28.Parent
                local ParentPosition = Parent:IsA("BasePart") and Parent.Position or Parent:IsA("Attachment") and Parent.WorldPosition or egg:GetPivot().Position
                local Magnitude = (ParentPosition - HumanoidRootPartPosition).Magnitude
                table.insert(tbl24, {
                    egg = egg,
                    prompt = var28,
                    promptParent = Parent,
                    eggPos = ParentPosition,
                    dist = Magnitude,
                    score = var30 * 10000 - Magnitude,
                    rarity = Rarity,
                    name = egg.Name
                })
            end

            if not (Configs.KaitunMode and _G.Runing) then
                StopTween()

                return
            end

            if not (#tbl24 > 0) then
                str4 = "🔍 Searching map for available eggs..."

                return
            end

            table.sort(tbl24, function(arg1, arg2): boolean
                return arg1.score > arg2.score
            end)

            local var28 = tbl24[1]
            str4 = string.format("🥚 Hunting [%s] (%s)...", var28.name, var28.rarity)
            local cFrame: CFrame = CFrame.new(var28.eggPos.X, var28.eggPos.Y, var28.eggPos.Z)
            tbl18.TweenToEgg(cFrame)

            if not (Configs.KaitunMode and _G.Runing) then
                StopTween()

                return
            end

            task.wait(0.08)
            var28.prompt.HoldDuration = 0
            var28.prompt.RequiresLineOfSight = false
            var28.prompt.MaxActivationDistance = 50
            var28.prompt.Enabled = true
            tbl18.firePrompt(var28.prompt)
            local var29 = getconnections and getconnections(var28.prompt.Triggered)

            if var29 then
                for _, v in ipairs(var29) do
                    if v.Function then
                        Callback(v.Function, LocalPlayer)
                    end
                end
            end

            if EggPickup then
                Callback(function()
                    EggPickup:FireServer(var28.egg.Name)
                end)
            end

            tbl17.eggsFarmed += 1
            task.wait(0.15)

            if not (Configs.KaitunMode and _G.Runing) then
                StopTween()

                return
            end

            if Configs.KaitunAutoHatch then
                func18()
            end

            if not ((plot:FindFirstChild("Eggs") and #plot.Eggs:GetChildren() or 0) < 10) or not Configs.KaitunAutoPlace then
                return
            end

            tbl18.TeleportHome(800)

            if not (Configs.KaitunMode and _G.Runing) then
                StopTween()

                return
            end

            task.wait(0.15)
            func17()

            if Configs.KaitunAutoHatch then
                func18()
            end
        end)
    end
end)

func2(function()
    while task.wait(1.5) do
        if not Configs.AutoPlace then
            continue
        end

        Callback(function()
            if var7.IsBusy("AutoPlace") then
                return
            end

            if f28().hasSpace and tbl18.HasCarriedEgg() then
                var7.Claim("AutoPlace", 6)
                func17()
                var7.Release("AutoPlace")
            end
        end)
    end
end)

func2(function()
    while task.wait(1.2) do
        if not Configs.AutoHatch then
            continue
        end

        Callback(function()
            local plot = tbl18.GetPlot()
            local Baseplate = plot and plot:FindFirstChild("Baseplate")

            if Baseplate and HumanoidRootPart and (HumanoidRootPart.Position - Baseplate.Position).Magnitude <= 45 or not var7.IsBusy("AutoHatch") then
                func18()
            end
        end)
    end
end)

func2(function()
    while task.wait(1.5) do
        if not (Configs.AutoCollectPetIncome and PetCollect) then
            continue
        end

        Callback(function()
            local plot = tbl18.GetPlot()

            if not plot or not plot:FindFirstChild("Pets") then
                return
            end

            for _, child in ipairs(plot.Pets:GetChildren()) do
                local PetKey = child:GetAttribute("PetKey")

                if PetKey then
                    PetCollect:FireServer(PetKey)
                end
            end
        end)
    end
end)

func2(function()
    while task.wait(3.5) do
        if Configs.AutoSwapBestPets or Configs.AutoEquipBest then
            Callback(f30)
        end
    end
end)

func2(function()
    while task.wait(2) do
        if not Configs.AutoRidePet then
            continue
        end

        Callback(function()
            if LocalPlayer:GetAttribute("IsRiding") == true or LocalPlayer:GetAttribute("IsPassenger") == true or not Backpack or not var3 then
                return
            end

            local num4 = -1
            local var26 = nil

            for _, child in ipairs(Backpack:GetChildren()) do
                if not (child:IsA("Tool") and child:HasTag("Pet")) then
                    continue
                end

                local num5 = tonumber(child:GetAttribute("Weight")) or 0

                if num4 < num5 then
                    var26 = child
                    num4 = num5
                end
            end

            if var26 then
                var3:EquipTool(var26)
                task.wait(0.3)
                Mounting:FireServer()
                task.wait(0.5)
            end
        end)
    end
end)

func2(function()
    while task.wait(1) do
        if not Configs.AutoSkipGrowth then
            continue
        end

        Callback(function()
            local plot = tbl18.GetPlot()

            if not (plot and plot:FindFirstChild("Eggs")) then
                return
            end

            for _, child in ipairs(plot.Eggs:GetChildren()) do
                local EggKey = child:GetAttribute("EggKey")

                if EggKey and not child:HasTag("Hatching") then
                    SkipGrowth:FireServer({ EggKey = EggKey })
                end
            end
        end)
    end
end)

func2(function()
    task.wait(2)

    Callback(function()
        OfflineEarnings:FireServer()
        local OfflineEarnings2 = PlayerGui and PlayerGui:FindFirstChild("Main") and PlayerGui.Main:FindFirstChild("OfflineEarnings")

        if OfflineEarnings2 and OfflineEarnings2.Visible then
            OfflineEarnings2.Visible = false
        end
    end)

    while task.wait(15) do
        if not Configs.AutoClaimOffline then
            continue
        end

        Callback(function()
            OfflineEarnings:FireServer()
            local OfflineEarnings2 = PlayerGui and PlayerGui:FindFirstChild("Main") and PlayerGui.Main:FindFirstChild("OfflineEarnings")

            if OfflineEarnings2 and OfflineEarnings2.Visible then
                OfflineEarnings2.Visible = false
            end
        end)
    end
end)

func1(OfflineEarnings.OnClientEvent:Connect(function()
    if not Configs.AutoClaimOffline then
        return
    end

    task.wait(0.1)
    OfflineEarnings:FireServer()

    Callback(function()
        local OfflineEarnings2 = PlayerGui and PlayerGui:FindFirstChild("Main") and PlayerGui.Main:FindFirstChild("OfflineEarnings")

        if OfflineEarnings2 then
            OfflineEarnings2.Visible = false
        end
    end)
end))

func2(function()
    while task.wait(3) do
        if not Configs.AutoFavoriteRare then
            continue
        end

        Callback(function()
            local tbl24 = {}

            if Backpack then
                for _, child in ipairs(Backpack:GetChildren()) do
                    table.insert(tbl24, child)
                end
            end

            if Character then
                for _, child in ipairs(Character:GetChildren()) do
                    table.insert(tbl24, child)
                end
            end

            for _, v in ipairs(tbl24) do
                if not (v:IsA("Tool") and v:HasTag("Pet")) then
                    continue
                end

                local PetKey = v:GetAttribute("PetKey")
                local bool2 = v:GetAttribute("Favorited") == true

                if not PetKey or bool2 then
                    continue
                end

                local PetName = v:GetAttribute("PetName") or v.Name:match("^(.-)%s*%[") or v.Name
                local var26 = var12[PetName]
                local Rarity = var26 and var26.Rarity or "Common"
                local Mutation = v:GetAttribute("Mutation")
                local SpawnMutation = v:GetAttribute("SpawnMutation")

                if func8(Configs.FavoriteRarities or { "Mythic", "Divine", "Ethereal" }, Rarity) or Mutation ~= nil and Mutation ~= "" or SpawnMutation ~= nil and SpawnMutation ~= "" then
                    FavoritePet:FireServer(PetKey)
                    v:SetAttribute("Favorited", true)
                    func3("Auto Favorite", string.format("Protected %s [%s]", PetName, Rarity), 3)
                    task.wait(0.2)
                end
            end
        end)
    end
end)

func2(function()
    while task.wait(45) do
        if not (Configs.AutoClaimEvent and ClaimEventReward) then
            continue
        end

        Callback(function()
            local SocialService: SocialService = game:GetService("SocialService")

            local bool2, var26 = Callback(function()
                return SocialService:GetUpcomingExperienceEventsAsync()
            end)

            if not bool2 or type(var26) ~= "table" then
                return
            end

            for _, v in ipairs(var26) do
                if not (v.Id and v.HasStarted) then
                    continue
                end

                if ClaimEventReward:IsA("RemoteFunction") then
                    local remoteFunction = ClaimEventReward
                    local Id = v.Id
                    remoteFunction:InvokeServer((tostring(Id)))
                else
                    local var27 = ClaimEventReward
                    local Id = v.Id
                    var27:FireServer((tostring(Id)))
                end
            end
        end)
    end
end)

func2(function()
    while task.wait(60) do
        if Configs.AutoClaimGroupReward and ClaimGroupReward then
            Callback(function()
                ClaimGroupReward:FireServer()
            end)
        end
    end
end)

func2(function()
    while task.wait(8) do
        if not Configs.AutoActivateRadar then
            continue
        end

        Callback(function()
            local tbl24 = {}

            if Character then
                for _, child in ipairs(Character:GetChildren()) do
                    table.insert(tbl24, child)
                end
            end

            if Backpack then
                for _, child in ipairs(Backpack:GetChildren()) do
                    table.insert(tbl24, child)
                end
            end

            local bool2 = false

            for _, v in ipairs(tbl24) do
                if v:IsA("Tool") and (v:HasTag("Radar") or v.Name:find("Radar")) then
                    bool2 = true
                    break
                end
            end

            if bool2 then
                ActivateRadar:FireServer()
            end
        end)
    end
end)

func2(function()
    while task.wait(10) do
        if not Configs.AutoPlaceLanterns then
            continue
        end

        Callback(function()
            local plot = tbl18.GetPlot()

            if not (plot and plot:FindFirstChild("Baseplate")) then
                return
            end

            if not (HumanoidRootPart and var3) then
                return
            end

            local var26

            if Backpack then
                var26 = nil

                for _, child in ipairs(Backpack:GetChildren()) do
                    if child:IsA("Tool") and (child:HasTag("Lantern") or child.Name:find("Lantern")) then
                        var26 = child
                        break
                    end

                    var26 = nil
                end
            else
                var26 = nil
            end

            if not var26 then
                return
            end

            local BaseplatePosition = plot.Baseplate.Position

            if not ((HumanoidRootPart.Position - BaseplatePosition).Magnitude <= 40) then
                return
            end

            var3:EquipTool(var26)
            task.wait(0.3)
            local random = math.random
            PlaceLantern:FireServer(var26.Name, BaseplatePosition + Vector3.new(math.random(-8, 8), 0.5, random(-8, 8)))
            task.wait(0.3)
            var3:UnequipTools()
        end)
    end
end)

func1(AddWeather.OnClientEvent:Connect(function(arg1)
    if Configs.WeatherWebhookAlert then
        Callback(f31, arg1)
        func3("Weather Alert", "Rare Storm Active: " .. tostring(arg1), 5)
    end
end))

func2(function()
    while task.wait(2) do
        if not Configs.AutoFeed then
            continue
        end

        Callback(function()
            local plot = tbl18.GetPlot()

            if not plot or not plot:FindFirstChild("Pets") or #plot.Pets:GetChildren() == 0 then
                return
            end

            local var26

            if Character then
                var26 = nil

                for _, child in ipairs(Character:GetChildren()) do
                    if child:IsA("Tool") and child:HasTag("Food") then
                        var26 = child
                        break
                    end

                    var26 = nil
                end
            else
                var26 = nil
            end

            if not var26 and Backpack then
                for _, child in ipairs(Backpack:GetChildren()) do
                    if not (child:IsA("Tool") and child:HasTag("Food")) then
                        continue
                    end

                    if var3 then
                        var3:EquipTool(child)
                    end

                    task.wait(0.2)
                    var26 = child
                    break
                end
            end

            if not var26 and Configs.AutoBuyFood and func9(Configs.BuyFood) then
                local tbl24 = func10(Configs.BuyFood)

                if #tbl24 > 0 then
                    BuyWithCash:FireServer("Food", tbl24[1])
                    task.wait(0.3)
                end
            end

            if not var26 then
                return
            end

            local var27 = nil
            local num4 = -1
            local var28 = nil

            for _, child in ipairs(plot.Pets:GetChildren()) do
                local PetKey = child:GetAttribute("PetKey")
                local Age = child:GetAttribute("Age") or 0
                child:GetAttribute("Weight")
                local num5 = f27(child)
                local var29 = var12[child:GetAttribute("PetName") or child.Name]
                local Rarity = var29 and var29.Rarity or "Common"

                if Configs.FeedAboveAge and Age < (Configs.FeedMinAge or 1) or Configs.FeedAboveIncome and num5 < (Configs.FeedMinIncome or 0) or func9(Configs.FeedRarities) and not func8(Configs.FeedRarities, Rarity) then
                    continue
                end

                if not Configs.FeedBestOnly then
                    var27 = PetKey
                    var28 = child
                    break
                end

                if num4 < num5 then
                    var27 = PetKey
                    var28 = child
                    num4 = num5
                end
            end

            if not var28 or not var27 then
                return
            end

            if var7.IsBusy("AutoFeed") then
                return
            end

            local PrimaryPart = var28.PrimaryPart or var28:FindFirstChildWhichIsA("BasePart")

            if not PrimaryPart or not HumanoidRootPart then
                return
            end

            var7.Claim("AutoFeed", 5)
            TP(PrimaryPart.CFrame + Vector3.new(0, 2, 3))
            task.wait(0.2)

            if var26.Parent == Backpack and var3 then
                var3:EquipTool(var26)
                task.wait(0.15)
            end

            local var29 = var28:FindFirstChildWhichIsA("ProximityPrompt", true)

            if var29 then
                var29.HoldDuration = 0
                tbl18.firePrompt(var29)
            end

            Callback(function()
                FeedPet:FireServer(var27)
            end)

            task.wait(0.3)

            if var3 then
                var3:UnequipTools()
            end

            var7.Release("AutoFeed")
        end)
    end
end)

func2(function()
    while task.wait(3) do
        if not Configs.AutoSell then
            continue
        end

        Callback(function()
            if not Backpack then
                return
            end

            local tbl24 = {}

            for _, child in ipairs(Backpack:GetChildren()) do
                if not (child:IsA("Tool") and child:HasTag("Pet")) then
                    continue
                end

                local PetKey = child:GetAttribute("PetKey")
                local PetName = child:GetAttribute("PetName") or child.Name:match("^(.-)%s*%[") or child.Name
                local var26 = var12[PetName]
                local Rarity = var26 and var26.Rarity or "Common"
                local num4 = tonumber(child:GetAttribute("Weight")) or 0

                if child:GetAttribute("Favorited") == true or func8(Configs.PetWhitelist or {}, PetName) or Configs.SellMinWeight > 0 and Configs.SellMinWeight <= num4 then
                    continue
                end

                local bool2 = not not (func9(Configs.SellRarities) and func8(Configs.SellRarities, Rarity))

                if func9(Configs.SellPets) and func8(Configs.SellPets, PetName) then
                    bool2 = true
                end

                if Configs.SellUnlisted and not func8(Configs.PetWhitelist or {}, PetName) then
                    bool2 = true
                end

                if bool2 and PetKey then
                    table.insert(tbl24, child)
                end
            end

            if not (#tbl24 > 0) then
                return
            end

            if var7.IsBusy("AutoSell") then
                return
            end

            local Richie = workspace:FindFirstChild("Stalls") and workspace.Stalls:FindFirstChild("Sell") and workspace.Stalls.Sell:FindFirstChild("Richie")

            if not Richie or not Richie.PrimaryPart then
                return
            end

            var7.Claim("AutoSell", 8)
            local HumanoidRootPartPosition = HumanoidRootPart and HumanoidRootPart.Position
            TP(Richie.PrimaryPart.CFrame + Vector3.new(0, 0, 4))
            task.wait(0.2)
            local var26 = Richie:FindFirstChildWhichIsA("ProximityPrompt", true)

            for _, v in ipairs(tbl24) do
                if not Configs.AutoSell then
                    break
                end

                if v.Parent ~= Backpack or not var3 then
                    continue
                end

                var3:EquipTool(v)
                task.wait(0.2)

                if var26 then
                    var26.HoldDuration = 0
                    tbl18.firePrompt(var26)
                    task.wait(0.1)
                end

                if DialogueSelect then
                    Callback(function()
                        DialogueSelect:FireServer(Richie, "I would like to sell this")
                    end)
                elseif DialogueModule and DialogueModule.SelectDialogue then
                    Callback(function()
                        DialogueModule.SelectDialogue("Richie", "Sell")
                    end)
                end

                task.wait(0.25)
            end

            if var3 then
                var3:UnequipTools()
            end

            if HumanoidRootPartPosition then
                TP(HumanoidRootPartPosition)
            end

            var7.Release("AutoSell")
        end)
    end
end)

func2(function()
    while task.wait(2.5) do
        if Configs.AutoUnlockNests then
            Callback(f29)
        end
    end
end)

func2(function()
    while task.wait(2) do
        if Configs.AutoHatchLuck then
            Callback(function()
                LocalPlayer:SetAttribute("Setting_LuckMultiplier", true)
                Upgrades:FireServer("Max")
            end)
        end
    end
end)

func2(function()
    while task.wait(5) do
        if Configs.AutoClaimIndex then
            Callback(function()
                ClaimIndexReward:FireServer()
            end)
        end
    end
end)

func2(function()
    while task.wait(4) do
        if not Configs.AutoRebirth then
            continue
        end

        Callback(function()
            local var26 = SavedData
            local var27 = SavedData

            if var26 then
                var27 = SavedData:FindFirstChild("Cash")
            end

            local var28 = if var27 then tonumber(var26.Cash.Value) or 0 else 0
            local var29 = SavedData

            if var26 then
                var29 = SavedData:FindFirstChild("Rebirths")
            end

            local num4 = var29 and tonumber(var26.Rebirths.Value) or 0
            local num5 = 50000 * (num4 + 1) ^ 2.5

            if var14 and type(var14.GetCost) == "function" then
                Callback(function()
                    num5 = var14.GetCost(num4 + 1)
                end)
            end

            if num5 <= var28 then
                Rebirth:FireServer()
            end
        end)
    end
end)

func2(function()
    while task.wait(5) do
        if not Configs.AutoBuyBasket then
            continue
        end

        Callback(function()
            local var26 = SavedData
            local var27 = SavedData

            if var26 then
                var27 = SavedData:FindFirstChild("EquippedEggBasket")
            end

            if (var27 and var26.EquippedEggBasket.Value or "Wooden") ~= "Infinite" then
                BuyWithCash:FireServer("EggBaskets", "Infinite")
            end
        end)
    end
end)

func2(function()
    while task.wait(4) do
        if not (Configs.AutoBuyGears and func9(Configs.BuyGears)) then
            continue
        end

        Callback(function()
            for _, v in ipairs(func10(Configs.BuyGears)) do
                BuyWithCash:FireServer("Gears", v)
                task.wait(0.3)
            end
        end)
    end
end)

local function func19()
    if not var3 then
        return
    end

    if Configs.WalkSpeedEnabled then
        var3.WalkSpeed = Configs.WalkSpeed or 32

        return
    end

    var3.WalkSpeed = 16
end

func1(UserInputService.JumpRequest:Connect(function()
    if Configs.InfJump and var3 then
        var3:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end))

func1(RunService.RenderStepped:Connect(function(deltaTime: number)
    if Configs.WalkSpeedEnabled and var3 then
        var3.WalkSpeed = Configs.WalkSpeed or 32
    end

    if not Configs.Fly or not HumanoidRootPart or not var3 then
        if var3 and var3.PlatformStand and not Configs.Fly then
            var3.PlatformStand = false
        end

        return
    end

    var3.PlatformStand = true
    local CurrentCamera = workspace.CurrentCamera
    local zero = Vector3.zero

    if CurrentCamera then
        zero = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            zero = Vector3.zero + CurrentCamera.CFrame.LookVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            zero -= CurrentCamera.CFrame.LookVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            zero -= CurrentCamera.CFrame.RightVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            zero += CurrentCamera.CFrame.RightVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            zero += Vector3.new(0, 1, 0)
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            zero -= Vector3.new(0, 1, 0)
        end
    end

    HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero

    if zero.Magnitude > 0 then
        HumanoidRootPart.CFrame += zero.Unit * (Configs.FlySpeed or 60) * deltaTime
    end
end))

local tbl24 = {}

local function f32()
    for _, v in pairs(tbl24) do
        if v and v.Destroy then
            Callback(function()
                v:Destroy()
            end)
        end
    end

    table.clear(tbl24)
end

local function f33()
    if not Configs.EggEsp then
        f32()

        return
    end

    local RenderedEggs = workspace:FindFirstChild("RenderedEggs")

    if not RenderedEggs then
        return
    end

    local tbl25 = {}

    for _, child in ipairs(RenderedEggs:GetChildren()) do
        tbl25[child] = true
        local var26 = child:FindFirstChildWhichIsA("BasePart") or child.PrimaryPart

        if not var26 then
            continue
        end

        local BonkHub_EggEsp = var26:FindFirstChild("BonkHub_EggEsp") or child:FindFirstChild("BonkHub_EggEsp", true)

        if not BonkHub_EggEsp then
            BonkHub_EggEsp = Instance.new("BillboardGui")
            BonkHub_EggEsp.Name = "BonkHub_EggEsp"
            BonkHub_EggEsp.AlwaysOnTop = true
            BonkHub_EggEsp.Size = UDim2.new(0, 150, 0, 40)
            BonkHub_EggEsp.StudsOffset = Vector3.new(0, 3, 0)
            local Text: TextLabel = Instance.new("TextLabel")
            Text.Name = "Text"
            Text.Size = UDim2.new(1, 0, 1, 0)
            Text.BackgroundTransparency = 1
            Text.Font = Enum.Font.SourceSansBold
            Text.TextSize = 14
            Text.TextStrokeTransparency = 0.2
            Text.Parent = BonkHub_EggEsp
            BonkHub_EggEsp.Adornee = var26
            BonkHub_EggEsp.Parent = var26
            table.insert(tbl24, BonkHub_EggEsp)
        end

        local Text = BonkHub_EggEsp:FindFirstChild("Text")

        if not Text then
            continue
        end

        local var27 = var8 and var8[child.Name]
        local Rarity = var27 and var27.Rarity or "Common"
        local var28 = if var26 and HumanoidRootPart then math.floor((var26.Position - HumanoidRootPart.Position).Magnitude) else 0
        local childName = child.Name

        if Configs.EspShowRarity then
            childName = string.format("[%s] %s", Rarity, childName)
        end

        if Configs.EspShowDistance then
            childName = string.format("%s (%dm)", childName, var28)
        end

        Text.Text = childName
        Text.TextColor3 = tbl5[Rarity] or Color3.fromRGB(255, 255, 255)
    end
end

func2(function()
    while task.wait(1.5) do
        if Configs.EggEsp then
            Callback(f33)
        else
            Callback(f32)
        end
    end
end)

func1(ProximityPromptService.PromptButtonHoldBegan:Connect(function(ProximityPrompt)
    if Configs.InstantProximityPrompt then
        ProximityPrompt.HoldDuration = 0
        fireproximityprompt(ProximityPrompt)
    end
end))

local BONKLIB_LOCAL = f6().BONKLIB_LOCAL

if not BONKLIB_LOCAL and isfile and isfile("Library.lua") then
    local bool2, var26 = Callback(function()
        return loadstring(readfile("Library.lua"))()
    end)

    BONKLIB_LOCAL = bool2 and var26 or BONKLIB_LOCAL
end

if not BONKLIB_LOCAL then
    local bool2, var26 = Callback(function()
        return loadstring(game:HttpGet("https://bonkhub.online/LibraryStandaloneLoader.lua"))()
    end)

    BONKLIB_LOCAL = bool2 and var26 or BONKLIB_LOCAL
end

if not BONKLIB_LOCAL then
    warn("[BonkHub] Error loading UI library!")

    return
end

local tbl25 = {
    Title = "BONK HUB",
    Subtitle = tostring(str1),
    Icon = "rbxassetid://11262159835",
    ToggleIcon = "rbxassetid://11262159835",
    Watermark = "BONK HUB | " .. tostring(str1),
    WatermarkEnabled = true,
    DiscordLink = "https://discord.gg/",
    ToggleUiKey = Enum.KeyCode.RightControl,
    Size = {
        Width = 660,
        Height = 460
    },
    SidebarWidth = 175,
    Splash = {
        Subtitle = "Loading modules...",
        MinDuration = 0.9
    },
    ConfigFile = "BONKHUB/" .. var5 .. "_Configs",
    Theme = "Forest",
    KeySystem = { Enabled = false }
}
local var26 = BONKLIB_LOCAL:Window(tbl25)

function _G.BonkHubCleanup()
    for _, v in ipairs(tbl1) do
        Callback(function()
            v:Disconnect()
        end)
    end

    table.clear(tbl1)

    for _, v in ipairs(tbl2) do
        Callback(function()
            task.cancel(v)
        end)
    end

    table.clear(tbl2)
    StopTween()
    func15(false)
    func14(false)
    f32()

    if var26 and var26.Destroy then
        Callback(function()
            var26:Destroy()
        end)
    end

    _G.Runing = false
end

var26:Section("Kaitun Automation")
local var27 = var26:Tab("Kaitun", "flame")
var26:Section("Main Automation")
local var28 = var26:Tab("Main", "eye")
var26:Section("Miscellaneous")
local var29 = var26:Tab("Misc", "sliders")
var26:Section("Server Operations")
local var30 = var26:Tab("Server", "globe")
var26:Section("Notifications")
local var31 = var26:Tab("Webhook", "send")
var26:Section("Configuration")
local var32 = var26:Tab("Settings", "7733771472")
local var33 = var27:SubTab("Overview")
local var34 = var33:Groupbox("Kaitun Master Control", "Left", "flame", "true")
local var35 = var33:Groupbox("Kaitun Live Dashboard", "Right")
local var36 = var35:AddParagraph({
    Title = "⚡ Kaitun Status",
    Content = "Status: Idle\nPlot Eggs: 0/10\nMode: Standby"
})
local var37 = var35:AddParagraph({
    Title = "📊 Session Progression",
    Content = "🥚 Eggs Farmed : 0\n🐣 Pets Hatched: 0\n💰 Cash Earned : +$0\n⏱️ Running Time: 00:00:00"
})

func2(function()
    while task.wait(1) do
        Callback(function()
            local plot = tbl18.GetPlot()
            local var38 = plot and plot:FindFirstChild("Eggs") and #plot.Eggs:GetChildren() or 0
            local Status = Configs.KaitunMode and (str4 or "Running...") or "Standby"
            local Eggs = var38 >= 10 and var38 .. "/10 (MAX - Safe Cap Active)" or var38 .. "/10 (Placing Allowed)"

            if var36 and var36.SetContent then
                var36:SetContent(string.format("Status: %s\nPlot Eggs: %s\nMode: %s", Status, Eggs, Configs.KaitunMode and "Active" or "Standby"))
            end

            if var37 and var37.SetContent then
                local startTime = tbl17.startTime
                local Runtime = func6(os.clock() - startTime)
                local num4 = func5()
                var37:SetContent(string.format("🥚 Eggs Farmed : %d\n🐣 Pets Hatched: %d\n💰 Cash Earned : +$%s\n⏱️ Runtime: %s", tbl17.eggsFarmed, tbl17.petsHatched, func7(num4), Runtime))
            end
        end)
    end
end)

var34:AddToggle({
    Title = "🔥 Auto Kaitun (All-In-One)",
    Default = Configs.KaitunMode,
    Flag = "KaitunModeFlag",
    Callback = function(KaitunMode)
        Configs.KaitunMode = KaitunMode

        if KaitunMode then
            func3("Kaitun Mode", "Started Full-Auto Kaitun Engine!", 3)
        else
            str4 = "Idle"
            StopTween()
            func3("Kaitun Mode", "Stopped Kaitun Engine immediately", 2)
        end

        Save()
    end
})

var34:AddToggle({
    Title = "Smart Rare Egg Priority",
    Default = Configs.KaitunSmartEggs,
    Callback = function(KaitunSmartEggs)
        Configs.KaitunSmartEggs = KaitunSmartEggs
        Save()
    end
})

var34:AddToggle({
    Title = "Auto Place (Strict Max 10 Cap)",
    Default = Configs.KaitunAutoPlace,
    Callback = function(KaitunAutoPlace)
        Configs.KaitunAutoPlace = KaitunAutoPlace
        Save()
    end
})

var34:AddToggle({
    Title = "Instant Hatch Ready Eggs",
    Default = Configs.KaitunAutoHatch,
    Callback = function(KaitunAutoHatch)
        Configs.KaitunAutoHatch = KaitunAutoHatch
        Save()
    end
})

var34:AddToggle({
    Title = "Auto Upgrade Hatch Luck",
    Default = Configs.KaitunAutoUpgradeLuck,
    Callback = function(KaitunAutoUpgradeLuck)
        Configs.KaitunAutoUpgradeLuck = KaitunAutoUpgradeLuck
        Save()
    end
})

var34:AddToggle({
    Title = "Auto Collect Ranch Income",
    Default = Configs.KaitunAutoCollectIncome,
    Callback = function(KaitunAutoCollectIncome)
        Configs.KaitunAutoCollectIncome = KaitunAutoCollectIncome
        Save()
    end
})

var34:AddToggle({
    Title = "Auto Equip & Ride Best Pet",
    Default = Configs.KaitunAutoRideBest,
    Callback = function(KaitunAutoRideBest)
        Configs.KaitunAutoRideBest = KaitunAutoRideBest
        Save()
    end
})

var34:AddToggle({
    Title = "Auto Claim All Free Rewards",
    Default = Configs.KaitunAutoClaimRewards,
    Callback = function(KaitunAutoClaimRewards)
        Configs.KaitunAutoClaimRewards = KaitunAutoClaimRewards
        Save()
    end
})

var35:AddButton({
    Title = "🚀 Force Hatch & Clear Plot",
    Callback = function()
        func3("Kaitun", func18() and "Triggered hatch on ready eggs!" or "No ready eggs to hatch right now", 3)
    end
})

var35:AddButton({
    Title = "🎁 Claim All Free Rewards Now",
    Callback = function()
        Callback(function()
            if ClaimGroupReward then
                ClaimGroupReward:FireServer()
            end

            if ClaimIndexReward then
                ClaimIndexReward:FireServer()
            end

            if var21 then
                var21:FireServer()
            end

            func3("Rewards", "Claimed all available free rewards!", 3)
        end)
    end
})

local var38 = var28:SubTab("Farming")
local var39 = var28:SubTab("Pets")
local var40 = var28:SubTab("Progression")
local var41 = var38:Groupbox("Egg Farming", "Left", "7733774602", "true")
local var42 = var38:Groupbox("Plot & Hatching", "Right")
local var43 = var38:Groupbox("Live Session Tracker", "Right"):AddParagraph({
    Title = "📊 Real-Time Statistics",
    Content = "🥚 Eggs Farmed : 0\n🐣 Pets Hatched: 0\n💰 Cash Earned : +$0\n⏱️ Running Time: 00:00:00"
})

func2(function()
    while task.wait(1) do
        Callback(function()
            if not var43 or not var43.SetContent then
                return
            end

            local startTime = tbl17.startTime
            local var44 = func6(os.clock() - startTime)
            local num4 = func5()
            local str5 = string.format("🥚 Eggs Farmed : %d\n🐣 Pets Hatched: %d\n💰 Cash Earned : +$%s\n⏱️ Running Time: %s", tbl17.eggsFarmed, tbl17.petsHatched, func7(num4), var44)
            var43:SetContent(str5)
        end)
    end
end)

var41:AddToggle({
    Title = "Auto Pickup (Returns & Places)",
    Default = Configs.AutoPickup,
    Flag = "AutoPickupFlag",
    Callback = function(AutoPickup)
        Configs.AutoPickup = AutoPickup

        if not AutoPickup then
            StopTween()
            func3("Auto Pickup", "Stopped immediately", 2)
        end

        Save()
    end
})

var41:AddToggle({
    Title = "Rare Egg Sniping",
    Default = Configs.RareEggSniping,
    Callback = function(RareEggSniping)
        Configs.RareEggSniping = RareEggSniping
        Save()
    end
})

var41:AddToggle({
    Title = "Auto Activate Radar Gear",
    Default = Configs.AutoActivateRadar,
    Callback = function(AutoActivateRadar)
        Configs.AutoActivateRadar = AutoActivateRadar
        Save()
    end
})

var41:AddSlider({
    Title = "Tween Speed (Studs/s)",
    Min = 100,
    Max = 10000,
    Default = Configs.TweenSpeed or 200,
    Rounding = 0,
    Callback = function(TweenSpeed)
        Configs.TweenSpeed = TweenSpeed
        Save()
    end
})

var41:AddSlider({
    Title = "Return Home Speed (Studs/s)",
    Min = 200,
    Max = 10000,
    Default = Configs.HomeSpeed or 800,
    Rounding = 0,
    Callback = function(HomeSpeed)
        Configs.HomeSpeed = HomeSpeed
        Save()
    end
})

var41:AddSlider({
    Title = "Min Weight",
    Min = 0,
    Max = 100,
    Default = Configs.PickupMinWeight or 0,
    Rounding = 1,
    Callback = function(PickupMinWeight)
        Configs.PickupMinWeight = PickupMinWeight
        Save()
    end
})

var41:AddDropdown({
    Title = "Filter Rarities",
    Values = tbl7,
    Default = func10(Configs.PickupRarities),
    Multi = true,
    Callback = function(PickupRarities)
        Configs.PickupRarities = PickupRarities
        Save()
    end
})

var41:AddDropdown({
    Title = "Filter Eggs",
    Values = Values,
    Default = func10(Configs.PickupEggs),
    Multi = true,
    Callback = function(PickupEggs)
        Configs.PickupEggs = PickupEggs
        Save()
    end
})

var42:AddToggle({
    Title = "Auto Place Eggs (Nests + Ground)",
    Default = Configs.AutoPlace,
    Flag = "AutoPlaceFlag",
    Callback = function(AutoPlace)
        Configs.AutoPlace = AutoPlace
        Save()
    end
})

var42:AddToggle({
    Title = "Auto Hatch Ready Eggs",
    Default = Configs.AutoHatch,
    Flag = "AutoHatchFlag",
    Callback = function(AutoHatch)
        Configs.AutoHatch = AutoHatch
        Save()
    end
})

var42:AddToggle({
    Title = "Auto Skip Egg Growth",
    Default = Configs.AutoSkipGrowth,
    Callback = function(AutoSkipGrowth)
        Configs.AutoSkipGrowth = AutoSkipGrowth
        Save()
    end
})

var42:AddToggle({
    Title = "Auto Equip Best Pets",
    Default = Configs.AutoEquipBest,
    Flag = "AutoEquipBestFlag",
    Callback = function(AutoEquipBest)
        Configs.AutoEquipBest = AutoEquipBest
        Save()
    end
})

var42:AddButton({
    Title = "Place All Carried Eggs Now",
    Callback = function()
        func17()
        func3("Plot", "Placed carried eggs onto plot!", 2)
    end
})

local var44 = var39:Groupbox("Ranch Optimization", "Left")
local var45 = var39:Groupbox("Auto Feed", "Left")
local var46 = var39:Groupbox("Auto Sell", "Right")

var44:AddToggle({
    Title = "Auto Collect Pet Income",
    Default = Configs.AutoCollectPetIncome,
    Callback = function(AutoCollectPetIncome)
        Configs.AutoCollectPetIncome = AutoCollectPetIncome
        Save()
    end
})

var44:AddToggle({
    Title = "Auto Swap Best Pets (Unequip Inferior)",
    Default = Configs.AutoSwapBestPets,
    Callback = function(arg1)
        Configs.AutoSwapBestPets = arg1
        Configs.AutoEquipBest = arg1
        Save()
    end
})

var44:AddToggle({
    Title = "Auto Favorite Rare Pets (Protect)",
    Default = Configs.AutoFavoriteRare,
    Callback = function(AutoFavoriteRare)
        Configs.AutoFavoriteRare = AutoFavoriteRare
        Save()
    end
})

var44:AddDropdown({
    Title = "Favorite Rarities",
    Values = {
        "Mythic",
        "Divine",
        "Ethereal",
        "Legendary"
    },
    Default = func10(Configs.FavoriteRarities or { "Mythic", "Divine", "Ethereal" }),
    Multi = true,
    Callback = function(FavoriteRarities)
        Configs.FavoriteRarities = FavoriteRarities
        Save()
    end
})

var44:AddToggle({
    Title = "Auto Ride Best Pet",
    Default = Configs.AutoRidePet,
    Callback = function(AutoRidePet)
        Configs.AutoRidePet = AutoRidePet
        Save()
    end
})

var44:AddDropdown({
    Title = "Pet Lock / Whitelist (Never Sell)",
    Values = tbl9,
    Default = func10(Configs.PetWhitelist),
    Multi = true,
    Callback = function(PetWhitelist)
        Configs.PetWhitelist = PetWhitelist
        Save()
    end
})

var45:AddToggle({
    Title = "Auto Feed Pets",
    Default = Configs.AutoFeed,
    Flag = "AutoFeedFlag",
    Callback = function(AutoFeed)
        Configs.AutoFeed = AutoFeed
        Save()
    end
})

var45:AddDropdown({
    Title = "Food Selection",
    Values = tbl11,
    Default = func10(Configs.FeedFoods or { "Grass", "Bone", "Meat" }),
    Multi = true,
    Callback = function(FeedFoods)
        Configs.FeedFoods = FeedFoods
        Save()
    end
})

var45:AddToggle({
    Title = "Feed Best Pet Only",
    Default = Configs.FeedBestOnly,
    Callback = function(FeedBestOnly)
        Configs.FeedBestOnly = FeedBestOnly
        Save()
    end
})

var45:AddToggle({
    Title = "Filter By Min Age",
    Default = Configs.FeedAboveAge,
    Callback = function(FeedAboveAge)
        Configs.FeedAboveAge = FeedAboveAge
        Save()
    end
})

var45:AddSlider({
    Title = "Min Pet Age",
    Min = 1,
    Max = 50,
    Default = Configs.FeedMinAge or 1,
    Rounding = 0,
    Callback = function(FeedMinAge)
        Configs.FeedMinAge = FeedMinAge
        Save()
    end
})

var46:AddToggle({
    Title = "Auto Sell Pets",
    Default = Configs.AutoSell,
    Flag = "AutoSellFlag",
    Callback = function(AutoSell)
        Configs.AutoSell = AutoSell
        Save()
    end
})

var46:AddSlider({
    Title = "Keep If Weight Above (KG)",
    Min = 0,
    Max = 2000,
    Default = Configs.SellMinWeight or 0,
    Rounding = 0,
    Callback = function(SellMinWeight)
        Configs.SellMinWeight = SellMinWeight
        Save()
    end
})

var46:AddDropdown({
    Title = "Select Rarities to Sell",
    Values = tbl7,
    Default = func10(Configs.SellRarities or { "Common" }),
    Multi = true,
    Callback = function(SellRarities)
        Configs.SellRarities = SellRarities
        Save()
    end
})

var46:AddDropdown({
    Title = "Select Pets to Sell",
    Values = tbl9,
    Default = func10(Configs.SellPets),
    Multi = true,
    Callback = function(SellPets)
        Configs.SellPets = SellPets
        Save()
    end
})

var46:AddToggle({
    Title = "Sell Unlisted Pets",
    Default = Configs.SellUnlisted,
    Callback = function(SellUnlisted)
        Configs.SellUnlisted = SellUnlisted
        Save()
    end
})

local var47 = var40:Groupbox("Base Progression", "Left")
local var48 = var40:Groupbox("Shop Automation", "Right")

var47:AddToggle({
    Title = "Auto Unlock Nests",
    Default = Configs.AutoUnlockNests,
    Callback = function(AutoUnlockNests)
        Configs.AutoUnlockNests = AutoUnlockNests
        Save()
    end
})

var47:AddToggle({
    Title = "Auto Upgrade Hatch Luck (Max)",
    Default = Configs.AutoHatchLuck,
    Callback = function(AutoHatchLuck)
        Configs.AutoHatchLuck = AutoHatchLuck
        Save()
    end
})

var47:AddToggle({
    Title = "Auto Claim Index Rewards",
    Default = Configs.AutoClaimIndex,
    Callback = function(AutoClaimIndex)
        Configs.AutoClaimIndex = AutoClaimIndex
        Save()
    end
})

var47:AddToggle({
    Title = "Auto Rebirth",
    Default = Configs.AutoRebirth,
    Callback = function(AutoRebirth)
        Configs.AutoRebirth = AutoRebirth
        Save()
    end
})

var47:AddToggle({
    Title = "Auto Claim Group Reward",
    Default = Configs.AutoClaimGroupReward,
    Callback = function(AutoClaimGroupReward)
        Configs.AutoClaimGroupReward = AutoClaimGroupReward
        Save()
    end
})

var47:AddToggle({
    Title = "Auto Claim Offline Earnings",
    Default = Configs.AutoClaimOffline,
    Callback = function(AutoClaimOffline)
        Configs.AutoClaimOffline = AutoClaimOffline
        Save()
    end
})

var47:AddToggle({
    Title = "Auto Claim Event Reward (x2 Boost)",
    Default = Configs.AutoClaimEvent,
    Callback = function(AutoClaimEvent)
        Configs.AutoClaimEvent = AutoClaimEvent
        Save()
    end
})

var47:AddToggle({
    Title = "Auto Place Lanterns on Plot",
    Default = Configs.AutoPlaceLanterns,
    Callback = function(AutoPlaceLanterns)
        Configs.AutoPlaceLanterns = AutoPlaceLanterns
        Save()
    end
})

var48:AddToggle({
    Title = "Auto Buy Food",
    Default = Configs.AutoBuyFood,
    Callback = function(AutoBuyFood)
        Configs.AutoBuyFood = AutoBuyFood
        Save()
    end
})

var48:AddDropdown({
    Title = "Select Food to Buy",
    Values = tbl11,
    Default = func10(Configs.BuyFood or { "Grass" }),
    Multi = true,
    Callback = function(BuyFood)
        Configs.BuyFood = BuyFood
        Save()
    end
})

var48:AddToggle({
    Title = "Auto Buy Gears",
    Default = Configs.AutoBuyGears,
    Callback = function(AutoBuyGears)
        Configs.AutoBuyGears = AutoBuyGears
        Save()
    end
})

var48:AddDropdown({
    Title = "Select Gears to Buy",
    Values = tbl13,
    Default = func10(Configs.BuyGears),
    Multi = true,
    Callback = function(BuyGears)
        Configs.BuyGears = BuyGears
        Save()
    end
})

var48:AddToggle({
    Title = "Auto Equip Best Basket",
    Default = Configs.AutoBuyBasket,
    Callback = function(AutoBuyBasket)
        Configs.AutoBuyBasket = AutoBuyBasket
        Save()
    end
})

local var49 = var29:SubTab("Character")
local var50 = var29:SubTab("Visuals")
local var51 = var29:SubTab("Teleports")
local var52 = var29:SubTab("Automation")
local var53 = var49:Groupbox("Movement Settings", "Left")
local var54 = var49:Groupbox("Character Modifiers", "Right")

var53:AddToggle({
    Title = "WalkSpeed Hack",
    Default = Configs.WalkSpeedEnabled,
    Callback = function(WalkSpeedEnabled)
        Configs.WalkSpeedEnabled = WalkSpeedEnabled
        func19()
        Save()
    end
})

var53:AddSlider({
    Title = "WalkSpeed Value",
    Min = 16,
    Max = 120,
    Default = Configs.WalkSpeed or 32,
    Rounding = 0,
    Callback = function(WalkSpeed)
        Configs.WalkSpeed = WalkSpeed
        func19()
        Save()
    end
})

var53:AddToggle({
    Title = "Fly Hack",
    Default = Configs.Fly,
    Callback = function(Fly)
        Configs.Fly = Fly
        Save()
    end
})

var53:AddSlider({
    Title = "Fly Speed",
    Min = 20,
    Max = 200,
    Default = Configs.FlySpeed or 60,
    Rounding = 0,
    Callback = function(FlySpeed)
        Configs.FlySpeed = FlySpeed
        Save()
    end
})

var54:AddToggle({
    Title = "Infinite Jump",
    Default = Configs.InfJump,
    Callback = function(InfJump)
        Configs.InfJump = InfJump
        Save()
    end
})

var54:AddToggle({
    Title = "Noclip",
    Default = Configs.NoClip,
    Callback = function(NoClip)
        Configs.NoClip = NoClip
        tbl18.SetNoclip(NoClip)
        Save()
    end
})

var54:AddToggle({
    Title = "Instant Proximity Prompt",
    Default = Configs.InstantProximityPrompt,
    Callback = function(InstantProximityPrompt)
        Configs.InstantProximityPrompt = InstantProximityPrompt
        Save()
    end
})

local var55 = var50:Groupbox("ESP Settings", "Left")
local var56 = var50:Groupbox("World Render", "Right")

var55:AddToggle({
    Title = "Egg ESP",
    Default = Configs.EggEsp,
    Callback = function(EggEsp)
        Configs.EggEsp = EggEsp
        Save()
    end
})

var55:AddToggle({
    Title = "Show Distance",
    Default = Configs.EspShowDistance,
    Callback = function(EspShowDistance)
        Configs.EspShowDistance = EspShowDistance
        Save()
    end
})

var55:AddToggle({
    Title = "Show Rarity",
    Default = Configs.EspShowRarity,
    Callback = function(EspShowRarity)
        Configs.EspShowRarity = EspShowRarity
        Save()
    end
})

var56:AddToggle({
    Title = "Boost FPS (Remove VFX)",
    Default = Configs.BoostFps,
    Callback = function(BoostFps)
        Configs.BoostFps = BoostFps
        func15(BoostFps)
        Save()
    end
})

var56:AddToggle({
    Title = "GPU Saver",
    Default = Configs.BlackScreen,
    Callback = function(BlackScreen)
        Configs.BlackScreen = BlackScreen
        RunService:Set3dRenderingEnabled(not BlackScreen)
        func14(BlackScreen)
        Save()
    end
})

local var57 = var51:Groupbox("Quick Teleports", "Left")

var57:AddButton({
    Title = "Teleport to My Ranch",
    Callback = function()
        tbl18.TeleportHome()
    end
})

var57:AddButton({
    Title = "Teleport to Richie (Sell)",
    Callback = function()
        local Richie = workspace:FindFirstChild("Stalls") and workspace.Stalls:FindFirstChild("Sell") and workspace.Stalls.Sell:FindFirstChild("Richie")

        if Richie and Richie.PrimaryPart then
            TP(Richie.PrimaryPart.CFrame + Vector3.new(0, 0, 5))
        end
    end
})

var57:AddButton({
    Title = "Teleport to Shop",
    Callback = function()
        local Food = workspace:FindFirstChild("Stalls") and workspace.Stalls:FindFirstChild("Food")

        if not Food then
            return
        end

        local var58 = Food:FindFirstChildWhichIsA("BasePart") or Food.PrimaryPart

        if var58 then
            TP(var58.CFrame + Vector3.new(0, 3, 0))
        end
    end
})

local var58 = var52:Groupbox("Automation Settings", "Left")
local var59 = var52:Groupbox("Config & Maintenance", "Right")

var58:AddToggle({
    Title = "Auto Skip Loading Screen",
    Default = Configs.AutoSkipLoadingScreen or false,
    Callback = function(AutoSkipLoadingScreen)
        Configs.AutoSkipLoadingScreen = AutoSkipLoadingScreen

        if AutoSkipLoadingScreen then
            func4()
        end

        Save()
    end
})

var58:AddToggle({
    Title = "Anti-AFK",
    Default = Configs.AntiAFK,
    Callback = function(AntiAFK)
        Configs.AntiAFK = AntiAFK
        Save()
    end
})

var58:AddToggle({
    Title = "Auto Rejoin on Disconnect",
    Default = Configs.AutoRejoin,
    Callback = function(AutoRejoin)
        Configs.AutoRejoin = AutoRejoin
        Save()
    end
})

var59:AddButton({
    Title = "Save Config",
    Callback = function()
        Save()
        func3("Config", "Config successfully saved!", 2)
    end
})

var59:AddButton({
    Title = "Load Config",
    Callback = function()
        Load()
        func3("Config", "Config reloaded!", 2)
    end
})

var59:AddButton({
    Title = "Delete Workspace (Fix Bug)",
    Callback = function()
        DeleteWorkspace()
    end
})

local var60 = var30:SubTab("Server")
local var61 = var60:Groupbox("Server Management", "Left")
local var62 = var60:Groupbox("Community", "Right")

var61:AddButton({
    Title = "Server Hop Now",
    Callback = function()
        Hop()
    end
})

var61:AddButton({
    Title = "Rejoin Current Server",
    Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

var61:AddToggle({
    Title = "Server Hop If No Eggs",
    Default = Configs.AutoServerHopNoEggs,
    Callback = function(AutoServerHopNoEggs)
        Configs.AutoServerHopNoEggs = AutoServerHopNoEggs
        Save()
    end
})

var61:AddButton({
    Title = "Copy Server Job ID",
    Callback = function()
        if setclipboard then
            setclipboard((tostring(game.JobId)))
            func3("Clipboard", "Job ID copied!", 2)
        end
    end
})

local var63 = nil

Callback(function()
    local request = syn and syn.request or http and http.request or request or http_request or BONKLIB_LOCAL.Creator and BONKLIB_LOCAL.Creator.Request

    if not request then
        return
    end

    local var64 = request({
        Url = "https://discord.com/api/v10/invites/KHgnWBNs9A?with_counts=true&with_expiration=true",
        Method = "GET",
        Headers = {
            ["User-Agent"] = "RobloxBot/1.0",
            Accept = "application/json"
        }
    })

    if var64 and var64.Body and var64.Body ~= "" then
        var63 = HttpService:JSONDecode(var64.Body)
    end
end)

if var63 and var63.guild then
    local tbl26 = {
        Title = var63.guild.name
    }
    local str5 = tostring(var63.approximate_member_count)
    local approximate_presence_count = var63.approximate_presence_count
    tbl26.Desc = " <font color=\"#52525b\">•</font> Member Count : " .. str5 .. "\n <font color=\"#16a34a\">•</font> Online Count : " .. tostring(approximate_presence_count)
    tbl26.Image = "https://cdn.discordapp.com/icons/" .. var63.guild.id .. "/" .. var63.guild.icon .. ".png?size=1024"
    tbl26.ImageSize = 42
    local var64 = var62:AddParagraph(tbl26)

    var62:AddButton({
        Title = "Update Info",
        Callback = function()
            local request = syn and syn.request or http and http.request or request or http_request or BONKLIB_LOCAL.Creator and BONKLIB_LOCAL.Creator.Request

            if not request then
                return
            end

            local var65 = request({
                Url = "https://discord.com/api/v10/invites/KHgnWBNs9A?with_counts=true&with_expiration=true",
                Method = "GET"
            })
            local var66 = var65 and var65.Body and HttpService:JSONDecode(var65.Body)

            if var66 and var66.guild then
                local var67 = var64
                local str6 = tostring(var66.approximate_member_count)
                local approximate_presence_count2 = var66.approximate_presence_count
                var67:SetDesc(" <font color=\"#52525b\">•</font> Member Count : " .. str6 .. "\n <font color=\"#16a34a\">•</font> Online Count : " .. tostring(approximate_presence_count2))
            end
        end
    })
else
    var62:AddParagraph({
        Title = "Discord Community",
        Desc = "Join the official BonkHub Discord community for updates, scripts, and support!",
        Image = "triangle-alert",
        ImageSize = 26
    })
end

var62:AddButton({
    Title = "Copy Discord Invite",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/KHgnWBNs9A")
            func3("Clipboard", "Discord invite copied!", 2)
        end
    end
})

local var64 = var31:SubTab("Discord Webhook")
local var65 = var64:Groupbox("Webhook Configuration", "Left")
local var66 = var64:Groupbox("Notification Triggers & Actions", "Right")

var65:AddToggle({
    Title = "Enable Webhook",
    Default = Configs.WebhookEnabled,
    Callback = function(WebhookEnabled)
        Configs.WebhookEnabled = WebhookEnabled
        Save()
    end
})

var65:AddTextbox({
    Title = "Webhook URL",
    Default = Configs.WebhookUrl or "",
    Placeholder = "Paste Discord Webhook URL here...",
    Callback = function(WebhookUrl)
        Configs.WebhookUrl = WebhookUrl
        Save()
    end
})

var65:AddToggle({
    Title = "Show Player Username",
    Default = Configs.WebhookShowUser,
    Callback = function(WebhookShowUser)
        Configs.WebhookShowUser = WebhookShowUser
        Save()
    end
})

var65:AddToggle({
    Title = "Show Server Job ID",
    Default = Configs.WebhookShowJobId,
    Callback = function(WebhookShowJobId)
        Configs.WebhookShowJobId = WebhookShowJobId
        Save()
    end
})

var65:AddToggle({
    Title = "Send Periodic Status Summary",
    Default = Configs.WebhookPeriodicReport,
    Callback = function(WebhookPeriodicReport)
        Configs.WebhookPeriodicReport = WebhookPeriodicReport
        Save()
    end
})

var65:AddSlider({
    Title = "Report Interval (Minutes)",
    Min = 5,
    Max = 60,
    Default = Configs.WebhookReportInterval or 10,
    Rounding = 0,
    Callback = function(WebhookReportInterval)
        Configs.WebhookReportInterval = WebhookReportInterval
        Save()
    end
})

var66:AddToggle({
    Title = "Notify on Hatch",
    Default = Configs.WebhookOnHatch,
    Callback = function(WebhookOnHatch)
        Configs.WebhookOnHatch = WebhookOnHatch
        Save()
    end
})

var66:AddDropdown({
    Title = "Hatch Min Rarity",
    Values = tbl7,
    Default = Configs.WebhookHatchMinRarity or "Common",
    Callback = function(WebhookHatchMinRarity)
        Configs.WebhookHatchMinRarity = WebhookHatchMinRarity
        Save()
    end
})

var66:AddToggle({
    Title = "Notify on Egg Returned to Base",
    Default = Configs.WebhookOnEggReturned or false,
    Callback = function(WebhookOnEggReturned)
        Configs.WebhookOnEggReturned = WebhookOnEggReturned
        Save()
    end
})

var66:AddToggle({
    Title = "Weather Alert Webhook",
    Default = Configs.WeatherWebhookAlert,
    Callback = function(WeatherWebhookAlert)
        Configs.WeatherWebhookAlert = WeatherWebhookAlert
        Save()
    end
})

var66:AddButton({
    Title = "Send Test Webhook Message",
    Callback = function()
        func13()
        func3("Webhook", "Sent test diagnostic webhook!", 2)
    end
})

var66:AddButton({
    Title = "Send Farming Summary Now",
    Callback = function()
        func12()
        func3("Webhook", "Sent farming summary report!", 2)
    end
})

var66:AddButton({
    Title = "Send Server Eggs Radar Now",
    Callback = function()
        func11()
        func3("Webhook", "Sent live eggs radar scan!", 2)
    end
})

var32:SubTab("UI Settings"):SetSettings()
print(string.format("[BonkHub] Successfully loaded %s script with complete BonkHub UI!", str1))
