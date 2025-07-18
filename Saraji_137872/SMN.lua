local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local debug = true; -- verbose print output into in-game chat for debugging purposes

local sets = {

    Idle_Priority = {
        Main = {'Willow Wand +1'},
        Ammo = {'Morion Tathlum'},
        Neck = {'Justice Badge'},
        Ear1 = {'Onyx Earring'},
        Ear2 = {'Onyx Earring'},
        Head = {'Silver Hairpin'},
        Body = {'Ryl.Ftm. Tunic'},
        Hands = {'Chocobo Gloves'},
        Ring1 = {'Astral Ring'},
        Ring2 = {'Astral Ring'},
        Back = {'Rabbit Mantle'},
        Waist = {'Leather Belt'},
        Legs = {'Angler\'s Hose', 'Chocobo Hose'},
        Feet = {'Chocobo Boots'}
    },
    MND_Priority = {
        Head = {'Silver Hairpin'},
        Body = {'Baron\'s Saio'},
        Neck = {'Justice Badge'},
        Waist = {'Friar\'s Rope'},
        Hands = {'Devotee\'s Mitts'},
        Legs = {'Custom Pants'},
        Back = {'White Cape +1'},
        Feet = {'Angler\'s Boots'}
    },
    MND_Ring_Priority = {
        Ring1 = {'Saintly Ring'},
        Ring2 = {'Saintly Ring'}
    },
    INT_Priority = {
        Ammo = {'Morion Tathlum'},
        Neck = {'Black Neckerchief'},
        Body = {'Mage\'s Tunic'},
        Ear1 = {'Morion Earring'},
        Ear2 = {'Morion Earring'},
        Hands = {'Angler\'s Gloves'},
        Legs = {'Mage\'s Slacks'},
        Waist = {'Shaman\'s Belt'},
        Feet = {'Custom F Boots'},
        Back = {'Black Cape +1'}
    },
    INT_Ring_Priority = {
        Ring1 = {'Eremite\'s Ring'},
        Ring2 = {'Eremite\'s Ring'}
    },
    Nuke_Priority = {
        Ammo = {'Morion Tathlum'},
        Neck = {'Black Neckerchief'},
        Body = {'Mage\'s Tunic'},
        Ear1 = {'Morion Earring'},
        Ear2 = {'Morion Earring'},
        Hands = {'Seer\'s Mitts +1', 'Angler\'s Gloves'},
        Legs = {'Mage\'s Slacks'},
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
        Feet = {'Crow Gaiters'},
        Back = {'White Cape +1'}
    },
    Enhancing = {
    },
    Enfeebling = {
        Legs = 'Nashira Seraweels', -- 5
    },
    Resting = {
        Main = 'Pluto\'s Staff', -- 10
        Body = 'Errant Hpl.', -- 5
        Legs = 'Baron\'s Slops', -- 1
        Ear2 = 'Relaxing Earring', -- 2
        Waist = 'Hierarch Belt', -- 2
    },
    SIRD = {
    },
    FastCast = {
    }
};
profile.Sets = sets;

local CurrentAvatar = {
    [1] = 'None',
    [2] = 'Carbuncle',
    [3] = 'Ifrit',
    [4] = 'Garuda',
    [5] = 'Titan',
    [6] = 'Leviathan',
    [7] = 'Shiva',
    [8] = 'Ramuh',
    [9] = 'Fenrir',
    [10] = 'Diabolos',
    [11] = 'Fire Spirit', 
    [12] = 'Ice Spirit', 
    [13] = 'Thunder Spirit', 
    [14] = 'Wind Spirit', 
    [15] = 'Water Spirit', 
    [16] = 'Earth Spirit', 
    [17] = 'Light Spirit', 
    [18] = 'Dark Spirit', 
};

local Settings = {
    CurrentAvatar = 'None',
    CurrentSubJob = nil,
    CurrentLevel = 0
};


profile.OnLoad = function()
    binds.Unbind_All();
    profile.LevelCheck();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.SMN_Load();

    aliases.Common_Load();
    aliases.SMN_Load();

    -- Setup Avatar cycle and initial bind state
    shared.CreateCycle('CurrentAvatar', CurrentAvatar);
    shared.SetCycleToValue('CurrentAvatar', 'None');
    Settings.CurrentAvatar = 'None';
    binds.SMN_Avatar_Load('None');

    Settings.CurrentMode = 'main';
    gSettings.AllowAddSet = true;

    -- Setting up HandleCommand cycles and toggles
    shared.OnLoad();

    local player = gData.GetPlayer();
    shared.LockStyleSet(player.MainJob);

end

profile.OnUnload = function()

    binds.Common_Unload();
    binds.SMN_Unload();
    aliases.Common_Unload();
    aliases.SMN_Unload();

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

    -- Check if Avatar is summoned
    local pet = gData.GetPet();
    -- Only redo binds if the avatar has changed since last check
    if pet and pet.Name ~= Settings.CurrentAvatar then
        local petSuccess = shared.SetCycleToValue('CurrentAvatar', pet.Name);
        if petSuccess then
            -- Check if avatar is different since last checked
            if Settings.CurrentAvatar ~= pet.Name then
                binds.SMN_Avatar_Load(pet.Name);
                Settings.CurrentAvatar = pet.Name;
            end
        else
            if debug then print('Unknown Pet Summoned...'); end
        end
    elseif not pet and Settings.CurrentAvatar ~= 'None' then
            binds.SMN_Avatar_Load('None');
            Settings.CurrentAvatar = 'None';
            shared.SetCycleToValue('CurrentAvatar', 'None');
    end

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
        gFunc.EquipSet(sets.Enfeebling);
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
    elseif (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Enhancing);
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
    end

end


return profile;