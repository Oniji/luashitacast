local profile = {};

local zones = gFunc.LoadFile('common/zones.lua');
local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {
    Idle_Priority = {
        Main = {'Casting Wand', 'Solid Wand', 'Yew Wand +1', 'Willow Wand +1'},
        Sub = {''},
        Ammo = {'Sweet Sachet'},
        Head = {'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Baron\'s Saio', 'Ryl.Ftm. Tunic'},
        Hands = {'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Gloves +1', 'Chocobo Gloves'},
        Legs = {'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops', 'Freesword\'s Slops'},
        Feet = {'Mage\'s Sandals', 'Holly Clogs'},
        Neck = {'Black Neckerchief', 'Justice Badge'},
        Ear1 = {'Morion Earring', 'Energy Earring'},
        Ear2 = {'Morion Earring', 'Energy Earring'},
        Ring1 = {'Astral Ring'},
        Ring2 = {'Astral Ring'},
        Back = {'Black Cape +1', 'Cape +1'},
        Waist = {'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Resting_Priority = {
        Main = {'Pilgrim\'s Wand'},
        Sub = {''},
        Ammo = {'Sweet Sachet'},
        Head = {'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Baron\'s Saio', 'Ryl.Ftm. Tunic'},
        Hands = {'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Gloves +1', 'Chocobo Gloves'},
        Legs = {'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops', 'Freesword\'s Slops'},
        Feet = {'Mage\'s Sandals', 'Holly Clogs'},
        Neck = {'Black Neckerchief', 'Justice Badge'},
        Ear1 = {'Morion Earring', 'Energy Earring'},
        Ear2 = {'Morion Earring', 'Energy Earring'},
        Ring1 = {'Astral Ring'},
        Ring2 = {'Astral Ring'},
        Back = {'Black Cape +1', 'Cape +1'},
        Waist = {'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Nuke_Priority = {
        Main = {'Casting Wand', 'Solid Wand', 'Yew Wand +1', 'Willow Wand +1'},
        Sub = {''},
        Ammo = {'Sweet Sachet'},
        Head = {'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Baron\'s Saio', 'Ryl.Ftm. Tunic'},
        Hands = {'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Gloves +1', 'Chocobo Gloves'},
        Legs = {'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops', 'Freesword\'s Slops'},
        Feet = {'Mage\'s Sandals', 'Holly Clogs'},
        Neck = {'Black Neckerchief', 'Justice Badge'},
        Ear1 = {'Morion Earring', 'Energy Earring'},
        Ear2 = {'Morion Earring', 'Energy Earring'},
        Back = {'Black Cape +1', 'Cape +1'},
        Waist = {'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Healing_Priority = {
        Main = {'Solid Wand'},
        Neck = {'Justice Badge'},
        Body = {'Baron\'s Saio'},
        Hands = {'Devotee\'s Mitts'},
    },
    Enhancing_Priority = {
        Main = {'Solid Wand'},
        Neck = {'Justice Badge'},
        Body = {'Baron\'s Saio'},
        Hands = {'Devotee\'s Mitts'},
    },
    EnfeeblingMND_Priority = {
        Main = {'Solid Wand'},
        Neck = {'Justice Badge'},
        Body = {'Baron\'s Saio'},
        Hands = 'Devotee\'s Mitts',
    },
    EnfeeblingINT_Priority = {
        Main = 'Solid Wand',
        Ammo = {'Sweet Sachet'},
        Neck = 'Black Neckerchief',
        Head = {'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = 'Baron\'s Saio',
        Hands = {'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Gloves +1', 'Chocobo Gloves'},
        Legs = {'Seer\'s Slacks +1', 'Mage\'s Slacks'},
        Ear1 = {'Morion Earring', 'Energy Earring'},
        Ear2 = {'Morion Earring', 'Energy Earring'},
        Back = {'Black Cape +1', 'Cape +1'},
        Waist = {'Shaman\'s Belt'},
    },
    Rings_MND_Priority = {
        Ring1 = {'Saintly Ring'},
        Ring2 = {'Saintly Ring'},
    },
    Rings_INT_Priority = {
        Ring1 = {'Eremite\'s Ring +1'},
        Ring2 = {'Eremite\'s Ring +1'},
    },
    Rings_Astral_Priority = {
        Ring1 = {'Astral Ring'},
        Ring2 = {'Astral Ring'},
    },
};
profile.Sets = sets;

local HP_RDM_BLM = 998; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit
local HP_RDM_WHM = 980; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 744HP is 0.76 Threshold. 236 deficit
local HP_RDM_NIN = 998; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit

local MP_BLM_RDM = 730; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_WHM = 749; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_NIN = 671; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc


local IdleSet = {
    [1] = 'PDT',
    [2] = 'MDT',
    [3] = 'Town',
};

local skulkers = false;
local dream_boots = false;
local dream_mittens = false;

local NukeSet = {
    [1] = 'Default',
    [2] = 'Accuracy',
    [3] = 'HNM',
};

local Settings = {
    Character = 'Oniji',
    DisplayThrottle = 1,
    LastDisplayed = 0,
    CurrentSubJob = nil,
    CurrentLevel = 0,
    MeleeMode = false,
    IdleMode = '',
    IdleDT = 'PDT',
    Extras = '',
    UseSorcRing = false,
    UseUggPendant = false,
};

local SpikeSpells = T{'Blaze Spikes','Shock Spikes','Ice Spikes'};

profile.OnLoad = function()
    shared.Unload();
    binds.Unbind_All();
    profile.LevelCheck();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.RDM_Load();
    binds.RDM_Nukes_Load(Settings.CurrentLevel);
    binds.RDM_Support_Load(Settings.CurrentLevel);

    aliases.Common_Load();
    aliases.RDM_Load();

    Settings.CurrentMode = 'main';
    gSettings.AllowAddSet = true;

    shared.CreateCycle('IdleSet', IdleSet);
    Settings.IdleSet = shared.GetCycle('IdleSet');
    shared.CreateCycle('NukeSet', NukeSet);
    Settings.NukeSet = shared.GetCycle('NukeSet');

    AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set: ' .. Settings.IdleSet .. ' | Sorc Ring: ' .. (Settings.UseSorcRing and 'Active' or 'Inactive') .. ' ]--');


    -- Setting up HandleCommand cycles and toggles
    shared.OnLoad();
    shared.SetCharacter(Settings.Character)
    shared.LockStyleSet();

end

profile.OnUnload = function()

    binds.Common_Unload();
    binds.RDM_Unload();
    aliases.Common_Unload();
    aliases.RDM_Unload();

    shared.Unload();

end

profile.HandleCommand = function(args)
    if (args[1] == 'main') then
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
    elseif (args[1] == 'melee') then
        Settings.MeleeMode = not Settings.MeleeMode;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Melee Mode: ' .. (Settings.MeleeMode and 'Active' or 'Inactive') .. ' ]--');
        return;
    elseif (args[1] == 'sorcring') then
        Settings.UseSorcRing = not Settings.UseSorcRing;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Sorc Ring ->> ' .. tostring(Settings.UseSorcRing):gsub("^%l", string.upper) .. ' ]--');
        return;
    elseif (args[1] == 'idle') then
        if Settings.IdleDT == 'PDT' then
            Settings.IdleDT = 'MDT';
            shared.SetCycleToValue('IdleSet', 'MDT');   
        else
            Settings.IdleDT = 'PDT';
            shared.SetCycleToValue('IdleSet', 'PDT');
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set ->> ' .. Settings.IdleDT .. ' ]--');
        return;
    elseif (args[1] == 'nuke') then
        Settings.NukeSet = shared.AdvanceCycle('NukeSet')
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Nuke Set ->> ' .. Settings.NukeSet .. ' ]--');
        return;
    elseif (args[1] == 'pdt') then
        Settings.IdleDT = 'PDT';
        shared.SetCycleToValue('IdleSet', 'PDT');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set ->> ' .. Settings.IdleDT .. ' ]--');
        return;
    elseif (args[1] == 'mdt') then
        Settings.IdleDT = 'MDT';
        shared.SetCycleToValue('IdleSet', 'MDT');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set ->> ' .. Settings.IdleDT .. ' ]--');
        return;
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
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        shared.SetCurrentSet('Resting');
    else
        gFunc.EquipSet(sets.Idle);
        shared.SetCurrentSet('Idle');
    end

    profile.DisplayRDM();
    shared.GearOverride();

end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end


profile.HandleMidcast = function()

    local player = gData.GetPlayer();
    local mpdeficit = player.MaxMP - player.MP;
    local DebuffMND = T{ 'Slow', 'Paralyze', 'Silence', 'Dia', 'Dia II' };
    local DebuffINT = T{ 'Blind', 'Bind', 'Gravity', 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock', 'Poison', 'Poison II', 'Poisonga', 'Sleep', 'Sleep II', 'Sleepga' , 'Sleepga II'};

    local action = gData.GetAction();

    local maxmp = player.MaxMP;
    local currentmp = player.MP;
    local mpdeficit = player.MaxMP - player.MP;

    if (action.Skill == 'Enfeebling Magic') then
        if (DebuffMND:contains(action.Name)) then
            --Func.EquipSet(sets.Enfeebling);
            gFunc.EquipSet(sets.EnfeeblingMND);
            if mpdeficit and mpdeficit > 50 then
                gFunc.EquipSet(sets.Rings_MND);
            else
                gFunc.EquipSet(sets.Rings_Astral);
            end
        elseif (DebuffINT:contains(action.Name)) then
            --gFunc.EquipSet(sets.Enfeebling);
            gFunc.EquipSet(sets.EnfeeblingINT);
            if mpdeficit and mpdeficit > 50 then
                gFunc.EquipSet(sets.Rings_INT);
            else
                gFunc.EquipSet(sets.Rings_Astral);
            end
        end
        gFunc.EquipSet(sets.Enfeebling);
        shared.SetCurrentSet('Enfeebling');
    elseif (action.Skill == 'Elemental Magic') then
        if (DebuffINT:contains(action.Name)) then
            --gFunc.EquipSet(sets.Enfeebling);
            gFunc.EquipSet(sets.EnfeeblingINT);
            shared.SetCurrentSet('Enfeebling');
        else
            gFunc.EquipSet(sets.Nuke);
            shared.SetCurrentSet('Nuke');
        end
        if mpdeficit and mpdeficit > 50 then
            gFunc.EquipSet(sets.Rings_INT);
        else
            gFunc.EquipSet(sets.Rings_Astral);
        end
    elseif (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Healing);
        shared.SetCurrentSet('Healing');
        if mpdeficit and mpdeficit > 50 then
            gFunc.EquipSet(sets.Rings_MND);
        else
            gFunc.EquipSet(sets.Rings_Astral);
        end
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
        shared.SetCurrentSet('Enhancing');
        if mpdeficit and mpdeficit > 50 then
            gFunc.EquipSet(sets.Rings_MND);
        else
            gFunc.EquipSet(sets.Rings_Astral);
        end
    end


--[[     if (Settings.CurrentLevel >= 51) and not Settings.MeleeMode then
        shared.UseElementalStaff(action.Element);
    end ]]

    if action.Name == 'Invisible' or action.Name == 'Sneak' then
        if skulkers then gFunc.Equip('back', 'Skulker\'s Cape'); end
        if action.Name == 'Sneak' then
            if dream_boots then gFunc.Equip('feet', 'Dream Boots +1'); end
        elseif action.Name == 'Invisible' then
            if dream_mittens then gFunc.Equip('hands', 'Dream Mittens +1'); end
        end
    end

end


profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

profile.SubjobCheck = function()

    local player = gData.GetPlayer();
    local subjob = player.SubJob;
    if subjob ~= 'NON' and subjob ~= Settings.CurrentSubJob then
        Settings.CurrentSubJob = subjob
        if (subjob == "WHM") then
            binds.RDM_WHM_Load();
        elseif (subjob == "BLM") then
            binds.RDM_BLM_Load();
        elseif (subjob == "NIN") then
            binds.RDM_NIN_Load();
        elseif (subjob == "BST") then
            binds.RDM_BST_Load();
        elseif (subjob == "THF") then
            binds.RDM_THF_Load();
            elseif (subjob == "DRK") then
            binds.RDM_DRK_Load();
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Sub Job Binds ->> ' .. subjob .. ' ]--');
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
        shared.LockStyleSet();
    end

end



profile.LevelCheck = function()

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    --myLevel = 50;
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        binds.RDM_Nukes_Load(Settings.CurrentLevel);
        binds.RDM_Support_Load(Settings.CurrentLevel);
    end

end

profile.DisplayRDM = function()

    local player = gData.GetPlayer();
    local action = gData.GetAction();
    -- Throttle
    local diffTime = os.clock() - Settings.LastDisplayed;
    if diffTime < Settings.DisplayThrottle then
        return;
    end

    if Settings.UseSorcRing then
        -- Sorc Ring Calcs
        local sjHPP = 0;
        if player.SubJob == 'BLM' then
            sjHPP = HP_RDM_BLM;
        elseif player.SubJob == 'WHM' then
            sjHPP = HP_RDM_WHM;
        elseif player.SubJob == 'NIN' then  
            sjHPP = HP_RDM_NIN;
        else
            sjHPP = player.MaxHP;
        end
        local maxHPP = math.floor(((player.HP / sjHPP) * 100) * 100 + 0.5) / 100; -- Whole percentage rounded to 2 decimals
        local threshold = math.floor(sjHPP * 0.7599); -- Sorc Ring Latent HP Threshold
    end

    if Settings.UseUggPendant then
        -- Ugg Pendant Calcs
        local mpPercent = 0;
        local nukeMaxMP = -1;
        local mpthreshold = 0;
        if Settings.UseUggPendant then
            if player.SubJob == "BLM" then
                nukeMaxMP = MP_RDM_BLM;
            elseif player.SubJob == "WHM" then
                nukeMaxMP = MP_RDM_WHM;
            elseif player.SubJob == "NIN" then
                nukeMaxMP = MP_RDM_NIN;
            else
                nukeMaxMP = player.MaxMP;
            end
        end
        if action and action.Type == 'Spell' then
            mpPercent = action.MpAftercast / nukeMaxMP;
        else
            mpPercent = player.MP / nukeMaxMP;
        end
    mpthreshold = math.floor(nukeMaxMP * 0.5099);
    end

    -- Build string
    local displayString = '\n';

    -- Sorc Ring Display
    displayString = displayString .. 'SorcRing: ' .. (Settings.UseSorcRing and '|cFF5FFF5F|On' or '|cFF989898|Off') .. '|r\n';
    if Settings.UseSorcRing then
        if maxHPP then displayString = displayString .. '  Current: ' .. player.HP .. 'HP\n'; end
        if maxHPP then displayString = displayString .. '  Threshold: ' .. (threshold) .. 'HP\n'; end
        if maxHPP then displayString = displayString .. '  Latent: ' .. (player.HP < threshold and '|cFF5FFF5F|Active' or '|cFF989898|Inactive') .. '|r\n'; end
    end
    displayString = displayString .. 'UggPendant: ' .. (Settings.UseUggPendant and '|cFF5FFF5F|On' or '|cFF989898|Off') .. '|r\n';
    if Settings.UseUggPendant then
        if mpPercent and mpthreshold then displayString = displayString .. '  Latent: ' .. (mpPercent < 0.5099 and '|cFF5FFF5F|Active' or '|cFF989898|Inactive') .. '|r\n'; end
    end

    shared.SetExtras(displayString);
    Settings.LastDisplayed = os.clock();
end



return profile;