local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {
    Idle_Priority = {
        Main = {'Earth Staff', 'Casting Wand', 'Solid Wand'},
        Sub = {'Solid Wand'},
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
        Neck = {'Uggalepih Pendant', 'Elemental Torque', 'Black Neckerchief'},
        Ear1 = {'Moldavite Earring', 'Morion Earring'},
        Ear2 = {'Phantom Earring', 'Morion Earring'},
        Head = {'Wizard\'s Petasos', 'Seer\'s Crown +1'},
        Body = {'Black Cloak', 'Wizard\'s Coat', 'Baron\'s Saio', 'Mage\'s Tunic'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1'},
        Ring1 = {'Sorcerer\'s Ring', 'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Back = {'Prism Cape', 'Black Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt'},
        Legs = {'Errant Slops', 'Wizard\'s Tonban', 'Mage\'s Slacks'},
        Feet = {'Rostrum Pumps', 'Custom F Boots'}
    },
    Nuke_Priority = {
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
        Neck = {'Philomath Stole', 'Black Neckerchief'},
        Ear1 = {'Moldavite Earring', 'Morion Earring'},
        Ear2 = {'Phantom Earring', 'Morion Earring'},
        Head = {'Wizard\'s Petasos', 'Black Cloak', 'Wizard\'s Petasos'},
        Body = {'Igqira Weskit', 'Black Cloak', 'Shaman\'s Cloak', 'Baron\'s Saio', 'Mage\'s Tunic'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1'},
        Ring1 = {'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Back = {'Prism Cape', 'Black Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt'},
        Legs = {'Errant Slops', 'Mage\'s Slacks'},
        Feet = {'Rostrum Pumps', 'Custom F Boots'}
    },
    Resting = {
        Main = 'Dark Staff',
        Body = 'Errant Hpl.',
        Legs = 'Baron\'s Slops',
    },
    DarkMagic = {
        Legs = 'Wizard\'s Tonban'
    },
    EnfeeblingMND_Priority = {
        Head = {'Igqira Tiara', 'Wizard\'s Petasos'},
        Neck = 'Justice Badge',
        Body = 'Wizard\'s Coat',
        Hands = 'Devotee\'s Mitts',
        Waist = 'Penitent\'s Rope',
        Back = {'Prism Cape', 'White Cape +1'},
        Legs = {'Errant Slops', 'Custom Pants'},
        Feet = {'Rostrum Pumps', 'Custom F Boots'},
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring'
    },
    EnfeeblingINT_Priority = {
        Head = {'Igqira Tiara', 'Wizard\'s Petasos'},
        Neck = {'Philomath Stole', 'Black Neckerchief'},
        Body = 'Wizard\'s Coat',
        Hands = 'Wizard\'s Gloves',
        Waist = 'Penitent\'s Rope',
        Back = {'Prism Cape', 'Black Cape +1'},
        Legs = {'Errant Slops', 'Mage\'s Slacks'},
        Feet = {'Rostrum Pumps', 'Custom F Boots'},
        Ear1 = {'Phantom Earring', 'Morion Earring'},
        Ear2 = {'Phantom Earring', 'Morion Earring'},
        Ring1 = {'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Wisdom Ring', 'Eremite\'s Ring'},
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
    },
    Healing_Priority = {
        Head = 'Wizard\'s Petasos',
        Neck = 'Justice Badge',
        Body = {'Errant Hpl.', 'Wizard\'s Coat'},
        Hands = 'Devotee\'s Mitts',
        Waist = 'Penitent\'s Rope',
        Back = {'Prism Cape', 'White Cape +1'},
        Legs = {'Errant Slops', 'Custom Pants'},
        Feet = {'Rostrum Pumps', 'Custom F Boots'},
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring'
    },
    SIRD = {
        -- 95% SIRD
        --Main = 'Eremite\'s Wand', -- 25
        --Sub = 'Eremite\'s Wand', -- 25
        --Head = 'Nashira Turban', -- 10
        Feet = 'Wizard\'s Sabots', -- 20
        --Neck = 'Willpower Torque', -- 5
        Waist = 'Druid\'s Rope', -- 10
        Ear1 = 'Merman\'s Earring' -- DR
    },
    Precast = {
        Feet = 'Rostrum Pumps'
    },
    YellowHP = {
        -- Goal -228hp~. Current: 110
        Ring1 = 'Ether Ring', -- -30 hp
        Ring2 = 'Astral Ring', -- 25 hp
        Feet = 'Rostrum Pumps', -- 30 hp
        Ammo = 'Tiphia Sting' -- 25 hp

        -- Potentials Addition: 87
        -- Neck = 'Checkered Scarf', -- 12 hp 30k
        -- Body = 'Blue Cotehardie', -- 40 hp 45k
        -- Back = 'Blue Cape', -- 15 hp 30k gil
        -- Head = 'Faerie Hairpin' -- 20 hp 150k
        -- Head = 'Coral Hairpin' -- 7 hp 8k




    }
};
profile.Sets = sets;

local Settings = {
    CurrentSubJob = nil,
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
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
    end
    local final_set = shared.DisplacedGearCheck(gData.GetEquipment());
    gFunc.EquipSet(final_set);



    shared.GearOverride();


end


profile.HandleAbility = function()
end


profile.HandleItem = function()
end


profile.HandlePrecast = function()
    shared.SetCurrentSet('Precast');
end


profile.HandleMidcast = function()

    local MndDebuffs = T{ 'Slow', 'Paralyze', 'Slow II', 'Paralyze II', 'Addle', 'Addle II' };
    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock', 'Blind' };
    local action = gData.GetAction();

    shared.SetMidcastDelay(sets.Precast);
    gFunc.InterimEquipSet(sets.SIRD);

    if (action.Skill == 'Enfeebling Magic') then
        if (MndDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.EnfeeblingMND);
        else
            gFunc.EquipSet(sets.EnfeeblingINT);
        end
    elseif (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);
        shared.UggPendantCheck(action);
        local spellmatchday = shared.SpellMatchDay(action);
        if spellmatchday then
            gFunc.Equip('Legs', 'Sorcerer\'s Tonban');
        end
        shared.ObiCheck(action);
    elseif (action.Skill == 'Dark Magic') then
        if (action.Name == 'Stun') then
            gFunc.EquipSet(sets.Nuke);
        else
            gFunc.EquipSet(sets.DarkMagic);
        end
        shared.UggPendantCheck(action);
    elseif (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Healing);
    end
    if (Settings.CurrentLevel >= 51) then
        shared.UseElementalStaff(action.Element);
    end
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
    --local myLevel = 50
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        binds.BLM_Nukes_Load(Settings.CurrentLevel);
    end

end


return profile;