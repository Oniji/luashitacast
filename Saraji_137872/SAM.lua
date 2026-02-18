local profile = {};
local sets = {
    TP_Priority = {
        Main = {'Homura +1', 'Kotetsu', 'Okanehira', 'Gunromaru', 'Katayama', 'Tachi'},
        Head = {'Centurion\'s Visor', 'Fed. Hachimaki', 'Mrc. Hachimaki', 'Ryl.Ftm. Bandana'},
        Neck = {'Spike necklace', 'Wing Pendant'},
        Ear1 = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Ear2 = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Body = {'Ctr. Scale Mail', 'Beetle Harness +1', 'Power Gi', 'Ryl.Ftm. Vest'},
        Hands = {'Custom F Gloves', 'Kingdom Gloves', 'Ryl.Ftm. Gloves'},
        Ring1 = {'Balance Ring', 'San d\'Orian Ring'},
        Ring2 = {'Balance Ring', 'Brass Ring'},
        Back = {'Wolf Mantle', 'Dhalmel Mantle', 'Rabbit Mantle'},
        Waist = {'Brave Belt', 'Leather Belt'},
        Legs = {'Republic Subligar', 'Beetle Subligar +1', 'Angler\'s hose', 'Leather Trousers'},
        Feet = {'Ctr. Greaves', 'Btl. Leggings +1', 'Ryl.Ftm. Boots'},
    },
    WS_Priority = {
        Ring1 = 'Puissance ring',
        Ring2 = 'Puissance ring',
        Hands = 'Custom F Gloves'
    },
    Chocobo = {
        Body = 'Choc. Jack Coat',
        Hands = 'Chocobo gloves',
        Legs = 'Chocobo hose',
        Feet = 'Chocobo boots'
    },
    Fishing = {
        Body = 'Angler\'s tunica',
        Hands = 'Angler\'s gloves',
        Legs = 'Angler\'s hose',
        Feet = 'Angler\'s boots',
        Range = 'Halcyon Rod',
        Ammo = 'Fly Lure'
    },
    WarpCudgel = {
        Main = 'Warp Cudgel'
    },
    EmpBand = {
        Ring1 = 'Emperor Band'
    }
};
profile.Sets = sets;

profile.SetMacroBook_SAM = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 9');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.SetMacroBook_Chocobo = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 20');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

--[[ Keybinds ]]

profile.Keybinds_Common = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F1 /lac fwd main');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F2 /lac fwd fishing');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F3 /lac fwd chocobo');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F4 /lac fwd warpcudgel');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F5 /lac fwd empband');
end

profile.Keybinds_SAM = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind q /attack');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind e /ra <t>; /p Fishing > <t> <call14>');
end

--[[ Unbinds ]]

profile.Unbinds_Common = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F5');
end

profile.Unbinds_SAM = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind q');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind e');
end

--[[ Aliases ]]
profile.Aliases_SAM = function()
end


profile.Packer = {
};

local Settings = {
    UseChocobo = false,
    UseFishing = false,
    UseWarpCudgel = false,
    UseEmperorBand = false,
    CurrentLevel = 0
};


profile.OnLoad = function()
    shared.Unload();

    profile.SetMacroBook_SAM();
    profile.Keybinds_SAM();
    profile.Keybinds_Common();
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /main /lac fwd main');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /fishing /lac fwd fishing');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /chocobo /lac fwd chocobo');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /warpcudgel /lac fwd warpcudgel');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /empband /lac fwd empband');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /iwarp /item "Instant Warp" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /cwarp /item "Warp Cudgel" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /eband /item "Emperor Band" <me>');

    shared.OnLoad();
end

profile.OnUnload = function()
    profile.Unbinds_SAM();
    profile.Unbinds_Common();
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /main');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /fishing');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /chocobo');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /warpcudgel');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /empband');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /iwarp');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /cwarp');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /eband');

    shared.Unload();
end

profile.HandleCommand = function(args)
    if (args[1] == 'chocobo') then
        Settings.UseChocobo = true;
        Settings.UseFishing = false;
        Settings.UseWarpCudgel = false;
        Settings.UseEmperorBand = false;
        profile.SetMacroBook_Chocobo();
    elseif (args[1] == 'fishing') then
        Settings.UseFishing = true;
        Settings.UseChocobo = false;
        Settings.UseWarpCudgel = false;
        Settings.UseEmperorBand = false;
        profile.SetMacroBook_Chocobo();
    elseif (args[1] == 'warpcudgel') then
        Settings.UseFishing = false;
        Settings.UseChocobo = false;
        Settings.UseEmperorBand = false;
        Settings.UseWarpCudgel = true;
        AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom WarpCudgel 30');
    elseif (args[1] == 'empband') then
        Settings.UseFishing = false;
        Settings.UseChocobo = false;
        Settings.UseWarpCudgel = false;
        Settings.UseEmperorBand = true;
        AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom EmperorBand 30');
    elseif (args[1] == 'main') then
        Settings.UseFishing = false;
        Settings.UseChocobo = false;
        Settings.UseWarpCudgel = false;
        Settings.UseEmperorBand = false;
        profile.SetMacroBook_SAM();
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end
    if (Settings.UseChocobo == true) then
        gFunc.EquipSet(sets.Chocobo);
    elseif (Settings.UseFishing == true) then
        gFunc.EquipSet(sets.Fishing);
    elseif (Settings.UseWarpCudgel == true) then
        gFunc.EquipSet(sets.WarpCudgel)
    elseif (Settings.UseEmperorBand == true) then
        gFunc.EquipSet(sets.EmpBand);
    else
        gFunc.EquipSet(sets.TP);
    end
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

return profile;