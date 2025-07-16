local profile = {};

local zones = gFunc.LoadFile('common/zones.lua');
local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {
    Idle = {
        Main = 'Earth Staff',
        Ammo = 'Phtm. Tathlum',
        --Neck = 'Jewelled Collar',
        Neck = 'Elemental Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        --Back = 'Umbra Cape',
        Back = 'Hexerei Cape',
        Waist = 'Sorcerer\'s Belt',
        Head = 'Igqira Tiara',
        Body = 'Errant Hpl.',
        Hands = 'Errant Cuffs',
        --Hands = 'Merman\'s Bangles',
        --Legs = 'Igqira Lappas',
        Legs = 'Errant Slops',
        Feet = 'Rostrum Pumps',
    },
    Idle_MDT = {
        Main = 'Earth Staff',
        Ammo = 'Phtm. Tathlum',
        --Neck = 'Jewelled Collar',
        Neck = 'Elemental Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Hexerei Cape',
        Waist = 'Sorcerer\'s Belt',
        Head = 'Igqira Tiara',
        Body = 'Errant Hpl.',
        Hands = 'Errant Cuffs',
        --Hands = 'Merman\'s Bangles',
        Legs = 'Errant Slops',
        --Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps',
    },
    Idle_Town = {
        Main = 'Aquilo\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Phantom Earring',
        Head = 'Wizard\'s Petasos',
        Body = 'Black Cloak',
        Hands = 'Zenith Mitts',
        Ring1 = 'Sorcerer\'s Ring', 
        Ring2 = 'Snow Ring', 
        Back = 'Prism Cape', 
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Sorcerer\'s Tonban', 
        Feet = 'Rostrum Pumps',
    },
    Nuke_Priority = {
        Ammo = 'Phtm. Tathlum',
        Neck = 'Philomath Stole',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Phantom Earring', 
        Head = 'Wizard\'s Petasos',
        Body = 'Igqira Weskit',
        Hands = 'Zenith Mitts',
        Ring1 = 'Snow Ring', 
        Ring2 = 'Snow Ring', 
        Back = 'Prism Cape', 
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Errant Slops', 
        Feet = 'Sorcerer\'s Sabots',
    },
    Nuke_NoSorcRing_Priority = {
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
        Neck = {'Philomath Stole', 'Black Neckerchief'},
        Ear1 = {'Moldavite Earring', 'Morion Earring'},
        Ear2 = {'Phantom Earring', 'Morion Earring'},
        Head = {'Wizard\'s Petasos', 'Black Cloak', 'Wizard\'s Petasos'},
        Body = {'Igqira Weskit', 'Black Cloak', 'Shaman\'s Cloak', 'Baron\'s Saio', 'Mage\'s Tunic'},
        Hands = {'Zenith Mitts', 'Wizard\'s Gloves', 'Seer\'s Mitts +1'},
        Ring1 = {'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Back = {'Prism Cape', 'Black Cape +1'},
        Waist = {'Sorcerer\'s Belt', 'Shaman\'s Belt'},
        Legs = {'Errant Slops', 'Mage\'s Slacks'},
        Feet = {'Rostrum Pumps', 'Sorcerer\'s Sabots', 'Custom F Boots'}
    },
    Resting = {
        Main = 'Pluto\'s Staff', -- 10
        Neck = 'Checkered Scarf', -- 1
        Head = 'Igqira Tiara', -- Curse, Evasion
        Body = 'Errant Hpl.', -- 5
        Hands = 'Errant Cuffs', -- Enmity
        Feet = 'Rostrum Pumps',
        Legs = 'Baron\'s Slops', -- 1
        Waist = 'Hierarch Belt', -- 2
        Ear2 = 'Relaxing Earring', -- 2
        Ear1 = 'Merman\'s Earring', -- MDT
        Ring1 = 'Merman\'s Ring', -- MDT
        Ring2 = 'Merman\'s Ring', -- MDT
        Back = 'Hexerei Cape', -- DT
    },
    Dark = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
        --Head = 'Nashira Turban', 
        --Body = 'Nashira Manteel', -- 5
        Head = 'Wizard\'s Petasos',
        Body = 'Wizard\'s Coat',
        Hands = 'Sorcerer\'s Gloves', -- 10
        Legs = 'Wizard\'s Tonban', -- 15
        Feet = 'Igqira Huaraches', -- 4
        Neck = 'Dark Torque', -- 7
        --Ear1 = 'Loquac. Earring',
        Ear1 = 'Morion Earring',
        Ear2 = 'Phantom Earring',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape', --5
        Waist = 'Sorcerer\'s Belt',
    },
    Stun = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wizard\'s Petasos',
        Body = 'Wizard\'s Coat',
        Hands = 'Sorcerer\'s Gloves',
        Ear1 = 'Phantom Earring',
        Ear2 = 'Morion Earring',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Rostrum Pumps'
    },
    EnfeeblingMND = {
        --Ammo = 'Hedgehog Bomb',
        Head = 'Igqira Tiara',
        Neck = 'Justice Badge',
        Body = 'Wizard\'s Coat',
        Hands = 'Devotee\'s Mitts',
        Waist = 'Penitent\'s Rope',
        Back = 'Prism Cape',
        --Back = 'Altruistic Cape',
        Legs = 'Nashira Seraweels',
        --Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        --Ring1 = 'Aqua Ring',
        --Ring2 = 'Aqua Ring',
        --Ear1 = 'Cmn. Earring',
        --Ear2 = 'Cmn. Earring',
    },
    EnfeeblingINT = {
        Head = 'Igqira Tiara',
        Neck = 'Philomath Stole',
        --Neck = 'Enfeebling Torque',
        Body = 'Wizard\'s Coat',
        Hands = 'Wizard\'s Gloves',
        --Hands = 'Errant Cuffs',
        Waist = 'Sorcerer\'s Belt',
        Back = 'Prism Cape',
        --Back = 'Altruistic Cape',
        Legs = 'Nashira Seraweels',
        --Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps', 
        Ear1 = 'Morion Earring', 
        Ear2 = 'Phantom Earring',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Ammo = 'Phtm. Tathlum',
    },
    Healing = {
        Head = 'Wizard\'s Petasos',
        Neck = 'Justice Badge',
        Body = 'Errant Hpl.',
        Hands = 'Devotee\'s Mitts',
        Waist = 'Penitent\'s Rope',
        Back = 'Prism Cape',
        Legs = 'Errant Slops', 
        Feet = 'Rostrum Pumps', 
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
    },
    SIRD = {
        --Main = 'Eremite\'s Wand', -- 25
        --Sub = 'Eremite\'s Wand', -- 25
        --Head = 'Nashira Turban', -- 10
        --Neck = 'Willpower Torque', -- 5
        --Back = 'Umbra Cape', -- PDT
        Ammo = 'Phtm. Tathlum',
        Head = 'Wizard\'s Petasos',
        --Head = 'Nashira Turban',
        Feet = 'Wizard\'s Sabots', -- 20
        --Body = 'Sorcerer\'s Coat',
        Body = 'Errant Hpl.',
        --Legs = 'Igqira Lappas', -- Curse, Evasion
        Legs = 'Errant Slops',
        Waist = 'Sorcerer\'s Belt', -- 10
        Ear1 = 'Merman\'s Earring', -- MDT
        Ear2 = 'Merman\'s Earring', -- MDT
        Ring1 = 'Merman\'s Ring', -- MDT
        Ring2 = 'Merman\'s Ring', -- MDT
    },
    Precast = {
        Legs = 'Nashira Seraweels',
        Waist = 'Swift Belt',
        Feet = 'Rostrum Pumps'
    },
    YellowHP = {
        Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Astral Ring', -- 25
        Ammo = 'Tiphia Sting', -- 25
        Head = 'Zenith Crown', -- 50
        Legs = 'Zenith Slacks', -- 50
        Waist = 'Penitent\'s Rope', -- 20
    },
    YellowObi = {
        Back = 'Blue Cape', -- 15 
        Neck = 'Checkered Scarf', -- 15
    }
};
profile.Sets = sets;

local HP_BLM_RDM = 998; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit
local HP_BLM_WHM = 980; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 744HP is 0.76 Threshold. 236 deficit
local HP_BLM_NIN = 998; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit

local MP_BLM_RDM = 730; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_WHM = 749; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_NIN = 671; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc

local IdleSet = {
    [1] = 'PDT',
    [2] = 'MDT',
    [3] = 'Town',
};

local Settings = {
    DisplayThrottle = 1;
    LastDisplayed = 0;
    UseSorcRing = true,
    UseUggPendant = true,
    CurrentSubJob = nil,
    IdleSet = '',
    IdleDT = 'PDT';
    Extras = '',
    CurrentLevel = 0
};


profile.OnLoad = function()

    profile.LevelCheck();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.BLM_Load();

    aliases.Common_Load();
    aliases.BLM_Load();

    gSettings.AllowAddSet = true;

    -- Setting up HandleCommand cycles and toggles
    
    local player = gData.GetPlayer();
    shared.LockStyleSet(player.MainJob);
    profile.LevelCheck();
    binds.BLM_Nukes_Load(Settings.CurrentLevel);

    shared.CreateCycle('IdleSet', IdleSet);
    Settings.IdleSet = shared.GetCycle('IdleSet');

    AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set: ' .. Settings.IdleSet .. ' | Sorc Ring: ' .. (Settings.UseSorcRing and 'Active' or 'Inactive') .. ' ]--');

    shared.OnLoad();

end


profile.OnUnload = function()

    binds.Common_Unload();
    binds.BLM_Unload();

    aliases.Common_Unload();
    aliases.BLM_Unload();

    shared.Unload();

end


profile.HandleCommand = function(args)

    if (args[1] == 'main') then
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    elseif (args[1] == 'sorcring') then
        Settings.UseSorcRing = not Settings.UseSorcRing;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Sorc Ring ->> ' .. tostring(Settings.UseSorcRing):gsub("^%l", string.upper) .. ' ]--');
        return;
    elseif (args[1] == 'idle') then
        if Settings.IdleDT == 'PDT' then
            Settings.IdleDT = 'MDT';
        else
            Settings.IdleDT = 'PDT';
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set ->> ' .. Settings.IdleDT .. ' ]--');
        return;
    end
    shared.ProcessCommand(args);

end


profile.HandleDefault = function()

    profile.LevelCheck();

    if (shared.IsNaked()) then
        shared.UnequipGear();
        shared.SetCurrentSet('Naked');
        return;
    end

    local player = gData.GetPlayer();
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        shared.SetCurrentSet('Resting');
    elseif (player.Status == 'Unknown') then
        -- Likely Fishing
        return;
    else
        if zones.IsInTown() then
            gFunc.EquipSet(sets.Idle_Town);
            shared.SetCurrentSet('Idle - Town');
            shared.SetCycleToValue('IdleSet', 'Town');
        else
            if Settings.IdleDT == 'MDT' then
                gFunc.EquipSet(sets.Idle_MDT);
                shared.SetCurrentSet('Idle - MDT');
                shared.SetCycleToValue('IdleSet', 'MDT');
            else
                gFunc.EquipSet(sets.Idle);
                shared.SetCurrentSet('Idle - PDT');
                shared.SetCycleToValue('IdleSet', 'PDT');
            end
            shared.SetCurrentSet('Idle - '.. Settings.IdleDT);
            if player.MPP < 100 then
                gFunc.Equip('Body', 'Black Cloak');
            end
        end
    end
    local final_set = shared.DisplacedGearCheck(gData.GetEquipment());
    gFunc.EquipSet(final_set);

    profile.DisplayBLM();
    shared.GearOverride();

end


profile.HandleAbility = function()
end


profile.HandleItem = function()
end


profile.HandlePrecast = function()
    shared.SetCurrentSet('Precast');
    gFunc.EquipSet(sets.Precast);
end


profile.HandleMidcast = function()

    local MndDebuffs = T{ 'Slow', 'Paralyze', 'Slow II', 'Paralyze II', 'Addle', 'Addle II' };
    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock', 'Blind' };
    local action = gData.GetAction();

    if (action.Skill == 'Enfeebling Magic') then
        if (MndDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.EnfeeblingMND);
        else
            gFunc.EquipSet(sets.EnfeeblingINT);
        end
    elseif (action.Skill == 'Elemental Magic') then
        if Settings.UseSorcRing then
            gFunc.EquipSet(sets.Nuke);
        else
            gFunc.EquipSet(sets.Nuke_NoSorcRing);
        end
        shared.UggPendantCheck(action);
        shared.ObiCheck(action, sets.YellowObi);
        local spellmatchday = shared.SpellMatchDay(action);
        if spellmatchday then
            gFunc.Equip('Legs', 'Sorcerer\'s Tonban');
        end
        if Settings.UseSorcRing then
            shared.SetMidcastDelay(sets.Precast, sets.YellowHP);
        end
    elseif (action.Skill == 'Dark Magic') then
        if (action.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
        else
            gFunc.EquipSet(sets.Dark);
            shared.ObiCheck(action, sets.YellowObi);
        end
    elseif (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Healing);
    end
    if (Settings.CurrentLevel >= 51) then
        shared.UseElementalStaff(action.Element);
    end

    if not Settings.UseSorcRing then
        shared.SetMidcastDelay(sets.Precast, null);
    end
    gFunc.InterimEquipSet(sets.SIRD);
    shared.SetCurrentSet('Midcast');

end


profile.HandlePreshot = function()
end


profile.HandleMidshot = function()
end


profile.HandleWeaponskill = function()
end


profile.LevelCheck = function()

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    local player = gData.GetPlayer();
    --local myLevel = 50

   -- Function for delayed lockstyle
    local function DelayedLockstyle()
        shared.LockStyleSet(player.MainJob);
    end

    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        binds.BLM_Nukes_Load(Settings.CurrentLevel);
        -- Level usually changes when zoning. Attempt to lockstyle as well
        DelayedLockstyle:once(2); -- Wait 2 seconds (for zone to load) then attempt lockstyle
        
    end

end

profile.DisplayBLM = function()

    local player = gData.GetPlayer();
    local action = gData.GetAction();
    -- Throttle
    local diffTime = os.clock() - Settings.LastDisplayed;
    if diffTime < Settings.DisplayThrottle then
        return;
    end

    -- Sorc Ring Calcs
    local sjHPP = 0;
    if player.SubJob == 'RDM' then
        sjHPP = HP_BLM_RDM;
    elseif player.SubJob == 'WHM' then
        sjHPP = HP_BLM_WHM;
    elseif player.SubJob == 'NIN' then  
        sjHPP = HP_BLM_NIN;
    else
        sjHPP = player.MaxHP;
    end
    local maxHPP = math.floor(((player.HP / sjHPP) * 100) * 100 + 0.5) / 100; -- Whole percentage rounded to 2 decimals
    local threshold = math.floor(sjHPP * 0.7599); -- Sorc Ring Latent HP Threshold

    -- Ugg Pendant Calcs
    local mpPercent = 0;
    local nukeMaxMP = -1;
    local mpthreshold = 0;
    if Settings.UseUggPendant then
        if player.SubJob == "RDM" then
            nukeMaxMP = MP_BLM_RDM;
        elseif player.SubJob == "WHM" then
            nukeMaxMP = MP_BLM_WHM;
        elseif player.SubJob == "NIN" then
            nukeMaxMP = MP_BLM_NIN;
        else
            nukeMaxMP = player.MaxMP;
        end
    end
    if action and action.Type == 'Spell' then
        mpPercent = action.MpAftercast / nukeMaxMP;
    else
        mpPercent = player.MP / nukeMaxMP;
    end
    
    mpthreshold = math.floor(nukeMaxMP * 0.5099);
    -- Build string
    local displayString = '\n';

    -- Sorc Ring Display
    displayString = displayString .. 'SorcRing: ' .. (Settings.UseSorcRing and '|cFF5FFF5F|On' or '|cFF989898|Off') .. '|r\n';
    if Settings.UseSorcRing then
        if maxHPP then displayString = displayString .. '  Current: ' .. player.HP .. '\n'; end
        if maxHPP then displayString = displayString .. '  Threshold: ' .. (threshold) .. '\n'; end
        if maxHPP then displayString = displayString .. '  Latent: ' .. (player.HP < threshold and '|cFF5FFF5F|Active' or '|cFF989898|Inactive') .. '|r\n'; end
    end
    displayString = displayString .. 'UggPendant: ' .. (Settings.UseUggPendant and '|cFF5FFF5F|On' or '|cFF989898|Off') .. '|r\n';
    if Settings.UseUggPendant then
        if mpPercent and mpthreshold then displayString = displayString .. '  Latent: ' .. (mpPercent < 0.5099 and '|cFF5FFF5F|Active' or '|cFF989898|Inactive') .. '|r\n'; end
    end

    -- Ugg Pendant Display


    --(Settings.UseWarpCudgel and 'On' or 'Off') 
        -- IdleSet: Town/PDT (Default)/MDT
        -- Use Sorc Ring (HP Threshold)
        -- Use Ugg Pendant (MP Threshold)
        -- MaxHP
        -- Sorc Ring Mode: Active/Inactive
            -- Current HPP: 
            -- Latent: Yes/No
        -- Ugg Pendant Mode: Active/Inactive
            -- Current MPP:
            -- Latent: Yes/No
    -- Send string to shared.Settings.Extras
    shared.SetExtras(displayString);
    Settings.LastDisplayed = os.clock();
end


return profile;