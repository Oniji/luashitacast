local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {
    Weapon_WHM_Priority = {
        Main = {'Tungi', 'Viking Axe', 'Barbaroi Axe', 'Warrior\'s Axe', 'Battleaxe +1', 'Bone Axe +1', 'Legionnaire\'s Axe', 'Brass Axe', 'Bronze Axe' },
        Sub = {'Targe +1'}
    },
    Weapon_NIN_Priority = {
        --Main = {'Fransisca', 'Tungi', 'Viking Axe', 'Cmb.Cst. Axe', 'Warrior\'s Axe', 'Battleaxe +1', 'Bone Axe +1', 'Legionnaire\'s Axe', 'Brass Axe', 'Bronze Axe' },
        --Sub = {'Tungi', 'Viking Axe', 'Barbaroi Axe', 'Warrior\'s Axe', 'Battleaxe +1'},
        Main = 'Viking Axe',
        Sub = 'Viking Axe',
    },
    TP_Priority = {
        Head = {'Walkure Mask', 'Win. Headgear', 'Centurion\'s Visor', 'Beetle Mask +1', 'San. Bandana'},
        Neck = {'Peacock Amulet', 'Ryl.Grd. Collar', 'Spike Necklace', 'Bird Whistle'},
        Body = {'Scorpion Harness', 'Beast Jackcoat', 'Brigandine', 'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail', 'Beetle Harness +1','Bastokan Harness', 'Ducal Aketon'},
        Hands = {'Custom F Gloves', 'Battle Gloves', 'Chocobo Gloves'},
        Ring1 = {'Toreador\'s Ring', 'Deft Ring', 'Balance Ring', 'San d\'Orian Ring'},
        Ring2 = {'Rajas Ring', 'Balance Ring', 'Bastokan Ring'},
        Ear1 = {'Brutal Earring', 'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1', 'Bone Earring +1', 'Onyx Earring'},
        Ear2 = {'Beastly Earring', 'Spike Earring', 'Beetle Earring +1', 'Bone Earring +1', 'Onyx Earring'},
        Legs = {'Crow Hose', 'Republic Subligar', 'Beetle Subligar +1', 'Angler\'s hose', 'Chocobo Hose'},
        Feet = {'Crow Gaiters', 'Ctr. Greaves', 'Btl. Leggings +1', 'Bas. Leggings', 'Chocobo Boots'},
        Back = {'Amemet Mantle', 'Nomad\'s Mantle'},
        Waist = {'Swift Belt', 'Life Belt', 'Tilt Belt', 'Brave Belt', 'Leather Belt'},
        Ammo = 'Tiphia Sting'
    },
    Idle_Priority = {
        Head = {'Optical Hat', 'Walkure Mask', 'Win. Headgear', 'Centurion\'s Visor', 'Beetle Mask +1', 'San. Bandana'},
        Neck = {'Peacock Amulet', 'Spike Necklace', 'Bird Whistle'},
        Body = {'Scorpion Harness', 'Beast Jackcoat', 'Brigandine', 'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail', 'Beetle Harness +1','Bastokan Harness', 'Ducal Aketon'},
        Hands = {'Custom F Gloves', 'Battle Gloves', 'Chocobo Gloves'},
        Ring1 = {'Toreador\'s Ring', 'Sniper\'s Ring', 'Deft Ring', 'Balance Ring', 'Bastokan Ring'},
        Ring2 = {'Rajas Ring', 'Balance Ring', 'Bastokan Ring'},
        Ear1 = {'Brutal Earring', 'Merman\'s Earring', 'Spike Earring', 'Beetle Earring +1', 'Bone Earring +1', 'Onyx Earring'},
        Ear2 = {'Beastly Earring', 'Spike Earring', 'Beetle Earring +1', 'Bone Earring +1', 'Onyx Earring'},
        Legs = {'Crow Hose', 'Republic Subligar', 'Beetle Subligar +1', 'Angler\'s hose', 'Chocobo Hose'},
        Feet = {'Crow Gaiters', 'Ctr. Greaves', 'Btl. Leggings +1', 'Bas. Leggings', 'Chocobo Boots'},
        Back = {'Amemet Mantle', 'Nomad\'s Mantle'},
        Waist = {'Swift Belt', 'Life Belt', 'Tilt Belt', 'Brave Belt', 'Leather Belt'},  
    },
    WS_Priority = {
        Neck = {'Peacock Amulet'},
        Hands = {'Enkelados\'s Bracelets'},
        Legs = {'Republic Subligar'},
        Ring1 = {'Puissance Ring', 'Courage Ring'},
        Ring2 = {'Rajas Ring', 'Courage Ring'},
        Waist = {'Sword Belt', 'Brave Belt'},
        Feet = {'Rutter Sabatons'},
        Ammo = 'Tiphia Sting'
    },
    WS_Acc_Priority = {
        Neck = {'Peacock Amulet'},
        Hands = {'Custom F Gloves'},
        Legs = {'Republic Subligar'},
        Ring1 = {'Toreador\'s Ring', 'Courage Ring'},
        Ring2 = {'Rajas Ring', 'Courage Ring'},
        Waist = {'Life Belt'},
        Feet = {'Rutter Sabatons'},
        Ammo = 'Tiphia Sting'
    },
    Charm_Priority = {
        Head = {'Beast Helm', 'Noble\'s Ribbon'},
        Body = {'Monster Jackcoat','Gaudy Harness'},
        Hands = 'Beast Gloves',
        Legs = 'Beast Trousers',
        Feet = 'Beast Gaiters',
        Neck = 'Bird Whistle',
        Waist = 'Corsette',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Ear2 = 'Beastly Earring'
    },
    Reward_Priority = {
        Body = 'Beast Jackcoat',
        Feet = 'Beast Gaiters',
        Ammo = {'Pet Fd. Epsilon', 'Pet Food Delta', 'Pet Fd. Gamma', 'Pet Food Beta', 'Pet Food Alpha'}
    },
    Interim = {
        Ring1 = 'Saintly Ring' -- test
    },
    Midcast = {
        Ring1 = 'Balance Ring' -- test
    },
    MaxMP = {
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring'
    },
    Fifty = {

    }
};

local AmmoMode = {
    [1] = 'Combat', 
    [2] = 'Jug', 
    [3] = 'Food',
    [4] = 'Pulling'
};

local PetType = { 
    [1] = 'Default', 
    [2] = 'Sheep', 
    [3] = 'Tiger', 
    [4] = 'Beetle', 
    [5] = 'Crab', 
    [6] = 'Antlion', 
    [7] = 'Rabbit', 
    [8] = 'Sabotender'
};

profile.Sets = sets;

local Settings = {
    UseMaxMP = false,
    AmmoMode = 'Combat',
    PetType = 'Default',
    UsePetFood = false,
    CurrentSubJob = nil,
    CurrentLevel = 0
};

profile.SetMacroBook_BST = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 10');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end


profile.OnLoad = function()

    profile.LevelCheck();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.BST_Load();

    aliases.Common_Load();
    aliases.BST_Load();

    -- Setting up HandleCommand cycles and toggles
    shared.OnLoad();
    shared.CreateCycle('AmmoMode', AmmoMode);
    shared.CreateCycle('PetType', PetType);
    gSettings.AllowAddSet = true;

    shared.LockStyleSet();
end



profile.OnUnload = function()

    binds.Common_Unload();
    binds.BST_Unload();

    aliases.Common_Unload();
    aliases.BST_Unload();

    shared.Unload();
    
end


profile.HandleCommand = function(args)

    if (args[1] == 'main') then
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    elseif (args[1] == 'petfood') then
        Settings.UsePetFood = not Settings.UsePetFood;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Pet Food Equipped ->> ' .. tostring(Settings.UsePetFood):gsub("^%l", string.upper) .. ' ]--');
    elseif (args[1] == 'ammocycle') then
        Settings.AmmoMode = shared.AdvanceCycle('AmmoMode');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Ammo Mode ->> ' .. Settings.AmmoMode .. ' ]--');
    elseif (args[1] == 'pettype') then
        Settings.PetType = shared.AdvanceCycle('PetType');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Pet Type ->> ' .. Settings.PetType .. ' | Next: ' .. shared.GetCycleNext('PetType') .. ' ]--');
    elseif (args[1] == 'maxmp') then
        Settings.UseMaxMP = not Settings.UseMaxMP;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Max MP Gear ->> ' .. tostring(Settings.UseMaxMP):gsub("^%l", string.upper) .. ' ]--');
    end

    shared.ProcessCommand(args);

end


profile.HandleDefault = function()

    local player = gData.GetPlayer();

    profile.LevelCheck();
    profile.SubjobCheck();

    if (shared.IsNaked()) then
        shared.UnequipGear();
        return;
    end

    -- Weapons
    if player.SubJob == 'NIN' then
        gFunc.EquipSet(sets.Weapon_NIN);
    elseif player.SubJob == 'WHM' then
        gFunc.EquipSet(sets.Weapon_WHM);
    else
        gFunc.EquipSet(sets.Weapon_WHM);
    end


    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        shared.SetCurrentSet('Resting');
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
        shared.SetCurrentSet('TP');
    else
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
    end

    if (player.SubJob == 'WHM' and player.MainJobSync >= 50 and player.MP <= 49) then
        gFunc.Equip('Body', 'Gaudy Harness');
    end

    if (Settings.UseMaxMP) then
        gFunc.EquipSet(sets.MaxMP);
    end

    if Settings.AmmoMode == 'Jug' then
        profile.EquipJug();
    elseif Settings.AmmoMode == 'Food' then
        profile.EquipFood();
    end

    shared.GearOverride();

end


profile.HandleAbility = function()

    local action = gData.GetAction();
    if (action.Name == 'Charm') then
        gFunc.EquipSet(sets.Charm);
        shared.SetCurrentSet('Charm');
    elseif (action.Name == 'Reward') then
        gFunc.EquipSet(sets.Reward);
        shared.SetCurrentSet('Reward');
    end

end


profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
    gFunc.Equip('ammo', 'Pebble');
    shared.SetCurrentSet('Pulling');
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if action == 'Rampage' then
        gFunc.EquipSet(sets.WS_Acc);
        shared.SetCurrentSet('Weaponskill (Accuracy)');
    else
        gFunc.EquipSet(sets.WS);
        shared.SetCurrentSet('Weaponskill');
    end
    

end

profile.AssignWeaponSkill = function(myLevel)
    if myLevel >= 55 then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ws "Rampage" <t>');
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ws "Raging Axe" <t>');
    end

end

profile.SubjobCheck = function()
    
    local player = gData.GetPlayer();
    local subjob = player.SubJob;
    if subjob ~= 'NON' and subjob ~= Settings.CurrentSubJob then
        Settings.CurrentSubJob = subjob
        if (subjob == "WHM") then
            binds.BST_SJ_WHM_Load();
        elseif (subjob == "NIN") then
            binds.BST_SJ_NIN_Load();
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Sub Job Binds ->> ' .. subjob .. ' ]--');
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
        shared.LockStyleSet();
    end

end

profile.LevelCheck = function()

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    myLevel = 50;
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        profile.AssignWeaponSkill(myLevel);
    end

end

profile.EquipJug = function()
    if Settings.PetType == 'Default' then
        if Settings.CurrentLevel >= 43 then
            gFunc.Equip('ammo', 'S. Herbal Broth');
        elseif Settings.CurrentLevel >= 28 then
            gFunc.Equip('ammo', 'Grass. Broth');
        elseif Settings.CurrentLevel >= 23 then
            gFunc.Equip('ammo', 'Herbal Broth');
        end
    elseif Settings.PetType == 'Sheep' then
        if Settings.CurrentLevel >= 43 then
            gFunc.Equip('ammo', 'S. Herbal Broth');
        else 
            gFunc.Equip('ammo', 'Herbal Broth');
        end
    elseif Settings.PetType == 'Tiger' then
        if Settings.CurrentLevel >= 51 then
            gFunc.Equip('ammo', 'W. Meat Broth');
        else 
            gFunc.Equip('ammo', 'Meat Broth');
        end
    elseif Settings.PetType == 'Beetle' then
        if Settings.CurrentLevel >= 63 then
            gFunc.Equip('ammo', 'Scarlet Sap');
        else 
            gFunc.Equip('ammo', 'Tree Sap');
        end
    elseif Settings.PetType == 'Crab' then
        if Settings.CurrentLevel >= 55 then
            gFunc.Equip('ammo', 'Fish Oil Broth');
        else 
            gFunc.Equip('ammo', 'Fish Broth');
        end
    elseif Settings.PetType == 'Antlion' then
        if Settings.CurrentLevel >= 63 then
            gFunc.Equip('ammo', 'Fragrant Antica Broth');
        else 
            gFunc.Equip('ammo', 'Antica Broth');
        end
    elseif Settings.PetType == 'Rabbit' then
        if Settings.CurrentLevel >= 43 then
            gFunc.Equip('ammo', 'Famous Carrot Broth');
        else 
            gFunc.Equip('ammo', 'Carrot Broth');
        end
    elseif Settings.PetType == 'Sabotender' then
        gFunc.Equip('ammo', 'Sun Water');
    end

end

profile.EquipFood = function()
    if Settings.CurrentLevel >= 72 then
        gFunc.Equip('ammo', 'Pet Food Zeta');
    elseif Settings.CurrentLevel >= 60 then
        gFunc.Equip('ammo', 'Pet Fd. Epsilon');
    elseif Settings.CurrentLevel >= 48 then
        gFunc.Equip('ammo', 'Pet Food Delta');
    elseif Settings.CurrentLevel >= 36 then
        gFunc.Equip('ammo', 'Pet Food Gamma');
    elseif Settings.CurrentLevel >= 24 then
        gFunc.Equip('ammo', 'Pet Food Beta');
    elseif Settings.CurrentLevel >= 12 then
        gFunc.Equip('ammo', 'Pet Food Alpha');
    end
end


return profile;