local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {
    Idle_Priority = {
        Main = {'Federation Knife', 'Mercenary\'s Knife'},
        Sub = {'Federation Knife', 'Mercenary\'s Knife'},
        Head = {'Beetle Mask +1'},
        Neck = {'Peacock Charm', 'Spike Necklace'},
        Ear1 = {'Beetle Earring +1'},
        Ear2 = {'Beetle Earring +1'},
        Body = {'Beetle Harness +1'},
        Hands = {'Battle Gloves'},
        Ring1 = {'Balance Ring'},
        Ring2 = {'Balance Ring'},
        Legs = {'Republic Subligar', 'Beetle Subligar +1'},
        Feet = {'Btl. Leggings +1'},
        Back = {'Nomad\'s Mantle', 'Dhalmel Mantle'},
        Waist = {'Warrior\'s Belt'},
        Range = {'Power Crossbow', 'Crossbow'},
        Ammo = {'Acid Bolt'}
    },
    TP_Priority = {
        Main = {'Federation Knife', 'Mercenary\'s Knife'},
        Sub = {'Federation Knife', 'Mercenary\'s Knife'},
        Head = {'Beetle Mask +1'},
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Beetle Earring +1'},
        Ear2 = {'Beetle Earring +1'},
        Body = {'Beetle Harness +1'},
        Hands = {'Battle Gloves'},
        Ring1 = {'Balance Ring'},
        Ring2 = {'Balance Ring'},
        Legs = {'Republic Subligar', 'Beetle Subligar +1'},
        Feet = {'Btl. Leggings +1'},
        Back = {'Nomad\'s Mantle', 'Dhalmel Mantle'},
        Waist = {'Warrior\'s Belt'},
        Range = {'Power Crossbow', 'Crossbow'},
        Ammo = {'Acid Bolt'}
    },

};
profile.Sets = sets;

local Settings = {
    CurrentLevel = 0
};


profile.OnLoad = function()

    binds.Unbind_All();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.THF_Load();

    aliases.Common_Load();
    aliases.THF_Load();

    gSettings.AllowAddSet = true;

    local player = gData.GetPlayer();
    if player.MainJob then 
        shared.LockStyleSet(player.MainJob);
    end

    -- Setting up HandleCommand cycles and toggles
    shared.OnLoad();

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
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
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
end

profile.HandlePreshot = function()
    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.Equip('ammo','Acid Bolt');
    else
        gFunc.Equip('ammo','Acid Bolt');
    end

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