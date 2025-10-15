local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local debug = true; -- verbose print output into in-game chat for debugging purposes

local carbuncle_mitts = true;
local yinyang_robe = false;
local summoners_doublet = false;
local summoners_horn = false;

local sets = {

    Idle_Priority = {
        Main = {'Kukulcan\'s Staff', 'Elm Staff +1', 'Pilgrim\'s Wand', 'Willow Wand +1'},
        Ammo = {'Hedgehog Bomb', 'Fortune Egg'},
        Neck = {'Rep.Bronze Medal'},
        Ear1 = {'Novia Earring', 'Morion Earring', 'Onyx Earring'},
        Ear2 = {'Loquac. Earring', 'Morion Earring', 'Onyx Earring'},
        Head = {'Electrum Hairpin', 'Silver Hairpin', 'Brass Hairpin'},
        Body = {'Seer\'s Tunic +1', 'Ducal Aketon'},
        Hands = {'Austere Cuffs', 'Carbuncle Mitts'},
        Ring1 = {'Ether Ring', 'Astral Ring'},
        Ring2 = {'Astral Ring'},
        Back = {'Aurora Mantle', 'Cape', 'Rabbit Mantle'},
        Waist = {'Hierarch Belt', 'Powerful Rope', 'Friar\'s Rope', 'Leather Belt'},
        Legs = {'Custom Pants', 'Baron\'s Slops', 'Angler\'s Hose', 'Chocobo Hose'},
        Feet = {'Custom F Boots', 'Mage\'s Sandals', 'Light Soleas', 'Chocobo Boots'}
    },
    MND_Priority = {
        Head = {'Austere Hat', 'Electrum Hairpin', 'Silver Hairpin'},
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
        Ring2 = {'Tamas Ring'}
    },
    INT_Priority = {
        Ammo = {'Morion Tathlum'},
        Neck = {'Black Neckerchief'},
        Body = {'Seer\'s Tunic +1', 'Mage\'s Tunic'},
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
        Ring2 = {'Tamas Ring'}
    },
    Nuke_Priority = {
        Ammo = {'Morion Tathlum'},
        Neck = {'Black Neckerchief'},
        Body = {'Seer\'s Tunic +1', 'Mage\'s Tunic'},
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
        Main = 'Pilgrim\'s Wand', -- 2
        Body = 'Seer\'s Tunic +1', -- 1
        Legs = 'Baron\'s Slops', -- 1
        Ear2 = 'Relaxing Earring', -- 2
        Waist = 'Hierarch Belt', -- 2
        Back = 'Errant Cape',
    },
    BP_Delay = {
        Head = 'Austere Hat', -- 2
        Hands = 'Austere Cuffs', -- 1
        Body = 'Austere Robe', -- 3
        --Legs = 'Summoner\'s Spats', -- 2
        Feet = 'Summoner\'s Pigaches', -- 2
        Back = 'Errant Cape',
    },
    BP = {
        --Head = 'Evoker\'s Horn', -- 5
        Head = 'Austere Hat', -- 2
        --Body = 'Summoner\'s Doublet', -- Avatar CritHit
        --Hands = 'Summoner\'s Bracers', -- 10 + Avatar Accuracy
        Hands = 'Austere Cuffs', -- 2
        Legs = 'Austere Slops', -- 3
        Feet = 'Austere Sabots', -- 3
        --Legs = 'Evoker\'s Spats', -- Avatar Accuracy
        --Feet = 'Summoner\'s Pigaches', -- Avatar Attack
        --Ring1 = 'Evoker\'s Ring', --10
        --Neck = 'Summoning Torque',
    },
    Avatar_Perp = {
        Body = 'Austere Robe', -- 1
        --Hands = 'Nashira Gages', -- 1
        --Feet = 'Evoker\'s Pigaches +1', -- 1
        --Ring1 = 'Evoker\'s Ring', -- 1
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
    LastSummoningElement = '',
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
    binds.SMN_Avatar_Unload();
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
    local current_avatar = binds.SMN_GetCurrentAvatar();
    -- Only redo binds if the avatar has changed since last check
    if pet then
        if pet.Name ~= Settings.CurrentAvatar then
            shared.SetCycleToValue('CurrentAvatar', pet.Name);
            Settings.CurrentAvatar = pet.Name;
        end
        if pet.Name ~= current_avatar then
            binds.SMN_Avatar_Load(pet.Name);
        end
        profile.EquipAvatarPerp(pet.Name);
        shared.SetCurrentSet('Avatar Perpetuation');
        if Settings.LastSummoningElement then
            local elemental_staff = shared.GetElementalStaff(Settings.LastSummoningElement);
            if elemental_staff then
                gFunc.Equip('main', elemental_staff);
            end
        end
    elseif not pet then
        if Settings.CurrentAvatar ~= 'None' then
            shared.SetCycleToValue('CurrentAvatar', 'None');
            Settings.CurrentAvatar = 'None';
        end
        if current_avatar ~= 'None' then
            binds.SMN_Avatar_Load('None');
        end
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
    end

    if not pet then
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
    end

    shared.GearOverride();
    profile.DisplaySMN();

end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if action.Type == 'Blood Pact: Rage' or action.Type == 'Blood Pact: Ward' then
        gFunc.EquipSet(sets.BP_Delay);
        shared.SetCurrentSet('Blood Pact Delay');
    end
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
    elseif (action.Skill == 'Summoning') then
        Settings.LastSummoningElement = action.Element;
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

profile.EquipAvatarPerp = function(pet)
    gFunc.EquipSet(sets.Avatar_Perp); -- Base Set
    local env = gData.GetEnvironment();
    -- Check for situational perp cost reductions
    if pet == 'Carbuncle' then
        if carbuncle_mitts then
            gFunc.Equip('hands', 'Carbuncle Mitts');
        end
        if yinyang_robe then
            gFunc.Equip('body', 'Yinyang Robe');
        end
    end
    if summoners_horn and env.Weather == Settings.LastSummoningElement then
        gFunc.Equip('head', 'Summoner\'s Horn');
    end
    if summoners_doublet and env.DayElement == Settings.LastSummoningElement then
        gFunc.Equip('body', 'Summoner\'s Doublet');
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
    elseif Settings.CurrentAvatar == 'Carbuncle' then displayString = displayString + '1: |cFF5FFF5F|Prot/Shell (44)|r\n2: |cFFF44336|WS Poison Nails|r\n3: |cFF5FFF5F|ST Heal (6)|r\n4: |cFF5FFF5F|AOE Heal (124)|r\n5: |cFFF44336|WS Meteorite (AOE)|r\n6: |cFF5FFF5F|Attr Buff|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Ifrit' then displayString = displayString + '1: |cFF5FFF5F|Attack Up (84)|r\n2: |cFFF44336|WS Punch|r\n3: |cFFF44336|WS Burning Strike|r\n4: |cFFF44336|WS Double Punch|r\n5: |cFFF44336|Fire 2|r\n6: |cFFF44336|Fire 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Garuda' then displayString = displayString + '1: |cFF5FFF5F|Blink (92)|r\n2: |cFFF44336|WS Claw|r\n3: |cFFF44336|WS Predator Claws|r\n4: |cFF5FFF5F|Hastega (112)|r\n5: |cFF5FFF5F|AOE Heal (119)|r\n6: |cFF6AA84F|Aero 2|r\n7: |cFF6AA84F|Aero 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Titan' then displayString = displayString + '1: |cFF5FFF5F|Stoneskin (92)|r\n2: |cFFF44336|WS Rock Throw|r\n3: |cFFF44336|WS Megalith Throw|r\n4: |cFFF44336|WS Bind|r\n5: |cFFF44336|WS Mountain Buster|r\n6: |cFFFFD966|Stone 2|r\n7: |cFFFFD966|Stone 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Leviathan' then displayString = displayString + '1: |cFF5FFF5F|Refresh (99)|r\n2: |cFFF44336|WS Barracuda Dive|r\n3: |cFFF44336|WS Tail Whip|r\n4: |cFFF44336|WS Spinning Dive|r\n5: |cFF9D5CDA|Slowga (48)|r\n6: |cFF3896EC|Water 2|r\n7: |cFF3896EC|Water 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Shiva' then displayString = displayString + '1: |cFF5FFF5F|Ice Spikes (63)|r\n2: |cFFF44336|WS Axe Kick|r\n3: |cFFF44336|WS Double Slap|r\n4: |cFFF44336|WS Rush|r\n5: |cFF9D5CDA|Sleepga (56)|r\n6: |cFFC8E0F7|Blizzard 2|r\n7: |cFFC8E0F7|Blizzard 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Ramuh' then displayString = displayString + '1: |cFF5FFF5F|Enthunder (52)|r\n2: |cFFF44336|WS Shock Strike|r\n3: |cFFF44336|WS Thunderspark|r\n4: |cFFF44336|WS Chaotic Strike|r\n5: |cFF5FFF5F|Shock Spikes (91)|r\n6: |cFF9D5CDA|Thunder 2|r\n7: |cFF9D5CDA|Thunder 4|r\n8: |cFF5FFF5F|2HR AOE'
    elseif Settings.CurrentAvatar == 'Fenrir' then
        local acc, eva = binds.Info_EclipticHowl();
        if acc and eva then displayString = displayString + '1: |cFF5FFF5F|Accuracy +' .. acc .. '/Evasion +' .. eva .. ' (57)|r\n2: |cFFF44336|WS Moonlit Charge (Blind)|r\n3: |cFFF44336|WS Crescent Fang (Para)|r\n4: |cFFF44336|WS Eclipse Bite|r\n5: |cFF9D5CDA|Dispel x 2 (27)|r\n6: |cFF5FFF5F|PT +Attr|r\n7: |cFF9D5CDA|Target -acc -eva|r\n8: |cFF5FFF5F|2HR AOE'
        else displayString = displayString + '1: |cFF5FFF5F|Accuracy/Evasion (57)|r\n2: |cFFF44336|WS Moonlit Charge (Blind)|r\n3: |cFFF44336|WS Crescent Fang (Para)|r\n4: |cFFF44336|WS Eclipse Bite|r\n5: |cFF9D5CDA|Dispel x 2 (27)|r\n6: |cFF5FFF5F|PT +Attr|r\n7: |cFF9D5CDA|Target -acc -eva|r\n8: |cFF5FFF5F|2HR AOE' end
    elseif Settings.CurrentAvatar == 'Diabolos' then 
        local mab, mdb = binds.Info_DreamShroud();
        if mab and mdb then displayString = displayString + '1: |cFF5FFF5F|MAB +' .. mab .. '/MDB +' .. mdb .. ' (121)|r\n2: |cFFF44336|WS Camisado|r\n3: |cFFF44336|WS Nether Blast|r\n4: |cFFF44336|WS Somnolence (Gravity)|r\n5: |cFF9D5CDA|Sleepga + DOT (42)|r\n6: |cFF5FFF5F|Phalanx (92)|r\n7: |cFF9D5CDA|Target -Attributes (27)|r\n8: |cFF5FFF5F|2HR AOE'
        else displayString = displayString + '1: |cFF5FFF5F|MAB/MDB (121)|r\n2: |cFFF44336|WS Camisado|r\n3: |cFFF44336|WS Nether Blast|r\n4: |cFFF44336|WS Somnolence (Gravity)|r\n5: |cFF9D5CDA|Sleepga + DOT (42)|r\n6: |cFF5FFF5F|Phalanx (92)|r\n7: |cFF9D5CDA|Target -Attributes (27)|r\n8: |cFF5FFF5F|2HR AOE' end
    elseif Settings.CurrentAvatar == 'Fire Spirit' then displayString = displayString + '1: |cFFF44336|Fire (13)|r\n2: |cFFF44336|Fire II (38)|r\n3: |cFFF44336|Fire III (62)|r\n4: |cFFF44336|Fire IV (73)|r\n5: |cFFF44336|Burn (24)|r\n6: |cFFF44336|Flare (60)'
    elseif Settings.CurrentAvatar == 'Ice Spirit' then displayString = displayString + '1: |cFFC8E0F7|Blizzard (17)|r\n2: |cFFC8E0F7|Blizzard II (42)|r\n3: |cFFC8E0F7|Blizzard III (64)|r\n4: |cFFC8E0F7|Blizzard IV (74)|r\n5: |cFFC8E0F7|Frost (22)|r\n6: |cFFC8E0F7|Freeze (50)|r\n7: |cFFC8E0F7|Paralyze (4)|r\n8: |cFFC8E0F7|Bind (7)'
    elseif Settings.CurrentAvatar == 'Thunder Spirit' then displayString = displayString + '1: |cFF9D5CDA|Thunder (21)|r\n2: |cFF9D5CDA|Thunder II (46)|r\n3: |cFF9D5CDA|Thunder III (66)|r\n4: |cFF9D5CDA|Thunder IV (75)|r\n5: |cFF9D5CDA|Shock (16)|r\n6: |cFF9D5CDA|Burst (56)'
    elseif Settings.CurrentAvatar == 'Air Spirit' then displayString = displayString + '1: |cFF6AA84F|Aero (9)|r\n2: |cFF6AA84F|Aero II (34)|r\n3: |cFF6AA84F|Aero III (59)|r\n4: |cFF6AA84F|Aero IV (72)|r\n5: |cFF6AA84F|Choke (20)|r\n6: |cFF6AA84F|Tornado (52)|r\n 7: |cFF6AA84F|Gravity (21)|r\n8: |cFF6AA84F|Silence (15)'
    elseif Settings.CurrentAvatar == 'Water Spirit' then displayString = displayString + '1: |cFF3896EC|Water (5)|r\n2: |cFF3896EC|Water II (30)|r\n3: |cFF3896EC|Water III (55)|r\n4: |cFF3896EC|Water IV (70)|r\n5: |cFF3896EC|Drown (27)|r\n6: |cFF3896EC|Flood (58)|r\n 7: |cFF3896EC|Poison (3)|r\n8: |cFF3896EC|Poison II (42)'
    elseif Settings.CurrentAvatar == 'Earth Spirit' then displayString = displayString + '1: |cFFFFD966|Stone (1)|r\n2: |cFFFFD966|Stone II (26)|r\n3: |cFFFFD966|Stone III (51)|r\n4: |cFFFFD966|Stone IV (68)|r\n5: |cFFFFD966|Rasp (18)|r\n6: |cFFFFD966|Quake (54)|r\n 7: |cFFFFD966|Slow (13)'
    elseif Settings.CurrentAvatar == 'Light Spirit' then displayString = displayString + '1: |cFF5FFF5F|Regen|r\n2: |cFF5FFF5F|Cure (Low)|r\n3: |cFF5FFF5F|Cure (High)|r\n4: |cFF5FFF5F|Curaga|r\n5: |cFF5FFF5F|Holy|r\n6: |cFF5FFF5F|Banish|r\n7: |cFF5FFF5F|Protect|r\n8: |cFF5FFF5F|Shell'
    elseif Settings.CurrentAvatar == 'Dark Spirit' then displayString = displayString + '1: |cFF5FFF5F|Stun|r\n2: |cFF5FFF5F|Dispel|r\n3: |cFF5FFF5F|Sleep|r\n4: |cFF5FFF5F|Sleepga|r\n5: |cFF5FFF5F|Bio|r\n6: |cFF5FFF5F|Drain|r\n7: |cFF5FFF5F|Aspir|r\n8: |cFF5FFF5F|Blind' 
    end
    shared.SetExtras(displayString);
    Settings.LastDisplayed = os.clock();
end


return profile;