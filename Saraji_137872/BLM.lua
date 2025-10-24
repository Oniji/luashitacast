local profile = {};

local zones = gFunc.LoadFile('common/zones.lua');
local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Merman\'s Ring',
        --Back = 'Umbra Cape',
        Back = 'Hexerei Cape',
        Waist = 'Sorcerer\'s Belt',
        Head = 'Igqira Tiara',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Merman\'s Bangles',
        Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps',
    },
    Idle_MDT = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Hexerei Cape',
        Waist = 'Sorcerer\'s Belt',
        Head = 'Green Ribbon +1',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Merman\'s Bangles',
        Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps',
    },
    Idle_Town = {
        Main = 'Aquilo\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Abyssal Earring',
        Head = 'Wzd. Petasos +1',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Zenith Mitts',
        Ring1 = 'Sorcerer\'s Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Igqira Lappas', 
        Feet = 'Rostrum Pumps',
    },
    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Neck = 'Elemental Torque',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Abyssal Earring',
        Head = 'Wzd. Petasos +1',
        Body = 'Igqira Weskit',
        Hands = 'Zenith Mitts',
        --Hands = 'Wizard\'s Gloves',
        Ring1 = 'Sorcerer\'s Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Prism Cape', 
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops', 
        Feet = 'Sorcerer\'s Sabots',
    },
    Nuke_Acc = {
        Ammo = 'Phtm. Tathlum',
        Neck = 'Elemental Torque',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Abyssal Earring',
        Head = 'Sorcerer\'s Petas.',
        Body = 'Igqira Weskit',
        Hands = 'Wzd. Gloves +1',
        Ring1 = 'Sorcerer\'s Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Prism Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Sorcerer\'s Sabots',
    },
    Nuke_NoSorcRing_Priority = {
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
        Neck = {'Philomath Stole', 'Black Neckerchief'},
        Ear1 = {'Moldavite Earring', 'Morion Earring'},
        Ear2 = {'Abyssal Earring', 'Phantom Earring', 'Morion Earring'},
        Head = {'Wzd. Petasos +1', 'Black Cloak', 'Wzd. Petasos +1'},
        Body = {'Igqira Weskit', 'Black Cloak', 'Shaman\'s Cloak', 'Baron\'s Saio', 'Mage\'s Tunic'},
        Hands = {'Zenith Mitts', 'Wizard\'s Gloves', 'Seer\'s Mitts +1'},
        Ring1 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring'},
        Ring2 = {'Tamas Ring', 'Eremite\'s Ring'},
        Back = {'Prism Cape', 'Black Cape +1'},
        Waist = {'Sorcerer\'s Belt', 'Shaman\'s Belt'},
        Legs = {'Mahatma Slops', 'Mage\'s Slacks'},
        Feet = {'Rostrum Pumps', 'Sorcerer\'s Sabots', 'Custom F Boots'}
    },
    Nuke_HNM = {
        Ammo = 'Phtm. Tathlum',
        Neck = 'Elemental Torque',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Novia Earring',
        Head = 'Sorcerer\'s Petas.', -- 2
        Body = 'Errant Hpl.', -- 3
        Hands = 'Wzd. Gloves +1', -- 2
        Ring1 = 'Sorcerer\'s Ring',
        Ring2 = 'Tamas Ring', -- 5
        Back = 'Errant Cape', -- 5
        Waist = 'Penitent\'s Rope', -- 3 
        Legs = 'Mahatma Slops', -- 3
        Feet = 'Sorcerer\'s Sabots', -- 1
    },
    Nuke_DOT = {
        Ammo = 'Phtm. Tathlum', -- 2
        Main = 'Kirin\'s Pole', -- 10
        Neck = 'Philomath Stole', -- 3
        --Neck = 'Prudence Torque', -- 5
        Ear1 = 'Phantom Earring', -- 1
        Ear2 = 'Abyssal Earring', -- 2
        Head = 'Wzd. Petasos +1', -- 5
        Body = 'Errant Hpl.', -- 3
        Hands = 'Wzd. Gloves +1', -- 3
        Ring1 = 'Snow Ring', -- 5
        Ring2 = 'Tamas Ring', -- 5
        Back = 'Prism Cape', -- 4
        Waist = 'Sorcerer\'s Belt', -- 6
        Legs = 'Mahatma Slops', -- 8
        Feet = 'Sorcerer\'s Sabots', -- 2
    },
    Resting = {
        Main = 'Pluto\'s Staff', -- 10
        Neck = 'Checkered Scarf', -- 1
        Head = 'Wzd. Petasos +1', -- Curse, Evasion
        Body = 'Sorcerer\'s Coat', -- 5
        Hands = 'Errant Cuffs', -- Enmity
        Feet = 'Rostrum Pumps',
        Legs = 'Baron\'s Slops', -- 1
        Waist = 'Hierarch Belt', -- 2
        Ear2 = 'Relaxing Earring', -- 2
        Ear1 = 'Merman\'s Earring', -- MDT
        Ring1 = 'Merman\'s Ring', -- MDT
        Ring2 = 'Merman\'s Ring', -- MDT
        Back = 'Errant Cape', -- Enmity, MP
    },
    Dark = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
        --Head = 'Nashira Turban', 
        --Body = 'Nashira Manteel', -- 5
        Head = 'Wzd. Petasos +1',
        Body = 'Wizard\'s Coat',
        Hands = 'Src. Gloves +1', -- 10
        Legs = 'Wizard\'s Tonban', -- 15
        Feet = 'Igqira Huaraches', -- 4
        --Neck = 'Dark Torque', -- 7
        --Ear1 = 'Loquac. Earring',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Phantom Earring',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape', --5
        Waist = 'Sorcerer\'s Belt',
    },
    Stun = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wzd. Petasos +1',
        Body = 'Wizard\'s Coat',
        Hands = 'Src. Gloves +1',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Loquac. Earring',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows'
    },
    EnfeeblingMND = {
        Ammo = 'Hedgehog Bomb',
        Head = 'Igqira Tiara',
        Neck = 'Enfeebling Torque',
        Body = 'Wizard\'s Coat',
        Hands = 'Devotee\'s Mitts',
        Waist = 'Penitent\'s Rope',
        Back = 'Prism Cape',
        --Back = 'Altruistic Cape',
        Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps',
        Ring1 = 'Solace Ring',
        Ring2 = 'Tamas Ring',
        --Ring1 = 'Aqua Ring',
        --Ring2 = 'Aqua Ring',
        --Ear1 = 'Cmn. Earring',
        --Ear2 = 'Cmn. Earring',
    },
    EnfeeblingINT = {
        Head = 'Igqira Tiara',
        Neck = 'Enfeebling Torque',
        Body = 'Wizard\'s Coat',
        Hands = 'Wizard\'s Gloves',
        --Hands = 'Errant Cuffs',
        Waist = 'Sorcerer\'s Belt',
        Back = 'Prism Cape',
        --Back = 'Altruistic Cape',
        Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps', 
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Phantom Earring',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Ammo = 'Phtm. Tathlum',
    },
    Healing = {
        Head = 'Wzd. Petasos +1',
        Neck = 'Justice Badge',
        Body = 'Errant Hpl.',
        Hands = 'Devotee\'s Mitts',
        Waist = 'Penitent\'s Rope',
        Back = 'Errant Cape',
        Legs = 'Mahatma Slops', 
        Feet = 'Rostrum Pumps',
        Ear1 = 'Novia Earring',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Tamas Ring',
    },
    SIRD_PDT = {
        -- Aquaveil -- 20
        Main = 'Eremite\'s Wand', -- 25
        --Sub = 'Eremite\'s Wand', -- 25
        --Head = 'Nashira Turban', -- 10
        --Neck = 'Willpower Torque', -- 5
        --Back = 'Umbra Cape', -- PDT
        Ammo = 'Phtm. Tathlum',
        Head = 'Igqira Tiara',
        --Head = 'Nashira Turban',
        Feet = 'Wizard\'s Sabots', -- 20
        --Body = 'Sorcerer\'s Coat',
        Body = 'Errant Hpl.',
        Legs = 'Igqira Lappas', -- Curse, Evasion
        Waist = 'Sorcerer\'s Belt', -- 8
        Ear1 = 'Merman\'s Earring', -- MDT
        Ear2 = 'Merman\'s Earring', -- MDT
        Ring1 = 'Jelly Ring', -- MDT
        Ring2 = 'Merman\'s Ring', -- MDT
    },
    SIRD_MDT = {
        -- Aquaveil -- 20
        Main = 'Eremite\'s Wand', -- 25
        --Sub = 'Eremite\'s Wand', -- 25
        --Head = 'Nashira Turban', -- 10
        --Neck = 'Willpower Torque', -- 5
        --Back = 'Umbra Cape', -- PDT
        Ammo = 'Phtm. Tathlum',
        Head = 'Igqira Tiara',
        --Head = 'Nashira Turban',
        Feet = 'Wizard\'s Sabots', -- 20
        --Body = 'Sorcerer\'s Coat',
        Body = 'Errant Hpl.',
        Legs = 'Igqira Lappas', -- Curse, Evasion
        Waist = 'Sorcerer\'s Belt', -- 8
        Ear1 = 'Merman\'s Earring', -- MDT
        Ear2 = 'Merman\'s Earring', -- MDT
        Ring1 = 'Merman\'s Ring', -- MDT
        Ring2 = 'Merman\'s Ring', -- MDT
    },
    Precast = {
        Legs = 'Nashira Seraweels',
        Waist = 'Swift Belt',
        Feet = 'Rostrum Pumps',
        Ear1 = 'Loquac. Earring',
    },
    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
        --Head = 'Nashira Turban',
        --Neck = 'Enhancing Torque',
        --Ear1 = 'Cmn. Earring',
        --Ear2 = 'Cmn. Earring',
        Body = 'Errant Hpl.',
        Hands = 'Devotee\'s Mitts',
        --Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Errant Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        --Feet = 'Igqira Huaraches',
    },
    YellowHP = {
        Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Astral Ring', -- 25
        Ammo = 'Tiphia Sting', -- 25
        Head = 'Zenith Crown', -- 50
        Legs = 'Zenith Slacks', -- 50
        Back = 'Blue Cape', -- 15 
        Waist = 'Penitent\'s Rope', -- 20
    },
    YellowHNM = {
        Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Astral Ring', -- 25
        Ammo = 'Tiphia Sting', -- 25
        Head = 'Zenith Crown', -- 50
        Legs = 'Zenith Slacks', -- 50
        Waist = 'Penitent\'s Rope', -- 20
        Back = 'Blue Cape', -- 15 
        Neck = 'Checkered Scarf', -- 15
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

local NukeSet = {
    [1] = 'Default',
    [2] = 'Accuracy',
    [3] = 'HNM',
};


local Settings = {
    DisplayThrottle = 1;
    LastDisplayed = 0;
    UseSorcRing = true,
    UseUggPendant = true,
    CurrentSubJob = nil,
    NukeSet = 'Default',
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
    shared.CreateCycle('NukeSet', NukeSet);
    Settings.NukeSet = shared.GetCycle('NukeSet');

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
            shared.SetCycleToValue('IdleSet', 'MDT');   
        else
            Settings.IdleDT = 'PDT';
            shared.SetCycleToValue('IdleSet', 'PDT');
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set ->> ' .. Settings.IdleDT .. ' ]--');
        return;
    elseif (args[1] == 'nuke') then
        Settings.NukeSet = shared.AdvanceCycle('NukeSet')
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Nuke Set ->> ' .. Settings.NukeSet .. ' ]--');
        return;
    elseif (args[1] == 'pdt') then
        Settings.IdleDT = 'PDT';
        shared.SetCycleToValue('IdleSet', 'PDT');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set ->> ' .. Settings.IdleDT .. ' ]--');
        return;
    elseif (args[1] == 'mdt') then
        Settings.IdleDT = 'MDT';
        shared.SetCycleToValue('IdleSet', 'MDT');
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
    else
        if not zones.IsInTown() then
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
        end
    end

    if zones.IsInTown() then
        gFunc.EquipSet(sets.Idle_Town);
        shared.SetCurrentSet('Idle - Town');
        shared.SetCycleToValue('IdleSet', 'Town');
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
    local environment = gData.GetEnvironment();
    local obi_used = false;
    local diabolos_pole = false;
    if (action.Skill == 'Enfeebling Magic') then
        if (MndDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.EnfeeblingMND);
            shared.EquipElementalStaff(action);
        else
            gFunc.EquipSet(sets.EnfeeblingINT);
            shared.EquipElementalStaff(action);
        end
        if shared.OutControl() then 
            gFunc.Equip('hands', 'Mst.Cst. Bracelets');
        end
    elseif (action.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Nuke_DOT);
            shared.SetCurrentSet('Elemental DOT');
        else
            if Settings.UseSorcRing then
                if Settings.NukeSet == 'Accuracy' then
                    gFunc.EquipSet(sets.Nuke_Acc);
                elseif Settings.NukeSet == 'HNM' then
                    gFunc.EquipSet(sets.Nuke_HNM);
                else
                    gFunc.EquipSet(sets.Nuke);
                end
            else
                gFunc.EquipSet(sets.Nuke_NoSorcRing);
            end
            shared.UggPendantCheck(action);
            obi_used = shared.ObiCheck(action, sets.YellowObi);
            local spellmatchday = shared.SpellMatchDay(action);
            if spellmatchday then
                gFunc.Equip('Legs', 'Sorcerer\'s Tonban');
            end
            if Settings.UseSorcRing then
                if Settings.NukeSet == 'HNM' then
                    shared.SetMidcastDelay(sets.Precast, sets.YellowHNM, "Nuke + Sorc Ring", obi_used);
                else
                    shared.SetMidcastDelay(sets.Precast, sets.YellowHP, "Nuke + Sorc Ring", obi_used);
                end
                
            end
            shared.EquipElementalStaff(action);
        end
    elseif (action.Skill == 'Dark Magic') then
        if (action.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
            shared.EquipElementalStaff(action);
        elseif (action.Name == 'Aspir' or action.Name == 'Drain') and environment.RawWeatherElement == 'Dark' then
            gFunc.Equip('main', 'Pluto\'s Staff');
            diabolos_pole = true;
        else
            gFunc.EquipSet(sets.Dark);
            shared.ObiCheck(action, sets.YellowObi);
            shared.EquipElementalStaff(action);
        end
    elseif (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Healing);
        shared.EquipElementalStaff(action);
    end

    if not Settings.UseSorcRing then
        shared.SetMidcastDelay(sets.Precast, null, 'Midcast', obi_used);
    end

    if Settings.IdleDT == 'MDT' then
        gFunc.InterimEquipSet(sets.SIRD_MDT);
        shared.SetCurrentSet('SIRD + MDT');
    else
        gFunc.InterimEquipSet(sets.SIRD_PDT);
        shared.SetCurrentSet('SIRD + PDT');
    end

end


profile.HandlePreshot = function()
end


profile.HandleMidshot = function()
end


profile.HandleWeaponskill = function()
end


profile.LevelCheck = function()

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();

   -- Function for delayed lockstyle
    local function DelayedLockstyle()
        shared.LockStyleSet();
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
        if maxHPP then displayString = displayString .. '  Current: ' .. player.HP .. 'HP\n'; end
        if maxHPP then displayString = displayString .. '  Threshold: ' .. (threshold) .. 'HP\n'; end
        if maxHPP then displayString = displayString .. '  Latent: ' .. (player.HP < threshold and '|cFF5FFF5F|Active' or '|cFF989898|Inactive') .. '|r\n'; end
    end
    displayString = displayString .. 'UggPendant: ' .. (Settings.UseUggPendant and '|cFF5FFF5F|On' or '|cFF989898|Off') .. '|r\n';
    if Settings.UseUggPendant then
        if mpPercent and mpthreshold then displayString = displayString .. '  Latent: ' .. (mpPercent < 0.5099 and '|cFF5FFF5F|Active' or '|cFF989898|Inactive') .. '|r\n'; end
    end

    shared.SetExtras(displayString);
    Settings.LastDisplayed = os.clock();
end

return profile;