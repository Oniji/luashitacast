local shared = {};
local cycles = {};
local toggles = {};

local zones = gFunc.LoadFile('common/zones.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');
local fonts = require('fonts');


local verbose = false; -- For debugging purposes
local packetfrequency = 250; -- 250ms packetflow / 400ms default
local buffer = 250; -- extra buffer to account for latency
local minimumcast = 1; -- Minimum cast time to apply midcast delay
local lockthrottle = 15; -- delay before allowing lockstyle (seconds)

local fontSettings = {
    visible = true,
    font_family = 'Consolas',
    font_height = 16,
    color = 0xFFFFFFFF,
    color_outline = 0xFF000000,
    position_x = 2780,
    position_y = 1180,
    draw_flags = 0x10,
    background =
    T{
        visible = false,
    },
};

local sets = {
    ExpRing = {
        Ring1 = 'Chariot Band'
    },
    Chocobo = {
        Body = 'Choc. Jack Coat',
        Hands = 'Chocobo gloves',
        Legs = 'Chocobo hose',
        Feet = 'Chocobo boots'
    },
    Fishing = {
        Body = 'Angler\'s tunica',
        Hands = 'Angler\'s gloves',
        Legs = 'Angler\'s hose',
        Feet = 'Angler\'s boots',
        Range = 'Halcyon Rod',
        Ammo = 'Worm Lure'
    },
    Logging = {
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose'
    }
};
shared.sets = sets;

local GearMode = {
    [1] = 'Main',
    [2] = 'Fishing',
    [3] = 'Digging',
    [4] = 'Logging'
};

local ElementalStaffTable = T{
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Jupiter\'s Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Dark Staff'
};

local ElementalWeakness = T{
    ['Earth'] = 'Wind',
    ['Wind'] = 'Ice',
    ['Ice'] = 'Fire',
    ['Fire'] = 'Water',
    ['Water'] = 'Thunder',
    ['Thunder'] = 'Earth',
    ['Light'] = 'Dark',
    ['Dark'] = 'Light',
};

local ElementalObis = T{
    ['Earth'] = {'Dorin Obi', false},
    ['Wind'] = {'Furin Obi', false},
    ['Ice'] = {'Hyorin Obi', false},
    ['Fire'] = {'Karin Obi', false},
    ['Water'] = {'Suirin Obi', false},
    ['Lightning'] = {'Rairin Obi', false},
    ['Light'] = {'Korin Obi', false},
    ['Dark'] = {'Anrin Obi', false}
};

local LockStyleSets = T{
    ['DRG'] = 21,
    ['BLM'] = 30,
    ['WHM'] = 40,
    ['NIN'] = 41,
    ['BST'] = 50,
    ['RDM'] = 60,
    ['THF'] = 70,
    ['Digging'] = 17,
    ['Fishing'] = 18,
    ['Logging'] = 19,
    ['Crafting'] = 20
};

-- Used for "Ugg Pendant latent"-logic. List of all potential caster equipment that: 
--  1) Increases Max MP
--  2) Is NOT equipped in a visible slot (visible slots include head, body, gloves, legs, feet, weapon).
local SubtractMP = T{
    ["Phtm. Tathlum"] = 10,
    ["Morion Tathlum"] = 3,
    ["Morion Earring"] = 4,
    ["Phantom Earring"] = 8,
    ["Prism Cape"] = 10
};

local FastCastValues = T{
    ["Rostrum Pumps"] = 2,
    ["Loquacious Earring"] = 2,
    ["Homam Cosciales"] = 4,
    ["Duelist\'s Tabard"] = 10,
    ["Duelist\'s Tabard +1"] = 10,
    ["Warlock\'s Chapeau"] = 10,
    ["Warlock\'s Chapeau +1"] = 10,
    ["Warlock\'s Mantle"] = 2
};

local VisibleSlot = T{
    ["Head"] = true,
    ["Body"] = true,
    ["Gloves"] = true,
    ["Legs"] = true,
    ["Feet"] = true
};

local DisplacementGear = T{
    -- ['Item Name'] = 'SlotDisplaced'
    ['Black Cloak'] = 'Head',
    ['Demon Cloak'] = 'Head',
    ['Shaman\'s Cloak'] = 'Head',
    ['Mage\'s Tunic'] = 'Head'
};

local CycleDisplayNames = {
    ['AmmoMode'] = 'Ammo Mode',
    ['PetType'] = 'Pet Type',
    ['GearMode'] = 'Gear Mode',
    ['TPmode'] = 'TP',
    ['WSmode'] = 'WS'
};

local Settings = {
    CurrentSet = 'None',
    LastLocked = nil,
    UseNaked = false,
    UseElementalObis = false,
    UseWarpCudgel = false,
    UseReraiseGorget = false,
    UseExpRing = false,
    GearMode = nil,
};

shared.OnLoad = function()
    if (shared.FontObject ~= nil) then
        shared.FontObject:SetVisible(false)
        shared.FontObject:destroy()
        shared.FontObject = nil
        ashita.events.unregister('d3d_present', 'shareddisplay_present_cb')
        print('Destroying Font Object...')
    end
    shared.FontObject = fonts.new(fontSettings);

    shared.CreateCycle('GearMode', GearMode);
    Settings.GearMode = shared.GetCycle('GearMode');

    local player = gData.GetPlayer()
    local job = player.MainJob

    ashita.events.register('d3d_present', 'shareddisplay_present_cb', function ()
        local display = 'CurrentSet' .. ': ' .. '|cFF5FFF5F|' .. Settings.CurrentSet .. '|r' .. ' \n';
--[[         for k, v in pairs(Toggles) do
            display = display .. ' '
            if (v == true) then
                display = display .. '|cFF5FFF5F|' .. k .. '|r'
            else
                display = display .. '|cFF989898|' .. k .. '|r'
            end
        end ]]
        for key, value in pairs(cycles) do
            display = display .. key .. ': ' .. '|cFF5FFF5F|' .. value.Array[value.Index] .. '|r \n'
        end
        shared.FontObject.text = display;
    end)

end

shared.Unload = function()
    if (shared.FontObject ~= nil) then
        shared.FontObject:SetVisible(false)
        shared.FontObject:destroy()
        shared.FontObject = nil
    end
    ashita.events.unregister('d3d_present', 'shareddisplay_present_cb')
end

shared.ProcessCommand = function(args)

    if (args[1] == 'main') then
        if shared.SetCycleToValue('GearMode', 'Main') then
            Settings.GearMode = 'Main';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Mode ->> Main ]--');
            local player = gData.GetPlayer();
            shared.LockStyleSet(player.MainJob);
            shared.SetCurrentSet('Main');
        else
            print("Unable to change gear mode. Gear Type 'Digging' not found.");
        end
    elseif (args[1] == 'digging') then
        if shared.SetCycleToValue('GearMode', 'Digging') then
            Settings.GearMode = 'Digging';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Mode ->> Digging ]--');
            macrobooks.SetMacroBook(macrobooks.BookTypes.DIGGING);
            shared.LockStyleSet('Digging');
            shared.SetCurrentSet('Digging');
        else
            print("Unable to change gear mode. Gear Type 'Digging' not found.");
        end
    elseif (args[1] == 'fishing') then
        if shared.SetCycleToValue('GearMode', 'Fishing') then
            Settings.GearMode = 'Fishing';
            macrobooks.SetMacroBook(macrobooks.BookTypes.FISHING);
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Mode ->> Fishing ]--');
            shared.LockStyleSet('Fishing');
            shared.SetCurrentSet('Fishing');
        else
            print("Unable to change gear mode. Gear Type 'Digging' not found.");
        end
    elseif (args[1] == 'logging') then
        if shared.SetCycleToValue('GearMode', 'Logging') then
            Settings.GearMode = 'Logging';
            macrobooks.SetMacroBook(macrobooks.BookTypes.LOGGIaNG);
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Mode ->> Logging ]--');
            shared.LockStyleSet('Logging');
            shared.SetCurrentSet('Logging');
        else
            print("Unable to change gear mode. Gear Type 'Digging' not found.");
        end
    elseif (args[1] == 'gearmode') then
        Settings.GearMode = shared.AdvanceCycle('GearMode');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Current Gear Mode: ' .. Settings.GearMode .. ' | Next: ' .. shared.GetCycleNext('GearMode') .. ' ]--');
        if Settings.GearMode == "Main" then
            local player = gData.GetPlayer();
            shared.SetCurrentSet('Main');
        else
            macrobooks.SetMacroBook(Settings.GearMode);
            shared.SetCurrentSet(Settings.GearMode);
        end
        shared.UnlockLockstyle();
    elseif (args[1] == 'naked') then
        Settings.UseNaked = not Settings.UseNaked;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Naked ->> ' .. (Settings.UseNaked and 'On' or 'Off') .. ' ]--');
    elseif (args[1] == 'warpcudgel') then
        Settings.UseWarpCudgel = not Settings.UseWarpCudgel;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Warp Cudgel ->> ' .. (Settings.UseWarpCudgel and 'On' or 'Off') .. ' ]--');
        AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom WarpCudgel 33');
    elseif (args[1] == 'expring') then
        Settings.UseExpRing = not Settings.UseExpRing;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use EXP Ring ->> ' .. (Settings.UseExpRing and 'On' or 'Off') .. ' ]--');
        AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom ExpRing 6');
    elseif (args[1] == 'gorget') then
        Settings.UseReraiseGorget = not Settings.UseReraiseGorget;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Reraise Gorget ->> ' .. (Settings.UseReraiseGorget and 'On' or 'Off') .. ' ]--');
        AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom ReraiseGorget 33');
    elseif (args[1] == 'checksets') then
        shared.CheckSets();
    end

end


shared.GearOverride = function()

    -- Chocobo
    if (Settings.GearMode == 'Digging') then
        gFunc.EquipSet(sets.Chocobo);
    end

    -- Fishing
    if (Settings.GearMode == 'Fishing') then
        gFunc.EquipSet(sets.Fishing);
    end

    -- Fishing
    if (Settings.GearMode == 'Logging') then
        gFunc.EquipSet(sets.Logging);
    end

    -- Warp Cudgel
    if (Settings.UseWarpCudgel == true) then
        gFunc.Equip('Main','Warp Cudgel');
    end

    -- Exp Band
    if (Settings.UseExpRing == true) then
        gFunc.EquipSet(sets.ExpRing);
    end

    -- Reraise Gorget
    if (Settings.UseReraiseGorget == true) then
        gFunc.Equip('Neck','Reraise Gorget');
    end

    zones.CityGear(); -- Aketon Auto-equip

end


shared.IsNaked = function()
    return Settings.UseNaked;
end


shared.UseElementalStaff = function(element)

    gFunc.Equip('Main', ElementalStaffTable[element]);

end

shared.UggPendantCheck = function(action)
    local player = gData.GetPlayer();
    if player.MainJobSync < 70 then
        -- Current level too low for Ugg Pendant
        return;
    end
    -- Only do slow, thorough equipment check if MP will go under an over-estimated threshold
    if action.MppAftercast <= 51 then
        local equipment = gData.GetEquipment();
        local subMpTotal = 0;
        for k,v in pairs(equipment) do
            if VisibleSlot[k] == nil and SubtractMP[v.Name] then
                subMpTotal = subMpTotal + SubtractMP[v.Name];
            end
        end
        local finalMPP = (player.MP - action.MpCost)/(player.MaxMP - subMpTotal); -- MPP excluding MP from non-visible gear
        if finalMPP <= 0.51 then
            --AshitaCore:GetChatManager():QueueCommand(-1, '/echo Ugg Pendant True. Current: ' .. player.MP .. ', Cost: ' .. action.MpCost .. ', MaxMP: ' .. player.MaxMP .. ', SubTotal: ' .. subMpTotal .. ', FinalMPP: ' .. finalMPP);
            gFunc.Equip('Neck', 'Uggalepih Pendant');
        end
    end
end


shared.UnequipGear = function()
    gFunc.Equip('main', 'remove');
    gFunc.Equip('sub', 'remove');
    gFunc.Equip('ammo', 'remove');
    gFunc.Equip('range', 'remove');
    gFunc.Equip('head', 'remove');
    gFunc.Equip('body', 'remove');
    gFunc.Equip('ear1', 'remove');
    gFunc.Equip('ear2', 'remove');
    gFunc.Equip('ring1', 'remove');
    gFunc.Equip('ring2', 'remove');
    gFunc.Equip('hands', 'remove');
    gFunc.Equip('waist', 'remove');
    gFunc.Equip('back', 'remove');
    gFunc.Equip('legs', 'remove');
    gFunc.Equip('feet', 'remove');
    gFunc.Equip('neck', 'remove');

end

shared.LockStyleSet = function(job)
    -- Throttle Lockstyle Attempts
    if Settings.LastLocked and ((os.time() - Settings.LastLocked) < lockthrottle) then
        return;
    end

    local lockstylenumber = LockStyleSets[job];
    if lockstylenumber then
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Lock Style Set ->> ' .. job .. ' ]--');
        AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyleset ' .. lockstylenumber);
        Settings.LastLocked = os.time();
    end
end

shared.UnlockLockstyle = function()
    -- Throttle Lockstyle Attempts
    if Settings.LastLocked and ((os.time() - Settings.LastLocked) < lockthrottle) then
        return;
    end

    AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Lock Style Set ->> OFF ]--');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyle off');
    Settings.LastLocked = os.time();
end

shared.DisplacedGearCheck = function(set)
    local displaced_set = {};
    for slot, item in pairs(set) do
        if DisplacementGear[item.Name] then
            displaced_set[slot] = item.Name;
            displaced_set[DisplacementGear[item.Name]] = 'displaced';
        end
    end
    return displaced_set;
end

shared.SpellMatchDay = function(spell)
    local environment = gData.GetEnvironment();
    return (spell.Element == environment.DayElement);
end

shared.ObiCheck = function(spell)
    if not Settings.UseElementalObis then
        return;
    end
    local environment = gData.GetEnvironment();
    if spell.Element == environment.WeatherElement or spell.Element == environment.DayElement then
        local elemental_obi = ElementalObis[spell.Element];
        if elemental_obi[2] then -- Do you have the relevant Obi?
            gFunc.Equip('Waist', elemental_obi[1]);
        end
    end
end

-- Utility Functions --
-- Taken from luashitacast varhelper.lua



shared.CreateCycle = function(name, values)
	local newCycle = {
		Index = 1,
		Array = values
	};
	cycles[name] = newCycle;
end

shared.AdvanceCycle = function(name)
	local ctable = cycles[name];
	if (type(ctable) ~= 'table') then
		return;
	end
	
	ctable.Index = ctable.Index + 1;
	if (ctable.Index > #ctable.Array) then
		ctable.Index = 1;
	end
    return ctable.Array[ctable.Index];
end

shared.SetCycleToValue = function(name, value)
    local ctable = cycles[name]
    if (type(ctable) ~= 'table') then
        return false
    end

    for i, v in ipairs(ctable.Array) do
        if v == value then
            ctable.Index = i
            return true
        end
    end

    return false  -- Value not found
end

shared.GetCycle = function(name)
	local ctable = cycles[name];
	if (type(ctable) == 'table') then
		return ctable.Array[ctable.Index];
	else
		return 'Unknown';
	end
end

shared.GetCycleNext = function(name)
    local ctable = cycles[name];
    if (type(ctable) ~= 'table') then
		return;
	end

    local nextIndex = ctable.Index + 1;
	if (nextIndex > #ctable.Array) then
		nextIndex = 1;
	end
    return ctable.Array[nextIndex];
end

shared.SetMidcastDelay = function(precastset)
    local player = gData.GetPlayer();
    local action = gData.GetAction();
    local casttime = action.CastTime;
    local weakenedstate = gData.GetBuffCount('Weakness');
    local chainspellstate = gData.GetBuffCount('Chainspell');
    local fastcast = 0;

    -- Skip midcast delay if short cast or weakened
    if casttime < minimumcast or weakenedstate >= 1 or chainspellstate >= 1 then
        return;
    end

    fastcast = shared.CalcFastCast(precastset);

    -- Check for BRD
        -- Check BRD equipment
        -- Check Bard Merits ??
    
    -- Check Cure spell
        -- Check cure cast time merits ???
        -- Cure clogs
        -- Capricornian Rope?
    
    local midcastdelay = (((casttime * (1 - fastcast))) - packetfrequency - buffer)/1000;

    if midcastdelay > minimumcast then
        gFunc.SetMidDelay(midcastdelay); -- seconds
        if verbose then print('Action: ' .. action.Name .. ' | Cast Time (s): ' .. action.CastTime/1000 .. ' | Mid Cast Delay (s): ' .. midcastdelay); end
    end

end

shared.CalcFastCast = function(set)
    local player = gData.GetPlayer();
    local rdmlevel = 0;
    local fastcast = 0;
    -- Check for Fast Cast on gear
    if set then
        for slot, item in pairs(set) do
            if FastCastValues[item] then
                fastcast = fastcast + FastCastValues[item];
            end
        end
    end
    -- Check for Fast Cast from RDM Traits
    if player.MainJob == 'RDM' then
        rdmlevel = player.MainJobLevel;
    elseif player.SubJob == 'RDM' then
        rdmlevel = player.SubJobLevel;
    end

    if rdmlevel >= 55 then
        fastcast = fastcast + 20; -- Fast Cast Trait III 20%
    elseif rdmlevel >= 35 then
        fastcast = fastcast + 15; -- Fast Cast Trait II 15%
    elseif rdmlevel >= 15 then
        fastcat = fastcast + 10; -- Fast Cast Trait I 10%
    end

    -- Casting Time Reduction Cap is 80% 
    if fastcast > 80 then
        fastcast = 80;
    end
    return fastcast/100;
    
end

shared.Display = function()
    if (shared.FontObject ~= nil) then
        shared.FontObject:SetVisible(false)
        shared.FontObject:destroy()
        shared.FontObject = nil
    end
    shared.FontObject = fonts.new(fontSettings)

    local player = gData.GetPlayer()
    local job = player.MainJob

    ashita.events.register('d3d_present', 'shareddisplay_present_cb', function ()
        local display = 'CurrentSet' .. ': ' .. '|cFF5FFF5F|' .. Settings.CurrentSet .. '|r' .. ' \n';
--[[         for k, v in pairs(Toggles) do
            display = display .. ' '
            if (v == true) then
                display = display .. '|cFF5FFF5F|' .. k .. '|r'
            else
                display = display .. '|cFF989898|' .. k .. '|r'
            end
        end ]]
        for key, value in pairs(cycles) do
            display = display .. key .. ': ' .. '|cFF5FFF5F|' .. value.Array[value.Index] .. '|r \n'
        end
        shared.FontObject.text = display;
    end)
end

shared.GetCurrentSet = function()
    return Settings.CurrentSet and 1 or 'None';
end

shared.SetCurrentSet = function(set)
    if set then
        Settings.CurrentSet = set;
    end
end

shared.CheckSets = function(sets)
    for set in sets do
        for slot, item in pairs(set) do
            print('Set: ' .. set .. ', Slot: ' .. slot .. ', Item: ' .. item)
        end
    end
end

return shared;