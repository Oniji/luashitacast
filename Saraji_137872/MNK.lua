local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {


    Idle_Priority = {
        Main = {'Boreas Cesti', 'Baghnakhs +1', 'Cougar Baghnakhs'},
        Range = {},
        Ammo = {'Happy Egg'},
        Head = {'Emperor Hairpin', 'Mrc. Hachimaki', 'Cmp. Eye Circlet'},
        Body = {'Mrc.Cpt. Doublet', 'Power Gi', 'Lgn. Harness', 'Ducal Aketon'},
        Hands = {'Battle Gloves', 'Lgn. Mittens', 'Field Gloves'},
        Legs = {'Republic Subligar', 'Beetle Subligar +1', 'Bone Subligar +1', 'Sitabaki', 'Field Hose'},
        Feet = {'Win. Kyahan', 'Beetle Subligar +1', 'Lgn. Leggings', 'Field Boots'},
        Neck = {'Peacock Amulet', 'Spike Necklace', 'Wing Pendant'},
        Ring1 = {'Deft Ring', 'Balance Ring'},
        Ring2 = {'Deft Ring', 'Balance Ring'},
        Ear1 = {'Beetle Earring +1', 'Bone Earring +1'},
        Ear2 = {'Beetle Earring +1', 'Bone Earring +1'},
        Back = {'Nomad\'s Mantle'},
        Waist = {'Brown Belt', 'Purple Belt'},
    },

    TP_Priority = {
        Neck = {'Peacock Amulet'},
        Hand = {'Battle Gloves'},
    },

    WS_Priority = {
        Ring1 = {'Puissance Ring'},
        Ring2 = {'Puissance Ring'},
        Neck = {'Spike Necklace'},
        Hand = {'Custom F Gloves'},
    },

};
profile.Sets = sets;

local Settings = {
    CurrentSubJob = nil,
    CurrentLevel = 0,
};


profile.OnLoad = function()

    binds.Unbind_All();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    binds.Common_Load();
    binds.MNK_Load();
    aliases.Common_Load();
    aliases.MNK_Load();
    gSettings.AllowAddSet = true;

    shared.LockStyleSet();
    shared.OnLoad();

end

profile.OnUnload = function()

    binds.Common_Unload();
    binds.MNK_Unload();
    aliases.Common_Unload();
    aliases.MNK_Unload();

    shared.Unload();

end

profile.HandleCommand = function(args)

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
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Engaged');
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
    --gFunc.EquipSet(sets.WS);
end

profile.SubjobCheck = function()

    local player = gData.GetPlayer();
    local subjob = player.SubJob;
    if subjob ~= 'NON' and subjob ~= Settings.CurrentSubJob then
        Settings.CurrentSubJob = subjob
        if (subjob == "WAR") then
            binds.MNK_WAR_Load();
        elseif (subjob == "NIN") then
            binds.MNK_NIN_Load();
        elseif (subjob == "SAM") then
            binds.MNK_SAM_Load();
        elseif (subjob == "DRG") then
            binds.MNK_DRG_Load();
        elseif (subjob == "THF") then
            binds.MNK_THF_Load();
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