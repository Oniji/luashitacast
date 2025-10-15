local binds = {};

local print_avatar_tips = false;
local cure_type = '<stal>';
local current_avatar = '';

--[[ Common ]]--

local LockStyleSets = T{
    ['DRG'] = 21,
    ['BLM'] = 30,
    ['WHM'] = 40,
    ['NIN'] = 41,
    ['BST'] = 50,
    ['RDM'] = 60,
    ['THF'] = 70
};

local AllowedKeys = {
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
    '+1', '+2', '+3', '+4', '+5', '+6', '+7', '+8', '+9', '+0', -- Shift
    '^1', '^2', '^3', '^4', '^5', '^6', '^7', '^8', '^9', '^0', -- Ctrl
    '!1', '!2', '!3', '!4', '!5', '!6', '!7', '!8', '!9', '!0', -- Alt
    'q', 'e', 'r', 't', 'f', 'g', 'x', 'c', 'v',
    '+q', '+e', '+r', '+t', '+f', '+g', '+x', '+c', '+v', -- Shift
    '^q', '^e', '^r', '^t', '^f', '^g', '^x', '^c', '^v', -- Ctrl
    '!q', '!e', '!r', '!t', '!f', '!g', '!x', '!c', '!v', -- Alt
    'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10',
    '+F1', '+F2', '+F3', '+F4', '+F5', '+F6', '+F7', '+F8', '+F9', '+F10', -- Shift
    '^F1', '^F2', '^F3', '^F4', '^F5', '^F6', '^F7', '^F8', '^F9', '^F10', -- Ctrl
    '!F1', '!F2', '!F3', '!F4', '!F5', '!F6', '!F7', '!F8', '!F9', '!F10', -- Alt
    '`', '-', '=', '[', ']', ',', '.', '^!1', '^!2', '!^c', -- Misc
};

binds.Common_Load = function()
    local player = gData.GetPlayer();
    binds.add('+F1', '/lac fwd main');
    binds.add('+F2', '/lac fwd gearmode');
    binds.add('+F3', '/lac fwd logging');
    binds.add('+F4', '/lac fwd warpcudgel');
    binds.add('+F5', '/lac fwd expring');
    binds.add('+F6', '/autotarget off');
    binds.add('+F7', '/autotarget on');
    binds.add('^F6', '/fps 2');
    binds.add('^F7', '/fps 1');
    binds.add('numpad1', '/fillmode 1');
    binds.add('numpad2', '/fillmode 2');
    binds.add('numpad3', '/fillmode 3');
    binds.add('q', '/attack');
    binds.add('z', '/lockon');
    binds.add('`', '/targetnpc');
    binds.add('-', '/lac disable');
    binds.add('=', '/lac enable');
    binds.add(',', '/lac fwd area');
    binds.add('0', '/lac fwd lockstyle');
    binds.add('.', '/lac fwd fillmodetoggle');
end

binds.Common_Unload = function()
    binds.remove('+F1');
    binds.remove('+F2');
    binds.remove('+F3');
    binds.remove('+F4');
    binds.remove('+F5');
    binds.remove('+F6');
    binds.remove('+F7');
    binds.remove('^F6');
    binds.remove('^F7');
    binds.remove('numpad1');
    binds.remove('numpad2');
    binds.remove('numpad3');
    binds.remove('q');
    binds.remove('z');
    binds.remove('`');
    binds.remove('-');
    binds.remove('=');
    binds.remove(',');
    binds.remove('0');
end

--[[ DRK ]]--

binds.DRK_Load = function()
    binds.add('1', '/ja "Weapon Bash" <t>');
    binds.add('2', '/ws "Dark Harvest" <t>');
    binds.add('3', '/ja "Souleater" <me>');
    binds.add('4', '/ja "Last Resort" <me>');
    binds.add('5', '/ja "Provoke" <t>');
    binds.add('6', '/ja "Arcane Circle" <me>');
    binds.add('e', '/ra <t>');
    binds.add('+1', '/ma "Drain" <t>');
    binds.add('+2', '/ma "Aspir" <t>'); 
    binds.add('^1', '/ma "Fire" <t>');
    binds.add('^2', '/ma "Blizzard" <t>');
    binds.add('^3', '/ma "Thunder" <t>');
    binds.add('^4', '/ma "Aero" <t>');
    binds.add('^5', '/ma "Water" <t>');
    binds.add('^6', '/ma "Stone" <t>');
    binds.add('!1', '/ma "Poison" <t>');
    binds.add('!2', '/ma "Bio" <t>');
    binds.add('c', '/ma "Sleep" <t>');
    binds.add('+f', '/ma "Bind" <t>');
end

binds.DRK_Unload = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('6');
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('^1');
    binds.remove('^2');
    binds.remove('^3');
    binds.remove('^4');
    binds.remove('^5');
    binds.remove('^6');
    binds.remove('!1');
    binds.remove('!2');
    binds.remove('e');
    binds.remove('c');
    binds.remove('+f');
end

--[[ BST ]]--

binds.BST_Load = function()
    binds.add('2', '/ws "Rampage" <t>');
    binds.add('3', '/pet "Lamb Chop" <me>;/pet \"Razor Fang\" <me>');
    binds.add('4', '/ja "Reward" <me>');
    binds.add('5', '/pet "Soporific" <me>');
    binds.add('6', '/pet "Sheep Song" <me>');
    binds.add('7', '/pet "Gloeosuccus" <me>');
    binds.add('8', '/pet "Palsy Pollen" <me>');

    binds.add('f', '/pet "Fight" <t>');
    binds.add('+1', '/ja "Charm" <stnpc>');
    binds.add('+2', '/ja "Call Beast" <me>'); 
    binds.add('+3', '/pet "Heel" <me>');
    binds.add('+4', '/pet "Stay" <me>');
    binds.add('^1', '/lac fwd ammocycle');
    binds.add('^2', '/lac fwd pettype');
end

binds.BST_Unload = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('6');
    binds.remove('7');
    binds.remove('8');
    binds.remove('9');
    binds.remove('f');
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('+3');
    binds.remove('+4');
    binds.remove('+7');
    binds.remove('+8');
    binds.remove('^1');
    binds.remove('^2');
    binds.remove('^7');
    binds.remove('^8');
end

binds.BST_SJ_WHM_Load = function()

    binds.add('1', '/ma "Dia" <t>');
    binds.add('+7', '/ma "Blink" <me>');
    binds.add('+8', '/ma "Stoneskin" <me>');
    binds.add('^7', '/ma "Sneak" <stpc>');
    binds.add('^8', '/ma "Invisible" <stpc>');

end

binds.BST_SJ_NIN_Load = function()
    binds.add('1', '/ma "Utsusemi: Ichi" <me>');
    binds.add('^8', '/ma "Tonko: Ichi" <me>');

end


--[[ DRG ]]--

binds.DRG_Load = function()
    binds.add('6', '/ja "Spirit Link" <me>');
    binds.add('7', '/pet "Steady Wing" <me>');
    binds.add('8', '/ja "Ancient Circle" <me>');
    binds.add('q', '/attack');
    binds.add('e', '/ja "Jump" <t>');
    binds.add('+e', '/ja "High Jump" <t>');
    binds.add('c', '/ja "Super Jump" <t>');
    binds.add('t', '/ma "Silence" <t>');
    binds.add('f', '/ma "Erase" <stpc>');
    binds.add('9', '/mmp');
    binds.add('[', '/solo');
    binds.add('+[', '/tpcycle');
    binds.add('+]', '/wscycle');
    
end

-- DRG - Weaponskills

binds.DRG_WS_Low_Load = function()
    binds.add('+1', '/ws "Double Thrust" <t>');
    binds.add('+2', '/ws "Leg Sweep" <t>');
    binds.add('+3', '/ws "Raiden Thrust" <t>');
    binds.add('+4', '/ws "Thunder Thrust" <t>')
end

binds.DRG_WS_Mid_Load = function()
    binds.add('+1', '/ws "Penta Thrust" <t>');
    binds.add('+2', '/ws "Leg Sweep" <t>');
    binds.add('+3', '/ws "Double Thrust" <t>');
    binds.add('+3', '/ws "Raiden Thrust" <t>');
end

binds.DRG_WS_High_Load = function()
    binds.add('+1', '/ws "Penta Thrust" <t>');
    binds.add('+2', '/ws "Leg Sweep" <t>');
    binds.add('+3', '/ws "Vorpal Thrust" <t>');
    binds.add('+4', '/ws "Double Thrust" <t>');
end

binds.DRG_WS_VeryHigh_Load = function()
    binds.add('+1', '/ws "Penta Thrust" <t>');
    binds.add('+2', '/ws "Leg Sweep" <t>');
    binds.add('+3', '/ws "Wheeling Thrust" <t>');
    binds.add('+4', '/ws "Impulse Drive" <t>');
end

-- DRG - Sub Jobs

binds.DRG_SJ_SAM_Load = function()
    binds.add('1', '/ja "Third Eye" <me>');
    binds.add('2', '/ja "Hasso" <me>');
    binds.add('3', '/ja "Meditate" <me>');
    binds.add('4', '/ja "Seigan" <me>');
    binds.add('5', '/ja "Warding Circle" <me>');
end

binds.DRG_SJ_WAR_Load = function()
    binds.add('1', '/ja "Provoke" <t>');
    binds.add('2', '/ja "Berserk" <me>');
    binds.add('3', '/ja "Warcry" <me>');
    binds.add('4', '/ja "Defender" <me>');
    binds.add('5', '/ja "Warding Circle" <me>');
end

binds.DRG_SJ_WHM_Load = function()
    binds.add('1', '/ma "Baraera" <me>');
    binds.add('2', '/ma "Dia" <t>');
    binds.add('3', '/ma "Barfira" <me>');
    binds.add('4', '/ma "Poisona" <stpc>');
    binds.add('5', '/ma "Paralyna" <stpc>');
    binds.add('+5', '/ma "Silence" <t>');
    binds.add('+7', '/ma "Blink" <me>');
    binds.add('+8', '/ma "Stoneskin" <me>');
    binds.add('+9', '/ma "Aquaveil" <me>');
    binds.add('^7', '/ma "Sneak" ' .. cure_type);
    binds.add('^8', '/ma "Invisible" ' .. cure_type);
end

binds.DRG_SJ_RDM_Load = function()
    binds.add('1', '/ma "Baraero" <me>');
    binds.add('2', '/ma "Dia" <t>');
    binds.add('3', '/ma "Barfire" <me>');
    binds.add('4', '/ma "Barthunder" <me>');
    binds.add('5', '/ma "Enwater" <me>');
    binds.add('+5', '/ma "Silence" <t>');
    binds.add('+7', '/ma "Blink" <me>');
    binds.add('+8', '/ma "Stoneskin" <me>');
    binds.add('+9', '/ma "Aquaveil" <me>');
    binds.add('+0', '/ma "Phalanx" <me>');
    binds.add('^7', '/ma "Sneak" ' .. cure_type);
    binds.add('^8', '/ma "Invisible" ' .. cure_type);
end

binds.DRG_Unload = function()
    binds.remove('q');
    binds.remove('t');
    binds.remove('e');
    binds.remove('+e');
    binds.remove('q');
    binds.remove('c');
    binds.remove('9');
    binds.remove('[');
    binds.remove('+[');
    binds.remove('+]');
    binds.remove('t');
    binds.remove('f');
end

binds.DRG_WS_Unload = function()
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('+3');
    binds.remove('+4');
end

binds.DRG_SJ_Unload = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('6');
    binds.remove('7');
    binds.remove('8');
    binds.remove('+5');
    binds.remove('+7');
    binds.remove('+8');
    binds.remove('+9');
    binds.remove('+0');
    binds.remove('^7');
    binds.remove('^8');
end

--[[ WHM ]]--

binds.WHM_Load = function()
    binds.add('q', '/attack');
    binds.add('e', '/dig');
    binds.add('+7', '/ma "Blink" <me>');
    binds.add('+8', '/ma "Stoneskin" <me>');
    binds.add('+9', '/ma "Aquaveil" <me>');
    binds.add('^7', '/ma "Sneak" <stpc>');
    binds.add('^8', '/ma "Invisible" <stpc>');

end

binds.WHM_Unload = function()
    binds.remove('q');
    binds.remove('e');
    binds.remove('^7');
    binds.remove('^8');
    binds.remove('+7');
    binds.remove('+8');
    binds.remove('+9');
end

--[[ WAR ]]--

binds.WAR_Load = function()
    binds.add('q', '/attack');
end

binds.WAR_Unload = function()
    binds.remove('q');
end

--[[ BLM ]]--

binds.BLM_Load = function()
    binds.add('!1', '/ma "Poison II" <t>');
    binds.add('!2', '/ma "Bio II" <t>');
    binds.add('!3', '/ma "Paralyze" <t>');
    binds.add('!4', '/ma "Burn" <t>');
    binds.add('!5', '/ma "Choke" <t>');
    binds.add('!6', '/ma "Shock" <t>');
    binds.add('!7', '/ma "Frost" <t>');
    binds.add('!8', '/ma "Rasp" <t>');
    binds.add('!9', '/ma "Drown" <t>');

    binds.add('^1', '/ma "Drain" <t>');
    binds.add('^2', '/ma "Aspir" <t>');
    binds.add('^3', '/ma "Cure III" <stpc>');
    binds.add('^4', '/ma "Regen" <stpc>');
    binds.add('^5', '/ma "Curaga" <stpc>');
    binds.add('^7', '/ma "Sneak" <stpc>');
    binds.add('^8', '/ma "Invisible" <stpc>');
    binds.add('^9', '/ma "Tonko: Ichi" <me>');

    binds.add('+7', '/ma "Blink" <me>');
    binds.add('+8', '/ma "Stoneskin" <me>');
    binds.add('+9', '/ma "Aquaveil" <me>');
    binds.add('+0', '/ma "Phalanx" <me>');

    binds.add('e', '/ma "Stun" <t>');
    binds.add('f', '/ma "Silence" <t>');
    binds.add('+f', '/ma "Bind" <t>');
    binds.add('t', '/ma "Silence" <t>');
    binds.add('x', '/ja "Elemental Seal" <me>');
    binds.add('+x', '/p <rc="Elemental Seal">');
    binds.add('g', '/ma "Gravity" <t>');
    binds.add('+g', '/ma "Dispel" <t>');
    binds.add('c', '/ma "Sleep II" <t>');
    binds.add('+c', '/ma "Sleepga II" <t>');
    binds.add('v', '/ma "Sleep" <t>');
    binds.add('+v', '/ma "Sleepga" <t>');


    binds.add('9', '/sorcring');

end

binds.BLM_THF_Load = function()
    binds.add('f', '/ja "Flee" <me>');
    binds.add('+f', '/ja "Steal" <t>');
end

binds.BLM_Unload = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('6');
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('+3');
    binds.remove('+4');
    binds.remove('+5');
    binds.remove('+6');
    binds.remove('+7');
    binds.remove('+8');
    binds.remove('+9');
    binds.remove('!1');
    binds.remove('!2');
    binds.remove('!3');
    binds.remove('!4');
    binds.remove('!5');
    binds.remove('!6');
    binds.remove('!7');
    binds.remove('!8');
    binds.remove('!9');
    binds.remove('^1');
    binds.remove('^2');
    binds.remove('^3');
    binds.remove('^4');
    binds.remove('^7');
    binds.remove('^8');
    binds.remove('^9');
    binds.remove('^0');
    binds.remove('e');
    binds.remove('f');
    binds.remove('+f');
    binds.remove('g');
    binds.remove('+g');
    binds.remove('x');
    binds.remove('+x');
    binds.remove('c');
    binds.remove('+c');
    binds.remove('t');
    binds.remove('v');
    binds.remove('+v');
    binds.remove('9');
    binds.remove('0');
end

binds.BLM_Nukes_Load = function(myLevel)
    local stone = 1;
    local water = 1;
    local aero = 1;
    local fira = 1;
    local blizzard = 1;
    local thunder = 1;
    local sga = 1;
    local wga = 1;
    local aga = 1;
    local fga = 1;
    local bga = 1;
    local tga = 1;

    -- Set minimum level
    if (myLevel < 25) then
        myLevel = 25;
    end

    --[[ Nukes Single-Target ]]--

    -- Stone
    if (myLevel >= 68) then
        binds.add('6', '/ma "Stone IV" <t>');
        stone = 4;
    elseif (myLevel >= 51) then
        binds.add('6', '/ma "Stone III" <t>');
        stone = 3;
    elseif (myLevel >= 26) then
        binds.add('6', '/ma "Stone II" <t>');
        stone = 2;
    else
        binds.add('6', '/ma "Stone" <t>');
    end

    -- Water
    if (myLevel >= 70) then
        binds.add('5', '/ma "Water IV" <t>');
        water = 4;
    elseif (myLevel >= 55) then
        binds.add('5', '/ma "Water III" <t>');
        water = 3;
    elseif (myLevel >= 30) then
        binds.add('5', '/ma "Water II" <t>');
        water = 2;
    else
        binds.add('5', '/ma "Water" <t>');
    end

    -- Aero
    if (myLevel >= 72) then
        binds.add('4', '/ma "Aero IV" <t>');
        aero = 4;
    elseif (myLevel >= 59) then
        binds.add('4', '/ma "Aero III" <t>');
        aero = 3;
    elseif (myLevel >= 34) then
        binds.add('4', '/ma "Aero II" <t>');
        aero = 2;
    else
        binds.add('4', '/ma "Aero" <t>');
    end

    -- Fire
    if (myLevel >= 73) then
        binds.add('1', '/ma "Fire IV" <t>');
        fira = 4;
    elseif (myLevel >= 62) then
        binds.add('1', '/ma "Blizzard II" <t>');
        fira = 3;
    elseif (myLevel >= 38) then
        binds.add('1', '/ma "Fire II" <t>');
        fira = 2;
    else
        binds.add('1', '/ma "Fire" <t>');
    end

    -- Blizzard
    if (myLevel >= 74) then
        binds.add('2', '/ma "Blizzard IV" <t>');
        blizzard = 4;
    elseif (myLevel >= 64) then
        binds.add('2', '/ma "Blizzard III" <t>');
        blizzard = 3;
    elseif (myLevel >= 42) then
        binds.add('2', '/ma "Blizzard II" <t>');
        blizzard = 2;
    else
        binds.add('2', '/ma "Blizzard" <t>');
    end

    -- Thunder
    if (myLevel >= 75) then
        binds.add('3', '/ma "Thunder IV" <t>');
        thunder = 4;
    elseif (myLevel >= 66) then
        binds.add('3', '/ma "Thunder III" <t>');
        thunder = 3;
    elseif (myLevel >= 46) then
        binds.add('3', '/ma "Thunder II" <t>');
        thunder = 2;
    else
        binds.add('3', '/ma "Thunder" <t>');
    end

    --[[ Nukes AOE ]]--

    -- Stonega
    if (myLevel >= 63) then
        binds.add('+6', '/ma "Stonega III" <t>');
        sga = 3;
    elseif (myLevel >= 40) then
        binds.add('+6', '/ma "Stonega II" <t>');
        sga = 2;
    else
        binds.add('+6', '/ma "Stonega" <t>');
    end

    -- Waterga
    if (myLevel >= 65) then
        binds.add('+5', '/ma "Waterga III" <t>');
        wga = 3;
    elseif (myLevel >= 44) then
        binds.add('+5', '/ma "Waterga II" <t>');
        wga = 2;
    else
        binds.add('+5', '/ma "Waterga" <t>');
    end

    -- Aeroga
    if (myLevel >= 67) then
        binds.add('+4', '/ma "Aeroga III" <t>');
        aga = 3;
    elseif (myLevel >= 48) then
        binds.add('+4', '/ma "Aeroga II" <t>');
        aga = 2;
    else
        binds.add('+4', '/ma "Aeroga" <t>');
    end

    -- Firaga
    if (myLevel >= 69) then
        binds.add('+1', '/ma "Firaga III" <t>');
        fga = 3;
    elseif (myLevel >= 53) then
        binds.add('+1', '/ma "Firaga II" <t>');
        fga = 2;
    else
        binds.add('+1', '/ma "Firaga" <t>');
    end

    -- Blizzaga
    if (myLevel >= 71) then
        binds.add('+2', '/ma "Blizzaga III" <t>');
        bga = 3;
    elseif (myLevel >= 57) then
        binds.add('+2', '/ma "Blizzaga II" <t>');
        bga = 2;
    else
        binds.add('+2', '/ma "Blizzaga" <t>');
    end

    -- Thundaga
    if (myLevel >= 73) then
        binds.add('+3', '/ma "Thundaga III" <t>');
        tga = 3;
    elseif (myLevel >= 61) then
        binds.add('+3', '/ma "Thundaga II" <t>');
        tga = 2;
    else
        binds.add('+3', '/ma "Thundaga" <t>');
    end

    -- Print out binding outcome
    --AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Keybinds Set ->> BLM Level ' .. myLevel .. ' ]--');
--[[     AshitaCore:GetChatManager():QueueCommand(-1, '/echo [ Bindings ST : Stone: ' .. stone ..
                                                                    ', Water: ' .. water ..
                                                                    ', Aero: ' .. aero ..
                                                                    ', Fira: ' .. fira ..
                                                                    ', Blizzard: ' .. blizzard ..
                                                                    ', Thunder: ' .. thunder ..
                                                                    ' ]');
    AshitaCore:GetChatManager():QueueCommand(-1, '/echo [ Bindings AOE : Stonega: ' .. sga ..
                                                                    ', Waterga: ' .. wga ..
                                                                    ', Aeroga: ' .. aga ..
                                                                    ', Firaga: ' .. fga ..
                                                                    ', Blizzaga: ' .. bga ..
                                                                    ', Thundaga: ' .. tga ..
                                                                    ' ]'); ]]

end


--[[ NIN ]]--

binds.NIN_Load = function()
    binds.add('1', '/ja "Provoke" <t>');
    binds.add('2', '/ma "Utsusemi: Ichi" <me>');
    binds.add('3', '/ma "Utsusemi: Ni" <me>');
    binds.add('4', '/ja "Yonin" <me>');
    binds.add('5', '/p <rc="Provoke"> <call21>');
    binds.add('9', '/item "Breath Mantle" <me>');

    -- Weaponskills --
    binds.add('+1', '/ws "Blade: Retsu" <t>');
    binds.add('+2', '/ws "Blade: Rin" <t>');
    binds.add('+3', '/ws "Blade: To" <t>');

end

binds.NIN_Unload = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('9');

    -- Weaponskills --
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('+3');
end

--[[ THF ]]--

binds.THF_Load = function()
    binds.add('f', '/ma "Utsusemi: Ichi" <me>');
    binds.add('+f', '/ma "Utsusemi: Ni" <me>');
    binds.add('8', '/ja "Ancient Circle" <me>');
    binds.add('q', '/attack');
    binds.add('e', '/range <t>');
    binds.add('+e', '/ja "Bully" <t>');
    binds.add('c', '/ja "Flee" <me>');
    binds.add('x', '/ja "Steal" <t>');
    binds.add('1', '/ja "Sneak Attack" <me>;/wait 1.5;/ja "Trick Attack" <me>');
    binds.add('2', '/ja "Sneak Attack" <me>');
    binds.add('3', '/ja "Trick Attack" <me>');
    binds.add('4', '/ja "Hide" <me>');
    binds.add('5', '/ja "Mug" <t>');
    binds.add('^1', '/ja "Accomplice" <stal>');
    binds.add('^2', '/ja "Collaborator" <stal>');
    binds.add('!1', '/ranged_bolt');
    binds.add('!2', '/ranged_acid_bolt');
    binds.add('!3', '/ranged_sleep_bolt');
    binds.add('!4', '/ranged_bloody_bolt');
    binds.add('+1', '/ws "Dancing Edge" <t>');
    binds.add('+2', '/ws "Shark Bite" <t>');
    binds.add('+3', '/ws "Evisceration" <t>');
    binds.add('^7', '/item "Silent Oil" <me>');
    binds.add('^8', '/ma "Tonko: Ichi" <me>');
end

binds.THF_BST_Load = function()
    binds.add('f', '/pet "Fight" <t>');
    binds.add('^1', '/ja "Charm" <stnpc>');
    binds.add('^2', '/ja "Reward" <me>');
    binds.add('^3', '/pet "Heel" <me>');
    binds.add('^4', '/pet "Stay" <me>');
    binds.add('^5', '/lac fwd ammocycle');
    binds.add('^6', '/lac fwd pettype');
end

binds.THF_Unload = function()
    binds.remove('f');
    binds.remove('+f');
    binds.remove('8');
    binds.remove('q');
    binds.remove('e');
    binds.remove('+e');
    binds.remove('c');
    binds.remove('x');
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('^1');
    binds.remove('^2');
    binds.remove('!1');
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('+3');
    binds.remove('^7');
    binds.remove('^8');

end

--[[ RDM ]]--

binds.RDM_Load = function()
    binds.add('1', '/ma "Regen" ' .. cure_type);
    binds.add('4', '/ma "Haste" ' .. cure_type);
    binds.add('5', '/ma "Refresh" ' .. cure_type);
    binds.add('7', '/ma "Protect IV" ' .. cure_type);
    binds.add('8', '/ma "Shell IV" ' .. cure_type);

    binds.add('!1', '/ma "Slow" <t>');
    binds.add('!3', '/ma "Paralyze" <t>');
    binds.add('!4', '/ma "Blind" <t>');

    binds.add('[', '/ma "Paralyna" ' .. cure_type);
    binds.add(']', '/ma "Silena" ' .. cure_type);

    binds.add('+1', '/ws "Evisceration" <t>');
    binds.add('+2', '/ma "Enthunder" <me>');
    binds.add('g', '/ma "Gravity" <t>');
    binds.add('+g', '/ma "Dispel" <t>');
    binds.add('+6', '/ma "Enthunder" <me>');
    binds.add('+6', '/ma "Shock Spikes" <me>');
    binds.add('+7', '/ma "Blink" <me>');
    binds.add('+8', '/ma "Stoneskin" <me>');
    binds.add('+9', '/ma "Aquaveil" <me>');
    binds.add('+0', '/ma "Phalanx" <me>');

    binds.add('^7', '/ma "Sneak" ' .. cure_type);
    binds.add('^8', '/ma "Invisible" ' .. cure_type);

    binds.add('e', '/ma "Dia" <t>');
    binds.add('+e', '/ma "Stun" <t>');
    binds.add('f', '/ma "Bind" <t>');
    binds.add('+f', '/ma "Bind" <t>');
    binds.add('+x', '/ma "Curaga II" ' .. cure_type);
    binds.add('c', '/ma "Sleep II" <t>');
    binds.add('+c', '/ma "Sleepga II" <t>');
    binds.add('v', '/ma "Sleep" <t>');
    binds.add('+v', '/ma "Sleepga" <t>');
    binds.add('t', '/ma "Silence" <t>');
end

binds.RDM_WHM_Load = function()
    binds.add('x', '/ja "Divine Seal" <me>');
end

binds.RDM_BLM_Load = function()
    binds.add('x', '/ja "Elemental Seal" <me>');
end

binds.RDM_NIN_Load = function()
    binds.add('x', '/ma "Utsusemi: Ichi" <me>');
    binds.add('+x', '/ma "Utsusemi: Ni" <me>');
end

binds.RDM_BST_Load = function()
    binds.add('e', '/target <scan>;/ja "Charm" <scan>');
end

binds.RDM_THF_Load = function()
    binds.add('x', '/ja "Flee" <me>');
end

binds.RDM_DRK_Load = function()
    binds.add('e', '/ma "Stun" <t>');
end

binds.RDM_Support_Load = function(myLevel)
    local dia = 1;
    local poison = 1;
    local cure_big = 3;
    local cure_mid = 2;
    local cure_small = 1;
    local prot = 1;
    local shell = 1;
    
    -- Set level floor
    if (myLevel < 14) then
        myLevel = 14;
    end

    -- Dia
    if (myLevel >= 31) then
        binds.add('!2', '/ma "Dia II" <t>');
        dia = 2;
    else
        binds.add('!2', '/ma "Dia" <t>');
    end

    -- Poison 
    if (myLevel >= 46) then
        binds.add('!5', '/ma "Poison II" <t>');
        poison = 2;
    else
        binds.add('!5', '/ma "Poison" <t>');
    end

    -- Cure
    if (myLevel >= 48) then
        cure_big = 4;
        cure_mid = 3;
        cure_small = 2;
        binds.add('6', '/ma "Cure II" ' .. cure_type);
        binds.add('3', '/ma "Cure III" ' .. cure_type);
        binds.add('2', '/ma "Cure IV" ' .. cure_type);
    else
        binds.add('6', '/ma "Cure" ' .. cure_type);
        binds.add('3', '/ma "Cure II" ' .. cure_type);
        binds.add('2', '/ma "Cure III" ' .. cure_type);
    end

--[[     -- Protect
    if (myLevel >= 63) then
        prot = 4;
        binds.add('8', '/ma "Protect IV" ' .. cure_type);
    elseif (myLevel >= 47) then
        prot = 3;
        binds.add('8', '/ma "Protect III" ' .. cure_type);
    elseif (myLevel >= 27) then
        prot = 2;
        binds.add('8', '/ma "Protect II" ' .. cure_type);
    else
        binds.add('8', '/ma "Protect" ' .. cure_type);
    end

    -- Shell
    if (myLevel >= 68) then
        shell = 4;
        binds.add('9', '/ma "Shell IV" ' .. cure_type);
    elseif (myLevel >= 57) then
        shell = 3;
        binds.add('9', '/ma "Shell III" ' .. cure_type);
    elseif (myLevel >= 37) then
        shell = 2;
        binds.add('9', '/ma "Shell II" ' .. cure_type);
    else
        binds.add('9', '/ma "Shell" ' .. cure_type);
    end
 ]]
--[[     AshitaCore:GetChatManager():QueueCommand(-1, '/echo [ Bindings Support : Dia: ' .. dia ..
                                                                    ', Poison: ' .. poison ..
                                                                    ', Protect: ' .. prot ..
                                                                    ', Shell: ' .. shell ..
                                                                    ', Cure (Big): ' .. cure_big ..
                                                                    ', Cure (Mid): ' .. cure_mid ..
                                                                    ', Cure (Small): ' .. cure_small ..
                                                                    ' ]'); ]]


end

binds.RDM_Nukes_Load = function(myLevel)
    local stone = 1;
    local water = 1;
    local aero = 1;
    local fira = 1;
    local blizzard = 1;
    local thunder = 1;

    -- Set minimum level
    if (myLevel < 25) then
        myLevel = 25;
    end

    --[[ Nukes Single-Target ]]--

    -- Stone
    if (myLevel >= 65) then
        binds.add('^6', '/ma "Stone III" <t>');
        stone = 3;
    elseif (myLevel >= 35) then
        binds.add('^6', '/ma "Stone II" <t>');
        stone = 2;
    else
        binds.add('^6', '/ma "Stone" <t>');
    end

    -- Water
    if (myLevel >= 67) then
        binds.add('^5', '/ma "Water III" <t>');
        water = 3;
    elseif (myLevel >= 40) then
        binds.add('^5', '/ma "Water II" <t>');
        water = 2;
    else
        binds.add('^5', '/ma "Water" <t>');
    end

    -- Aero
    if (myLevel >= 69) then
        binds.add('^4', '/ma "Aero III" <t>');
        aero = 3;
    elseif (myLevel >= 45) then
        binds.add('^4', '/ma "Aero II" <t>');
        aero = 2;
    else
        binds.add('^4', '/ma "Aero" <t>');
    end

    -- Fire
    if (myLevel >= 71) then
        binds.add('^1', '/ma "Fire III" <t>');
        fira = 3;
    elseif (myLevel >= 50) then
        binds.add('^1', '/ma "Fire II" <t>');
        fira = 2;
    else
        binds.add('^1', '/ma "Fire" <t>');
    end

    -- Blizzard
    if (myLevel >= 73) then
        binds.add('^2', '/ma "Blizzard III" <t>');
        blizzard = 3;
    elseif (myLevel >= 55) then
        binds.add('^2', '/ma "Blizzard II" <t>');
        blizzard = 2;
    else
        binds.add('^2', '/ma "Blizzard" <t>');
    end

    -- Thunder
    if (myLevel >= 75) then
        binds.add('^3', '/ma "Thunder III" <t>');
        thunder = 3;
    elseif (myLevel >= 60) then
        binds.add('^3', '/ma "Thunder II" <t>');
        thunder = 2;
    else
        binds.add('^3', '/ma "Thunder" <t>');
    end

    -- Print out binding outcome
    --AshitaCore:GetChatManager():QueueCommand(-1, '/echo --[ Keybinds Set ->> RDM Level ' .. myLevel .. ' ]--');
--[[     AshitaCore:GetChatManager():QueueCommand(-1, '/echo [ Bindings ST : Stone: ' .. stone ..
                                                                    ', Water: ' .. water ..
                                                                    ', Aero: ' .. aero ..
                                                                    ', Fira: ' .. fira ..
                                                                    ', Blizzard: ' .. blizzard ..
                                                                    ', Thunder: ' .. thunder ..
                                                                    ' ]'); ]]
end

binds.RDM_Unload = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('6');
    binds.remove('8');
    binds.remove('9');
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('+3');
    binds.remove('+4');
    binds.remove('+5');
    binds.remove('+6');
    binds.remove('+7');
    binds.remove('+8');
    binds.remove('+9');
    binds.remove('!1');
    binds.remove('!2');
    binds.remove('!3');
    binds.remove('!4');
    binds.remove('!5');
    
    binds.remove('^1');
    binds.remove('^2');
    binds.remove('^3');
    binds.remove('^4');
    binds.remove('e');
    binds.remove('f');
    binds.remove('+f');
    binds.remove('x');
    binds.remove('c');
    binds.remove('+c');
    binds.remove('!c');
    binds.remove('+v');
    binds.remove('^!1');
    binds.remove('^!2');

end

binds.SMN_Load = function()

    -- Job Abilities
    binds.add('x', '/ja "Divine Seal" <me>');
    -- Avatar Commands
    binds.add('v', '/pet "Release" <me>');
    binds.add('e', '/pet "Assault" <stnpc>');
    binds.add('f', '/pet "Retreat" <me>');

    -- Avatars
    binds.add('+1', '/ma "Fire Spirit" <me>');
    binds.add('+2', '/ma "Ice Spirit" <me>');
    binds.add('+3', '/ma "Thunder Spirit" <me>');
    binds.add('+4', '/ma "Air Spirit" <me>');
    binds.add('+5', '/ma "Water Spirit" <me>');
    binds.add('+6', '/ma "Earth Spirit" <me>');
    binds.add('+7', '/ma "Light Spirit" <me>');
    binds.add('+8', '/ma "Dark Spirit" <me>');

    -- Spells
    binds.add('!1', '/ma "Slow" <t>');
    binds.add('!2', '/ma "Dia" <t>');
    binds.add('!3', '/ma "Paralyze" <t>');
    binds.add('^1', '/ma "Regen" <stpc>');
    binds.add('^2', '/ma "Cure III" <stpc>');
    binds.add('^3', '/ma "Cure II" <stpc>');
    binds.add('^4', '/ma "Curaga" <stpc>');
    binds.add('^5', '/ma "Erase" <stpc>');
    binds.add('^7', '/ma "Sneak" <stpc>');
    binds.add('^8', '/ma "Invisible" <stpc>');
end

binds.SMN_Avatar_Load = function(pet)
    if pet == 'None' then
        if print_avatar_tips then print('Avatars | 1: Carbuncle | 2: Ifrit | 3: Garuda | 4: Titan | 5: Leviathan | 6: Shiva | 7: Ramuh | 8: Fenrir | 9: Diabolos'); end
        binds.add('1', '/ma "Carbuncle" <me>');
        binds.add('2', '/ma "Ifrit" <me>');
        binds.add('3', '/ma "Garuda" <me>');
        binds.add('4', '/ma "Titan" <me>');
        binds.add('5', '/ma "Leviathan" <me>');
        binds.add('6', '/ma "Shiva" <me>');
        binds.add('7', '/ma "Ramuh" <me>');
        binds.add('8', '/ma "Fenrir" <me>');
        binds.add('9', '/ma "Diabolos" <me>');
    elseif pet == 'Carbuncle' then
        if print_avatar_tips then print('Carbuncle | 1: Prot/Shell | 2: WS PsnNails | 3: ST Heal | 4: AOE Heal | 5: WS AOE | 6: Attr Buff | 8: 2HR AOE'); end
        binds.add('1', '/pet "Shining Ruby" <me>'); -- Protect/Shell
        binds.add('2', '/pet "Poison Nails" <t>'); -- Blood Pact: Rage
        binds.add('3', '/pet "Healing Ruby" <stpc>'); -- ST Heal
        binds.add('4', '/pet "Healing Ruby II" <me>'); -- AOE Heal
        binds.add('5', '/pet "Meteorite" <t>'); -- AOE Blood Pact: Rage
        binds.add('6', '/pet "Glittering Ruby" <me>'); -- Random Attribute Buff
        binds.add('8', '/pet "Searing Light" <t>'); -- Needs 2hr AOE
    elseif pet == 'Ifrit' then
        if print_avatar_tips then print('Ifrit | 1: Attack Up | 2: WS Punch | 3: WS BurnStrk | 4: WS DblPunch | 5: Fire2 | 6: Fire4 | 8: 2HR AOE'); end
        binds.add('1', '/pet "Crimson Howl" <me>'); -- Attack Up - Blood Pact: Ward
        binds.add('2', '/pet "Punch" <t>'); -- Blood Pact: Rage
        binds.add('3', '/pet "Burning Strike" <t>'); -- Blood Pact: Rage
        binds.add('4', '/pet "Double Punch" <t>'); -- Blood Pact: Rage
        binds.add('6', '/pet "Fire II" <t>'); -- Blood Pact: Rage
        binds.add('7', '/pet "Fire IV" <t>'); -- Blood Pact: Rage
        binds.add('8', '/pet "Inferno" <t>'); -- Needs 2hr AOE
    elseif pet == 'Garuda' then
        if print_avatar_tips then print('Garuda | 1: Blink | 2: WS Claw | 3: WS PredClaws | 4: Hastega | 5: AOE Heal | 6: Aero2 | 7: Aero4 | 8: 2HR AOE'); end
        binds.add('1', '/pet "Aerial Armor" <me>'); -- Blink - Blood Pact: Ward
        binds.add('2', '/pet "Claw" <t>'); -- Blood Pact: Rage
        binds.add('3', '/pet "Predator Claws" <t>'); -- Blood Pact: Rage
        binds.add('4', '/pet "Hastega" <me>'); -- Blood Pact: Ward
        binds.add('5', '/pet "Whispering Wind" <me>'); -- Blood Pact: Ward
        binds.add('6', '/pet "Aero II" <t>'); -- Blood Pact: Rage
        binds.add('7', '/pet "Aero IV" <t>'); -- Blood Pact: Rage
        binds.add('8', '/pet "Aerial Blast" <t>'); -- Needs 2hr AOE
    elseif pet == 'Titan' then
        if print_avatar_tips then print('Titan | 1: Stoneskin | 2: WS RockThrow | 3: WS MegalthThrow | 4: WS Bind | 5: WS Bind+ | 6: Fire2 | 7: Fire4 | 8: 2HR AOE'); end
        binds.add('1', '/pet "Earthen Ward" <me>'); -- Stoneskin - Blood Pact: Ward
        binds.add('2', '/pet "Rock Throw" <t>'); -- Blood Pact: Rage
        binds.add('3', '/pet "Megalith Throw" <t>'); -- Blood Pact: Rage
        binds.add('4', '/pet "Rock Buster" <t>;/p 2: Rock Buster --> <t>'); -- Bind - Blood Pact: Rage
        binds.add('5', '/pet "Mountain Buster" <t>'); -- Bind - Blood Pact: Rage
        binds.add('6', '/pet "Stone II" <t>'); -- Blood Pact: Rage
        binds.add('7', '/pet "Stone IV" <t>'); -- Blood Pact: Rage
        binds.add('8', '/pet "Earthen Fury" <t>'); -- Needs 2hr AOE
    elseif pet == 'Leviathan' then
        if print_avatar_tips then print('Leviathan | 1: Refresh | 2: WS BarrDive | 3: WS TailWhip | 4: WS SpnDive | 5: Slowga | 6: Wat2 | 7: Wat | 8: 2HR AOE'); end
        binds.add('1', '/pet "Spring Water" <me>'); -- Refresh Blood Pact: Ward
        binds.add('2', '/pet "Barracuda Dive" <t>;/p 2: Barracude Dive --> <t>'); -- Blood Pact: Rage
        binds.add('3', '/pet "Tail Whip" <t>'); -- Gravity - Blood Pact: Rage
        binds.add('4', '/pet "Spinning Dive" <t>'); -- Blood Pact: Rage
        binds.add('5', '/pet "Slowga" <t>'); -- Blood Pact: Ward
        binds.add('6', '/pet "Water II" <t>'); -- Blood Pact: Rage
        binds.add('7', '/pet "Water IV" <t>'); -- Blood Pact: Rage
        binds.add('8', '/pet "Tidal Wave" <t>'); -- Needs 2hr AOE
    elseif pet == 'Shiva' then
        if print_avatar_tips then print('Shiva | 1: Ice Spikes | 2: WS AxeKick | 3: WS DblSlap | 4: WS Rush | 5: Sleepga | 6: Bliz2 | 7: Bliz4 | 8: 2HR AOE'); end
        binds.add('1', '/pet "Frost Armor" <me>'); -- Ice Spikes Blood Pact: Ward
        binds.add('2', '/pet "Axe Kick" <t>'); -- Blood Pact: Rage
        binds.add('3', '/pet "Double Slap" <t>'); -- Blood Pact: Rage
        binds.add('4', '/pet "Rush" <t>'); -- Blood Pact: Rage
        binds.add('5', '/pet "Sleepga" <t>'); -- Sleepga 8" Blood Pact: Ward
        binds.add('6', '/pet "Blizzard II" <t>'); -- Blood Pact: Rage
        binds.add('7', '/pet "Blizzard IV" <t>'); -- Blood Pact: Rage
        binds.add('8', '/pet "Diamond Dust" <t>'); -- Needs 2hr AOE
    elseif pet == 'Ramuh' then
        if print_avatar_tips then print('Ramuh | 1: Enthunder | 2: WS ShckStrike | 3: WS ThndrSpark | 4: WS ChaoStrike | 5: Shock Spikes | 6: Thunder2 | 7: Thunder4 | 8: 2HR AOE'); end
        binds.add('1', '/pet "Rolling Thunder" <me>'); -- Enthunder Blood Pact: Ward
        binds.add('2', '/pet "Shock Strike" <t>'); -- Stun Blood Pact: Rage
        binds.add('3', '/pet "Thunderspark" <t>'); -- Paralyze-ga Blood Pact: Rage
        binds.add('4', '/pet "Chaotic Strike" <t>'); -- Stun Blood Pact: Rage
        binds.add('5', '/pet "Lightning Armor" <me>'); -- Shock Spikes Blood Pact: Ward
        binds.add('6', '/pet "Thunder II" <t>'); -- Blood Pact: Rage
        binds.add('7', '/pet "Thunder IV" <t>'); -- Blood Pact: Rage
        binds.add('8', '/pet "Judgement Bolt" <t>'); -- Needs 2hr AOE
    elseif pet == 'Fenrir' then
        if print_avatar_tips then print('Fenrir | 1: Acc+ Eva+ | 2: WS MoonlitCharge (Blind) | 3: WS CrescntFang (Para) | 4: WS EclpBite | 5: 2x Dispel | 6: PT +Attr | 7: Target -acc -eva | 8: 2HR AOE'); end
        binds.add('1', '/pet "Ecliptic Howl" <me>'); -- Party +acc +eva Blood Pact: Ward
        binds.add('2', '/pet "Moonlit Charge" <t>'); -- Blind Blood Pact: Rage
        binds.add('3', '/pet "Crescent Fang" <t>'); -- Paralyze Blood Pact: Rage
        binds.add('4', '/pet "Eclipse Bite" <t>'); -- Blood Pact: Rage
        binds.add('5', '/pet "Lunar Roar" <t>'); -- 2x Dispel Blood Pact: Ward
        binds.add('6', '/pet "Ecliptic Growl" <me>'); -- +Attr Blood Pact: Ward
        binds.add('7', '/pet "Lunar Cry" <t>'); -- Target -acc -eva Blood Pact: Ward
        binds.add('8', '/pet "Howling Moon" <t>'); -- Needs 2hr AOE
    elseif pet == 'Diabolos' then
        if print_avatar_tips then print('Diabolos | 1: MAB/MDB | 2: WS Camisado | 3: WS NethBlast | 4: WS Somnolence (Gravity) | 5: Sleepga+DOT | 6: Phalanx | 7: Target -ATTR | 8: 2HR AOE'); end
        binds.add('1', '/pet "Dream Shroud" <me>'); -- MAB+MDB Blood Pact: Ward
        binds.add('2', '/pet "Camisado" <t>'); -- Blood Pact: Rage
        binds.add('3', '/pet "Nether Blast" <t>'); -- Blood Pact: Rage
        binds.add('4', '/pet "Somnolence" <t>'); -- Gravity Pact: Ward
        binds.add('5', '/pet "Nightmare" <t>'); -- Sleepga + DOT Blood Pact: Ward
        binds.add('6', '/pet "Noctoshield" <me>'); -- Phalanx Blood Pact: Ward
        binds.add('7', '/pet "Ultimate Terror" <t>'); -- Target -attr Blood Pact: Ward
        binds.add('8', '/pet "Ruinous Omen" <t>'); -- Needs 2hr AOE
        binds.Info_DreamShroud();
    elseif pet == 'Fire Spirit' then
        if print_avatar_tips then print('Fire Spirit | 1: Fire (13) | 2: Fire II (38) | 3: Fire III (62) | 4: Fire IV (73) | 5: Burn (24) | 6: Flare (60)'); end
        binds.add('1', '/ma "Fire" <t>'); -- 13
        binds.add('2', '/ma "Fire II" <t>'); -- 38
        binds.add('3', '/ma "Fire III" <t>'); -- 62
        binds.add('4', '/ma "Fire IV" <t>'); -- 73
        binds.add('5', '/ma "Burn" <t>'); -- 24
        binds.add('6', '/ma "Flare" <t>'); -- 60
    elseif pet == 'Ice Spirit' then
        if print_avatar_tips then print('Ice Spirit | 1: Blizzard (17) | 2: Blizzard II (42) | 3: Blizzard III (64) | 4: Blizzard IV (74) | 5: Frost (22) | 6: Freeze (50) | 7: Paralyze (4) | 8: Bind (7)'); end
        binds.add('1', '/ma "Blizzard" <t>'); -- 17
        binds.add('2', '/ma "Blizzard II" <t>'); -- 42
        binds.add('3', '/ma "Blizzard III" <t>'); -- 64
        binds.add('4', '/ma "Blizzard IV" <t>'); -- 74
        binds.add('5', '/ma "Frost" <t>'); -- 22
        binds.add('6', '/ma "Freeze" <t>'); -- 50
        binds.add('7', '/ma "Paralyze" <t>'); -- 4
        binds.add('8', '/ma "Bind" <t>'); -- 7
    elseif pet == 'Thunder Spirit' then
        if print_avatar_tips then print('Thunder Spirit | 1: Thunder (21) | 2: Thunder II (46) | 3: Thunder III (66) | 4: Thunder IV (75) | 5: Shock (16) | 6: Burst (56)'); end
        binds.add('1', '/ma "Thunder" <t>'); -- 21
        binds.add('2', '/ma "Thunder II" <t>'); -- 46
        binds.add('3', '/ma "Thunder III" <t>'); -- 66
        binds.add('4', '/ma "Thunder IV" <t>'); -- 75
        binds.add('5', '/ma "Shock" <t>'); -- 16
        binds.add('6', '/ma "Burst" <t>'); -- 56
    elseif pet == 'Air Spirit' then
        if print_avatar_tips then print('Air Spirit | 1: Aero (9) | 2: Aero II (34) | 3: Aero III (59) | 4: Aero IV (72) | 5: Choke (20) | 6: Tornado (52) |  7: Gravity (21) | 8: Silence (15)'); end
        binds.add('1', '/ma "Aero" <t>'); -- 9
        binds.add('2', '/ma "Aero II" <t>'); -- 34
        binds.add('3', '/ma "Aero III" <t>'); -- 59
        binds.add('4', '/ma "Aero IV" <t>'); -- 72
        binds.add('5', '/ma "Choke" <t>'); -- 20
        binds.add('6', '/ma "Tornado" <t>'); -- 52
        binds.add('7', '/ma "Gravity" <t>'); -- 21
        binds.add('8', '/ma "Silence" <t>'); -- 15
    elseif pet == 'Water Spirit' then
        if print_avatar_tips then print('Water Spirit | 1: Water (5) | 2: Water II (30) | 3: Water III (55) | 4: Water IV (70) | 5: Drown (27) | 6: Flood (58) |  7: Poison (3) | 8: Poison II (42)'); end
        binds.add('1', '/ma "Water" <t>'); -- 5
        binds.add('2', '/ma "Water II" <t>'); -- 30
        binds.add('3', '/ma "Water III" <t>'); -- 55
        binds.add('4', '/ma "Water IV" <t>'); -- 70
        binds.add('5', '/ma "Drown" <t>'); -- 27
        binds.add('6', '/ma "Flood" <t>'); -- 58
        binds.add('7', '/ma "Poison" <t>'); -- 3   
        binds.add('8', '/ma "Poison II" <t>'); -- 42    
    elseif pet == 'Earth Spirit' then
        if print_avatar_tips then print('Earth Spirit | 1: Stone (1) | 2: Stone II (26) | 3: Stone III (51) | 4: Stone IV (68) | 5: Rasp (18) | 6: Quake (54) |  7: Slow (13)'); end
        binds.add('1', '/ma "Stone" <t>'); -- 1
        binds.add('2', '/ma "Stone II" <t>'); -- 26
        binds.add('3', '/ma "Stone III" <t>'); -- 51
        binds.add('4', '/ma "Stone IV" <t>'); -- 68
        binds.add('5', '/ma "Rasp" <t>'); -- 18
        binds.add('6', '/ma "Quake" <t>'); -- 54
        binds.add('7', '/ma "Slow" <t>'); -- 13    
    elseif pet == 'Light Spirit' then
        if print_avatar_tips then print('Light Spirit | 1: Regen | 2: Cure (Low) | 3: Cure (High) | 4: Curaga | 5: Holy | 6: Banish | 7: Protect | 8: Shell'); end
        binds.SMN_LightSpirit_Load();
    elseif pet == 'Dark Spirit' then
        if print_avatar_tips then print('Dark Spirit | 1: Stun | 2: Dispel | 3: Sleep | 4: Sleepga | 5: Bio | 6: Drain | 7: Aspir | 8: Blind'); end
        binds.add('1', '/ma "Stun" <t>'); -- 37
        binds.add('2', '/ma "Dispel" <t>'); -- 32
        binds.add('6', '/ma "Drain" <t>'); -- 10
        binds.add('7', '/ma "Aspir" <t>'); -- 20
        binds.add('8', '/ma "Blind" <t>'); -- 4
        binds.SMN_DarkSpirit_Load();
    end
    current_avatar = pet;
end

binds.SMN_GetCurrentAvatar = function()
    return current_avatar;
end

binds.SMN_DarkSpirit_Load = function()
    local level = gData.GetPlayer().MainJobSync;
    -- Sleep
    if level >= 41 then
        binds.add('3', '/ma "Sleep II" <t>')
    elseif level >= 20 then
        binds.add('3', '/ma "Sleep" <t>')
    end
    -- Sleepga
    if level >= 56 then
        binds.add('4', '/ma "Sleepga II" <t>')
    elseif level >= 31 then
        binds.add('4', '/ma "Sleepga" <t>')
    end
    -- Bio
    if level >= 35 then
        binds.add('5', '/ma "Bio II" <t>')
    elseif level >= 10 then
        binds.add('5', '/ma "Bio" <t>')
    end
end

binds.SMN_LightSpirit_Load = function()
    local level = gData.GetPlayer().MainJobSync;
    -- Regen
    if level >= 21 then
        binds.add('1', '/ma "Regen" <stpc>');
    end
    -- Holy
    if level >= 50 then
        binds.add('5', '/ma "Holy" <t>');
    end
    -- Cure
    if level >= 61 then
        binds.add('2', '/ma "Cure IV" <stpc>');
        binds.add('3', '/ma "Cure V" <stpc>');
    elseif level >= 41 then
        binds.add('2', '/ma "Cure III" <stpc>');
        binds.add('3', '/ma "Cure IV" <stpc>');
    elseif level >= 21 then
        binds.add('2', '/ma "Cure II" <stpc>');
        binds.add('3', '/ma "Cure III" <stpc>');
    elseif level >= 11 then
        binds.add('2', '/ma "Cure" <stpc>');
        binds.add('3', '/ma "Cure II" <stpc>');
    else
        binds.add('2', '/ma "Cure" <stpc>');
        binds.add('3', '/ma "Cure" <stpc>');
    end
    -- Curaga
    if level >= 71 then
        binds.add('4', '/ma "Curaga IV" <stpc>');
    elseif level >= 51 then
        binds.add('4', '/ma "Curaga III" <stpc>');
    elseif level >= 31 then
        binds.add('4', '/ma "Curaga II" <stpc>');
    elseif level >= 16 then
        binds.add('4', '/ma "Curaga" <stpc>');
    end
    -- Protect
    if level >= 63 then
        binds.add('7', '/ma "Protect IV" <stpc>');
    elseif level >= 47 then
        binds.add('7', '/ma "Protect III" <stpc>');
    elseif level >= 27 then
        binds.add('7', '/ma "Protect II" <stpc>');
    elseif level >= 7 then
        binds.add('7', '/ma "Protect" <stpc>');
    end  
    -- Shell
    if level >= 68 then
        binds.add('8', '/ma "Shell IV" <stpc>');
    elseif level >= 57 then
        binds.add('8', '/ma "Shell III" <stpc>');
    elseif level >= 37 then
        binds.add('8', '/ma "Shell II" <stpc>');
    elseif level >= 17 then
        binds.add('8', '/ma "Shell" <stpc>');
    end 
    -- Banish
    if level >= 65 then
        binds.add('6', '/ma "Banish III" <t>');
    elseif level >= 30 then
        binds.add('6', '/ma "Banish II" <t>');
    elseif level >= 5 then
        binds.add('6', '/ma "Banish" <t>');
    end 
end


binds.SMN_Avatar_Unload = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('6');
    binds.remove('7');
    binds.remove('8');
    binds.remove('9');
end

binds.SMN_Unload = function()
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('+3');
    binds.remove('+4');
    binds.remove('+5');
    binds.remove('+6');
    binds.remove('+7');
    binds.remove('+8');
    binds.remove('+9');
    binds.remove('^1');
    binds.remove('^2');
    binds.remove('^3');
    binds.remove('^4');
    binds.remove('^5');
    binds.remove('^6');
    binds.remove('^7');
    binds.remove('^8');
    binds.remove('^9');
    binds.remove('!0');
    binds.remove('!1');
    binds.remove('!2');
    binds.remove('!3');
    binds.remove('q');
    binds.remove('v');
    binds.remove('e');
    binds.remove('x');
end

binds.Unbind_All = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('3');
    binds.remove('4');
    binds.remove('5');
    binds.remove('6');
    binds.remove('7');
    binds.remove('8');
    binds.remove('9');
    binds.remove('0');
    binds.remove('+1');
    binds.remove('+2');
    binds.remove('+3');
    binds.remove('+4');
    binds.remove('+5');
    binds.remove('+6');
    binds.remove('+7');
    binds.remove('+8');
    binds.remove('+9');
    binds.remove('+0');
    binds.remove('!1');
    binds.remove('!2');
    binds.remove('!3');
    binds.remove('!4');
    binds.remove('!5');
    binds.remove('!6');
    binds.remove('!7');
    binds.remove('!8');
    binds.remove('!9');
    binds.remove('!0');
    binds.remove('^1');
    binds.remove('^2');
    binds.remove('^3');
    binds.remove('^4');
    binds.remove('^5');
    binds.remove('^6');
    binds.remove('^7');
    binds.remove('^8');
    binds.remove('^9');
    binds.remove('^0');
    binds.remove('e');
    binds.remove('f');
    binds.remove('+f');
    binds.remove('x');
    binds.remove('+x');
    binds.remove('c');
    binds.remove('+c');
    binds.remove('!^c');
    binds.remove('+v');
    binds.remove('^!1');
    binds.remove('^!2');
end

binds.HELM_Load = function()
    binds.send_command('/addon unload metrics');
    binds.send_command('/addon load hgather');
    binds.add('f', '/ja "Flee" <me>');
end

binds.Logging_Load = function()
    binds.add('1', '/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;');
    binds.add('2', '/item "Hatchet" <stnpc>;/wait 5;/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;/wait 5;/item "Hatchet" <lastst>;');
    binds.add('3', '/party x');
    binds.add('f', '/ja "Flee" <me>');
end

binds.Digging_Load = function()
    binds.add('e', '/dig');
end

binds.Fishing_Load = function()
    binds.add('q', '/fish');
end

binds.HELM_Unload = function()
    binds.remove('1');
    binds.remove('2');
    binds.remove('f');
    binds.remove('e');
    binds.remove('q');
    binds.send_command('/addon load hgather');
    binds.send_command('/addon unload metrics');
end

binds.add = function(key, command)
    if key and command then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ' .. key .. ' ' .. command); 
    end
end

binds.remove = function(key)
    if key then
        AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ' .. key); 
    end
end

binds.send_command = function(command)
    if command then
        AshitaCore:GetChatManager():QueueCommand(-1, command); 
    end
end

binds.Info_DreamShroud = function()
        local env = gData.GetEnvironment();
        if env then
            local mab = 0;
            local mdb = 0;
            if env.Time >= 0 and env.Time <= 1 then
                mab = 13;
                mdb = 1;
            elseif (env.Time > 1 and env.Time <= 2) or (env.Time > 23 and env.Time <= 23.99) then
                mab = 12;
                mdb = 2;
            elseif (env.Time > 2 and env.Time <= 3) or (env.Time > 22 and env.Time <= 23) then
                mab = 11;
                mdb = 3;
            elseif (env.Time > 3 and env.Time <= 4) or (env.Time > 21 and env.Time <= 22) then
                mab = 10;
                mdb = 4;
            elseif (env.Time > 4 and env.Time <= 5) or (env.Time > 20 and env.Time <= 21) then
                mab = 9;
                mdb = 5;
            elseif (env.Time > 5 and env.Time <= 6) or (env.Time > 19 and env.Time <= 20) then
                mab = 8;
                mdb = 6;
            elseif (env.Time > 6 and env.Time <= 7) or (env.Time > 18 and env.Time <= 19) then
                mab = 7;
                mdb = 7;
            elseif (env.Time > 7 and env.Time <= 8) or (env.Time > 17 and env.Time <= 18) then
                mab = 6;
                mdb = 8;
            elseif (env.Time > 8 and env.Time <= 9) or (env.Time > 16 and env.Time <= 17) then
                mab = 5;
                mdb = 9;
            elseif (env.Time > 9 and env.Time <= 10) or (env.Time > 15 and env.Time <= 16) then
                mab = 4;
                mdb = 10;
            elseif (env.Time > 10 and env.Time <= 11) or (env.Time > 14 and env.Time <= 15) then
                mab = 3;
                mdb = 11;
            elseif (env.Time > 11 and env.Time <= 12) or (env.Time > 13 and env.Time <= 14) then
                mab = 2;
                mdb = 12;
            elseif env.Time > 12 and env.Time <= 13 then
                mab = 1;
                mdb = 13;
            end
            if print_avatar_tips then print("Dream Shroud | Time: " .. env.Time .. " | MAB: +" .. mab .. " | MDB: +" .. mdb); end
            return mab, mdb;
        end
end

binds.Info_EclipticHowl = function()
        local env = gData.GetEnvironment();
        if env then
            local acc = 0;
            local eva = 0;
            if env.MoonPhase == 'Full Moon' then
                acc = 21;
                eva = 5;
            elseif env.MoonPhase == 'Waning Gibbous' or env.MoonPhase == 'Waxing Gibbous' then
                acc = 17;
                eva = 9;
            elseif env.MoonPhase == 'Last Quarter' or env.MoonPhase == 'First Quarter' then
                acc = 13;
                eva = 13;
            elseif env.MoonPhase == 'Waning Crescent' or env.MoonPhase == 'Waxing Crescent' then
                acc = 9;
                eva = 17;
            elseif env.MoonPhase == 'New Moon' then
                acc = 5;
                eva = 21;
            end
            if print_avatar_tips then print("Ecliptic Howl | Time: " .. env.Time .. " | Acc: +" .. acc .. " | Eva: +" .. eva); end
            return acc, eva;
        end
end

return binds;