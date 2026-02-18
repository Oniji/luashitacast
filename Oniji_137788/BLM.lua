local profile = {};

local zones = gFunc.LoadFile('common/zones.lua');
local binds = gFunc.LoadFile('common/binds.lua');
local aliases = gFunc.LoadFile('common/aliases.lua');
local shared = gFunc.LoadFile('common/shared.lua');
local macrobooks = gFunc.LoadFile('common/macrobooks.lua');

local sets = {
    Idle_Priority = {
        Main = {'Earth Staff', 'Casting Wand', 'Solid Wand', 'Yew Wand +1', 'Willow Wand +1'},
        Sub = {''},
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet'},
        Head = {'Black Cloak', 'Vermillion Cloak', 'Wizard\'s Petasos', 'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Black Cloak', 'Vermillion Cloak', 'Wizard\'s Coat', 'Baron\'s Saio'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Chocobo Gloves'},
        Legs = {'Mahatma Slops', 'Wizard\'s Tonban', 'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops'},
        Feet = {'Wizard\'s Sabots', 'Mage\'s Sandals'},
        Neck = {'Philomath Stole', 'Black Neckerchief'},
        Ear1 = {'Moldavite Earring', 'Morion Earring', 'Energy Earring'},
        Ear2 = {'Phantom Earring', 'Morion Earring', 'Energy Earring'},
        Ring1 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Back = {'Prism Cape', 'Black Cape +1', 'Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Idle_MDT_Priority  = {
        Main = {'Earth Staff', 'Casting Wand', 'Solid Wand', 'Yew Wand +1', 'Willow Wand +1'},
        Sub = {''},
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet'},
        Head = {'Black Cloak', 'Vermillion Cloak', 'Wizard\'s Petasos', 'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Black Cloak', 'Vermillion Cloak', 'Wizard\'s Coat', 'Baron\'s Saio'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Chocobo Gloves'},
        Legs = {'Mahatma Slops', 'Wizard\'s Tonban', 'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops'},
        Feet = {'Wizard\'s Sabots', 'Mage\'s Sandals'},
        Neck = {'Philomath Stole', 'Black Neckerchief'},
        Ear1 = {'Merman\'s Earring', 'Moldavite Earring', 'Morion Earring', 'Energy Earring'},
        Ear2 = {'Merman\'s Earring', 'Phantom Earring', 'Morion Earring', 'Energy Earring'},
        Ring1 = {'Merman\'s Ring', 'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Ring2 = {'Merman\'s Ring', 'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Back = {'Prism Cape', 'Black Cape +1', 'Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Idle_PDT_Priority  = {
        Main = {'Earth Staff', 'Casting Wand', 'Solid Wand', 'Yew Wand +1', 'Willow Wand +1'},
        Sub = {''},
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet'},
        Head = {'Black Cloak', 'Vermillion Cloak', 'Wizard\'s Petasos', 'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Black Cloak', 'Vermillion Cloak', 'Wizard\'s Coat', 'Baron\'s Saio'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Chocobo Gloves'},
        Legs = {'Mahatma Slops', 'Wizard\'s Tonban', 'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops'},
        Feet = {'Wizard\'s Sabots', 'Mage\'s Sandals'},
        Neck = {'Philomath Stole', 'Black Neckerchief'},
        Ear1 = {'Merman\'s Earring', 'Moldavite Earring', 'Morion Earring', 'Energy Earring'},
        Ear2 = {'Merman\'s Earring', 'Phantom Earring', 'Morion Earring', 'Energy Earring'},
        Ring1 = {'Merman\'s Ring', 'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Ring2 = {'Merman\'s Ring', 'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Back = {'Prism Cape', 'Black Cape +1', 'Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Idle_Town_Priority = {
        Main = {'Aquilo\'s Staff', 'Earth Staff', 'Casting Wand', 'Solid Wand', 'Yew Wand +1', 'Willow Wand +1'},
        Sub = {''},
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet'},
        Head = {'Black Cloak', 'Vermillion Cloak', 'Wizard\'s Petasos', 'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Black Cloak', 'Vermillion Cloak', 'Wizard\'s Coat', 'Baron\'s Saio'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Chocobo Gloves'},
        Legs = {'Mahatma Slops', 'Wizard\'s Tonban', 'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops'},
        Feet = {'Wizard\'s Sabots', 'Mage\'s Sandals'},
        Neck = {'Philomath Stole', 'Black Neckerchief'},
        Ear1 = {'Novio Earring', 'Merman\'s Earring', 'Moldavite Earring', 'Morion Earring', 'Energy Earring'},
        Ear2 = {'Moldavite Earring', 'Merman\'s Earring', 'Phantom Earring', 'Morion Earring', 'Energy Earring'},
        Ring1 = {'Sorcerer\'s Ring','Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Back = {'Prism Cape', 'Black Cape +1', 'Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Idle_Dynamis = {
        Main = 'Earth Staff',
        Ammo = 'Phtm. Tathlum',
        Neck = 'Philomath Stole',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Head = 'Black Cloak',
        Body = 'Black Cloak',
        Hands = 'Wizard\'s Gloves',
        Legs = 'Mahatma Slops',
        Feet = 'Wizard\'s Sabots',
    },
    Nuke_Priority = {
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet'},
        Head = {'Wizard\'s Petasos', 'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Igqira Weskit', 'Baron\'s Saio'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Chocobo Gloves'},
        Legs = {'Mahatma Slops', 'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops'},
        Feet = {'Wizard\'s Sabots', 'Mage\'s Sandals'},
        Neck = {'Philomath Stole', 'Elemental Torque', 'Black Neckerchief'},
        Ear1 = {'Moldavite Earring', 'Morion Earring', 'Energy Earring'},
        Ear2 = {'Phantom Earring', 'Morion Earring', 'Energy Earring'},
        Ring1 = {'Sorcerer\'s Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Back = {'Prism Cape', 'Black Cape +1', 'Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Nuke_Acc = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Phantom Earring',
        Head = 'Wizard\'s Petasos',
        Body = 'Igqira Weskit', -- 5s
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Sorcerer\'s Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops', -- 4
        Feet = 'Wizard\'s Sabots',
    },
    Nuke_HNM = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Phantom Earring',
        Head = 'Wizard\'s Petasos',
        Body = 'Igqira Weskit', -- 5s
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Sorcerer\'s Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops', -- 4
        Feet = 'Wizard\'s Sabots',
    },
    Nuke_NoSorcRing_Priority = {
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet'},
        Head = {'Wizard\'s Petasos', 'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Igqira Weskit', 'Baron\'s Saio'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Chocobo Gloves'},
        Legs = {'Mahatma Slops', 'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops'},
        Feet = {'Wizard\'s Sabots', 'Mage\'s Sandals'},
        Neck = {'Philomath Stole', 'Elemental Torque', 'Black Neckerchief'},
        Ear1 = {'Moldavite Earring', 'Morion Earring', 'Energy Earring'},
        Ear2 = {'Phantom Earring', 'Morion Earring', 'Energy Earring'},
        Ring1 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Back = {'Prism Cape', 'Black Cape +1', 'Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Nuke_DOT_Priority = {
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet'},
        Head = {'Wizard\'s Petasos', 'Seer\'s Crown +1', 'Baron\'s Chapeau'},
        Body = {'Errant Hpl.', 'Baron\'s Saio'},
        Hands = {'Wizard\'s Gloves', 'Seer\'s Mitts +1', 'Mycophile Cuffs', 'Trader\'s Cuffs', 'Chocobo Gloves'},
        Legs = {'Mahatma Slops', 'Seer\'s Slacks +1', 'Mage\'s Slacks', 'Baron\'s Slops'},
        Feet = {'Wizard\'s Sabots', 'Mage\'s Sandals'},
        Neck = {'Philomath Stole', 'Elemental Torque', 'Black Neckerchief'},
        Ear1 = {'Morion Earring', 'Morion Earring', 'Energy Earring'},
        Ear2 = {'Phantom Earring', 'Morion Earring', 'Energy Earring'},
        Ring1 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Eremite\'s Ring +1'},
        Back = {'Prism Cape', 'Black Cape +1', 'Cape +1'},
        Waist = {'Penitent\'s Rope', 'Shaman\'s Belt', 'Silver Obi +1', 'Friar\'s Rope'},
    },
    Resting_Priority = {
        Neck = {'Checkered Scarf'}, -- 1
        Legs = {'Baron\'s Slops'}, -- 1
    },
    Dark_Priority = {
        Ammo = {'Phtm. Tathlum'},
        Hands = {'Sorcerer\'s Gloves'}, -- 10
        Legs = {'Wizard\'s Tonban'}, -- 15
        Ring1 = {'Snow Ring'},
        Ring2 = {'Snow Ring'},
        Back = {'Prism Cape'}, --5
        Waist = {'Penitent\'s Rope'},
    },
    Stun_Priority = {
        Ammo = {'Phtm. Tathlum'},
        Hands = {'Sorcerer\'s Gloves'}, -- 10
        Legs = {'Wizard\'s Tonban'}, -- 15
        Ring1 = {'Snow Ring'},
        Ring2 = {'Snow Ring'},
        Back = {'Prism Cape'}, --5
        Waist = {'Penitent\'s Rope'},
    },
    Enfeebling_Priority = { -- 49 Enfeebling Skill
        Head = {'Igqira Tiara'}, -- 10
        Body = {'Wizard\'s Coat'}, -- 12
    },
    EnfeeblingMND_Priority = {
        Body = {'Errant Hpl.'},
        Neck = {'Justice Badge'},
        Hands = {'Devotee\'s Mitts'},
        Ring1 = {'Saintly Ring'},
        Ring2 = {'Saintly Ring'},
        Legs = {'Mahatma Slops'},
        Waist = {'Penitent\'s Rope'},
        Back = {'Prism Cape'},
    },
    EnfeeblingINT_Priority = {
        Body = {'Errant Hpl.'},
        Neck = {'Philomath Stole'},
        Ring1 = {'Snow Ring'},
        Ring2 = {'Snow Ring'},
        Back = {'Prism Cape'},
        Legs = {'Mahatma Slops', },
        Waist = {'Penitent\'s Rope'},
        Ammo = {'Phtm. Tathlum'},
    },
    Healing_Priority = {
        Head = {'Wizard\'s Petasos'},
        Neck = {'Justice Badge'},
        Body = {'Errant Hpl.'},
        Hands = {'Devotee\'s Mitts'},
        Waist = {'Penitent\'s Rope'},
        Back = {'Prism Cape'},
        Legs = {'Mahatma Slops'},
        Feet = {'Wizard\'s Sabots'},
        Ring1 = {'Saintly Ring'},
        Ring2 = {'Saintly Ring'},
    },
    SIRD_PDT_Priority = {
        -- Aquaveil -- 20
        Main = {'Eremite\'s Wand'}, -- 25
        --Sub = 'Genbu\'s Shield',
        Head = {'Wizard\'s Petasos'},
        Back = {'Prism Cape'},
        Ammo = {'Phtm. Tathlum'},
        Feet = {'Wizard\'s Sabots'}, -- 20
        Body = {'Errant Hpl.'},
        Legs = {'Mahatma Slops'},
        Waist = {'Penitent\'s Rope'},
        Ear1 = {'Merman\'s Earring'}, -- MDT
        Ear2 = {'Merman\'s Earring'}, -- MDT
        Ring1 = {'Merman\'s Ring'}, -- MDT
        Ring2 = {'Merman\'s Ring'}, -- MDT
    },
    SIRD_MDT_Priority = {
        -- Aquaveil -- 20
        Main = {'Eremite\'s Wand'}, -- 25
        --Sub = 'Genbu\'s Shield'},
        Back = {'Prism Cape'},
        Ammo = {'Phtm. Tathlum'},
        Feet = {'Wizard\'s Sabots'}, -- 20
        Head = {'Wizard\'s Petasos'},
        Body = {'Errant Hpl.'},
        Legs = {'Mahatma Slops'},
        Waist = {'Penitent\'s Rope'},
        Ear1 = {'Merman\'s Earring'}, -- MDT
        Ear2 = {'Merman\'s Earring'}, -- MDT
        Ring1 = {'Merman\'s Ring'}, -- MDT
        Ring2 = {'Merman\'s Ring'}, -- MDT
    },
    Precast_Priority = { -- Fast Cast
        -- RDM subjob 15
        Feet = {'Rostrum Pumps'}, -- 2
        Ear1 = {'Loquac. Earring'}, -- 2
    },
    Enhancing_Priority = {
        Ammo = {'Phtm. Tathlum'},
        Head = {'Wizard\'s Petasos'},
        Neck = {'Enhancing Torque'},
        Body = {'Errant Hpl.'},
        Hands = {'Devotee\'s Mitts'},
        Ring1 = {'Saintly Ring'},
        Ring2 = {'Saintly Ring'},
        Back = {'Prism Cape'},
        Waist = {'Penitent\'s Rope'},
        Legs = {'Mahatma Slops'},
        Feet = {'Wizard\'s Sabots'},
    },
    Stoneskin_Priority = {
        Ammo = {'Phtm. Tathlum'},
        Head = {'Wizard\'s Petasos'},
        Neck = {'Enhancing Torque'},
        Body = {'Errant Hpl.'},
        Hands = {'Devotee\'s Mitts'},
        Ring1 = {'Saintly Ring'},
        Ring2 = {'Saintly Ring'},
        Back = {'Prism Cape'},
        Waist = {'Penitent\'s Rope'},
        Legs = {'Mahatma Slops'},
        Feet = {'Wizard\'s Sabots'},
    },
    Haste_Priority = { -- For enhancing spells that do not scale with enhancing/MND (Haste, Refresh, Blink, Utsusemi)
        Waist = {'Swift Belt'},
        --Ear1 = 'Loquac. Earring',
    },
--[[     YellowGear = { -- Currently only 152. Need 184 for /RDM and 172 for /WHM
        Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Astral Ring', -- 25
        Head = 'Zenith Crown', -- 50
        Back = 'Blue Cape', -- 15 
        Waist = 'Penitent\'s Rope', -- 20 but currently nuke belt
        Neck = 'Checkered Scarf', -- 12
        --Hands = 'Zenith Mitts', -- 50
        --Legs = 'Zenith Slacks', -- 50
        --Ammo = 'Tiphia Sting', -- 25
    }, ]]
    YellowHP = {
        Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Astral Ring', -- 25
        Head = 'Zenith Crown', -- 50
        Legs = 'Zenith Slacks', -- 50
        Back = 'Blue Cape', -- 15 
        Waist = 'Penitent\'s Rope', -- 20 but currently nuke belt
        Neck = 'Checkered Scarf', -- 12
        --Hands = 'Zenith Mitts', -- 50
        --Ammo = 'Tiphia Sting', -- 25
    },
    YellowObi = { 
        --Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Astral Ring', -- 25
        Ammo = 'Tiphia Sting', -- 25
        Head = 'Zenith Crown', -- 50
        Hands = 'Zenith Mitts', -- 50
        Legs = 'Zenith Slacks', -- 50
        --Back = 'Blue Cape', -- 15 
        Waist = 'Penitent\'s Rope', -- 20
        Neck = 'Checkered Scarf', -- 12
    },
    YellowHNM = { 
        --Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Astral Ring', -- 25
        Ammo = 'Tiphia Sting', -- 25
        Head = 'Zenith Crown', -- 50
        Hands = 'Zenith Mitts', -- 50
        Legs = 'Zenith Slacks', -- 50
        --Back = 'Blue Cape', -- 15 
        Waist = 'Penitent\'s Rope', -- 20
        Neck = 'Checkered Scarf', -- 12
    },
    YellowHNMObi = { 
        Ring1 = 'Ether Ring', -- 30
        Ring2 = 'Astral Ring', -- 25
        Ammo = 'Tiphia Sting', -- 25
        Head = 'Zenith Crown', -- 50
        Hands = 'Zenith Mitts', -- 50
        Legs = 'Zenith Slacks', -- 50
        --Back = 'Blue Cape', -- 15 
        Waist = 'Penitent\'s Rope', -- 20
        --Neck = 'Checkered Scarf', -- 12
    },

};
profile.Sets = sets;

local HP_BLM_RDM = 762; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit
local HP_BLM_WHM = 711; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 744HP is 0.76 Threshold. 236 deficit
local HP_BLM_NIN = 762; -- hardcoded values for Max HP with Nuke Set equipped (excluding Convert pieces) 758HP is 0.76 Threshold. 240 deficit

local MP_BLM_RDM = 943; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_RDM_HNM = 943; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_WHM = 940; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc
local MP_BLM_WHM_HNM = 940; -- Amount of MP you have in Nuke Set minus non-visible slots and minus convert pieces - Used for Ugg Pendant calc

local mst_cast_bracelet = false;
local src_tonban = false;
local diabolos_pole = false;
local dream_boots = false;
local dream_mittens = false

local SorcRingLatentHP = {
    RDM = {
        Default = 578,
        Default_Obi = 593,
        HNM = 578,
        HNM_Obi = 593,
    },
    WHM = {
        Default = 539,
        Default_Obi = 554,
        HNM = 539,
        HNM_Obi = 554,
    }
}

local IdleSet = {
    [1] = 'MDT',
    [2] = 'PDT',
    [3] = 'Town',
    [4] = 'Dynamis',
};

local NukeSet = {
    [1] = 'Default',
    [2] = 'Accuracy',
    [3] = 'HNM',
};


local Settings = {
    Character = 'Oniji',
    UseBorrowed = false,
    DisplayThrottle = 1,
    LastDisplayed = 0,
    UseSorcRing = false,
    UseUggPendant = false,
    UseMagicBurst = false,
    CurrentSubJob = nil,
    NukeSet = 'Default',
    IdleSet = '',
    IdleDT = 'MDT',
    Extras = '',
    CurrentLevel = 0
};


profile.OnLoad = function()

    shared.Unload();

    profile.LevelCheck();
    macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);

    binds.Common_Load();
    binds.BLM_Load();

    aliases.Common_Load();
    aliases.BLM_Load();

    gSettings.AllowAddSet = true;

    -- Setting up HandleCommand cycles and toggles
    
    local player = gData.GetPlayer();
    shared.LockStyleSet(player.MainJob);
    profile.LevelCheck();
    binds.BLM_Nukes_Load(Settings.CurrentLevel);

    shared.CreateCycle('IdleSet', IdleSet);
    Settings.IdleSet = shared.GetCycle('IdleSet');
    shared.CreateCycle('NukeSet', NukeSet);
    Settings.NukeSet = shared.GetCycle('NukeSet');

    AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Idle Set: ' .. Settings.IdleSet .. ' | Sorc Ring: ' .. (Settings.UseSorcRing and 'Active' or 'Inactive') .. ' ]--');

    shared.OnLoad();
    shared.SetCharacter(Settings.Character)

end


profile.OnUnload = function()

    binds.Common_Unload();
    binds.BLM_Unload();

    aliases.Common_Unload();
    aliases.BLM_Unload();

    shared.Unload();

end


profile.HandleCommand = function(args)

    if (args[1] == 'main') then
        macrobooks.SetMacroBook(macrobooks.BookTypes.JOBS);
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
    elseif (args[1] == 'hnm') then
        Settings.NukeSet = 'HNM';
        shared.SetCycleToValue('NukeSet', 'HNM');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Nuke Set ->> ' .. Settings.NukeSet .. ' ]--');
        return;
    elseif (args[1] == 'accuracy') then
        Settings.NukeSet = 'Accuracy';
        shared.SetCycleToValue('NukeSet', 'Accuracy');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Nuke Set ->> ' .. Settings.NukeSet .. ' ]--');
        return;
    elseif (args[1] == 'default') then
        Settings.NukeSet = 'Default';
        shared.SetCycleToValue('NukeSet', 'Default');
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Nuke Set ->> ' .. Settings.NukeSet .. ' ]--');
        return;
    elseif (args[1] == 'nuke') then
        Settings.NukeSet = shared.AdvanceCycle('NukeSet')
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Nuke Set ->> ' .. Settings.NukeSet .. ' ]--');
        return;
    elseif (args[1] == 'magicburst') then
        Settings.UseMagicBurst = not Settings.UseMagicBurst;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use MagicBurst ->> ' .. tostring(Settings.UseMagicBurst):gsub("^%l", string.upper) .. ' ]--');
        return;
    elseif (args[1] == 'borrowed') then
        Settings.UseBorrowed = not Settings.UseBorrowed;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Use Borrowed Gear ->> ' .. tostring(Settings.UseBorrowed):gsub("^%l", string.upper) .. ' ]--');
        if Settings.UseBorrowed then
            shared.SetCharacter("Oniji_Special")
        else
            shared.SetCharacter("Oniji")
        end
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
        shared.SetCurrentSet('Naked');
        return;
    end

    local player = gData.GetPlayer();
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        if Settings.CurrentLevel >= 51 then
            if Settings.UseBorrowed then
                gFunc.Equip('main','Pluto\'s Staff')
            else
                gFunc.Equip('main','Dark Staff')
            end
        end
        shared.SetCurrentSet('Resting');
    else
        if not zones.IsInTown() then
            if zones.IsInDynamis() then
                gFunc.EquipSet(sets.Idle_Dynamis);
                shared.SetCurrentSet('Idle - Dynamis');
                shared.SetCycleToValue('IdleSet', 'Dynamis');
            else
                if Settings.IdleDT == 'MDT' then
                    gFunc.EquipSet(sets.Idle_MDT);
                    shared.SetCurrentSet('Idle - MDT');
                    shared.SetCycleToValue('IdleSet', 'MDT');
                else
                    gFunc.EquipSet(sets.Idle_PDT);
                    shared.SetCurrentSet('Idle - PDT');
                    shared.SetCycleToValue('IdleSet', 'PDT');
                end
                shared.SetCurrentSet('Idle - '.. Settings.IdleDT);
            end
        else
            gFunc.EquipSet(sets.Idle_Town);
            shared.SetCurrentSet('Idle - Town');
            shared.SetCycleToValue('IdleSet', 'Town');
        end
    end

    local final_set = shared.DisplacedGearCheck(gData.GetEquipment());
    gFunc.EquipSet(final_set);

    profile.DisplayBLM();
    shared.GearOverride();

end


profile.HandleAbility = function()
end


profile.HandleItem = function()
end


profile.HandlePrecast = function()
    shared.SetCurrentSet('Precast');
    gFunc.EquipSet(sets.Precast);
end


profile.HandleMidcast = function()

    local DebuffMND = T{ 'Slow', 'Paralyze', 'Silence', 'Dia', 'Dia II' };
    local DebuffINT = T{ 'Blind', 'Bind', 'Gravity', 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock', 'Poison', 'Poison II', 'Poisonga', 'Sleep', 'Sleep II', 'Sleepga' , 'Sleepga II'};
    local action = gData.GetAction();
    local player = gData.GetPlayer();
    local environment = gData.GetEnvironment();
    local obi_used = false;
    local nukeMaxMP = 0;

    if action.Skill == 'Enfeebling Magic' then
        if DebuffMND:contains(action.Name) then
            gFunc.EquipSet(sets.EnfeeblingMND);
            shared.SetMidcastDelay(sets.Precast, null, 'Enfeebling - MND');
        elseif DebuffINT:contains(action.Name) then
            gFunc.EquipSet(sets.EnfeeblingINT);
            shared.SetMidcastDelay(sets.Precast, null, 'Enfeebling - INT');
        end
        gFunc.EquipSet(sets.Enfeebling);
        if Settings.CurrentLevel >= 51 then shared.EquipElementalStaff(action); end
        if shared.OutControl() and mst_cast_bracelet then
            gFunc.Equip('hands', 'Mst.Cst. Bracelets'); -- +7 Enfeebling
        end
        if Settings.UseBorrowed then
            gFunc.Equip('neck', 'Enfeebling Torque')
        end
    elseif action.Skill == 'Elemental Magic' then
        if DebuffINT:contains(action.Name) then
            gFunc.EquipSet(sets.Nuke_DOT);
            shared.SetMidcastDelay(sets.Precast, null, 'Elemental DOT');
            if Settings.CurrentLevel >= 51 then shared.EquipElementalStaff(action); end
        else
            if Settings.UseSorcRing then
                if Settings.NukeSet == 'Accuracy' then
                    gFunc.EquipSet(sets.Nuke_Acc);
                elseif Settings.NukeSet == 'HNM' then
                    gFunc.EquipSet(sets.Nuke_HNM);
                else
                    gFunc.EquipSet(sets.Nuke);
                end
            else
                gFunc.EquipSet(sets.Nuke_NoSorcRing);
            end
            -- Get MaxMP while in specific nuke set/subjob
            if player.SubJob == "RDM" then
                if Settings.NukeSet == 'HNM' then
                    nukeMaxMP = MP_BLM_RDM_HNM;
                else
                    nukeMaxMP = MP_BLM_RDM;
                end
            elseif player.SubJob == "WHM" then
                if Settings.NukeSet == 'HNM' then
                    nukeMaxMP = MP_BLM_WHM_HNM;
                else
                    nukeMaxMP = MP_BLM_WHM;
                end
            else
                nukeMaxMP = player.MaxMP;
            end

            shared.UggPendantCheck(action, nukeMaxMP);
            obi_used = shared.ObiCheck(action);
            local spellmatchday = shared.SpellMatchDay(action);
            if spellmatchday and src_tonban then
                gFunc.Equip('Legs', 'Sorcerer\'s Tonban');
            end
            if Settings.UseSorcRing then
                if Settings.NukeSet == 'HNM' then
                    if obi_used then
                        shared.SetMidcastDelay(sets.Precast, sets.YellowHNMObi, "Nuke + Sorc Ring");
                    else
                        shared.SetMidcastDelay(sets.Precast, sets.YellowHNM, "Nuke + Sorc Ring");
                    end
                else
                    if obi_used then
                        shared.SetMidcastDelay(sets.Precast, sets.YellowObi, "Nuke + Sorc Ring");
                    else
                        shared.SetMidcastDelay(sets.Precast, sets.YellowHP, "Nuke + Sorc Ring");
                    end
                    
                end
            else 
                shared.SetMidcastDelay(sets.Precast, null, 'Nuke');
            end
            if Settings.CurrentLevel >= 51 then shared.EquipElementalStaff(action); end
        end
    elseif (action.Skill == 'Dark Magic') then
        if (action.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
            shared.SetMidcastDelay(sets.Precast, null, 'Stun');
            if Settings.CurrentLevel >= 51 then shared.EquipElementalStaff(action); end
            shared.SetCurrentSet('Stun');
        elseif (action.Name == 'Aspir' or action.Name == 'Drain') and (environment.RawWeatherElement == 'Dark') then
            gFunc.EquipSet(sets.Dark);
            if diabolos_pole then
                gFunc.Equip('main', 'Diabolos\'s Pole');
                shared.SetMidcastDelay(sets.Precast, null, 'Drain/Aspir + D.Pole.');
            else
                if Settings.CurrentLevel >= 51 then shared.EquipElementalStaff(action); end
                shared.SetMidcastDelay(sets.Precast, null, 'Drain/Aspir');
            end
            shared.ObiCheck(action, sets.YellowObi);
        else
            gFunc.EquipSet(sets.Dark);
            shared.ObiCheck(action, sets.YellowObi);
            if Settings.CurrentLevel >= 51 then shared.EquipElementalStaff(action); end
            shared.SetMidcastDelay(sets.Precast, null, 'Dark');
        end
        if Settings.UseBorrowed then
            gFunc.Equip('neck', 'Dark Torque')
        end
    elseif (string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga')) then
        gFunc.EquipSet(sets.Healing);
        if Settings.CurrentLevel >= 51 then shared.EquipElementalStaff(action); end
        shared.SetMidcastDelay(sets.Precast, null, 'Healing');
    elseif (action.Skill == 'Enhancing Magic') then
        if action.Name == 'Stoneskin' then
            gFunc.EquipSet(sets.Stoneskin);
            shared.SetMidcastDelay(sets.Precast, null, 'Stoneskin');
        else
            gFunc.EquipSet(sets.Enhancing);
            shared.SetMidcastDelay(sets.Precast, null, 'Enhancing');
        end
        if Settings.CurrentLevel >= 51 then shared.EquipElementalStaff(action); end
    end

    if Settings.IdleDT == 'MDT' then
        gFunc.InterimEquipSet(sets.SIRD_MDT);
        shared.SetCurrentSet('SIRD + MDT');
    else
        gFunc.InterimEquipSet(sets.SIRD_PDT);
        shared.SetCurrentSet('SIRD + PDT');
    end
    if action.Name == 'Invisible' or action.Name == 'Sneak' then
        gFunc.Equip('back', 'Skulker\'s Cape');
        if action.Name == 'Sneak' and dream_boots then
            gFunc.Equip('feet', 'Dream Boots +1');
        elseif action.Name == 'Invisible' and dream_mittens then
            gFunc.Equip('hands', 'Dream Mittens +1');
        end
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
    --myLevel = 50

   -- Function for delayed lockstyle
    local function DelayedLockstyle()
        shared.LockStyleSet();
    end

    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
        binds.BLM_Nukes_Load(Settings.CurrentLevel);
        -- Level usually changes when zoning. Attempt to lockstyle as well
        DelayedLockstyle:once(2); -- Wait 2 seconds (for zone to load) then attempt lockstyle
        
    end

end

profile.SubjobCheck = function()
    local player = gData.GetPlayer();
    local subjob = player.SubJob;
    if subjob ~= 'NON' and subjob ~= Settings.CurrentSubJob then
        Settings.CurrentSubJob = subjob
        if subjob == "WHM" then
            binds.BLM_WHM_Load();
        elseif subjob == "BLM" then
            binds.BLM_RDM_Load();
        elseif subjob == "THF" then
            binds.BLM_THF_Load();
        end
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Sub Job Binds ->> ' .. subjob .. ' ]--');
        shared.LockStyleSet();
    end
end

profile.DisplayBLM = function()

    local player = gData.GetPlayer();
    local action = gData.GetAction();
    -- Throttle
    local diffTime = os.clock() - Settings.LastDisplayed;
    if diffTime < Settings.DisplayThrottle then
        return;
    end

    -- Sorc Ring Calcs
    local sjHPP = 0;
    if player.SubJob == 'RDM' then
        sjHPP = HP_BLM_RDM;
    elseif player.SubJob == 'WHM' then
        sjHPP = HP_BLM_WHM;
    elseif player.SubJob == 'NIN' then  
        sjHPP = HP_BLM_NIN;
    else
        sjHPP = player.MaxHP;
    end
    local maxHPP = math.floor(((player.HP / sjHPP) * 100) * 100 + 0.5) / 100; -- Whole percentage rounded to 2 decimals
    local threshold = math.floor(sjHPP * 0.7599); -- Sorc Ring Latent HP Threshold

    -- Ugg Pendant Calcs
    local mpPercent = 0;
    local nukeMaxMP = -1;
    local mpthreshold = 0;
    if Settings.UseUggPendant then
        if player.SubJob == "RDM" then
            nukeMaxMP = MP_BLM_RDM;
        elseif player.SubJob == "WHM" then
            nukeMaxMP = MP_BLM_WHM;
        elseif player.SubJob == "NIN" then
            nukeMaxMP = MP_BLM_NIN;
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