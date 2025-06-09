local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {

    -- Idle Set

    Idle_Priority = {
        Main = {'Orichalcum Lance', 'Dreizack', 'Spear of Trials', 'Gnd.Kgt. Lance', 'Mythril Lance', 'Peregrine','Ryl.Sqr. Halberd', 'Obelisk Lance', 'Fuscina'},
        Head = {'Wym. Armet +1', 'Optical Hat', 'Walkure Mask', 'Centurion\'s Visor'},
        Ear1 = {'Brutal Earring', 'Merman\'s Earring', 'Spike Earring', 'Beetle earring +1'},
        Ear2 = {'Beastly Earring', 'Spike Earring', 'Beetle earring +1'},
        Neck = {'Peacock Amulet', 'Spike necklace'},
        Body = {'Barone Corazza', 'Scorpion Harness', 'Brigandine', 'Ctr. Scale Mail', 'Beetle Harness +1'},
        Hands = {'Wyrm Fng.Gnt.', 'Drachen Fng. Gnt.', 'Battle gloves'},
        Ring1 = {'Toreador\'s Ring','Sniper\'s Ring', 'Balance Ring'},
        Ring2 = {'Rajas Ring', 'Balance Ring'},
        Back = {'Forager\'s Mantle', 'Nomad\'s Mantle'},
        Waist = {'Swift Belt', 'Life Belt', 'Tilt Belt', 'Brave Belt'},
        Legs = {'Barone Cosciales', 'Drachen Brais', 'Republic Subligar'},
        Feet = {'Wyrm Greaves', 'Drachen Greaves', 'Ctr. Greaves'},
        Range = 'remove',
        Ammo = {'Tiphia Sting', 'Mille. Sachet'}
    },

    -- TP Sets

    TP_Priority = { -- Default: High Accuracy
        Main = {'Orichalcum Lance', 'Dreizack', 'Spear of Trials', 'Gnd.Kgt. Lance', 'Mythril Lance', 'Peregrine','Ryl.Sqr. Halberd', 'Obelisk Lance', 'Fuscina'},
        Head = {'Optical Hat', 'Walkure Mask', 'Centurion\'s Visor'},
        Ear1 = {'Brutal Earring', 'Merman\'s Earring', 'Spike Earring', 'Beetle earring +1'},
        Ear2 = {'Beastly Earring', 'Spike Earring', 'Beetle earring +1'},
        Neck = {'Peacock Amulet', 'Spike necklace'},
        Body = {'Scorpion Harness', 'Brigandine', 'Ctr. Scale Mail', 'Beetle Harness +1'},
        Hands = {'Wyrm Fng.Gnt.', 'Drachen Fng. Gnt.', 'Battle gloves'},
        Ring1 = {'Toreador\'s Ring','Sniper\'s Ring', 'Balance Ring'},
        Ring2 = {'Rajas Ring', 'Balance Ring'},
        Back = {'Forager\'s Mantle', 'Nomad\'s Mantle'},
        Waist = {'Swift Belt', 'Life Belt', 'Tilt Belt', 'Brave Belt'},
        Legs = {'Barone Cosciales', 'Drachen Brais', 'Republic Subligar'},
        Feet = {'Wyrm Greaves', 'Drachen Greaves', 'Ctr. Greaves'},
        Range = 'remove',
        Ammo = {'Tiphia Sting', 'Mille. Sachet'}
    },
    TP_MediumAccuracy = {
        Head = 'Wym. Armet +1',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Neck = 'Peacock Amulet',
        Body = 'Barone Corazza',
        Hands = 'Wyrm Fng.Gnt.',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Barone Cosciales',
        Feet = 'Wyrm Greaves',
        Range = 'remove',
        Ammo = 'Tiphia Sting',
    },
    TP_LowAccuracy = {
        Head = 'Wym. Armet +1',
        Ear1 = {'Brutal Earring', 'Merman\'s Earring', 'Spike Earring', 'Beetle earring +1'},
        Ear2 = {'Beastly Earring', 'Spike Earring', 'Beetle earring +1'},
        Neck = {'Peacock Amulet', 'Spike necklace'},
        Body = {'Barone Corazza', 'Scorpion Harness', 'Brigandine', 'Ctr. Scale Mail', 'Beetle Harness +1'},
        Hands = {'Wyrm Fng.Gnt.', 'Custom F Gloves'},
        Ring1 = 'Toreador\'s Ring',
        Ring2 = {'Rajas Ring', 'Balance Ring'},
        Back = {'Forager\'s Mantle', 'Nomad\'s Mantle'},
        Waist = {'Swift Belt', 'Sword Belt'},
        Legs = {'Barone Cosciales', 'Drachen Brais', 'Republic Subligar'},
        Feet = {'Wyrm Greaves', 'Drachen Greaves', 'Ctr. Greaves'},
        Range = 'remove',
        Ammo = {'Tiphia Sting', 'Mille. Sachet'}
    },

    -- Weaponskill Sets

    WS_Priority = { -- Default: Low Accuracy | High Damage
        Head = 'Wym. Armet +1',
        Neck = 'Spike necklace',
        Body = 'Barone Corazza',
        Ring1 = 'Puissance ring',
        Ring2 = 'Rajas Ring',
        Hands = 'Custom F Gloves',
        Waist = 'Warwolf Belt',
        Legs = 'Barone Cosciales', 
        Feet = 'Rutter Sabatons'
    },
    WS_MediumAccuracy_Priority = {
        Head = 'Wym. Armet +1',
        Body = 'Barone Corazza',
        Neck = 'Peacock Amulet',
        Hands = 'Custom F Gloves',
        Waist = 'Warwolf Belt',
        Legs = 'Barone Cosciales',
        Feet = 'Rutter Sabatons'
    },
    WS_HighAccuracy_Priority = {
        Head = 'Optical Hat',
        Body = 'Scorpion Harness',
        Neck = 'Peacock Amulet',
        Hands = 'Wyrm Fng.Gnt.',
        Waist = 'Warwolf Belt',
        Legs = 'Barone Cosciales',
        Feet = 'Rutter Sabatons',
        Ring1 = 'Toreador\'s Ring'
    },
    WS_STR = {
        Hands = 'Enkelados\'s Brc.'
    },
    Resting_Priority = {
        Feet = 'Wyrm Greaves'
    },
    -- Do not put gear here that you cannot equip or cannot use
    -- As any fastcast gear listed here will be factored in for midcast delay 
    Precast = { 
        --Ear1 = 'Loquacious Earring',
        Waist = 'Swift Belt'
    },
    Interim = { -- Equipped between Precast and Midcast (after delay)
        --Head = 'Drachen Armet',
        Ear2 = 'Ethereal Earring'
    },
    Midcast = { -- Just before dragon determines whether to heal or not
        Head = 'Drachen Armet'
    },

    -- Utility Sets

    MaxMP = {
        Neck = 'Uggalepih Pendant',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
        Hands = 'Custom F Gloves',
        Feet = 'Custom F Boots'
    },
    DragonRegen = {
        Body = 'Drachen Mail'
    },
    HealingBreath = {
        Head = 'Wym. Armet +1',
        Body = 'Wyvern Mail',
        Hands = 'Ostreger Mitts',
        Legs = 'Drachen Brais',
        Feet = 'Homam Gambieras',
    },
    ElementalBreath = {
        Head = 'Wym. Armet +1',
        Feet = 'Wyrm Greaves'
    },
    SpritLink = {
        Legs = 'Custom F Pants',
        Waist = 'Friar\'s Rope',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Neck = 'Justice Badge'
    },
    SteadyWing = {
        Body = 'Wyvern Mail',
        Hands = 'Ostreger Mitts',
        Legs = 'Drachen Brais',
        Feet = 'Homam Gambieras'
    },
    AncientCircle = {
        Legs = 'Drachen Brais'
    },
    Jump = {
        Head = 'Wym. Armet +1',
        Body = 'Barone Corazza',
        Legs = 'Barone Cosciales',
        Feet = 'Drachen Greaves',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring'
    },
    HighJump = {
        Head = 'Wym. Armet +1',
        Body = 'Barone Corazza',
        Legs = 'Barone Cosciales',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring'
    },
    Blunt = {
        Main = 'Bourdonasse'
    },

    -- Situation Sets

    Dynamis_TP = {
        Head = 'Optical Hat',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Neck = 'Merman\'s Gorget',
        Body = 'Scorpion Harness',
        Hands = 'Wyrm Fng.Gnt.',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Barone Cosciales',
        Feet = 'Wyrm Greaves',
        Range = 'remove',
        Ammo = 'Tiphia Sting',
    },
    Dynamis_WS = {
        Head = 'Walkure Mask',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Neck = 'Spike necklace',
        Body = 'Drachen Mail',
        Hands = 'Custom F Gloves',
        Ring1 = 'Puissance ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swordbelt',
        Legs = 'Barone Cosciales',
        Feet = 'Rutter Sabatons',
        Range = 'remove',
        Ammo = 'Tiphia Sting',
    },
    Tank = {
        Head = 'Darksteel Cap', -- 15k
        Body = 'Gavial Mail', -- 15k
        Hands = 'Darksteel Mittens',   -- 8k
        Legs = 'Gavial Cuisses', -- 6k
        Feet = 'Gavial Greaves', -- 8k
        Ring1 = 'Bomb Ring',
        Ear2 = 'Ethereal Earring',
        Back = 'Boxer\'s Mantle',
        Ammo = 'Happy Egg'
    },
    Solo = {
        Body = 'Barone Corazza',
        Ear2 = 'Ethereal Earring'
    }
};
profile.Sets = sets;

local TPmode = {
    [1] = 'High Accuracy',
    [2] = 'Medium Accuracy',
    [3] = 'Low Accuracy',
};

local WSmode = {
    [1] = 'Low Accuracy',
    [2] = 'Medium Accuracy',
    [3] = 'High Accuracy',
};

local Settings = {
    UseSolo = false,
    UseBlunt = false,
    UseMaxMP = false,
    TPmode = nil,
    WSmode = nil,
    CurrentSubJob = nil,
    CurrentLevel = 0
};


profile.OnLoad = function()

    binds.Unbind_All();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    binds.Common_Load();
    binds.DRG_Load();
    binds.DRG_WS_VeryHigh_Load();
    aliases.Common_Load();
    aliases.DRG_Load();
    gSettings.AllowAddSet = true;

    local player = gData.GetPlayer();
    if player.MainJob then 
        shared.LockStyleSet(player.MainJob);
    end

    -- Setting up HandleCommand cycles and toggles
    shared.CreateCycle('TPmode', TPmode);
    shared.CreateCycle('WSmode', WSmode);
    Settings.TPmode = shared.GetCycle('TPmode');
    Settings.WSmode = shared.GetCycle('WSmode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ TP Mode: ' .. Settings.TPmode .. ' | WS Mode: ' .. Settings.WSmode .. ' ]--');

    shared.OnLoad();

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
    elseif (args[1] == 'solo') then
        Settings.UseSolo = not Settings.UseSolo;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Solo Gear ->> ' .. tostring(Settings.UseSolo):gsub("^%l", string.upper) .. ' ]--');
        return;
    elseif (args[1] == 'easy') then
        if shared.SetCycleToValue('TPmode', 'Low Accuracy') then
            Settings.TPmode = 'Low Accuracy';
        end
        if shared.SetCycleToValue('WSmode', 'Low Accuracy') then
            Settings.WSmode = 'Low Accuracy';
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Easy Prey Set ][ TP Mode: ' .. Settings.TPmode .. ' | WS Mode: ' .. Settings.WSmode ..  ' ]--');
        return;
    elseif (args[1] == 'even') then
        if shared.SetCycleToValue('TPmode', 'Medium Accuracy') then
            Settings.WSmode = 'Medium Accuracy';
        end
        if shared.SetCycleToValue('WSmode', 'Medium Accuracy') then
            Settings.WSmode = 'Medium Accuracy';
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Even Monster Set ][ TP Mode: ' .. Settings.TPmode .. ' | WS Mode: ' .. Settings.WSmode ..  ' ]--');
        return;
    elseif (args[1] == 'tough') then
        if shared.SetCycleToValue('TPmode', 'High Accuracy') then
            Settings.WSmode = 'High Accuracy';
        end
        if shared.SetCycleToValue('WSmode', 'High Accuracy') then
            Settings.WSmode = 'High Accuracy';
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Even Match Set ][ TP Mode: ' .. Settings.TPmode .. ' | WS Mode: ' .. Settings.WSmode ..  ' ]--');
        return;
    end
    shared.ProcessCommand(args);

end


profile.HandleDefault = function()

    -- Level Check
    profile.LevelCheck();
    profile.SubjobCheck();

    if (shared.IsNaked()) then
        shared.UnequipGear();
        shared.SetCurrentSet('Naked');
        return;
    end
    -- Combat Check
    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        if (Settings.TPmode == 'Low Accuracy') then
            gFunc.EquipSet(sets.TP_LowAccuracy);
            shared.SetCurrentSet('TP - Low Accuracy');
            if Settings.UseSolo then
                gFunc.EquipSet(sets.Solo);
            end
        elseif (Settings.TPmode == 'Medium Accuracy') then
            gFunc.EquipSet(sets.TP_MediumAccuracy);
            shared.SetCurrentSet('TP - Medium Accuracy');
            if Settings.UseSolo then
                gFunc.EquipSet(sets.Solo);
            end
        else
            gFunc.EquipSet(sets.TP);
            shared.SetCurrentSet('TP - High Accuracy');
            if Settings.UseSolo then
                gFunc.EquipSet(sets.Solo);
            end
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        shared.SetCurrentSet('Resting');
    else
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
        if (pet ~= nil) and (pet.HPP < 100) then
            gFunc.EquipSet(sets.DragonRegen);
        end
    end

    if Settings.UseBlunt then
        gFunc.EquipSet(sets.Blunt);
    end

    if Settings.UseMaxMP then
        gFunc.EquipSet(sets.MaxMP);
    end

    if Settings.UseSolo then
        gFunc.EquipSet(sets.Solo);
    end

    local petAction = gData.GetPetAction();
    if (petAction ~= nil) then
		if (petAction.Name == "Healing Breath III" or petAction.Name == "Healing Breath II") then
			gFunc.EquipSet(sets.HealingBreath);						
        else
           gFunc.EquipSet(sets.ElementalBreath); 
        end
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
end


profile.HandlePreshot = function()
    gFunc.Equip('ammo', 'Pebble');
end


profile.HandleMidshot = function()
end


profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Penta Thrust') then
        if (Settings.WSmode == 'High Accuracy') then 
            gFunc.EquipSet(sets.WS_HighAccuracy);
        elseif (Settings.WSmode == 'Medium Accuracy') then 
            gFunc.EquipSet(sets.WS_MediumAccuracy);
        else
            gFunc.EquipSet(sets.WS);
        end
        shared.CurrentSet = 'WS';
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
        shared.LockStyleSet(player.MainJob);
    end

end


profile.LevelCheck = function()
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        profile.AssignWeaponSkill(myLevel);
    end

end


return profile;