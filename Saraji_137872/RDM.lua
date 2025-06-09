local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {

    Idle_Priority = {
        Main = {'Earth Staff', 'Solid Wand', 'Yew Wand +1', 'Willow Wand +1'},
        --Sub = {'Targe +1', 'Aspis'},
        Ammo = 'Morion Tathlum',
        Neck = {'Justice Badge'},
        Ear1 = {'Moldavite Earring', 'Morion Earring', 'Onyx Earring'},
        Ear2 = {'Morion Earring', 'Onyx Earring'},
        Head = {'Electrum Hairpin', 'Silver Hairpin'},
        Body = {'Tct.Mgc. Coat', 'Baron\'s Saio', 'Mage\'s Tunic', 'Ryl.Ftm. Tunic'},
        Hands = {'Devotee\'s Mitts', 'Angler\'s Gloves', 'Chocobo Gloves'},
        Ring1 = {'Astral Ring'},
        Ring2 = {'Astral Ring'},
        Back = {'White Cape +1', 'Rabbit Mantle'},
        Waist = {'Shaman\'s Belt', 'Friar\'s Rope', 'Leather Belt'},
        Legs = {'Custom Pants', 'Mage\'s Slacks', 'Angler\'s Hose', 'Chocobo Hose'},
        Feet = {'Custom F Boots', 'Angler\'s Boots', 'Chocobo Boots'}
    },
    MND_Priority = {
        Body = {'Baron\'s Saio'},
        Neck = {'Justice Badge'},
        Waist = {'Friar\'s Rope'},
        Hands = {'Devotee\'s Mitts'},
        Legs = {'Custom Pants'},
        Back = {'White Cape +1'},
        Feet = {'Angler\'s Boots'}
    },
    MND_Ring_Priority = {
        Ring1 = {'Solace Ring', 'Saintly Ring'},
        Ring2 = {'Solace Ring', 'Saintly Ring'}
    },
    INT_Priority = {
        Neck = {'Black Neckerchief'},
        Body = {'Mage\'s Tunic'},
        Ear1 = {'Morion Earring'},
        Ear2 = {'Morion Earring'},
        Hands = {'Angler\'s Gloves'},
        Legs = {'Magic Cuisses', 'Mage\'s Slacks'},
        Waist = {'Shaman\'s Belt'},
        Feet = {'Custom F Boots'},
        Back = {'Black Cape +1'}
    },
    INT_Ring_Priority = {
        Ring1 = {'Wisdom Ring', 'Eremite\'s Ring'},
        Ring2 = {'Wisdom Ring', 'Eremite\'s Ring'}
    },
    Nuke_Priority = {
        Neck = {'Black Neckerchief'},
        Body = {'Mage\'s Tunic'},
        Ear1 = {'Moldavite Earring', 'Morion Earring'},
        Ear2 = {'Morion Earring'},
        Hands = {'Seer\'s Mitts +1', 'Angler\'s Gloves'},
        Legs = {'Magic Cuisses', 'Mage\'s Slacks'},
        Waist = {'Shaman\'s Belt'},
        Feet = {'Custom F Boots'},
        Back = {'Black Cape +1'},
    },
    Healing_Priority = {
        Body = {'Baron\'s Saio'},
        Neck = {'Justice Badge'},
        Waist = {'Friar\'s Rope'},
        Hands = {'Devotee\'s Mitts'},
        Legs = {'Custom Pants'},
        Back = {'White Cape +1'}
    },
    Resting_Priority = {
        Legs = {'Baron\'s Slops'}
    }
};
profile.Sets = sets;

local Settings = {
    CurrentSubJob = nil,
    CurrentLevel = 0
};


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

    local player = gData.GetPlayer();
    shared.LockStyleSet(player.MainJob);

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

    if (shared.IsNaked()) then
        shared.UnequipGear();
        return;
    end

    local player = gData.GetPlayer();
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
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
            gFunc.EquipSet(sets.MND);
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.MND_Ring);
            end
        elseif (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.INT);
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
        end
    elseif (action.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.INT);
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
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


profile.LevelCheck = function()

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        binds.RDM_Nukes_Load(Settings.CurrentLevel);
        binds.RDM_Support_Load(Settings.CurrentLevel);
    end

end


return profile;