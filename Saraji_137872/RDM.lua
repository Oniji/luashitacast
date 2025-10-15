local profile = {};

local zones = gFunc.LoadFile('common/zones.lua');
local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {

    Idle_Town = {
        Ammo = 'Hedgehog Bomb',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Duelist\'s Chapeau',
        Body = 'Duelist\'s Tabard',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Merman\'s Ring', -- 5
        Ring2 = 'Merman\'s Ring', -- 5
        Back = 'Hexerei Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Blood Cuisses',
        Feet = 'Crimson Greaves', -- 2
    },
    Idle_PDT = {
        Ammo = 'Hedgehog Bomb',
        Head = 'Duelist\'s Chapeau',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Dls. Gloves +1', -- MDB +2
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Merman\'s Ring', -- 5
        Back = 'Hexerei Cape', -- replace
        Waist = 'Warwolf Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Crimson Greaves', -- 2
    },
    Idle_MDT = {
        Ammo = 'Hedgehog Bomb',
        Head = 'Duelist\'s Chapeau',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Duelist\'s Tabard',
        Hands = 'Dls. Gloves +1', -- MDB +2
        Ring1 = 'Merman\'s Ring', -- 5
        Ring2 = 'Merman\'s Ring', -- 5
        Back = 'Hexerei Cape', -- 3
        Waist = 'Penitent\'s Rope',
        Legs = 'Blood Cuisses',
        Feet = 'Crimson Greaves', -- 2
    },
    Weapon_Default = {
        Main = 'Terra\'s Staff'
    },
    Weapon_Melee = {
        Main = 'Blau Dolch',
        Sub = 'Genbu\'s Shield'
    },
    Weapon_Melee_NIN = {
        Main = 'Blau Dolch',
        Sub = 'Joyeuse'
    },
    MND_Priority = {
        Head = {'Duelist\'s Chapeau', 'Warlock\'s Chapeau', 'Electrum Hairpin', 'Silver Hairpin'},
        Body = {'Errant Hpl.', 'Baron\'s Saio'},
        Neck = {'Justice Badge'},
        Waist = {'Penitent\'s Rope', 'Friar\'s Rope'},
        Hands = {'Devotee\'s Mitts'},
        Legs = {'Mahatma Slops', 'Warlock\'s Tights', 'Custom Pants'},
        Back = {'Prism Cape', 'White Cape +1'},
        Feet = {'Duelist\'s Boots', 'Warlock\'s Boots', 'Angler\'s Boots'}
    },
    MND_Ring_Priority = {
        Ring1 = {'Solace Ring', 'Saintly Ring'},
        Ring2 = {'Tamas Ring', 'Solace Ring', 'Saintly Ring'}
    },
    INT_Priority = {
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
        Neck = {'Black Neckerchief'},
        Head = {'Warlock\'s Chapeau'},
        Body = {'Errant Hpl.', 'Warlock\'s Tabard', 'Mage\'s Tunic'},
        Ear1 = {'Abyssal Earring'},
        Ear2 = {'Phantom Earring'},
        Hands = {'Angler\'s Gloves'},
        Legs = {'Mahatma Slops', 'Magic Cuisses', 'Mage\'s Slacks'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt'},
        Feet = {'Custom F Boots'},
        Back = {'Prism Cape', 'Black Cape +1'}
    },
    INT_Ring_Priority = {
        Ring1 = {'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Ring2 = {'Tamas Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'}
    },
    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Neck = 'Elemental Torque',
        Head = 'Warlock\'s Chapeau',
        Body = 'Errant Hpl.',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Abyssal Earring',
        Hands = 'Zenith Mitts', 
        Legs = 'Duelist\'s Tights', 
        Waist = 'Penitent\'s Rope',
        Feet = 'Duelist\'s Boots',
        Back = 'Prism Cape',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
    },
    Nuke_HNM = {
        -- Merits 4
        Ammo = 'Hedgehog Bomb', -- 1
        Neck = 'Elemental Torque',
        Head = 'Warlock\'s Chapeau',
        Body = 'Errant Hpl.', -- 3
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Novia Earring',
        Hands = 'Zenith Mitts',
        Legs = 'Mahatma Slops', -- 4
        Waist = 'Penitent\'s Rope', -- 3
        Feet = 'Duelist\'s Boots',
        Back = 'Errant Cape', -- 5
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring', -- 5
    },
    Healing_Priority = {
        Head = {'Duelist\'s Chapeau', 'Vermillion Cloak', 'Warlock\'s Chapeau'},
        Body = {'Duelist\'s Tabard'},
        Neck = {'Justice Badge'},
        Waist = {'Penitent\'s Rope', 'Friar\'s Rope'},
        Hands = {'Devotee\'s Mitts'},
        Legs = {'Warlock\'s Tights', 'Custom Pants'},
        Feet = {'Crow Gaiters'},
        Back = 'Errant Cape',
        Ear1 = 'Novia Earring'
    },
    Enhancing = {
        Hands = 'Dls. Gloves +1',
        Legs = 'Warlock\'s Tights',
    },
    Enfeebling = {
        Head = 'Duelist\'s Chapeau', -- 15
        Body = 'Warlock\'s Tabard', -- 15
        Legs = 'Nashira Seraweels', -- 5
        Neck = 'Enfeebling Torque',
    },
    Enfeebling_INT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Phantom Earring',
        Hands = 'Errant Cuffs',
        Waist = 'Penitent\'s Rope',
        Feet = 'Custom F Boots',
        Back = 'Prism Cape',
        Ring1 = 'Snow Ring', 
        Ring2 = 'Tamas Ring',
    },
    Enfeebling_MND = {
        Waist = 'Penitent\'s Rope', 
        Hands = 'Devotee\'s Mitts',
        Back = 'Prism Cape',
        Feet = 'Duelist\'s Boots',
        Ring1 = 'Solace Ring',
        Ring2 = 'Tamas Ring',
    },
    Resting = {
        Head = 'Duelist\'s Chapeau', -- Refresh
        Neck = 'Checkered Scarf',
        Body = 'Errant Hpl.',
        Legs = 'Baron\'s Slops', -- 1
        Ear2 = 'Relaxing Earring', -- 2
        Waist = 'Duelist\'s Belt', -- 4
    },
    SIRD = {
        Main = 'Eremite\'s Wand',
        Body = 'Warlock\'s Tabard'
    },
    FastCast = {
        Head = 'Warlock\'s Chapeau',
        Body = 'Duelist\'s Tabard',
        Ear1 = 'Loquac. Earring',
    },
    Spikes = {
        Hands = 'Dls. Gloves +1',
        Legs = 'Duelist\'s Tights',
    },
    Melee = {
        Head = 'Optical Hat',
        Body = 'Scorpion Harness',
        Hands = 'Custom F Gloves',
        Legs = 'Duelist\'s Tights',
        Feet = 'Crimson Greaves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Merman\'s Earring',
        Waist = 'Life Belt',
        Back = 'Forager\'s Mantle',
        Neck = 'Peacock Amulet',
        Ammo = 'Tiphia Sting',

    }
};
profile.Sets = sets;

local HP_RDM_BLM = 998; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit
local HP_RDM_WHM = 980; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 744HP is 0.76 Threshold. 236 deficit
local HP_RDM_NIN = 998; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit

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
    CurrentSubJob = nil,
    CurrentLevel = 0,
    MeleeMode = false,
    IdleMode = '',
    IdleDT = 'PDT',
    Extras = '',
    UseSorcRing = false,
    UseUggPendant = true,
};

local SpikeSpells = T{ 'Blaze Spikes','Shock Spikes','Ice Spikes' };

profile.OnLoad = function()
    binds.Unbind_All();
    profile.LevelCheck();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.RDM_Load();
    binds.RDM_Nukes_Load(Settings.CurrentLevel);
    binds.RDM_Support_Load(Settings.CurrentLevel);

    aliases.Common_Load();
    aliases.RDM_Load();

    Settings.CurrentMode = 'main';
    gSettings.AllowAddSet = true;

    shared.CreateCycle('IdleSet', IdleSet);
    Settings.IdleSet = shared.GetCycle('IdleSet');
    shared.CreateCycle('NukeSet', NukeSet);
    Settings.NukeSet = shared.GetCycle('NukeSet');

    AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set: ' .. Settings.IdleSet .. ' | Sorc Ring: ' .. (Settings.UseSorcRing and 'Active' or 'Inactive') .. ' ]--');


    -- Setting up HandleCommand cycles and toggles
    shared.OnLoad();

    shared.LockStyleSet();

end

profile.OnUnload = function()

    binds.Common_Unload();
    binds.RDM_Unload();
    aliases.Common_Unload();
    aliases.RDM_Unload();

    shared.Unload();

end

profile.HandleCommand = function(args)
    if (args[1] == 'main') then
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    elseif (args[1] == 'melee') then
        Settings.MeleeMode = not Settings.MeleeMode;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Melee Mode: ' .. (Settings.MeleeMode and 'Active' or 'Inactive') .. ' ]--');
        return;
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
    profile.SubjobCheck();

    if (shared.IsNaked()) then
        shared.UnequipGear();
        return;
    end

    local player = gData.GetPlayer();
    -- Weapons
    if Settings.MeleeMode and player.SubJob == 'NIN' then
        gFunc.EquipSet(sets.Weapon_Melee_NIN);
    elseif Settings.MeleeMode then
        gFunc.EquipSet(sets.Weapon_Melee);
    else
        gFunc.EquipSet(sets.Weapon_Default);
    end

    
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        shared.SetCurrentSet('Resting');
        if not Settings.MeleeMode then
            gFunc.Equip('main', 'Pluto\'s Staff');
        end
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Melee);
        shared.SetCurrentSet('Melee');
    else
        if not zones.IsInTown() then
            if Settings.IdleDT == 'MDT' then
                gFunc.EquipSet(sets.Idle_MDT);
                shared.SetCurrentSet('Idle - MDT');
                shared.SetCycleToValue('IdleSet', 'MDT');
            else
                gFunc.EquipSet(sets.Idle_PDT);
                shared.SetCurrentSet('Idle - PDT');
                shared.SetCycleToValue('IdleSet', 'PDT');
            end
            shared.SetCurrentSet('Idle - '.. Settings.IdleDT);
        else
            gFunc.EquipSet(sets.Idle_Town);
            shared.SetCurrentSet('Idle - Town');
            shared.SetCycleToValue('IdleSet', 'Town');
        end
    end

    --local final_set = shared.DisplacedGearCheck(gData.GetEquipment());
    --gFunc.EquipSet(final_set);

    if player.IsMoving then
        gFunc.Equip('legs', 'Blood Cuisses');
    end

    shared.GearOverride();

end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end


profile.HandleMidcast = function()

    local player = gData.GetPlayer();
    local mpdeficit = player.MaxMP - player.MP;
    local MndDebuffs = T{ 'Slow', 'Paralyze', 'Slow II', 'Paralyze II', 'Addle', 'Addle II' };
    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock', 'Blind' };
    local action = gData.GetAction();
    
    if (action.Skill == 'Enfeebling Magic') then
        if (MndDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Enfeebling);
            gFunc.EquipSet(sets.Enfeebling_MND);
        elseif (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Enfeebling);
            gFunc.EquipSet(sets.Enfeebling_INT);
        end
        gFunc.EquipSet(sets.Enfeebling);
        shared.SetCurrentSet('Enfeebling');
    elseif (action.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Enfeebling);
            gFunc.EquipSet(sets.Enfeebling_INT);
            shared.SetCurrentSet('Enfeebling');
        else
            gFunc.EquipSet(sets.Nuke);
            shared.SetCurrentSet('Nuke');
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
        end
    elseif (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Healing);
        shared.SetCurrentSet('Healing');
        if (mpdeficit > 50) then
            gFunc.EquipSet(sets.MND_Ring);
        end
    elseif (action.Skill == 'Enhancing Magic') then
        if (SpikeSpells:contains(action.Name)) then
            gFunc.EquipSet(sets.Spikes);
            shared.SetCurrentSet('Spikes');
        else
            gFunc.EquipSet(sets.Enhancing);
            shared.SetCurrentSet('Enhancing');
        end
    end

    if (Settings.CurrentLevel >= 51) and not Settings.MeleeMode then
        shared.UseElementalStaff(action.Element);
    end

end


profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

profile.SubjobCheck = function()

    local player = gData.GetPlayer();
    local subjob = player.SubJob;
    if subjob ~= 'NON' and subjob ~= Settings.CurrentSubJob then
        Settings.CurrentSubJob = subjob
        if (subjob == "WHM") then
            binds.RDM_WHM_Load();
        elseif (subjob == "BLM") then
            binds.RDM_BLM_Load();
        elseif (subjob == "NIN") then
            binds.RDM_NIN_Load();
        elseif (subjob == "BST") then
            binds.RDM_BST_Load();
        elseif (subjob == "THF") then
            binds.RDM_THF_Load();
            elseif (subjob == "DRK") then
            binds.RDM_DRK_Load();
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Sub Job Binds ->> ' .. subjob .. ' ]--');
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
        shared.LockStyleSet();
    end

end



profile.LevelCheck = function()

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    --myLevel = 50;
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        binds.RDM_Nukes_Load(Settings.CurrentLevel);
        binds.RDM_Support_Load(Settings.CurrentLevel);
    end

end

profile.DisplayRDM = function()

    local player = gData.GetPlayer();
    local action = gData.GetAction();
    -- Throttle
    local diffTime = os.clock() - Settings.LastDisplayed;
    if diffTime < Settings.DisplayThrottle then
        return;
    end

    -- Sorc Ring Calcs
    local sjHPP = 0;
    if player.SubJob == 'BLM' then
        sjHPP = HP_RDM_BLM;
    elseif player.SubJob == 'WHM' then
        sjHPP = HP_RDM_WHM;
    elseif player.SubJob == 'NIN' then  
        sjHPP = HP_RDM_NIN;
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
        if player.SubJob == "BLM" then
            nukeMaxMP = MP_RDM_BLM;
        elseif player.SubJob == "WHM" then
            nukeMaxMP = MP_RDM_WHM;
        elseif player.SubJob == "NIN" then
            nukeMaxMP = MP_RDM_NIN;
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