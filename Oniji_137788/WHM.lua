local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {

    Idle_Priority = {
        Main = {'Solid Wand', 'Yew Wand +1', 'Willow Wand +1'},
        Sub = 'Oak Shield',
        Ear1 = {'Morion Earring', 'Energy Earring'},
        Ear2 = {'Morion Earring', 'Energy Earring'},
        Neck = 'Justice Badge',
        Head = {'Silver Hairpin +1', 'Ryl.Ftm. Tunic'},
        Body = {'Baron\'s Saio', 'Ryl.Ftm. Tunic'},
        Hands = {'Devotee\'s mitts', 'Gloves +1'},
        Ring1 = 'Astral ring',
        Ring2 = 'Astral ring',
        Back = {'White cape +1', 'Cape +1'},
        Waist = 'Friar\'s rope',
        Legs = {'Custom Pants', 'Freesword\'s Slops'},
        Feet = {'Seer\'s Pumps +1', 'Holly Clogs'},
    },
    Resting = {
        Main = 'Pilgrim\'s Wand',
        Body = 'Seer\'s Tunic',
        Legs = 'Baron\'s Slops',
    },
    Healing = {
        Neck = 'Justice Badge',
        Hands = 'Devotee\'s mitts',
    }
};
profile.Sets = sets;

local Settings = {
    Character = 'Oniji',
    CurrentSubJob = nil,
    CurrentLevel = 0
};

profile.OnLoad = function()
    shared.Unload();

    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    binds.Common_Load();
    binds.WHM_Load();
    aliases.Common_Load();
    aliases.WHM_Load();
    gSettings.AllowAddSet = true;

    -- Setting up HandleCommand cycles and toggles
    shared.OnLoad();
    shared.SetCharacter(Settings.Character)
    shared.LockStyleSet();
    
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