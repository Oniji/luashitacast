local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local debug = true; -- verbose print output into in-game chat for debugging purposes

local sets = {

    Idle_Priority = {
        Main = {'Pilgrim\'s Wand', 'Willow Wand +1'},
        Ammo = {'Morion Tathlum', 'Fortune Egg'},
        Neck = {'Rep.Bronze Medal'},
        Ear1 = {'Onyx Earring'},
        Ear2 = {'Onyx Earring'},
        Head = {'Silver Hairpin', 'Brass Hairpin'},
        Body = {'Ducal Aketon'},
        Hands = {'Carbuncle Mitts'},
        Ring1 = {'Astral Ring'},
        Ring2 = {'Astral Ring'},
        Back = {'Cape', 'Rabbit Mantle'},
        Waist = {'Friar\'s Rope', 'Leather Belt'},
        Legs = {'Freesword\'s Slops', 'Angler\'s Hose', 'Chocobo Hose'},
        Feet = {'Mage\'s Sandals', 'Light Soleas', 'Chocobo Boots'}
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
    DisplayThrottle = 1,
    LastDisplayed = 0,
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

    shared.LockStyleSet();

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
            if debug then  print('Unknown Pet Summoned...'); end
        end
    elseif not pet and Settings.CurrentAvatar ~= 'None' then
            binds.SMN_Avatar_Load('None');
            Settings.CurrentAvatar = 'None';
            shared.SetCycleToValue('CurrentAvatar', 'None');
    end

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
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
    end

    shared.GearOverride();
    profile.DisplaySMN();

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
            shared.SetCurrentSet('Enfeebling - MND');
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.MND_Ring);
            end
        elseif (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.INT);
            shared.SetCurrentSet('Enfeebling - INT');
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
        end
        gFunc.EquipSet(sets.Enfeebling);
    elseif (action.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.INT);
            shared.SetCurrentSet('Enfeebling - INT');
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
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
        shared.SetCurrentSet('Enhancing');
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

profile.DisplaySMN = function()
    -- Throttle
    local diffTime = os.clock() - Settings.LastDisplayed;
    if diffTime < Settings.DisplayThrottle then
        return;
    end
    local displayString = '';
    if Settings.CurrentAvatar == 'None' then displayString = displayString + '1: |cFF54DCF8|Carbuncle|r\n2: |cFFF44336|Ifrit|r\n3: |cFF6AA84F|Garuda|r\n4: |cFFFFD966|Titan|r\n5: |cFF3896EC|Leviathan|r\n6: |cFFC8E0F7|Shiva|r\n7: |cFF9D5CDA|Ramuh|r\n8: |cFF592789|Fenrir|r\n9: |cFF960E5E|Diabolos'
    elseif Settings.CurrentAvatar == 'Carbuncle' then displayString = displayString + '1: |cFF5FFF5F|Prot/Shell|r\n2: |cFF5FFF5F|WS Poison Nails|r\n3: |cFF5FFF5F|ST Heal|r\n4: |cFF5FFF5F|AOE Heal|r\n5: |cFF5FFF5F|WS Meteorite (AOE)|r\n6: |cFF5FFF5F|Attr Buff|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Ifrit' then displayString = displayString + '1: |cFF5FFF5F|Attack Up|r\n2: |cFF5FFF5F|WS Punch|r\n3: |cFF5FFF5F|WS Burning Strike|r\n4: |cFF5FFF5F|WS Double Punch|r\n5: |cFF5FFF5F|Fire 2|r\n6: |cFF5FFF5F|Fire 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Garuda' then displayString = displayString + '1: |cFF5FFF5F|Blink|r\n2: |cFF5FFF5F|WS Claw|r\n3: |cFF5FFF5F|WS Predator Claws|r\n4: |cFF5FFF5F|Hastega|r\n5: |cFF5FFF5F|AOE Heal|r\n6: |cFF5FFF5F|Aero 2|r\n7: |cFF5FFF5F|Aero 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Titan' then displayString = displayString + '1: |cFF5FFF5F|Stoneskin|r\n2: |cFF5FFF5F|WS Rock Throw|r\n3: |cFF5FFF5F|WS Megalith Throw|r\n4: |cFF5FFF5F|WS Bind|r\n5: |cFF5FFF5F|WS Mountain Buster|r\n6: |cFF5FFF5F|Fire 2|r\n7: |cFF5FFF5F|Fire 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Leviathan' then displayString = displayString + '1: |cFF5FFF5F|Refresh|r\n2: |cFF5FFF5F|WS Barracuda Dive|r\n3: |cFF5FFF5F|WS Tail Whip|r\n4: |cFF5FFF5F|WS Spinning Dive|r\n5: |cFF5FFF5F|Slowga|r\n6: |cFF5FFF5F|Water 2|r\n7: |cFF5FFF5F|Water 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Shiva' then displayString = displayString + '1: |cFF5FFF5F|Ice Spikes|r\n2: |cFF5FFF5F|WS Axe Kick|r\n3: |cFF5FFF5F|WS Double Slap|r\n4: |cFF5FFF5F|WS Rush|r\n5: |cFF5FFF5F|Sleepga|r\n6: |cFF5FFF5F|Blizzard 2|r\n7: |cFF5FFF5F|Blizzard 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Ramuh' then displayString = displayString + '1: |cFF5FFF5F|Enthunder|r\n2: |cFF5FFF5F|WS Shock Strike|r\n3: |cFF5FFF5F|WS Thunderspark|r\n4: |cFF5FFF5F|WS Chaotic Strike|r\n5: |cFF5FFF5F|Shock Spikes|r\n6: |cFF5FFF5F|Thunder 2|r\n7: |cFF5FFF5F|Thunder 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Fenrir' then displayString = displayString + '1: |cFF5FFF5F|Target -acc -eva|r\n2: |cFF5FFF5F|WS Moonlit Charge (Blind)|r\n3: |cFF5FFF5F|WS Crescent Fang (Para)|r\n4: |cFF5FFF5F|WS Eclipse Bite|r\n5: |cFF5FFF5F|2x Dispel|r\n6: |cFF5FFF5F|PT +Attr|r\n7: |cFF5FFF5F|PT +acc+eva|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Diabolos' then displayString = displayString + '1: |cFF5FFF5F|MAB/MDB|r\n2: |cFF5FFF5F|WS Camisado|r\n3: |cFF5FFF5F|WS Nether Blast|r\n4: |cFF5FFF5F|WS Somnolence (Gravity)|r\n5: |cFF5FFF5F|Sleepga+DOT|r\n6: |cFF5FFF5F|Phalanx|r\n7: |cFF5FFF5F|Target -ATTR|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Fire Spirit' then displayString = displayString + '1: |cFF5FFF5F|Fire (13)|r\n2: |cFF5FFF5F|Fire II (38)|r\n3: |cFF5FFF5F|Fire III (62)|r\n4: |cFF5FFF5F|Fire IV (73)|r\n5: |cFF5FFF5F|Burn (24)|r\n6: |cFF5FFF5F|Flare (60)'
    elseif Settings.CurrentAvatar == 'Ice Spirit' then displayString = displayString + '1: |cFF5FFF5F|Blizzard (17)|r\n2: |cFF5FFF5F|Blizzard II (42)|r\n3: |cFF5FFF5F|Blizzard III (64)|r\n4: |cFF5FFF5F|Blizzard IV (74)|r\n5: |cFF5FFF5F|Frost (22)|r\n6: |cFF5FFF5F|Freeze (50)|r\n7: |cFF5FFF5F|Paralyze (4)|r\n8: |cFF5FFF5F|Bind (7)'
    elseif Settings.CurrentAvatar == 'Thunder Spirit' then displayString = displayString + '1: |cFF5FFF5F|Thunder (21)|r\n2: |cFF5FFF5F|Thunder II (46)|r\n3: |cFF5FFF5F|Thunder III (66)|r\n4: |cFF5FFF5F|Thunder IV (75)|r\n5: |cFF5FFF5F|Shock (16)|r\n6: |cFF5FFF5F|Burst (56)'
    elseif Settings.CurrentAvatar == 'Air Spirit' then displayString = displayString + '1: |cFF5FFF5F|Aero (9)|r\n2: |cFF5FFF5F|Aero II (34)|r\n3: |cFF5FFF5F|Aero III (59)|r\n4: |cFF5FFF5F|Aero IV (72)|r\n5: |cFF5FFF5F|Choke (20)|r\n6: |cFF5FFF5F|Tornado (52)|r\n 7: |cFF5FFF5F|Gravity (21)|r\n8: |cFF5FFF5F|Silence (15)'
    elseif Settings.CurrentAvatar == 'Water Spirit' then displayString = displayString + '1: |cFF5FFF5F|Water (5)|r\n2: |cFF5FFF5F|Water II (30)|r\n3: |cFF5FFF5F|Water III (55)|r\n4: |cFF5FFF5F|Water IV (70)|r\n5: |cFF5FFF5F|Drown (27)|r\n6: |cFF5FFF5F|Flood (58)|r\n 7: |cFF5FFF5F|Poison (3)|r\n8: |cFF5FFF5F|Poison II (42)'
    elseif Settings.CurrentAvatar == 'Earth Spirit' then displayString = displayString + '1: |cFF5FFF5F|Stone (1)|r\n2: |cFF5FFF5F|Stone II (26)|r\n3: |cFF5FFF5F|Stone III (51)|r\n4: |cFF5FFF5F|Stone IV (68)|r\n5: |cFF5FFF5F|Rasp (18)|r\n6: |cFF5FFF5F|Quake (54)|r\n 7: |cFF5FFF5F|Slow (13)'
    elseif Settings.CurrentAvatar == 'Light Spirit' then displayString = displayString + '1: |cFF5FFF5F|Regen|r\n2: |cFF5FFF5F|Cure (Low)|r\n3: |cFF5FFF5F|Cure (High)|r\n4: |cFF5FFF5F|Curaga|r\n5: |cFF5FFF5F|Holy|r\n6: |cFF5FFF5F|Banish|r\n7: |cFF5FFF5F|Protect|r\n8: |cFF5FFF5F|Shell'
    elseif Settings.CurrentAvatar == 'Dark Spirit' then displayString = displayString + '1: |cFF5FFF5F|Stun|r\n2: |cFF5FFF5F|Dispel|r\n3: |cFF5FFF5F|Sleep|r\n4: |cFF5FFF5F|Sleepga|r\n5: |cFF5FFF5F|Bio|r\n6: |cFF5FFF5F|Drain|r\n7: |cFF5FFF5F|Aspir|r\n8: |cFF5FFF5F|Blind' 
    end
    shared.SetExtras(displayString);
    Settings.LastDisplayed = os.clock();
end


return profile;