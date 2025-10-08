local profile = {};

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
        Main = 'Terra\'s Staff', -- 20
        Ammo = 'Hedgehog Bomb',
        Head = 'Duelist\'s Chapeau',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Darksteel Mittens', -- 1
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Merman\'s Ring', -- 5
        Back = 'Hexerei Cape', -- replace
        Waist = 'Warwolf Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Crimson Greaves', -- 2
    },
    Idle_MDT = {
        Main = 'Terra\'s Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Duelist\'s Chapeau',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Duelist\'s Tabard',
        Hands = 'Darksteel Mittens', -- replace
        Ring1 = 'Merman\'s Ring', -- 5
        Ring2 = 'Merman\'s Ring', -- 5
        Back = 'Hexerei Cape', -- 3
        Waist = 'Penitent\'s Rope',
        Legs = 'Blood Cuisses',
        Feet = 'Crimson Greaves', -- 2
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
    Nuke_Priority = {
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
        Neck = {'Elemental Torque', 'Black Neckerchief'},
        Head = {'Warlock\'s Chapeau'},
        Body = {'Errant Hpl.', 'Warlock\'s Tabard', 'Mage\'s Tunic'},
        Ear1 = {'Moldavite Earring', 'Morion Earring'},
        Ear2 = {'Abyssal Earring', 'Phantom Earring', 'Morion Earring'},
        Hands = {'Zenith Mitts', 'Seer\'s Mitts +1', 'Angler\'s Gloves'},
        Legs = {'Duelist\'s Tights', 'Mahatma Slops', 'Magic Cuisses', 'Mage\'s Slacks'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt'},
        Feet = {'Duelist\'s Boots', 'Custom F Boots'},
        Back = {'Prism Cape', 'Black Cape +1'},
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
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
        Main = 'Pluto\'s Staff', -- 10
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
        Main = 'Blau Dolch',
        --Main = 'Platoon Dagger',
        Sub = 'Genbu\'s Shield',
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

local Settings = {
    CurrentSubJob = nil,
    CurrentLevel = 0
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
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Melee);
    else
        gFunc.EquipSet(sets.Idle);
    end

    --local final_set = shared.DisplacedGearCheck(gData.GetEquipment());
    --gFunc.EquipSet(final_set);

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
    elseif (action.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Enfeebling);
            gFunc.EquipSet(sets.Enfeebling_INT);
        else
            gFunc.EquipSet(sets.Nuke);
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
        end
    elseif (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Healing);
        if (mpdeficit > 50) then
            gFunc.EquipSet(sets.MND_Ring);
        end
    elseif (action.Skill == 'Enhancing Magic') then
        if (SpikeSpells:contains(action.Name)) then
            gFunc.EquipSet(sets.Spikes);
        else
            gFunc.EquipSet(sets.Enhancing);
        end
    end

    if (Settings.CurrentLevel >= 51) then
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


return profile;