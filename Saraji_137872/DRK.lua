local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {

    Idle_Priority = {
        Main = {'Mrc.Cpt. Scythe', 'Frostreaper', 'Cruel Scythe', 'Republic Scythe', 'Lgn. Scythe'},
        --Sub = {},
        Range = {'Power Crossbow', 'Crossbow'},
        Ammo = {},
        Head = {'Emperor Hairpin', 'Beetle Mask +1', 'Bone Mask +1', 'Ryl.Ftm. Bandana'},
        Body = {'Beetle Harness +1', 'Bone Harness +1', 'Lgn. Harness'},
        Hands = {'Kingdom Gloves', 'Ryl.Ftm. Gloves'},
        Legs = {'Republic Subligar', 'Beetle Subligar +1', 'Bone Subligar +1', 'Brass Subligar'},
        Feet = {'Leaping Boots'},
        Neck = {'Spike Necklace', 'Rep.Bronze Medal'},
        Ring1 = {'Balance Ring', 'San d\'Orian Ring'},
        Ring2 = {'Balance Ring', 'Bastokan Ring'},
        Ear1 = {'Beetle Earring +1', 'Bone Earring +1'},
        Ear2 = {'Beetle Earring +1', 'Bone Earring +1'},
        Back = {'Nomad\'s Mantle', 'Dhalmel Mantle', 'Rabbit Mantle'},
        Waist = {'Brave Belt', 'Warrior\'s Belt', 'Blood Stone'},
    },

    -- TP Sets

    TP_Priority = { -- Default: High Accuracy
        --Main = {'Cruel Scythe', 'Republic Scythe', 'Lgn. Scythe'},
        --Sub = {},
        Range = {'Power Crossbow', 'Crossbow'},
        Ammo = {},
        Head = {'Emperor Hairpin', 'Beetle Mask +1', 'Bone Mask +1', 'Ryl.Ftm. Bandana'},
        Body = {'Beetle Harness +1', 'Bone Harness +1', 'Lgn. Harness'},
        Hands = {'Kingdom Gloves', 'Ryl.Ftm. Gloves'},
        Legs = {'Republic Subligar', 'Beetle Subligar +1', 'Bone Subligar +1', 'Brass Subligar'},
        Feet = {'Leaping Boots'},
        Neck = {'Spike Necklace', 'Rep.Bronze Medal'},
        Ring1 = {'Balance Ring', 'San d\'Orian Ring'},
        Ring2 = {'Balance Ring', 'Bastokan Ring'},
        Ear1 = {'Beetle Earring +1', 'Bone Earring +1'},
        Ear2 = {'Beetle Earring +1', 'Bone Earring +1'},
        Back = {'Nomad\'s Mantle', 'Dhalmel Mantle', 'Rabbit Mantle'},
        Waist = {'Brave Belt', 'Warrior\'s Belt', 'Blood Stone'},
    },
    -- Weaponskill Sets

    WS = { -- Default: Low Accuracy | High Damage
        Ring1 = {'Courage Ring'},
        Ring2 = {'Courage Ring'},
    },
};
profile.Sets = sets;

local TPmode = {
    [1] = 'High Accuracy',
    [2] = 'Medium Accuracy',
    [3] = 'Low Accuracy',
    [4] = 'Tank',
};

local WSmode = {
    [1] = 'Low Accuracy',
    [2] = 'Medium Accuracy',
    [3] = 'High Accuracy',
};

local Settings = {
    TPmode = nil,
    WSmode = nil,
    CurrentSubJob = nil,
    CurrentLevel = 0,
};


profile.OnLoad = function()

    binds.Unbind_All();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    binds.Common_Load();
    binds.DRK_Load();
    aliases.Common_Load();
    aliases.DRK_Load();
    gSettings.AllowAddSet = true;

    shared.LockStyleSet();

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
    binds.DRK_Unload();
    aliases.Common_Unload();
    aliases.DRK_Unload();

    shared.Unload();

end

profile.HandleCommand = function(args)

    if (args[1] == 'main') then
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    elseif (args[1] == 'tpcycle') then
        Settings.TPmode = shared.AdvanceCycle('TPmode');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ TP Mode: ' .. Settings.TPmode .. ' ]--');
        return;
    elseif (args[1] == 'wscycle') then
        Settings.WSmode = shared.AdvanceCycle('WSmode');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ WS Mode: ' .. Settings.WSmode .. ' ]--');
        return;
    end
    shared.ProcessCommand(args);

end


profile.HandleDefault = function()

    -- Level Check
    profile.LevelCheck();

    if (shared.IsNaked()) then
        shared.UnequipGear();
        shared.SetCurrentSet('Naked');
        return;
    end
    -- Combat Check
    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
        shared.SetCurrentSet('TP');
    else
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
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
end


profile.HandlePreshot = function()
end


profile.HandleMidshot = function()
end


profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS);
end


profile.LevelCheck = function()
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end

end


return profile;