local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {

    -- Idle Set

    Idle_Town = {
        Head = 'Ace\'s Helm',
        Ear1 = 'Brutal Earring', 
        Ear2 = 'Merman\'s Earring',
        Neck = 'Peacock Amulet', 
        Body = 'Homam Corazza', 
        Hands = 'Homam Manopolas', 
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle', 
        Waist = 'Swift Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Homam Gambieras',
        Range = 'remove',
        Ammo = 'Tiphia Sting',
    },
    Idle_Priority = {
        Main = 'Orichalcum Lance',
        --Main = 'Gae Bolg',
        --Main = 'Martial Lance',
        Head = {'Ace\'s Helm', 'Homam Zucchetto', 'Optical Hat', 'Walkure Mask', 'Centurion\'s Visor'},
        Ear1 = {'Brutal Earring', 'Merman\'s Earring', 'Spike Earring', 'Beetle earring +1'},
        Ear2 = {'Ethereal Earring', 'Merman\'s Earring', 'Spike Earring', 'Beetle earring +1'},
        Neck = {'Peacock Amulet', 'Spike necklace'},
        Body = {'Homam Corazza', 'Scorpion Harness', 'Brigandine', 'Ctr. Scale Mail', 'Beetle Harness +1'},
        Hands = {'Homam Manopolas', 'Wyrm Fng.Gnt.', 'Drachen Fng. Gnt.', 'Battle gloves'},
        Ring1 = {'Toreador\'s Ring','Sniper\'s Ring', 'Balance Ring'},
        Ring2 = {'Toreador\'s Ring', 'Balance Ring'},
        Back = {'Forager\'s Mantle', 'Nomad\'s Mantle'},
        Waist = {'Swift Belt', 'Life Belt', 'Tilt Belt', 'Brave Belt'},
        Legs = {'Homam Cosciales', 'Drachen Brais', 'Republic Subligar'},
        Feet = {'Homam Gambieras', 'Wyrm Greaves', 'Drn. Greaves +1', 'Ctr. Greaves'},
        Range = 'remove',
        Ammo = {'Tiphia Sting', 'Mille. Sachet'}
    },

    -- TP Sets

    TP = { -- Low Accuracy
        Head = 'Ace\'s Helm',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Range = 'remove',
        Ammo = 'Tiphia Sting',
    },
    TP_MediumAccuracy = {
        Head = 'Ace\'s Helm',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Range = 'remove',
        Ammo = 'Tiphia Sting',
    },
    TP_HighAccuracy = {
        Head = 'Ace\'s Helm',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Wyrm Belt',
        Range = 'remove',
        Ammo = 'Tiphia Sting',
    },
    TP_Tank = {
        Head = 'Ace\'s Helm',
        Body = 'Gavial Mail',
        Hands = 'Darksteel Mittens',
        Legs = 'Gavial Cuisses',
        Feet = 'Gavial Greaves',
        Neck = 'Peacock Amulet',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Ammo = 'Tiphia Sting',
        Waist = 'Swift Belt',
        Back = 'Forager\'s Mantle',
    },

    -- Weaponskill Sets

    WS = { -- Default: Low Accuracy | High Damage
        Head = 'Hecatomb Cap',
        Neck = 'Justice Torque',
        Body = 'Hecatomb Harness',
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Forager\'s Mantle',
        Hands = 'Hecatomb Mittens',
        Waist = 'Warwolf Belt',
        Legs = 'Barone Cosciales', 
        Feet = 'Hct. Leggings',
        Ammo = 'Tiphia Sting',
    },
    WS_MediumAccuracy = {
        Head = 'Hecatomb Cap',
        Body = 'Hecatomb Harness',
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Forager\'s Mantle',
        Neck = 'Peacock Amulet',
        Hands = 'Hecatomb Mittens',
        Waist = 'Warwolf Belt',
        Legs = 'Barone Cosciales',
        Feet = 'Hct. Leggings',
        Ammo = 'Tiphia Sting',
    },
    WS_HighAccuracy = {
        Head = 'Hecatomb Cap',
        Body = 'Hecatomb Harness',
        Neck = 'Peacock Amulet',
        Hands = 'Hecatomb Mittens',
        Waist = 'Warwolf Belt',
        Legs = 'Drn. Brais +1',
        Feet = 'Hct. Leggings',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Forager\'s Mantle',
        Ammo = 'Tiphia Sting',
    },
    Resting = {
        Feet = 'Wyrm Greaves',
        Ear2 = 'Relaxing Earring',
    },
    -- Do not put gear here that you cannot equip or cannot use
    -- As any fastcast gear listed here will be factored in for midcast delay 
    Precast = { 
        Ear1 = 'Loquac. Earring', -- 2
        Legs = 'Homam Cosciales', -- 5
    },
    Interim = { -- Equipped between Precast and Midcast (after delay)
        Ear2 = 'Ethereal Earring',
        Head = 'Drn. Armet +1',
        Hands = 'Homam Manopolas',
        Legs = 'Wyrm Brais',
        Feet = 'Homam Gambieras',
    },
    Midcast = { -- Just before dragon determines whether to heal or not
        Head = 'Drn. Armet +1',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Legs = 'Homam cosciales',
        Feet = 'Homam Gambieras',
        Ring1 = 'Bomb Queen Ring', -- 75 HP
        Ring2 = 'Toreador\'s Ring', -- 10 HP
        Ear2 = 'Ethereal Earring', -- 15 HP
        Ammo = 'Happy Egg', -- 1% HP
    },

    -- Utility Sets

    MaxMP = {
        Neck = 'Uggalepih Pendant',
        Ring1 = 'Ether Ring',
        Ring2 = 'Astral Ring',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Phantom Earring',
        Head = 'Homam Zucchetto',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
        Ammo = 'Fortune Egg'
    },
    DragonRegen = {
        Body = 'Drachen Mail'
    },
    HealingBreath = {
        Head = 'Wym. Armet +1',
        Body = 'Wyvern Mail',
        Hands = 'Ostreger Mitts',
        Legs = 'Drn. Brais +1',
        Feet = 'Homam Gambieras',
    },
    ElementalBreath = {
        Head = 'Wym. Armet +1',
    },
    SpiritLink = {
        Head = 'Drn. Armet +1', -- MND + Player HP
        Body = 'Homam Corazza', -- Player HP
        Hands = 'Homam Manopolas', -- Player HP
        Legs = 'Drn. Brais +1', -- Player HP + Wyvern HP
        Feet = 'Homam Gambieras',
        Waist = 'Friar\'s Rope', -- MND
        Ring1 = 'Tamas Ring', -- MND
        Ring2 = 'Aqua Ring', -- MND
        Ammo = 'Happy Egg', -- Player HP
    },
    SteadyWing = { 
        Body = 'Wyvern Mail',
        Hands = 'Ostreger Mitts',
        Legs = 'Drn. Brais +1',
        Feet = 'Homam Gambieras'
    },
    AncientCircle = {
        Legs = 'Drn. Brais +1'
    },
    CallWyvern = {
        Body = 'Wyrm Mail'
    },
    Jump = {
        Head = 'Hecatomb cap',
        Body = 'Homam Corazza',
        Hands = 'Hecatomb Mittens',
        Legs = 'Drn. Brais +1',
        Feet = 'Drn. Greaves +1',
        Neck = 'Justice Torque', -- Need Love Torque
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Back = 'Forager\'s Mantle',
        Waist = 'Wyrm Belt',
        Ammo = 'Tiphia Sting',
    },
    HighJump = {
        Head = 'Hecatomb cap',
        Body = 'Homam Corazza',
        Hands = 'Hecatomb Mittens',
        Legs = 'Wyrm Brais',
        Feet = 'Drn. Greaves +1',
        Neck = 'Justice Torque', -- Need Love Torque
        Ring1 = 'Flame Ring',
        Ring2 = 'Vaulter\'s Ring',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
        Back = 'Forager\'s Mantle',
        Waist = 'Wyrm Belt',
        Ammo = 'Tiphia Sting',
    },
    Blunt = {
        Main = 'Bourdonasse'
    },
    Staff = {
        Main = 'Primate Staff'
    },

    -- Situation Sets

    Dynamis_TP = {

    },
    Dynamis_WS = {

    },
};
profile.Sets = sets;

local TPmode = {
    [1] = 'Default',
    [2] = 'Mid Accuracy',
    [3] = 'High Accuracy',
    [4] = 'Tank',
};

local WSmode = {
    [1] = 'Default',
    [2] = 'Mid Accuracy',
    [3] = 'High Accuracy',
};

local Settings = {
    Character = 'Saraji',
    LastCast = 0,
    LastBreath = 0,
    UseTank = false,
    UseSolo = false,
    UseBlunt = false,
    UseStaff = false,
    UseMaxMP = false,
    TPmode = nil,
    WSmode = nil,
    CurrentSubJob = nil,
    CurrentLevel = 0,
};


profile.OnLoad = function()

    shared.Unload();

    binds.Unbind_All();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    binds.Common_Load();
    binds.DRG_Load();
    binds.DRG_WS_VeryHigh_Load();
    aliases.Common_Load();
    aliases.DRG_Load();
    gSettings.AllowAddSet = true;

    shared.LockStyleSet();


    -- Setting up HandleCommand cycles and toggles
    shared.CreateCycle('TPmode', TPmode);
    shared.CreateCycle('WSmode', WSmode);
    Settings.TPmode = shared.GetCycle('TPmode');
    Settings.WSmode = shared.GetCycle('WSmode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ TP Mode: ' .. Settings.TPmode .. ' | WS Mode: ' .. Settings.WSmode .. ' ]--');

    shared.OnLoad();
    shared.SetCharacter(Settings.Character)

end

profile.OnUnload = function()

    binds.Common_Unload();
    binds.DRG_Unload();
    binds.DRG_WS_Unload();
    binds.DRG_SJ_Unload();
    aliases.Common_Unload();
    aliases.DRG_Unload();

    shared.Unload();

end

profile.HandleCommand = function(args)

    if (args[1] == 'maxmp') then
        Settings.UseMaxMP = not Settings.UseMaxMP;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Max MP Set ->> ' .. tostring(Settings.UseMaxMP):gsub("^%l", string.upper) .. ' ]--');
        return;
    elseif (args[1] == 'main') then
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    elseif (args[1] == 'tpcycle') then
        Settings.TPmode = shared.AdvanceCycle('TPmode');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ TP Mode: ' .. Settings.TPmode .. ' ]--');
        return;
    elseif (args[1] == 'wscycle') then
        Settings.WSmode = shared.AdvanceCycle('WSmode');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ WS Mode: ' .. Settings.WSmode .. ' ]--');
        return;
    elseif (args[1] == 'blunt') then
        Settings.UseBlunt = not Settings.UseBlunt;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Blunt Weapon ->> ' .. tostring(Settings.UseBlunt):gsub("^%l", string.upper) .. ' ]--');
        return;
    elseif (args[1] == 'staff') then
        Settings.UseStaff = not Settings.UseStaff;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Staff Weapon ->> ' .. tostring(Settings.UseStaff):gsub("^%l", string.upper) .. ' ]--');
        return;
    elseif (args[1] == 'solo') then
        Settings.UseSolo = not Settings.UseSolo;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Solo Gear ->> ' .. tostring(Settings.UseSolo):gsub("^%l", string.upper) .. ' ]--');
        return;
    elseif (args[1] == 'easy') then
        if shared.SetCycleToValue('TPmode', 'Default') then
            Settings.TPmode = 'Low Accuracy';
        end
        if shared.SetCycleToValue('WSmode', 'Low Accuracy') then
            Settings.WSmode = 'Low Accuracy';
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Easy Prey Set ][ TP Mode: ' .. Settings.TPmode .. ' | WS Mode: ' .. Settings.WSmode ..  ' ]--');
        return;
    elseif (args[1] == 'even') then
        if shared.SetCycleToValue('TPmode', 'Medium Accuracy') then
            Settings.TPmode = 'Medium Accuracy';
        end
        if shared.SetCycleToValue('WSmode', 'Medium Accuracy') then
            Settings.WSmode = 'Medium Accuracy';
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Even Monster Set ][ TP Mode: ' .. Settings.TPmode .. ' | WS Mode: ' .. Settings.WSmode ..  ' ]--');
        return;
    elseif (args[1] == 'tough') then
        if shared.SetCycleToValue('TPmode', 'High Accuracy') then
            Settings.TPmode = 'High Accuracy';
        end
        if shared.SetCycleToValue('WSmode', 'High Accuracy') then
            Settings.WSmode = 'High Accuracy';
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Very Tough Match Set ][ TP Mode: ' .. Settings.TPmode .. ' | WS Mode: ' .. Settings.WSmode ..  ' ]--');
        return;
    elseif (args[1] == 'tank') then
        shared.SetCycleToValue('TPmode', 'Tank') 
        Settings.TPmode = 'Tank';
        return;
    end
    shared.ProcessCommand(args);

end


profile.HandleDefault = function()

    -- Level Check
    profile.LevelCheck();
    profile.SubjobCheck();
    -- Naked Toggle
    if (shared.IsNaked()) then
        shared.UnequipGear();
        shared.SetCurrentSet('Naked');
        return;
    end
    -- Main combat checks
    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        if (Settings.TPmode == 'Tank') then
            gFunc.EquipSet(sets.TP_Tank);
            shared.SetCurrentSet('TP - Tank');
        elseif (Settings.TPmode == 'High Accuracy') then
            gFunc.EquipSet(sets.TP_HighAccuracy);
            shared.SetCurrentSet('TP - High Accuracy');
        elseif (Settings.TPmode == 'Medium Accuracy') then
            gFunc.EquipSet(sets.TP_MediumAccuracy);
            shared.SetCurrentSet('TP - Medium Accuracy');
        else
            gFunc.EquipSet(sets.TP);
            shared.SetCurrentSet('TP - Default');
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        shared.SetCurrentSet('Resting');
    else
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
    end
    -- Situational overwrites
    if Settings.UseBlunt then
        gFunc.EquipSet(sets.Blunt);
    end
    if Settings.UseStaff then
        gFunc.EquipSet(sets.Staff);
    end
    if Settings.UseMaxMP then
        gFunc.EquipSet(sets.MaxMP);
    end
    if Settings.UseSolo then
        gFunc.Equip('ear2', 'Ethereal Earring');
    end
    -- Healing Breath Handler
    local petAction = gData.GetPetAction();
    if (petAction ~= nil) then
        local now = os.clock()
		if (petAction.Name == "Healing Breath III" or petAction.Name == "Healing Breath II") then
			gFunc.EquipSet(sets.HealingBreath);
            if Settings.LastBreath == 0 or Settings.LastBreath == nil or (now - Settings.LastBreath) > 4	then
                AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom HealingBreath 4');
            end
        else
           gFunc.EquipSet(sets.ElementalBreath);
        end
        Settings.LastBreath = now
	end
    -- Rest Staff on 0 TP only
    if player.Status == 'Resting' and player.TP <= 0 and player.MainJobLevel >= 51  then
        gFunc.Equip('main', 'Pluto\'s Staff');
    end
    -- Movement Speed Gear
    -- Does not swap in movement gear during Healing Breath or when engaged
    if player.IsMoving and player.Status ~= 'Engaged' and (Settings.LastBreath == 0 or os.clock() > (Settings.LastBreath + 2)) then
            gFunc.Equip('legs', 'Blood Cuisses');
    end
    shared.GearOverride();

end


profile.HandleAbility = function()
    local action = gData.GetAction();
	if (action.Name == 'Jump') then
        gFunc.EquipSet(sets.Jump);
    elseif (action.Name == 'Ancient Circle') then
        gFunc.EquipSet(sets.AncientCircle);
    elseif (action.Name == 'High Jump') then
        gFunc.EquipSet(sets.HighJump);
    elseif (action.Name == 'Spirit Link') then
        gFunc.EquipSet(sets.SpiritLink);
    elseif (action.Name == 'Steady Wing') then
        gFunc.EquipSet(sets.SteadyWing);
    elseif (action.Name == 'Call Wyvern') then
        gFunc.EquipSet(sets.CallWyvern);
    end

end


profile.HandleItem = function()
end


profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast);
end


profile.HandleMidcast = function()
    shared.SetMidcastDelay(sets.Precast);
    gFunc.InterimEquipSet(sets.Interim);
    gFunc.EquipSet(sets.Midcast);

    -- Calculate spell cast time
    local action = gData.GetAction();
    local fastcast = shared.CalcFastCast(sets.Precast);
    Settings.LastCast =  os.clock() + (action.CastTime * (1 - fastcast))/1000;
end


profile.HandlePreshot = function()
    gFunc.Equip('ammo', 'Pebble');
end


profile.HandleMidshot = function()
end


profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Penta Thrust') then
        gFunc.EquipSet(sets.WS_HighAccuracy);
        shared.CurrentSet = 'WS';
    elseif (action.Name == 'Wheeling Thrust') then
        gFunc.EquipSet(sets.WS);
        gFunc.Equip('Neck', 'Light Gorget');
    else
        gFunc.EquipSet(sets.WS); -- Ignore accuracy mode. Most of the remaining useful WS have innate accuracy bonus on Horizon
    end
end


profile.AssignWeaponSkill = function(myLevel)

    if (Settings.UseWSLow == true) then
        binds.DRG_WS_Low_Load();
    elseif (Settings.UseWSMid == true) then
        binds.DRG_WS_Mid_Load();
    elseif (Settings.UseWSHigh == true) then
        binds.DRG_WS_High_Load();
    elseif (Settings.UseWSVeryHigh == true) then
        binds.DRG_WS_VeryHigh_Load();
    else
        if (myLevel == 0) then
            local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
        end
        -- Use Auto Assign based on Level
        if (myLevel <= 48) then
            binds.DRG_WS_Low_Load();
        elseif (myLevel >= 49 and myLevel < 55) then
            binds.DRG_WS_Mid_Load();
        elseif (myLevel >= 55 and myLevel < 65) then
            binds.DRG_WS_High_Load();
        elseif (myLevel >= 65) then
            binds.DRG_WS_VeryHigh_Load();
        end
    end

end


profile.SubjobCheck = function()

    local player = gData.GetPlayer();
    local subjob = player.SubJob;
    if subjob ~= 'NON' and subjob ~= Settings.CurrentSubJob then
        Settings.CurrentSubJob = subjob
        if (subjob == "SAM") then
            binds.DRG_SJ_SAM_Load();
        elseif (subjob == "WAR") then
            binds.DRG_SJ_WAR_Load();
        elseif (subjob == "WHM") then
            binds.DRG_SJ_WHM_Load();
        elseif (subjob == "RDM") then
            binds.DRG_SJ_RDM_Load();
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Sub Job Binds ->> ' .. subjob .. ' ]--');
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
        shared.LockStyleSet();
    end

end


profile.LevelCheck = function()
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    --local myLevel = 50;
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        profile.AssignWeaponSkill(myLevel);
    end

end


return profile;