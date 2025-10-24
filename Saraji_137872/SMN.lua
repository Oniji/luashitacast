local profile = {};

local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local debug = true; -- verbose print output into in-game chat for debugging purposes

local carbuncle_mitts = true;
local yinyang_robe = false;
local summoners_doublet = false;
local summoners_horn = false;


local sets = {

    Idle_Priority = {
        Main = {'Kukulcan\'s Staff', 'Elm Staff +1', 'Pilgrim\'s Wand', 'Willow Wand +1'},
        Ammo = {'Hedgehog Bomb', 'Fortune Egg'},
        Neck = {'Rep.Mythril Medal', 'Rep.Bronze Medal'},
        Ear1 = {'Novia Earring', 'Morion Earring', 'Onyx Earring'},
        Ear2 = {'Loquac. Earring', 'Morion Earring', 'Onyx Earring'},
        Head = {'Vermillion Cloak', 'Electrum Hairpin', 'Silver Hairpin', 'Brass Hairpin'},
        Body = {'Vermillion Cloak', 'Seer\'s Tunic +1', 'Ducal Aketon'},
        Hands = {'Evoker\'s Bracers', 'Austere Cuffs', 'Carbuncle Mitts'},
        Ring1 = {'Ether Ring', 'Astral Ring'},
        Ring2 = {'Astral Ring'},
        Back = {'Aurora Mantle', 'Cape', 'Rabbit Mantle'},
        Waist = {'Hierarch Belt', 'Powerful Rope', 'Friar\'s Rope', 'Leather Belt'},
        Legs = {'Custom Pants', 'Baron\'s Slops', 'Angler\'s Hose', 'Chocobo Hose'},
        Feet = {'Evoker\'s Pigaches', 'Custom F Boots', 'Mage\'s Sandals', 'Light Soleas', 'Chocobo Boots'}
    },
    MND_Priority = {
        Head = {'Austere Hat', 'Electrum Hairpin', 'Silver Hairpin'},
        Body = {'Baron\'s Saio'},
        Neck = {'Justice Badge'},
        Waist = {'Friar\'s Rope'},
        Hands = {'Devotee\'s Mitts'},
        Legs = {'Custom Pants'},
        Back = {'White Cape +1'},
        Feet = {'Angler\'s Boots'}
    },
    MND_Ring_Priority = {
        Ring1 = {'Saintly Ring'},
        Ring2 = {'Tamas Ring'}
    },
    INT_Priority = {
        Ammo = {'Morion Tathlum'},
        Neck = {'Black Neckerchief'},
        --Body = {'Seer\'s Tunic +1', 'Mage\'s Tunic'},
        Ear1 = {'Morion Earring'},
        Ear2 = {'Morion Earring'},
        Hands = {'Evoker\'s Bracers', 'Angler\'s Gloves'},
        Legs = {'Mage\'s Slacks'},
        Waist = {'Shaman\'s Belt'},
        Feet = {'Custom F Boots'},
        Back = {'Black Cape +1'}
    },
    INT_Ring_Priority = {
        Ring1 = {'Eremite\'s Ring'},
        Ring2 = {'Tamas Ring'}
    },
    Nuke_Priority = {
        Ammo = {'Morion Tathlum'},
        Neck = {'Black Neckerchief'},
        --Body = {'Seer\'s Tunic +1', 'Mage\'s Tunic'},
        Ear1 = {'Morion Earring'},
        Ear2 = {'Morion Earring'},
        Hands = {'Seer\'s Mitts +1', 'Angler\'s Gloves'},
        Legs = {'Mage\'s Slacks'},
        Waist = {'Shaman\'s Belt'},
        Feet = {'Custom F Boots'},
        Back = {'Black Cape +1'},
    },
    Healing_Priority = {
        --Body = {'Baron\'s Saio'},
        Neck = {'Justice Badge'},
        Waist = {'Friar\'s Rope'},
        Hands = {'Devotee\'s Mitts'},
        Legs = {'Custom Pants'},
        Feet = {'Crow Gaiters'},
        Back = {'White Cape +1'}
    },
    Enhancing = {
    },
    Enfeebling = {
        Legs = 'Nashira Seraweels', -- 5
    },
    Resting = {
        Main = 'Pluto\'s Staff', -- 2
        Body = 'Vermillion Cloak', -- 1
        Legs = 'Baron\'s Slops', -- 1
        Ear2 = 'Relaxing Earring', -- 2
        Waist = 'Hierarch Belt', -- 2
        Back = 'Errant Cape',
        Neck = 'Checkered Scarf', -- 1
    },
    BP_Delay = {
        Head = 'Austere Hat', -- 2
        Hands = 'Austere Cuffs', -- 1
        Body = 'Austere Robe', -- 3
        --Legs = 'Summoner\'s Spats', -- 2
        Feet = 'Summoner\'s Pigaches', -- 2
        Back = 'Errant Cape',
    },
    BP = {
        --Head = 'Evoker\'s Horn', -- 5
        Head = 'Austere Hat', -- 2
        --Body = 'Summoner\'s Doublet', -- Avatar CritHit
        --Hands = 'Summoner\'s Bracers', -- 10 + Avatar Accuracy
        Hands = 'Austere Cuffs', -- 2
        Legs = 'Austere Slops', -- 3
        Feet = 'Austere Sabots', -- 3
        --Legs = 'Evoker\'s Spats', -- Avatar Accuracy
        --Feet = 'Summoner\'s Pigaches', -- Avatar Attack
        --Ring1 = 'Evoker\'s Ring', --10
        --Neck = 'Summoning Torque',
    },
    Avatar_Perp = {
        Head = 'Austere Hat',
        Body = 'Austere Robe', -- 1
        --Hands = 'Nashira Gages', -- 1
        --Feet = 'Evoker\'s Pigaches +1', -- 1
        --Ring1 = 'Evoker\'s Ring', -- 1
    }
};
profile.Sets = sets;

local CurrentAvatar = {
    [1] = 'None',
    [2] = 'Carbuncle',
    [3] = 'Ifrit',
    [4] = 'Garuda',
    [5] = 'Titan',
    [6] = 'Leviathan',
    [7] = 'Shiva',
    [8] = 'Ramuh',
    [9] = 'Fenrir',
    [10] = 'Diabolos',
    [11] = 'Fire Spirit', 
    [12] = 'Ice Spirit', 
    [13] = 'Thunder Spirit', 
    [14] = 'Wind Spirit', 
    [15] = 'Water Spirit', 
    [16] = 'Earth Spirit', 
    [17] = 'Light Spirit', 
    [18] = 'Dark Spirit', 
};

local Settings = {
    LastSummoningElement = '',
    DisplayThrottle = 1,
    LastDisplayed = 0,
    CurrentAvatar = 'None',
    CurrentSubJob = nil,
    CurrentLevel = 0
};

local SmnSkill = T{'Shining Ruby','Glittering Ruby','Crimson Howl','Inferno Howl','Frost Armor','Crystal Blessing','Aerial Armor','Hastega II','Fleet Wind','Hastega','Earthen Ward','Earthen Armor','Rolling Thunder','Lightning Armor','Soothing Current','Ecliptic Growl','Heavenward Howl','Ecliptic Howl','Noctoshield','Dream Shroud','Altana\'s Favor','Reraise','Reraise II','Reraise III','Raise','Raise II','Raise III','Wind\'s Blessing'}
local SmnHealing = T{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'}
local SmnMagical = T{'Searing Light','Meteorite','Holy Mist','Inferno','Fire II','Fire IV','Meteor Strike','Conflag Strike','Diamond Dust','Blizzard II','Blizzard IV','Heavenly Strike','Aerial Blast','Aero II','Aero IV','Wind Blade','Earthen Fury','Stone II','Stone IV','Geocrush','Judgement Bolt','Thunder II','Thunder IV','Thunderstorm','Thunderspark','Tidal Wave','Water II','Water IV','Grand Fall','Howling Moon','Lunar Bay','Ruinous Omen','Somnolence','Nether Blast','Night Terror','Level ? Holy'}
local SmnEnfeebling = T{'Diamond Storm','Sleepga','Shock Squall','Slowga','Tidal Roar','Pavor Nocturnus','Ultimate Terror','Nightmare','Mewing Lullaby','Eerie Eye'}
local SmnHybrid = T{'Flaming Crush','Burning Strike'}


profile.OnLoad = function()
    binds.Unbind_All();
    profile.LevelCheck();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.SMN_Load();

    aliases.Common_Load();
    aliases.SMN_Load();

    -- Setup Avatar cycle and initial bind state
    shared.CreateCycle('CurrentAvatar', CurrentAvatar);
    shared.SetCycleToValue('CurrentAvatar', 'None');
    Settings.CurrentAvatar = 'None';
    binds.SMN_Avatar_Load('None');

    Settings.CurrentMode = 'main';
    gSettings.AllowAddSet = true;

    -- Setting up HandleCommand cycles and toggles
    shared.OnLoad();

    shared.LockStyleSet();

end

profile.OnUnload = function()

    binds.Common_Unload();
    binds.SMN_Unload();
    binds.SMN_Avatar_Unload();
    aliases.Common_Unload();
    aliases.SMN_Unload();

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

    -- Check if Avatar is summoned
    local pet = gData.GetPet();
    local current_avatar = binds.SMN_GetCurrentAvatar();
    -- Only redo binds if the avatar has changed since last check
    if pet then
        if pet.Name ~= Settings.CurrentAvatar then
            shared.SetCycleToValue('CurrentAvatar', pet.Name);
            Settings.CurrentAvatar = pet.Name;
        end
        if pet.Name ~= current_avatar then
            binds.SMN_Avatar_Load(pet.Name);
        end
        profile.EquipAvatarPerp(pet.Name);
        shared.SetCurrentSet('Avatar Perpetuation');
        if Settings.LastSummoningElement then
            local elemental_staff = shared.GetElementalStaff(Settings.LastSummoningElement);
            if elemental_staff then
                gFunc.Equip('main', elemental_staff);
            end
        end
    elseif not pet then
        if Settings.CurrentAvatar ~= 'None' then
            shared.SetCycleToValue('CurrentAvatar', 'None');
            Settings.CurrentAvatar = 'None';
        end
        if current_avatar ~= 'None' then
            binds.SMN_Avatar_Load('None');
        end
    end

    if (shared.IsNaked()) then
        shared.UnequipGear();
        shared.SetCurrentSet('Naked');
        return;
    end

    local player = gData.GetPlayer();

    if not pet then
        if (player.Status == 'Resting') then
            gFunc.EquipSet(sets.Resting);
            shared.SetCurrentSet('Resting');
        else
            gFunc.EquipSet(sets.Idle);
            shared.SetCurrentSet('Idle');
        end
    end

    local pet_action = gData.GetPetAction();

    if pet_action ~= nil then
        gFunc.EquipSet('BP');
        shared.SetCurrentSet('BP');
    end

    shared.GearOverride();
    profile.DisplaySMN();

end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if action.Type == 'Blood Pact: Rage' or action.Type == 'Blood Pact: Ward' then
        gFunc.EquipSet(sets.BP_Delay);
        shared.SetCurrentSet('Blood Pact Delay');
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end


profile.HandleMidcast = function()

    local player = gData.GetPlayer();
    local mpdeficit = player.MaxMP - player.MP;
    local MndDebuffs = T{ 'Slow', 'Paralyze', 'Slow II', 'Paralyze II', 'Addle', 'Addle II' };
    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock', 'Blind' };
    local action = gData.GetAction();
    
    if (action.Skill == 'Enfeebling Magic') then
        if (MndDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.MND);
            shared.SetCurrentSet('Enfeebling - MND');
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.MND_Ring);
            end
        elseif (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.INT);
            shared.SetCurrentSet('Enfeebling - INT');
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
        end
        gFunc.EquipSet(sets.Enfeebling);
    elseif (action.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.INT);
            shared.SetCurrentSet('Enfeebling - INT');
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
        else
            gFunc.EquipSet(sets.Nuke);
            shared.SetCurrentSet('Nuke');
            if (mpdeficit > 50) then
                gFunc.EquipSet(sets.INT_Ring);
            end
        end
    elseif (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Healing);
        shared.SetCurrentSet('Healing');
        if (mpdeficit > 50) then
            gFunc.EquipSet(sets.MND_Ring);
        end
    elseif (action.Skill == 'Enhancing Magic') then
        shared.SetCurrentSet('Enhancing');
        gFunc.EquipSet(sets.Enhancing);
    elseif (action.Skill == 'Summoning') then
        Settings.LastSummoningElement = action.Element;
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

profile.EquipAvatarPerp = function(pet)
    gFunc.EquipSet(sets.Avatar_Perp); -- Base Set
    local env = gData.GetEnvironment();
    -- Check for situational perp cost reductions
    if pet == 'Carbuncle' then
        if carbuncle_mitts then
            gFunc.Equip('hands', 'Carbuncle Mitts');
        end
        if yinyang_robe then
            gFunc.Equip('body', 'Yinyang Robe');
        end
    end
    if summoners_horn and env.Weather == Settings.LastSummoningElement then
        gFunc.Equip('head', 'Summoner\'s Horn');
    end
    if summoners_doublet and env.DayElement == Settings.LastSummoningElement then
        gFunc.Equip('body', 'Summoner\'s Doublet');
    end
end

profile.DisplaySMN = function()
    -- Throttle
    local diffTime = os.clock() - Settings.LastDisplayed;
    local C = shared.Colour;
    if diffTime < Settings.DisplayThrottle then
        return;
    end
    local displayString = '';
    if Settings.CurrentAvatar == 'None' then
        displayString = '1: |' .. C.CARBUNCLE .. '|Carbuncle|r\n' ..
                        '2: |' .. C.IFRIT .. '|Ifrit|r\n' ..
                        '3: |' .. C.GARUDA .. '|Garuda|r\n' ..
                        '4: |' .. C.TITAN .. '|Titan|r\n' ..
                        '5: |' .. C.LEVIATHAN .. '|Leviathan|r\n' ..
                        '6: |' .. C.SHIVA .. '|Shiva|r\n' ..
                        '7: |' .. C.RAMUH .. '|Ramuh|r\n' ..
                        '8: |' .. C.FENRIR .. '|Fenrir|r\n' ..
                        '9: |' .. C.DIABOLOS .. '|Diabolos'
    elseif Settings.CurrentAvatar == 'Carbuncle' then
        displayString = '1: |' .. C.WARD .. '|Prot/Shell (44)|r\n' ..
                        '2: |' .. C.RAGE .. '|WS Poison Nails|r\n' ..
                        '3: |' .. C.WARD .. '|ST Heal (6)|r\n' ..
                        '4: |' .. C.WARD .. '|AOE Heal (124)|r\n' ..
                        '5: |' .. C.RAGE .. '|WS Meteorite (AOE)|r\n' ..
                        '7: |' .. C.WARD .. '|Attr Buff|r\n' ..
                        '8: |' .. C.TWOHOUR .. '|2HR - Searing Light'
    elseif Settings.CurrentAvatar == 'Ifrit' then
        displayString = '1: |' .. C.WARD .. '|Attack Up (84)|r\n' ..
                        '2: |' .. C.RAGE .. '|WS Punch|r\n' ..
                        '3: |' .. C.RAGE .. '|WS Burning Strike|r\n' ..
                        '4: |' .. C.RAGE .. '|WS Double Punch|r\n' ..
                        '5: |' .. C.RAGE .. '|WS Flaming Crush|r\n' ..
                        '6: |' .. C.IFRIT .. '|Fire 2|r\n' ..
                        '7: |' .. C.IFRIT .. '|Fire 4|r\n' ..
                        '8: |' .. C.TWOHOUR .. '|2HR - Inferno'
    elseif Settings.CurrentAvatar == 'Garuda' then
        displayString = '1: |' .. C.WARD .. '|Blink (92)|r\n' ..
                        '2: |' .. C.RAGE .. '|WS Claw|r\n' ..
                        '3: |' .. C.RAGE .. '|WS Predator Claws|r\n' ..
                        '4: |' .. C.WARD .. '|Hastega (112)|r\n' ..
                        '5: |' .. C.WARD .. '|AOE Heal (119)|r\n' ..
                        '6: |' .. C.GARUDA .. '|Aero 2|r\n' ..
                        '7: |' .. C.GARUDA .. '|Aero 4|r\n' ..
                        '8: |' .. C.TWOHOUR .. '|2HR - Aerial Blast'
    elseif Settings.CurrentAvatar == 'Titan' then
        displayString = '1: |' .. C.WARD .. '|Stoneskin (92)|r\n' ..
                        '2: |' .. C.RAGE .. '|WS Rock Throw|r\n' ..
                        '3: |' .. C.RAGE .. '|WS Megalith Throw|r\n' ..
                        '4: |' .. C.RAGE .. '|WS Rock Buster (Bind)|r\n' ..
                        '5: |' .. C.RAGE .. '|WS Mountain Buster|r\n' ..
                        '6: |' .. C.TITAN .. '|Stone 2|r\n' ..
                        '7: |' .. C.TITAN .. '|Stone 4|r\n' ..
                        '8: |' .. C.TWOHOUR .. '|2HR - Earthen Fury'
    elseif Settings.CurrentAvatar == 'Leviathan' then
        displayString = '1: |' .. C.WARD .. '|Refresh (99)|r\n' ..
                        '2: |' .. C.RAGE .. '|WS Barracuda Dive|r\n' ..
                        '3: |' .. C.RAGE .. '|WS Tail Whip|r\n' ..
                        '4: |' .. C.RAGE .. '|WS Spinning Dive|r\n' ..
                        '5: |' .. C.DEBUFF .. '|Slowga (48)|r\n' ..
                        '6: |' .. C.LEVIATHAN .. '|Water 2|r\n' ..
                        '7: |' .. C.LEVIATHAN .. '|Water 4|r\n' ..
                        '8: |' .. C.TWOHOUR .. '|2HR - Tidal Wave'
    elseif Settings.CurrentAvatar == 'Shiva' then
        displayString = '1: |' .. C.WARD .. '|Ice Spikes (63)|r\n' ..
                        '2: |' .. C.RAGE .. '|WS Axe Kick|r\n' ..
                        '3: |' .. C.RAGE .. '|WS Double Slap|r\n' ..
                        '4: |' .. C.RAGE .. '|WS Rush|r\n' ..
                        '5: |' .. C.DEBUFF .. '|Sleepga (56)|r\n' ..
                        '6: |' .. C.SHIVA .. '|Blizzard 2|r\n' ..
                        '7: |' .. C.SHIVA .. '|Blizzard 4|r\n' ..
                        '8: |' .. C.TWOHOUR .. '|2HR - Diamond Dust'
    elseif Settings.CurrentAvatar == 'Ramuh' then
        displayString = '1: |' .. C.WARD .. '|Enthunder (52)|r\n' ..
                        '2: |' .. C.RAGE .. '|WS Shock Strike|r\n' ..
                        '3: |' .. C.RAGE .. '|WS Thunderspark|r\n' ..
                        '4: |' .. C.RAGE .. '|WS Chaotic Strike|r\n' ..
                        '5: |' .. C.WARD .. '|Shock Spikes (91)|r\n' ..
                        '6: |' .. C.RAMUH .. '|Thunder 2|r\n' ..
                        '7: |' .. C.RAMUH .. '|Thunder 4|r\n' ..
                        '8: |' .. C.TWOHOUR .. '|2HR - Judgment Bolt'
    elseif Settings.CurrentAvatar == 'Fenrir' then
        local acc, eva = binds.Info_EclipticHowl();
        if acc and eva then 
            displayString = '1: |' .. C.WARD .. '|Accuracy +' .. acc .. '/Evasion +' .. eva .. ' (57)|r\n' ..
                            '2: |' .. C.RAGE .. '|WS Moonlit Charge (Blind)|r\n' ..
                            '3: |' .. C.RAGE .. '|WS Crescent Fang (Para)|r\n' ..
                            '4: |' .. C.RAGE .. '|WS Eclipse Bite|r\n' ..
                            '5: |' .. C.DEBUFF .. '|Dispel x 2 (27)|r\n' ..
                            '6: |' .. C.WARD .. '|PT +Attr|r\n' ..
                            '7: |' .. C.DEBUFF .. '|Target -acc -eva|r\n' ..
                            '8: |' .. C.TWOHOUR .. '|2HR - Howling Moon'
        else 
            displayString = '1: |' .. C.WARD .. '|Accuracy/Evasion (57)|r\n' ..
                            '2: |' .. C.RAGE .. '|WS Moonlit Charge (Blind)|r\n' ..
                            '3: |' .. C.RAGE .. '|WS Crescent Fang (Para)|r\n' ..
                            '4: |' .. C.RAGE .. '|WS Eclipse Bite|r\n' ..
                            '5: |' .. C.DEBUFF .. '|Dispel x 2 (27)|r\n' ..
                            '6: |' .. C.WARD .. '|PT +Attr|r\n' ..
                            '7: |' .. C.DEBUFF .. '|Target -acc -eva|r\n' ..
                            '8: |' .. C.TWOHOUR .. '|2HR - Howling Moon'
        end
    elseif Settings.CurrentAvatar == 'Diabolos' then
        local mab, mdb = binds.Info_DreamShroud();
        if mab and mdb then 
            displayString = '1: |' .. C.WARD .. '|MAB +' .. mab .. '/MDB +' .. mdb .. ' (121)|r\n' ..
                            '2: |' .. C.RAGE .. '|WS Camisado|r\n' ..
                            '3: |' .. C.RAGE .. '|WS Nether Blast|r\n' ..
                            '4: |' .. C.RAGE .. '|WS Somnolence (Gravity)|r\n' ..
                            '5: |' .. C.DEBUFF .. '|Sleepga + DOT (42)|r\n' ..
                            '6: |' .. C.WARD .. '|Phalanx (92)|r\n' ..
                            '7: |' .. C.DEBUFF .. '|Target -Attributes (27)|r\n' ..
                            '8: |' .. C.TWOHOUR .. '|2HR - Ruinous Omen'
        else
            displayString = '1: |' .. C.WARD .. '|MAB/MDB (121)|r\n' ..
                            '2: |' .. C.RAGE .. '|WS Camisado|r\n' ..
                            '3: |' .. C.RAGE .. '|WS Nether Blast|r\n' ..
                            '4: |' .. C.RAGE .. '|WS Somnolence (Gravity)|r\n' ..
                            '5: |' .. C.DEBUFF .. '|Sleepga + DOT (42)|r\n' ..
                            '6: |' .. C.WARD .. '|Phalanx (92)|r\n' ..
                            '7: |' .. C.DEBUFF .. '|Target -Attributes (27)|r\n' ..
                            '8: |' .. C.TWOHOUR .. '|2HR - Ruinous Omen'
        end
    elseif Settings.CurrentAvatar == 'Fire Spirit' then
        displayString = '1: |' .. C.IFRIT .. '|Fire (13)|r\n' ..
                        '2: |' .. C.IFRIT .. '|Fire II (38)|r\n' ..
                        '3: |' .. C.IFRIT .. '|Fire III (62)|r\n' ..
                        '4: |' .. C.IFRIT .. '|Fire IV (73)|r\n' ..
                        '5: |' .. C.IFRIT .. '|Burn (24)|r\n' ..
                        '6: |' .. C.IFRIT .. '|Flare (60)'
    elseif Settings.CurrentAvatar == 'Ice Spirit' then 
        displayString = '1: |' .. C.SHIVA .. '|Blizzard (17)|r\n' ..
                        '2: |' .. C.SHIVA .. '|Blizzard II (42)|r\n' ..
                        '3: |' .. C.SHIVA .. '|Blizzard III (64)|r\n' ..
                        '4: |' .. C.SHIVA .. '|Blizzard IV (74)|r\n' ..
                        '5: |' .. C.SHIVA .. '|Frost (22)|r\n' ..
                        '6: |' .. C.SHIVA .. '|Freeze (50)|r\n' ..
                        '7: |' .. C.SHIVA .. '|Paralyze (4)|r\n' ..
                        '8: |' .. C.SHIVA .. '|Bind (7)'
    elseif Settings.CurrentAvatar == 'Thunder Spirit' then
        displayString = '1: |' .. C.RAMUH .. '|Thunder (21)|r\n' ..
                        '2: |' .. C.RAMUH .. '|Thunder II (46)|r\n' ..
                        '3: |' .. C.RAMUH .. '|Thunder III (66)|r\n' ..
                        '4: |' .. C.RAMUH .. '|Thunder IV (75)|r\n' ..
                        '5: |' .. C.RAMUH .. '|Shock (16)|r\n' ..
                        '6: |' .. C.RAMUH .. '|Burst (56)'
    elseif Settings.CurrentAvatar == 'Air Spirit' then
        displayString = '1: |' .. C.GARUDA .. '|Aero (9)|r\n' ..
                        '2: |' .. C.GARUDA .. '|Aero II (34)|r\n' ..
                        '3: |' .. C.GARUDA .. '|Aero III (59)|r\n' ..
                        '4: |' .. C.GARUDA .. '|Aero IV (72)|r\n' ..
                        '5: |' .. C.GARUDA .. '|Choke (20)|r\n' ..
                        '6: |' .. C.GARUDA .. '|Tornado (52)|r\n' ..
                        '7: |' .. C.GARUDA .. '|Gravity (21)|r\n' ..
                        '8: |' .. C.GARUDA .. '|Silence (15)'
    elseif Settings.CurrentAvatar == 'Water Spirit' then
        displayString = '1: |' .. C.LEVIATHAN .. '|Water (5)|r\n' ..
                        '2: |' .. C.LEVIATHAN .. '|Water II (30)|r\n' ..
                        '3: |' .. C.LEVIATHAN .. '|Water III (55)|r\n' ..
                        '4: |' .. C.LEVIATHAN .. '|Water IV (70)|r\n' ..
                        '5: |' .. C.LEVIATHAN .. '|Drown (27)|r\n' ..
                        '6: |' .. C.LEVIATHAN .. '|Flood (58)|r\n' ..
                        '7: |' .. C.LEVIATHAN .. '|Poison (3)|r\n' ..
                        '8: |' .. C.LEVIATHAN .. '|Poison II (42)'
    elseif Settings.CurrentAvatar == 'Earth Spirit' then
        displayString = '1: |' .. C.TITAN .. '|Stone (1)|r\n' ..
                        '2: |' .. C.TITAN .. '|Stone II (26)|r\n' ..
                        '3: |' .. C.TITAN .. '|Stone III (51)|r\n' ..
                        '4: |' .. C.TITAN .. '|Stone IV (68)|r\n' ..
                        '5: |' .. C.TITAN .. '|Rasp (18)|r\n' ..
                        '6: |' .. C.TITAN .. '|Quake (54)|r\n' ..
                        '7: |' .. C.TITAN .. '|Slow (13)'
    elseif Settings.CurrentAvatar == 'Light Spirit' then
        displayString = '1: |' .. C.CARBUNCLE .. '|Regen|r\n' ..
                        '2: |' .. C.CARBUNCLE .. '|Cure (Low)|r\n' ..
                        '3: |' .. C.CARBUNCLE .. '|Cure (High)|r\n' ..
                        '4: |' .. C.CARBUNCLE .. '|Curaga|r\n' ..
                        '5: |' .. C.CARBUNCLE .. '|Holy|r\n' ..
                        '6: |' .. C.CARBUNCLE .. '|Banish|r\n' ..
                        '7: |' .. C.CARBUNCLE .. '|Protect|r\n' ..
                        '8: |' .. C.CARBUNCLE .. '|Shell'
    elseif Settings.CurrentAvatar == 'Dark Spirit' then
        displayString = '1: |' .. C.FENRIR .. '|Stun|r\n' ..
                        '2: |' .. C.FENRIR .. '|Dispel|r\n' ..
                        '3: |' .. C.FENRIR .. '|Sleep|r\n' ..
                        '4: |' .. C.FENRIR .. '|Sleepga|r\n' ..
                        '5: |' .. C.FENRIR .. '|Bio|r\n' ..
                        '6: |' .. C.FENRIR .. '|Drain|r\n' ..
                        '7: |' .. C.FENRIR .. '|Aspir|r\n' ..
                        '8: |' .. C.FENRIR .. '|Blind'
    end
    shared.SetExtras(displayString);
    Settings.LastDisplayed = os.clock();
end


return profile;