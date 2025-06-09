local profile = {};
local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local sets = {
    TP_Priority = {
        Main = {'Kodachi +1', 'Busuto +1', 'Suzume', 'Gassan', 'Shinobi-Gatana', 'Wakizashi'},
        Sub = {'Kodachi +1', 'Fukuro', 'Suzume', 'Shinobi-Gatana', 'Wakizashi'},
        Head = {'Ryl. Squire\'s Helm', 'Beetle Mask +1', 'Cotton Headband', 'Ryl.Ftm. Bandana'},
        Neck = {'Spike Necklace', 'Wing Pendant'},
        Ear1 = {'Optical Earring', 'Opal Earring'},
        Ear2 = {'Beetle Earring +1', 'Opal Earring'},
        Body = {'Ryl. Squire\'s Chainmail', 'Windurstian Gi', 'Custom Vest', 'Beetle Harness +1', 'Bone Harness +1', 'Power Gi', 'Ryl.Ftm. Vest'},
        Hands = {'Ryl.Sqr. Mufflers', 'Beetle Mittens +1', 'Kingdom Gloves', 'Ryl.Ftm. Gloves'},
        Ring1 = {'Reflex Ring', 'San d\'Orian Ring'},
        Ring2 = {'Reflex Ring', 'Windurstian Ring', 'Brass Ring'},
        Back = {'Breath Mantle', 'Rabbit Mantle'},
        Waist = {'Warrior\'s Belt +1', 'Leather Belt'},
        Legs = {'Ryl.Sqr. Breeches', 'Republic Subligar', 'Beetle Subligar +1', 'Republic Subligar', 'Bone Leggings +1', 'Brass Subligar'},
        Feet = {'Ryl.Sqr. Sollerets', 'Btl. Leggings +1', 'Ryl.Ftm. Boots'},
        Range = 'empty',
        Ammo = 'Mille. Sachet'
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
    EmperorBand = {
        Ring1 = 'Emperor Band'
    },
    EmpressBand = {
        Ring1 = 'Empress Band'
    },
    ChariotBand = {
        Ring1 = 'Chariot Band'
    },
    ExpBand = {
        Ring1 = {'Chariot Band', 'Empress Band', 'Emperor Band'}
    }
};
profile.Sets = sets;

profile.SetMacroBook_NIN = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 6');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.SetMacroBook_Chocobo = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 20');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end


profile.Packer = {
};

local Settings = {
    UseWarpCudgel = false,
    UseExpRing = false,
    CurrentMode = nil,
    CurrentSubJob = nil,
    CurrentLevel = 0
};

profile.OnLoad = function()
    profile.SetMacroBook_NIN();
    binds.Common_Load();
    binds.NIN_Load();
    aliases.Common_Load();
    Settings.CurrentMode = 'main';
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyleset 41');

    shared.OnLoad();
end

profile.OnUnload = function()
    binds.Common_Unload();
    binds.NIN_Unload();
    aliases.Common_Unload();

    shared.Unload();
end

profile.HandleCommand = function(args)
    if (args[1] == 'chocobo') then
        Settings.CurrentMode = 'chocobo';
        profile.SetMacroBook_Chocobo();
    elseif (args[1] == 'fishing') then
        Settings.CurrentMode = 'fishing';
        profile.SetMacroBook_Chocobo();
    elseif (args[1] == 'main') then
        Settings.CurrentMode = 'main';
        profile.SetMacroBook_NIN();
    elseif (args[1] == 'naked') then
        if (Settings.CurrentMode ~= 'naked') then
            Settings.CurrentMode = 'naked';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Set ->> Naked On ]--');
        else
            Settings.CurrentMode = 'main';
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Gear Set ->> Normal ]--');
        end
    elseif (args[1] == 'warpcudgel') then
        if (Settings.UseWarpCudgel == false) then
            Settings.UseWarpCudgel = true;
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Warp Cudgel ->> On ]--');
        else
            Settings.UseWarpCudgel = false;
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Warp Cudgel ->> Off ]--');
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom WarpCudgel 30');
    elseif (args[1] == 'expring') then
        if (Settings.UseExpRing == false) then
            Settings.UseExpRing = true;
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ XP Ring ->> On ]--');
        else
            Settings.UseExpRing = false;
            AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ XP Ring ->> Off ]--');
        end
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local pet = gData.GetPet();

    -- Remove Gear Override
    if (Settings.CurrentMode == 'naked') then
        profile.UnequipGear();
        return;
    end

    -- Level Check
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end

    -- Main Gear Check (Layer 1)
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.TP);
    else
        gFunc.EquipSet(sets.TP);
    end

    -------------- (Layer 2) ---------------------

    -- Chocobo
    if (Settings.CurrentMode == 'chocobo') then
        gFunc.EquipSet(sets.Chocobo);
    end

    -- Fishing
    if (Settings.CurrentMode == 'fishing') then
        gFunc.EquipSet(sets.Fishing);
    end

    -------------- (Layer 3) ---------------------

    -- Warp Cudgel
    if (Settings.UseWarpCudgel == true) then
        gFunc.EquipSet(sets.WarpCudgel)
    end

    -- Emp Band
    if (Settings.UseExpRing == true) then
        -- Attempt to equip whatever XP ring is in the player's inventory
        gFunc.EquipSet(sets.ChariotBand);
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
end

return profile;