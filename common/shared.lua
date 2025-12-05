local shared = {};
local cycles = {};
local toggles = {};

local fonts = require('fonts');

local binds = gFunc.LoadFile('common/binds.lua');
local zones = gFunc.LoadFile('common/zones.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');
local conquest = gFunc.LoadFile('common/conquest.lua');

local verbose = false; -- For debugging purposes
local packetfrequency = 250; -- 250ms packetflow / 400ms default
local buffer = 250; -- extra buffer to account for latency
local minimumcast = 1; -- Minimum cast time to apply midcast delay
local lockthrottle = 15; -- delay before allowing lockstyle (seconds)

local HP_BLM_RDM = 998; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit
local HP_BLM_WHM = 980; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 744HP is 0.76 Threshold. 236 deficit
local HP_BLM_NIN = 998; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit

local MP_BLM_RDM = 730; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_WHM = 749; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_NIN = 671; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc

shared.Colour = {
    CARBUNCLE = 'cFF54DCF8',
    IFRIT = 'cFFF44336',
    GARUDA = 'cFF6AA84F',
    TITAN = 'cFFFFD966',
    LEVIATHAN = 'cFF3896EC',
    SHIVA = 'cFFC8E0F7',
    RAMUH = 'cFF9D5CDA',
    FENRIR = 'cFF592789',
    DIABOLOS = 'cFF960E5E',
    RAGE = 'cFFF44336',
    WARD = 'cFF54DCF8',
    DEBUFF = 'cFF9D5CDA',
    TWOHOUR = 'cFFFF00FF',
}

local fontSettings = {
    visible = true,
    font_family = 'Consolas',
    font_height = 16,
    color = 0xFFFFFFFF,
    color_outline = 0xFF000000,
    position_x = 2780,
    position_y = 1150,
    draw_flags = 0x10,
    background =
    T{
        visible = false,
    },
};

local sets = {
    ExpRing = {
        Ring1 = 'Emperor Band'
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
        Range = 'Lu Shang\'s F. Rod',
        Ammo = 'Fly Lure'
    },
    Logging = {
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose'
    },
    Clamming = {
        Body = 'Hume Top +1',
        Hands = 'displaced',
        Legs = 'Hume Shorts +1',
        Feet = 'displaced',
    },
    YellowObi = {
        Back = 'Blue Cape', -- 15 
        Neck = 'Checkered Scarf', -- 15
    }
};
shared.sets = sets;

local GearMode = {
    [1] = 'Main',
    [2] = 'Fishing',
    [3] = 'Digging',
    [4] = 'Logging',
    [5] = 'Clamming',
};

local ElementalStaffTable = T{
    ['Fire'] = 'Vulcan\'s Staff',
    ['Earth'] = 'Terra\'s Staff',
    ['Water'] = 'Neptune\'s Staff',
    ['Wind'] = 'Auster\'s Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Jupiter\'s Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Pluto\'s Staff'
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
    ['Ice'] = {'Hyorin Obi', true},
    ['Fire'] = {'Karin Obi', false},
    ['Water'] = {'Suirin Obi', false},
    ['Thunder'] = {'Rairin Obi', true},
    ['Light'] = {'Korin Obi', false},
    ['Dark'] = {'Anrin Obi', true}
};

local LockStyleSets = {
    ['DRG'] = 21,
    ['BLM'] = 30,
    ['WHM'] = 40,
    ['NIN'] = 41,
    ['BST'] = 50,
    ['RDM'] = 60,
    ['SMN'] = 61,
    ['THF'] = 70,
    ['DRK'] = 80,
    ['MNK'] = 81,
    ['Clamming'] = 16,
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
    ['Mage\'s Tunic'] = 'Head',
    ['Vermillion Cloak'] = 'Head'
};

local CycleDisplayNames = {
    ['AmmoMode'] = 'Ammo Mode',
    ['PetType'] = 'Pet Type',
    ['GearMode'] = 'Gear Mode',
    ['TPmode'] = 'TP',
    ['WSmode'] = 'WS'
};

local Settings = {
    FillModeState = true,
    CurrentSet = 'None',
    LastLocked = nil,
    UseNaked = false,
    UseElementalObis = true,
    UseWarpCudgel = false,
    UseReraiseHairpin = false,
    UseReraiseGorget = false,
    UseExpRing = false,
    UsePowderBoots = false,
    GearMode = nil,
    Extras = '', -- Text for displaying additional job information
};

-- --------------------------------------------------------
-- Ashitacore Functions
-- --------------------------------------------------------

shared.OnLoad = function()
    if (shared.FontObject ~= nil) then
        shared.FontObject:SetVisible(false)
        shared.FontObject:destroy()
        shared.FontObject = nil
        ashita.events.unregister('d3d_present', 'shareddisplay_present_cb')
        if verbose then print('Destroying Font Object...'); end
    end
    shared.FontObject = fonts.new(fontSettings);

    shared.CreateCycle('GearMode', GearMode);
    Settings.GearMode = shared.GetCycle('GearMode');

    local player = gData.GetPlayer()
    local job = player.MainJob

    ashita.events.register('d3d_present', 'shareddisplay_present_cb', function ()
        local display = 'CurrentSet' .. ': ' .. '|cFF5FFF5F|' .. Settings.CurrentSet .. '|r' .. ' \n';
        for key, value in pairs(cycles) do
            display = display .. key .. ': ' .. '|cFF5FFF5F|' .. value.Array[value.Index] .. '|r \n'
        end
        display = display .. Settings.Extras;

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
            shared.LockStyleSet();
            shared.SetCurrentSet('Main');
        else
            if verbose then print("Unable to change gear mode. Gear Type 'Digging' not found."); end
        end
    elseif (args[1] == 'digging') then
        if shared.SetCycleToValue('GearMode', 'Digging') then
            Settings.GearMode = 'Digging';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Mode ->> Digging ]--');
            macrobooks.SetMacroBook(macrobooks.BookTypes.DIGGING);
            shared.LockStyleSet();
            shared.SetCurrentSet('Digging');
        else
            if verbose then print("Unable to change gear mode. Gear Type 'Digging' not found."); end
        end
    elseif (args[1] == 'fishing') then
        if shared.SetCycleToValue('GearMode', 'Fishing') then
            Settings.GearMode = 'Fishing';
            macrobooks.SetMacroBook(macrobooks.BookTypes.FISHING);
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Mode ->> Fishing ]--');
            shared.LockStyleSet();
            shared.SetCurrentSet('Fishing');
        else
            if verbose then print("Unable to change gear mode. Gear Type 'Digging' not found."); end
        end
    elseif (args[1] == 'logging') then
        if shared.SetCycleToValue('GearMode', 'Logging') then
            Settings.GearMode = 'Logging';
            macrobooks.SetMacroBook(macrobooks.BookTypes.LOGGING);
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Mode ->> Logging ]--');
            shared.LockStyleSet();
            shared.SetCurrentSet('Logging');
        else
            if verbose then print("Unable to change gear mode. Gear Type 'Digging' not found."); end
        end
    elseif (args[1] == 'clamming') then
        if shared.SetCycleToValue('GearMode', 'Clamming') then
            Settings.GearMode = 'Clamming';
            macrobooks.SetMacroBook(macrobooks.BookTypes.CLAMMING);
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Mode ->> Clamming ]--');
            shared.LockStyleSet();
            shared.SetCurrentSet('Clamming');
        else
            if verbose then print("Unable to change gear mode. Gear Type 'Digging' not found."); end
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
        if Settings.UseWarpCudgel then AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom WarpCudgel 33'); end
    elseif (args[1] == 'powder_boots') then
        Settings.UsePowderBoots = not Settings.UsePowderBoots;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Powder Boots ->> ' .. (Settings.UsePowderBoots and 'On' or 'Off') .. ' ]--');
        if Settings.UsePowderBoots then AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom PowderBoots 33'); end
    elseif (args[1] == 'reraise_hairpin') then
        Settings.UseReraiseHairpin = not Settings.UseReraiseHairpin;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Reraise Hairpin ->> ' .. (Settings.UseReraiseHairpin and 'On' or 'Off') .. ' ]--');
        if Settings.UseReraiseHairpin then AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom ReraiseHairpin 33'); end
    elseif (args[1] == 'expring') then
        Settings.UseExpRing = not Settings.UseExpRing;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use EXP Ring ->> ' .. (Settings.UseExpRing and 'On' or 'Off') .. ' ]--');
        if Settings.UseExpRing then AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom ExpRing 6'); end
    elseif (args[1] == 'gorget') then
        Settings.UseReraiseGorget = not Settings.UseReraiseGorget;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Reraise Gorget ->> ' .. (Settings.UseReraiseGorget and 'On' or 'Off') .. ' ]--');
        if Settings.UseReraiseGorget then AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom ReraiseGorget 33'); end
    elseif (args[1] == 'checksets') then
        shared.CheckSets();
    elseif (args[1] == 'lockstyle') then
        shared.LockStyleSet();
    elseif (args[1] == 'lsfsh') then
        shared.LockStyleSet();
    elseif (args[1] == 'lsbot') then
        shared.LockStyleSet();
    elseif (args[1] == 'lsdig') then
        shared.LockStyleSet(); 
    elseif (args[1] == 'lsblm') then
        shared.LockStyleSet();
    elseif (args[1] == 'lsdrg') then
        shared.LockStyleSet();
    elseif (args[1] == 'lsrdm') then
        shared.LockStyleSet();
    elseif (args[1] == 'logging_binds') then
        binds.Logging_Load();
    elseif (args[1] == 'fillmodetoggle') then
        Settings.FillModeState = not Settings.FillModeState;
        if not Settings.FillModeState then
            AshitaCore:GetChatManager():QueueCommand(-1, '/fillmode 2');
        else
            AshitaCore:GetChatManager():QueueCommand(-1, '/fillmode 3');
        end
    elseif (args[1] == 'find_zone') then
        if not args[2] then
            print('Zone Abbreviation Usage: /zone partialname');
        end
        local zone_abbr_list = zones.GetZoneAbbr(args[2]);
        if zone_abbr_list then
            for _, search in ipairs(zone_abbr_list) do
                print("Long: ".. search.name .. " | Short: " .. search.abbr)
            end
        end
    end

end

-- --------------------------------------------------------
-- Situational Gearswaps
-- --------------------------------------------------------

shared.EquipElementalStaff = function(action)
    if action then
        gFunc.Equip('main', ElementalStaffTable[action.Element]);
    end
end

shared.GearOverride = function()

    local player = gData.GetPlayer();
    
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
        if player.IsMoving then
            gFunc.Equip('legs', 'Blood Cuisses');
        end
    end

    -- Clamming
    if (Settings.GearMode == 'Clamming') then
        gFunc.EquipSet(sets.Clamming);
    end

    -- Warp Cudgel
    if (Settings.UseWarpCudgel == true) then
        gFunc.Equip('Main','Warp Cudgel');
    end

    -- Powder Boots
    if (Settings.UsePowderBoots == true) then
        gFunc.Equip('Feet','Powder Boots');
    end

    -- Exp Band
    if (Settings.UseExpRing == true) then
        gFunc.EquipSet(sets.ExpRing);
    end

    -- Reraise Gorget
    if (Settings.UseReraiseGorget == true) then
        gFunc.Equip('Neck','Reraise Gorget');
    end

    -- Reraise Hairpin
    if (Settings.UseReraiseHairpin == true) then
        gFunc.Equip('Head','Reraise Hairpin');
    end

    -- Skip Aketon Swap if in digging gear
    if Settings.GearMode ~= 'Digging' then
        zones.CityGear(); -- Aketon Auto-equip
    end

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
    local mpPercent = 0;
    local nukeMaxMP = 0;
    if player.MainJob == "BLM" and player.SubJob == "RDM" then
        mpPercent = action.MpAftercast / MP_BLM_RDM;
        nukeMaxMP = MP_BLM_RDM;
    elseif player.MainJob == "BLM" and player.SubJob == "WHM" then
        mpPercent = action.MpAftercast / MP_BLM_WHM;
        nukeMaxMP = MP_BLM_WHM;
    elseif player.MainJob == "BLM" and player.SubJob == "NIN" then
        mpPercent = action.MpAftercast / MP_BLM_NIN;
        nukeMaxMP = MP_BLM_NIN;
    else
        mpPercent = 100;
    end
    if verbose then print("MP Percent: " .. mpPercent .. ". Nuke Max MP: " .. nukeMaxMP); end
    if mpPercent < 51 and nukeMaxMP ~= 0 then
        --[[ Was used to calculate MaxMP on the fly, however, it would always calculate based on equipped set at the time which is usually either Idle or Precast and not Nuke
        This can be adjusted in the future to make it only look at Nuke set. But would need to pass the nuke set as a second argument
        Also, need to update the MP gear list
        Also, need to "add MP" for any pieces on the equipped nuke set that are convert pieces.
        For now, hardcoding MP values... (not ideal)
        local equipment = gData.GetEquipment();
        local subMpTotal = 0;
        for k,v in pairs(equipment) do
            if VisibleSlot[k] == nil and SubtractMP[v.Name] then
                subMpTotal = subMpTotal + SubtractMP[v.Name];
            end
        end 
        local finalMPP = (player.MP - action.MpCost)/(maxMP - subMpTotal); -- MPP excluding MP from non-visible gear
        if finalMPP <= 0.51 then
            if verbose then print('Ugg Pendant True. Current: ' .. player.MP .. ', Cost: ' .. action.MpCost .. ', MaxMP: ' .. player.MaxMP .. ', SubTotal: ' .. subMpTotal .. ', FinalMPP: ' .. finalMPP); end
            gFunc.Equip('Neck', 'Uggalepih Pendant');
        end
        ]]
        local finalMPP = (player.MP - action.MpCost) / nukeMaxMP; -- MPP excluding MP from non-visible gear
        if finalMPP <= 0.51 then
            if verbose then print('Ugg Pendant True. Current: ' .. player.MP .. ', Cost: ' .. action.MpCost .. ', MaxMP: ' .. nukeMaxMP .. ', FinalMPP: ' .. finalMPP); end
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

-- --------------------------------------------------------
-- Lockstyle
-- --------------------------------------------------------

shared.LockStyleSet = function()

    local lockstylenumber = nil;
    local styleset = '';
    local player = gData.GetPlayer();
    local job = player.MainJob;

    -- Throttle Lockstyle Attempts
    if Settings.LastLocked and ((os.time() - Settings.LastLocked) < lockthrottle) then
        print("Cannot lockstyle for another " .. (lockthrottle - (os.time() - Settings.LastLocked)) .. 's');
        return;
    end

    -- HELM lockstyles
    if Settings.GearMode ~= nil and Settings.GearMode ~= 'Main' then
        lockstylenumber = LockStyleSets[Settings.GearMode];
        styleset = Settings.GearMode;
    else
        if job == 'NON' or not job then
            return;
        else
            lockstylenumber = LockStyleSets[job];
            styleset = job;
        end
    end

    if lockstylenumber then
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Lock Style Set ->> ' .. styleset .. ' ]--');
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

-- --------------------------------------------------------
-- Elemental Day/Weather
-- --------------------------------------------------------

shared.SpellMatchDay = function(spell)
    local environment = gData.GetEnvironment();
    return (spell.Element == environment.DayElement);
end

shared.ObiCheck = function(spell, yellowSet)
    if not Settings.UseElementalObis then
        return false;
    end
    local environment = gData.GetEnvironment();
    if spell.Element == environment.WeatherElement or spell.Element == environment.DayElement then
        if verbose then print('Spell Type: ' .. spell.Element); end
        local elemental_obi = ElementalObis[spell.Element];
        if elemental_obi[2] then -- Do you have the relevant Obi?
            gFunc.Equip('Waist', elemental_obi[1]);
            gFunc.EquipSet(yellowSet); -- Add more -HP to make up for normal yellow HP belt
            if verbose then print("Using Obi: " .. elemental_obi[1] .. " . Element: " .. spell.Element); end
            return true;
        end
    end
    return false;
end

-- --------------------------------------------------------
-- Utility Functions
-- --------------------------------------------------------
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

-- --------------------------------------------------------
-- Midcast Delay/Yellow Latent 
-- --------------------------------------------------------

shared.SetMidcastDelay = function(precastset, yellowhpset, midcastset, obi)
    local player = gData.GetPlayer();
    local action = gData.GetAction();
    local casttime = action.CastTime;
    local weakenedstate = gData.GetBuffCount('Weakness');
    local chainspellstate = gData.GetBuffCount('Chainspell');
    local fastcast = 0;

    -- Forces yellow hp gear
    local function DelayYellow()
        gFunc.ForceEquipSet(yellowhpset);
        if obi then
            gFunc.ForceEquipSet(sets.YellowObi);
            shared.SetCurrentSet('Yellow HP (Obi)');
        else
            shared.SetCurrentSet('Yellow HP');
        end
    end

    local function DelayDisplay()
        if midcastset then
            shared.SetCurrentSet(midcastset);
        else
            shared.SetCurrentSet('Midcast');
        end
        
    end

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
    end

    -- Sorc Ring Latent Gear Swap (1 sec before midcast gear gets put on)
    local yellowhpdelay = midcastdelay - 1;
    if yellowhpdelay < 0 then
        yellowhpdelay = 0;
    end
    if yellowhpset then
        if yellowhpdelay == 0 then
            gFunc.ForceEquipSet(yellowhpset);
            shared.SetCurrentSet('Yellow HP');
            DelayDisplay:once(0.5);
        else
            DelayYellow:once(yellowhpdelay);
            DelayDisplay:once(midcastdelay);
        end
    else
        DelayDisplay:once(midcastdelay);
    end

    if verbose then print('Action: ' .. action.Name .. ' | Cast Time (s): ' .. action.CastTime/1000 .. ' | Yellow Gearswap Delay (s): ' .. yellowhpdelay .. ' | Mid Cast Delay (s): ' .. midcastdelay); end

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

-- --------------------------------------------------------
-- Elemental DOTs
-- --------------------------------------------------------

shared.ElementalDebuffValues = function(action)
    local hp_per_tick;
    local stat_down;
    local stat;

    if action.Name == 'Rasp' then
        stat = 'DEX';
    elseif action.Name == 'Drown' then
        stat = 'STR';
    elseif action.Name == 'Choke' then
        stat = 'VIT';
    elseif action.Name == 'Burn' then
        stat = 'INT';
    elseif action.Name == 'Frost' then
        stat = 'AGI';
    elseif action.Name == 'Shock' then
        stat = 'MND';
    else 
        return;
    end

    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local intelligence = player:GetStat(5); -- 5 = INT
    --local stat_mod = player:GetStatMod(5);
    print("Intelligence: " .. intelligence);

    if not intelligence then
        return;
    end

    if intelligence >= 150 then
        hp_per_tick = 5;
        stat_down = -13;
    elseif intelligence >= 100 then
        hp_per_tick = 4;
        stat_down = -11;
    elseif intelligence >= 70 then
        hp_per_tick = 3;
        stat_down = -9;
    elseif intelligence >= 40 then
        hp_per_tick = 2;
        stat_down = -7;
    else
        hp_per_tick = 1;
        stat_down = -5;
    end

    return hp_per_tick, stat, stat_down;
end

-- --------------------------------------------------------
-- Display Functions
-- --------------------------------------------------------

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

        for key, value in pairs(cycles) do
            display = display .. key .. ': ' .. '|cFF5FFF5F|' .. value.Array[value.Index] .. '|r \n'
        end
        display = display .. Settings.Extras;
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
            if verbose then print('Set: ' .. set .. ', Slot: ' .. slot .. ', Item: ' .. item) end
        end
    end
end

shared.SetExtras = function(extras)
    if extras then
        Settings.Extras = extras;
    end
end

shared.GetExtras = function()
    if Settings.Extras then
        return Settings.Extras;
    end
end

shared.GetGearMode = function()
    return Settings.GearMode;
end

-- --------------------------------------------------------
-- Conquest
-- --------------------------------------------------------

shared.InControl = function()
    return conquest.GetInsideControl();
end

shared.OutControl = function()
    return conquest.GetOutsideControl();
end

-- --------------------------------------------------------
-- Misc.
-- --------------------------------------------------------

shared.GetElementalStaff = function(element)
    if element then
        return ElementalStaffTable[element];
    else
        return '';
    end
end

return shared;