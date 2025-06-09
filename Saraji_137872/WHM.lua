local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {

    Idle_Priority = {
        Main = 'Solid Wand',
        Sub = 'Oak Shield',
        Head = 'Silver Hairpin',
        Ear1 = {'Morion Earring'},
        Ear2 = {'Morion Earring'},
        Neck = 'Justice Badge',
        Body = 'Baron\'s Saio',
        Hands = 'Devotee\'s mitts',
        Ring1 = 'Astral ring',
        Ring2 = 'Astral ring',
        Back = 'White cape +1',
        Waist = 'Friar\'s rope',
        Legs = 'Custom Pants',
        Feet = 'Seer\'s Pumps +1',
    },
    Resting = {
        Legs = 'Baron\'s Slops'
    },
    Healing = {
        Legs = 'Custom Pants'
    }
};
profile.Sets = sets;

local Settings = {
    CurrentSubJob = nil,
    CurrentLevel = 0
};

profile.OnLoad = function()

    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    binds.Common_Load();
    binds.WHM_Load();
    aliases.Common_Load();
    aliases.WHM_Load();
    gSettings.AllowAddSet = true;

    -- Setting up HandleCommand cycles and toggles
    shared.OnLoad();

    local player = gData.GetPlayer();
    shared.LockStyleSet(player.MainJob);
    
end

profile.OnUnload = function()

    binds.Common_Unload();
    binds.WHM_Unload();
    aliases.Common_Unload();
    aliases.WHM_Unload();

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

    local player = gData.GetPlayer()
    if (player.Status == 'Resting') then
        if (player.MPP <= 70) then
            gFunc.EquipSet(sets.Resting);
        else
            gFunc.EquipSet(sets.Idle);
        end
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
    -- Debuff Categories
    local mndDebuffs = T{ 'Slow', 'Paralyze', 'Slow II', 'Paralyze II', 'Addle', 'Addle II'};
    local intDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock'};
    local action = gData.GetAction();
    if (action.Skill == 'Enfeebling Magic') then
        if (mndDebuffs:contains(action.Name)) then
            --gFunc.EquipSet(sets.DebuffMND);
            gFunc.EquipSet(sets.Idle);
        elseif (intDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Idle);
            --gFunc.EquipSet(sets.DebuffINT);
        end
    elseif (action.Skill == 'Elemental Magic') then
        --gFunc.EquipSet(sets.Nuke);
        gFunc.EquipSet(sets.Idle);
    elseif string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga') then
        --gFunc.EquipSet(sets.Healing);
        gFunc.EquipSet(sets.Idle);
    elseif (action.Skill == 'Enhancing Magic') then
        --gFunc.EquipSet(sets.Enhancing);
        gFunc.EquipSet(sets.Idle);
    else
        --gFunc.EquipSet(sets.Haste);
        gFunc.EquipSet(sets.Idle);
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


return profile;