local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {
    Idle_Priority = {
        Main = {'Blau Dolch', 'Hoplites Harpe', 'Cermet Kukri +1', 'Darksteel Kukri +1', 'Corsair\'s Knife', 'Bone Knife +1', 'Marauder\'s Knife', 'Federation Kukri', 'Federation Knife', 'Mercenary\'s Knife'},
        --Sub = {'Tatami Shield', 'Sirocco Kukri', 'Thief\'s Knife', 'Chicken Knife', 'Hornetneedle', 'Bone Knife +1', 'Federation Kukri', 'Federation Knife', 'Mercenary\'s Knife'},
        Head = {'Homam Zucchetto', 'Optical Hat', 'Emperor Hairpin', 'Beetle Mask +1'},
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Brutal Earring', 'Spike Earring', 'Beetle Earring +1'},
        Ear2 = {'Ethereal Earring', 'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1'},
        Body = {'Homam Corazza', 'Rapparee Harness', 'Brigandine', 'Mrc.Cpt. Doublet', 'Beetle Harness +1'},
        Hands = {'Homam Manopolas', 'Battle Gloves'},
        Ring1 = {'Toreador\'s Ring', 'Sniper\'s Ring', 'Deft Ring', 'Balance Ring'},
        Ring2 = {'Toreador\'s Ring', 'Sniper\'s Ring', 'Balance Ring'},
        Legs = {'Homam Cosciales', 'Republic Subligar', 'Beetle Subligar +1'},
        Feet = {'Homam Gambieras', 'Leaping Boots', 'Btl. Leggings +1'},
        Back = {'Forager\'s Mantle', 'Amemet Mantle +1', 'Nomad\'s Mantle', 'Dhalmel Mantle'},
        Waist = {'Swift Belt', 'Tilt Belt', 'Mrc.Cpt. Belt', 'Warrior\'s Belt'},
        Range = {'Thug\'s Zamburak', 'Power Crossbow', 'Crossbow'},
    },
    TP_Priority = {
        Head = {'Homam Zucchetto', 'Optical Hat', 'Emperor Hairpin', 'Beetle Mask +1'},
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1'},
        Ear2 = {'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1'},
        Body = {'Rapparee Harness', 'Brigandine', 'Mrc.Cpt. Doublet', 'Beetle Harness +1'},
        Hands = {'Homam Manopolas', 'Battle Gloves'},
        Ring1 = {'Toreador\'s Ring', 'Sniper\'s Ring', 'Deft Ring', 'Balance Ring'},
        Ring2 = {'Toreador\'s Ring', 'Sniper\'s Ring', 'Rajas Ring', 'Balance Ring'},
        Legs = {'Homam Cosciales', 'Republic Subligar', 'Beetle Subligar +1'},
        Feet = {'Homam Gambieras', 'Leaping Boots', 'Btl. Leggings +1'},
        Back = {'Forager\'s Mantle', 'Amemet Mantle +1',  'Nomad\'s Mantle', 'Dhalmel Mantle'},
        Waist = {'Swift Belt', 'Tilt Belt', 'Mrc.Cpt. Belt', 'Warrior\'s Belt'},
    },
    TP_Tigers_Priority = {
        Head = {'Homam Zucchetto', 'Emperor Hairpin', 'Beetle Mask +1'},
        Neck = {'Nanaa\'s Charm', 'Spike Necklace'},
        Ear1 = {'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1'},
        Ear2 = {'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1'},
        Body = {'Rapparee Harness', 'Brigandine', 'Mrc.Cpt. Doublet', 'Beetle Harness +1'},
        Hands = {'Homam Manopolas', 'Custom F Gloves'},
        Ring1 = {'Toreador\'s Ring', 'Sniper\'s Ring', 'Deft Ring', 'Balance Ring'},
        Ring2 = {'Toreador\'s Ring',  'Balance Ring'},
        Legs = {'Homam Cosciales', 'Republic Subligar', 'Beetle Subligar +1'},
        Feet = {'Homam Gambieras', 'Leaping Boots', 'Btl. Leggings +1'},
        Back = {'Forager\'s Mantle', 'Amemet Mantle +1',  'Nomad\'s Mantle', 'Dhalmel Mantle'},
        Waist = {'Sword Belt', 'Tilt Belt', 'Mrc.Cpt. Belt', 'Warrior\'s Belt'},
    },
    WS_Priority = {
        Head = {'Emperor Hairpin', 'Beetle Mask +1'},
        Neck = {'Spike Necklace'},
        Hands = {'Custom F Gloves', 'Battle Gloves'},
        Legs = 'Noct Brais +1',
        Feet = {'Leaping Boots', 'Btl. Leggings +1'},
        Back = {'Forager\'s Mantle', 'Amemet Mantle +1',  'Nomad\'s Mantle', 'Dhalmel Mantle'},
        Waist = {'Royal Knight\'s Belt', 'Mrc.Cpt. Belt', 'Warrior\'s Belt'},
        Ring1 = {'Grace Ring', 'Deft Ring', 'Balance Ring'},
        Ring2 = {'Grace Ring', 'Balance Ring'},
        Ear1 = {'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1'},
        Ear2 = {'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1'},
    },
    WS_AGI_Priority = { -- Shark Bite Only
        Head = {'Emperor Hairpin', 'Beetle Mask +1'},
        Neck = {'Spike Necklace'},
        Hands = {'Battle Gloves'},
        Feet = {'Leaping Boots', 'Btl. Leggings +1'},
        Waist = {'Mrc.Cpt. Belt', 'Warrior\'s Belt'},
        Ring1 = {'Grace Ring', 'Deft Ring', 'Balance Ring'},
        Ring2 = {'Grace Ring', 'Balance Ring'},
        Ear1 = {'Drone Earring'},
        Ear2 = {'Drone Earring'},
    },
    WS_Multi_Priority = {
        Neck = 'Peacock Amulet',
        Legs = 'Noct Brais +1',
        Ring1 = {'Toreador\'s Ring', 'Sniper\'s Ring'},
        Ring2 = {'Toreador\'s Ring', 'Sniper\'s Ring'},
        Waist = {'Life Belt', 'Tilt Belt'},
    },
    SA_Priority = {
        Neck = 'Spike Necklace',
        Legs = 'Noct Brais +1',
        Ring1 = {'Grace Ring', 'Deft Ring', 'Balance Ring'},
        Ring2 = {'Grace Ring', 'Balance Ring'},
    },
    TA_Priority = {
        Neck = 'Spike Necklace',
        Ear1 = {'Drone Earring'},
        Ear2 = {'Drone Earring'},
        Ring1 = {'Celerity Ring', 'Alacrity Ring'},
        Ring2 = {'Celerity Ring', 'Alacrity Ring'},
    },
    SATA_Priority = {
        Neck = 'Spike Necklace',
        Legs = 'Noct Brais +1',
        Ear1 = {'Drone Earring'},
        Ear2 = {'Drone Earring'},
        Ring1 = {'Grace Ring', 'Deft Ring', 'Balance Ring'},
        Ring2 = {'Grace Ring', 'Balance Ring'},
    },
    Ranged_Priority = {
        Legs = 'Noct Brais +1',
        Ear1 = {'Drone Earring'},
        Ear2 = {'Drone Earring'},
        Ring1 = {'Horn Ring +1'},
        Ring2 = {'Horn Ring +1'},
    },
    Evasion = {
        Body = 'Scorpion Harness',
        Gloves = 'War Gloves',
        Head = 'Optical Hat',
        Ear1 = 'Ethereal Earring',
        Feet = 'Crow Gaiters',
    },
    Flee = {
        Feet = 'Rogue\'s Poulaines',
    },
    Steal = {
        Hands = 'Rogue\'s Armlets',
        --Hands = 'Assassin\'s Culottes'.
        Head = 'Rogue\'s Bonnet',
        Legs = 'Rogue\'s Culottes',
        Feet = 'Rogue\'s Poulaines',
    },
    Hide = {
        Body = 'Rogue\'s Vest'
    },
    Mug = {
        Head = 'Assassin\'s Bonnet'
    },
    TH = {
        Neck = 'Nanaa\'s Charm',
        --Hands = 'Assassin\'s Armlets',
    },
    Precast = {
        Ear1 = 'Loquac. Earring',
        Waist = 'Swift Belt',
    },

};
profile.Sets = sets;

local timeout = 2; -- seconds
local sa_timeout = 0;
local ta_timeout = 0;

local AmmoType = {
    [1] = 'Acid Bolt',
    [2] = 'Crossbow Bolt',
    [3] = 'Sleep Bolt',
    [4] = 'Bloody Bolt',
    [5] = 'None',
};


local Settings = {
    Character = 'Saraji',
    AmmoType = 'None',
    TH = true,
    Evasion = false,
    CurrentLevel = 0
};


profile.OnLoad = function()
    shared.Unload();

    binds.Unbind_All();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.THF_Load();
    aliases.Common_Load();
    aliases.THF_Load();
    gSettings.AllowAddSet = true;

    shared.LockStyleSet();

    -- Setting up HandleCommand cycles and toggles
    shared.CreateCycle('AmmoType', AmmoType);
    Settings.AmmoType = shared.GetCycle('AmmoType');
    shared.OnLoad();
    shared.SetCharacter(Settings.Character)

end

profile.OnUnload = function()

    binds.Common_Unload();
    binds.THF_Unload();
    aliases.Common_Unload();
    aliases.THF_Unload();

    shared.Unload();

end

profile.HandleCommand = function(args)

    if (args[1] == 'main') then
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    elseif args[1] == 'ranged_bolt' then
        if shared.SetCycleToValue('AmmoType', 'Crossbow Bolt') then
            Settings.AmmoType = 'Crossbow Bolt';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Ranged Ammo --> Crossbow Bolt ]--');
        end
        return;
    elseif args[1] == 'ranged_acid_bolt' then
        if shared.SetCycleToValue('AmmoType', 'Acid Bolt') then
            Settings.AmmoType = 'Acid Bolt';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Ranged Ammo --> Acid Bolt ]--');
        end
        return;
    elseif args[1] == 'ranged_sleep_bolt' then
        if shared.SetCycleToValue('AmmoType', 'Sleep Bolt') then
            Settings.AmmoType = 'Sleep Bolt';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Ranged Ammo --> Sleep Bolt ]--');
        end
        return;
    elseif args[1] == 'ranged_bloody_bolt' then
        if shared.SetCycleToValue('AmmoType', 'Bloody Bolt') then
            Settings.AmmoType = 'Bloody Bolt';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Ranged Ammo --> Bloody Bolt ]--');
        end
        return;
    elseif (args[1] == 'th') then
        Settings.TH = not Settings.TH;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Treasure Hunter Mode ->> ' .. (Settings.TH and 'On' or 'Off') .. ' ]--');
    elseif (args[1] == 'eva') then
        Settings.Evasion = not Settings.Evasion;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Evasion Mode ->> ' .. (Settings.Evasion and 'On' or 'Off') .. ' ]--');
     
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
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
        shared.SetCurrentSet('TP');
        if Settings.TH then
            gFunc.Equip('neck', 'Nanaa\'s Charm');
        end
    else
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
        if Settings.TH then
            gFunc.Equip('neck', 'Nanaa\'s Charm');
        end
    end

    -- Equip Ammo
    if Settings.AmmoType == 'Crossbow Bolt' then
        gFunc.Equip('ammo', 'Crossbow Bolt');
    elseif Settings.AmmoType == 'Acid Bolt' then
        gFunc.Equip('ammo', 'Acid Bolt');
    elseif Settings.AmmoType == 'Sleep Bolt' then
        gFunc.Equip('ammo', 'Sleep Bolt');
    elseif Settings.AmmoType == 'Bloody Bolt' then
        gFunc.Equip('ammo', 'Bloody Bolt');
    end

    profile.EquipSATA();

    shared.GearOverride();

    if player.IsMoving then
        gFunc.Equip('feet', 'Trotter Boots');
    end


end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if action.Name == 'Sneak Attack' then
        sa_timeout = os.clock() + timeout;
    elseif action.Name == 'Trick Attack' then
        ta_timeout = os.clock() + timeout;
    elseif action.Name == 'Flee' then
        gFunc.EquipSet(sets.Flee);
        shared.SetCurrentSet('Flee');
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast);
end

profile.HandleMidcast = function()
    local action = gData.GetAction();
    if action.Name == 'Invisible' or action.Name == 'Sneak' then
        --gFunc.Equip('back', 'Skulker\'s Cape');
        if action.Name == 'Sneak' then
            gFunc.Equip('feet', 'Dream Boots +1');
        elseif action.Name == 'Invisible' then
            gFunc.Equip('hands', 'Dream Mittens +1');
        end
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged);
    shared.SetCurrentSet('Ranged');
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    local sata = '';
    if action == 'Shark Bite' then
        gFunc.EquipSet(sets.WS_AGI);
        sata = profile.EquipSATA();
        shared.SetCurrentSet(sata .. 'WS + AGI');
    elseif action == 'Evisceration' or action == 'Dancing Edge' then
        gFunc.EquipSet(sets.WS);
        gFunc.EquipSet(sets.WS_Multi);
        sata = profile.EquipSATA();
        shared.SetCurrentSet(sata .. 'WS + Multi-Hit');
    else
        gFunc.EquipSet(sets.WS);
        sata = profile.EquipSATA();
        shared.SetCurrentSet(sata .. 'WS');
    end

end

profile.EquipSATA = function()
    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')
    if (sa > 0 and ta > 0) or (os.clock() < sa_timeout and os.clock() < ta_timeout) then
        gFunc.EquipSet(sets.SATA)
        shared.SetCurrentSet('SATA');
        return 'SATA + ';
    elseif (sa > 0) or (os.clock() < sa_timeout) then
        gFunc.EquipSet(sets.SA)
        shared.SetCurrentSet('SA');
        return 'SA + ';
    elseif (ta > 0) or (os.clock() < ta_timeout) then
        gFunc.EquipSet(sets.TA)
        shared.SetCurrentSet('TA');
        return 'TA + ';
    end
    return '';
end

profile.TreasureHunterTag = function()

end

profile.SubjobCheck = function()
    local player = gData.GetPlayer();
    local subjob = player.SubJob;
    if subjob ~= 'NON' and subjob ~= Settings.CurrentSubJob then
        Settings.CurrentSubJob = subjob
        if (subjob == "NIN") then
            binds.THF_Load();
        elseif (subjob == "BST") then
            binds.THF_Load();
            binds.THF_BST_Load();
        elseif (subjob == "WAR") then
            binds.THF_Load();
            binds.THF_WAR_Load();
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Sub Job Binds ->> ' .. subjob .. ' ]--');
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
        shared.LockStyleSet();
    end

end

profile.LevelCheck = function()
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end

end

return profile;