local binds = {};

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

binds.Common_Load = function()
    local player = gData.GetPlayer();
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F1 /lac fwd main');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F2 /lac fwd gearmode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F3 /lac fwd logging');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F4 /lac fwd warpcudgel');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F5 /lac fwd expring');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F6 /autotarget off');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F7 /autotarget on');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^F6 /fps 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^F7 /fps 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind numpad1 /fillmode 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind numpad2 /fillmode 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind numpad3 /fillmode 3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind q /attack');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ` /targetnpc');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind - /lac disable');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind = /lac enable');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind , /lac fwd area');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^!\\ /deeps reset; /points config');
    if LockStyleSets[player.MainJob] then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 0 /lockstyleset ' .. LockStyleSets[player.MainJob] .. ';/echo --[ Lock Style Set ->> ' .. player.MainJob .. ' ]--' );
    end
end

binds.Common_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^F6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^F7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind numpad1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind numpad2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind numpad3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind q');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind `');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind -');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind =');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ,');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^!\\');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 0');
end

--[[ BST ]]--
binds.SMN_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ws "Rampage" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /pet "Lamb Chop" <me>;/pet \"Razor Fang\" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ja "Reward" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /pet "Rage" <me>; /tt custom Pet_Rage 180');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /pet "Sheep Song" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind f /pet "Fight" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ja "Charm" <stnpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ja "Call Beast" <me>'); 
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /pet "Heel" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +4 /pet "Stay" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^1 /lac fwd ammocycle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^2 /lac fwd pettype');
end

--[[ BST ]]--

binds.BST_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ws "Rampage" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /pet "Lamb Chop" <me>;/pet \"Razor Fang\" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ja "Reward" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /pet "Rage" <me>; /tt custom Pet_Rage 180');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /pet "Sheep Song" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind f /pet "Fight" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ja "Charm" <stnpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ja "Call Beast" <me>'); 
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /pet "Heel" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +4 /pet "Stay" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^1 /lac fwd ammocycle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^2 /lac fwd pettype');
end

binds.BST_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^8');
end

binds.BST_SJ_WHM_Load = function()

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Dia" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ma "Cure" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 7 /ma "Protectra" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 8 /ma "Shellra" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 9 /maxmp');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +7 /ma "Blink" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +8 /ma "Stoneskin" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^7 /ma "Sneak" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^8 /ma "Invisible" <stpc>');

end

binds.BST_SJ_NIN_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Utsusemi: Ichi" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^8 /ma "Tonko: Ichi" <me>');

end


--[[ DRG ]]--

binds.DRG_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /ja "Spirit Link" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 7 /pet "Steady Wing" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 8 /ja "Ancient Circle" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind q /attack');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind e /ja "Jump" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +e /ja "High Jump" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind c /ja "Super Jump" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind t /ma "Silence" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind f /ma "Erase" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 9 /mmp');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind [ /solo');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +[ /tpcycle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +] /wscycle');
    
end

-- DRG - Weaponskills

binds.DRG_WS_Low_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ws "Double Thrust" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ws "Leg Sweep" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ws "Raiden Thrust" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +4 /ws "Thunder Thrust" <t>')
end

binds.DRG_WS_Mid_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ws "Penta Thrust" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ws "Leg Sweep" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ws "Double Thrust" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ws "Raiden Thrust" <t>');
end

binds.DRG_WS_High_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ws "Penta Thrust" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ws "Leg Sweep" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ws "Vorpal Thrust" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +4 /ws "Double Thrust" <t>');
end

binds.DRG_WS_VeryHigh_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ws "Penta Thrust" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ws "Leg Sweep" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ws "Wheeling Thrust" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +4 /ws "Impulse Drive" <t>');
end

-- DRG - Sub Jobs

binds.DRG_SJ_SAM_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ja "Third Eye" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ja "Hasso" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ja "Meditate" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ja "Seigan" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ja "Warding Circle" <me>');
end

binds.DRG_SJ_WAR_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ja "Provoke" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ja "Berserk" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ja "Warcry" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ja "Defender" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ja "Warding Circle" <me>');
end

binds.DRG_SJ_WHM_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Baraera" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Dia" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Barfira" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ma "Poisona" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ma "Paralyna" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +5 /ma "Silence" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +7 /ma "Blink" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +8 /ma "Stoneskin" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +9 /ma "Aquaveil" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^7 /ma "Sneak" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^8 /ma "Invisible" <me>');
end

binds.DRG_SJ_RDM_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Baraero" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Dia" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Barfire" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ma "Barthunder" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ma "Phalanx" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +5 /ma "Silence" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +7 /ma "Blink" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +8 /ma "Stoneskin" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +9 /ma "Aquaveil" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^7 /ma "Sneak" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^8 /ma "Invisible" <me>');
end

binds.DRG_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind q');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind t');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind e');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +e');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind q');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind [');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +[');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +]');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind t');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind f');
end

binds.DRG_WS_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +4');
end

binds.DRG_SJ_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^8');
end

--[[ WHM ]]--

binds.WHM_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind q /attack');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind e /dig');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +7 /ma "Blink" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +8 /ma "Stoneskin" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +9 /ma "Aquaveil" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^7 /ma "Sneak" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^8 /ma "Invisible" <stpc>');

end

binds.WHM_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind q');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind e');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +9');
end

--[[ WAR ]]--

binds.WAR_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind q /attack');
end

binds.WAR_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind q');
end

--[[ BLM ]]--

binds.BLM_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !1 /ma "Poison II" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !2 /ma "Bio II" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !3 /ma "Paralyze" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !4 /ma "Burn" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !5 /ma "Choke" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !6 /ma "Shock" <t>');

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^1 /ma "Drain" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^2 /ma "Aspir" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^3 /ma "Cure III" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^4 /ma "Regen" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^5 /ma "Curaga" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^7 /ma "Sneak" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^8 /ma "Invisible" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^9 /ma "Tonko: Ichi" <me>');

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +7 /ma "Blink" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +8 /ma "Stoneskin" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +9 /ma "Aquaveil" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +0 /ma "Phalanx" <me>');

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind e /ma "Stun" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind f /ma "Silence" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +f /ma "Bind" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind t /ma "Silence" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind x /ja "Elemental Seal" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +x /p <rc="Elemental Seal">');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind g /ma "Gravity" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind c /ma "Sleep II" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +c /ma "Sleepga II" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind v /ma "Sleep" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +v /ma "Sleepga" <t>');


    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 9 /sorcring');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 0 /lockstyleset 30');

end

binds.BLM_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^0');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind e');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind g');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind x');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +x');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind t');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind v');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +v');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 0');
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
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /ma "Stone IV" <t>');
        stone = 4;
    elseif (myLevel >= 51) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /ma "Stone III" <t>');
        stone = 3;
    elseif (myLevel >= 26) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /ma "Stone II" <t>');
        stone = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /ma "Stone" <t>');
    end

    -- Water
    if (myLevel >= 70) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ma "Water IV" <t>');
        water = 4;
    elseif (myLevel >= 55) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ma "Water III" <t>');
        water = 3;
    elseif (myLevel >= 30) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ma "Water II" <t>');
        water = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ma "Water" <t>');
    end

    -- Aero
    if (myLevel >= 72) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ma "Aero IV" <t>');
        aero = 4;
    elseif (myLevel >= 59) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ma "Aero III" <t>');
        aero = 3;
    elseif (myLevel >= 34) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ma "Aero II" <t>');
        aero = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ma "Aero" <t>');
    end

    -- Fire
    if (myLevel >= 73) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Fire IV" <t>');
        fira = 4;
    elseif (myLevel >= 62) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Blizzard II" <t>');
        fira = 3;
    elseif (myLevel >= 38) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Fire II" <t>');
        fira = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Fire" <t>');
    end

    -- Blizzard
    if (myLevel >= 74) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Blizzard IV" <t>');
        blizzard = 4;
    elseif (myLevel >= 64) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Blizzard III" <t>');
        blizzard = 3;
    elseif (myLevel >= 42) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Blizzard II" <t>');
        blizzard = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Blizzard" <t>');
    end

    -- Thunder
    if (myLevel >= 75) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Thunder IV" <t>');
        thunder = 4;
    elseif (myLevel >= 66) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Thunder III" <t>');
        thunder = 3;
    elseif (myLevel >= 46) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Thunder II" <t>');
        thunder = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Thunder" <t>');
    end

    --[[ Nukes AOE ]]--

    -- Stonega
    if (myLevel >= 63) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +6 /ma "Stonega III" <t>');
        sga = 3;
    elseif (myLevel >= 40) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +6 /ma "Stonega II" <t>');
        sga = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +6 /ma "Stonega" <t>');
    end

    -- Waterga
    if (myLevel >= 65) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +5 /ma "Waterga III" <t>');
        wga = 3;
    elseif (myLevel >= 44) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +5 /ma "Waterga II" <t>');
        wga = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +5 /ma "Waterga" <t>');
    end

    -- Aeroga
    if (myLevel >= 67) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +4 /ma "Aeroga III" <t>');
        aga = 3;
    elseif (myLevel >= 48) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +4 /ma "Aeroga II" <t>');
        aga = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +4 /ma "Aeroga" <t>');
    end

    -- Firaga
    if (myLevel >= 69) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ma "Firaga III" <t>');
        fga = 3;
    elseif (myLevel >= 53) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ma "Firaga II" <t>');
        fga = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ma "Firaga" <t>');
    end

    -- Blizzaga
    if (myLevel >= 71) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ma "Blizzaga III" <t>');
        bga = 3;
    elseif (myLevel >= 57) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ma "Blizzaga II" <t>');
        bga = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ma "Blizzaga" <t>');
    end

    -- Thundaga
    if (myLevel >= 73) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ma "Thundaga III" <t>');
        tga = 3;
    elseif (myLevel >= 61) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ma "Thundaga II" <t>');
        tga = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ma "Thundaga" <t>');
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
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ja "Provoke" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Utsusemi: Ichi" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Utsusemi: Ni" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ja "Yonin" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /p <rc="Provoke"> <call21>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 9 /item "Breath Mantle" <me>');

    -- Weaponskills --
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ws "Blade: Retsu" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ws "Blade: Rin" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ws "Blade: To" <t>');

end

binds.NIN_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 9');

    -- Weaponskills --
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +3');
end

--[[ THF ]]--

binds.THF_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind f /ma "Utsusemi: Ichi" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +f /ma "Utsusemi: Ni" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 8 /ja "Ancient Circle" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind q /attack');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind e /range <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +e /range <t>; /p Pulling ... <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind c /ja "Flee" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind x /ja "Steal" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +x /ja "Mug" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /echo Future Keybind SATA');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ja "Sneak Attack" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ja "Trick Attack" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ja "Hide" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^1 /ja "Accomplice" <stal>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^2 /ja "Collaborator" <stal>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !1 /ja "Bully" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ws "Wasp Sting" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ws "Gust Slash" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +3 /ws "Viper Bite" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^7 /item "Silent Oil" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^8 /ma "Tonko: Ichi" <me>');

end

binds.THF_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind q');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind e');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +e');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind x');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +x');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^8');

end

--[[ RDM ]]--

binds.RDM_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 /ma "Regen" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 /ma "Haste" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 /ma "Refresh" <stpc>');

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !1 /ma "Slow" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !3 /ma "Paralyze" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !4 /ma "Blind" <t>');

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +1 /ma "Gravity" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +2 /ma "Dispel" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +6 /ma "Phalanx" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +7 /ma "Blink" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +8 /ma "Stoneskin" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +9 /ma "Aquaveil" <me>');

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^7 /ma "Sneak" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^8 /ma "Invisible" <stpc>');

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind e /ma "Dia" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind f /ma "Silence" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +f /ma "Bind" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind x /ja "Elemental Seal" <me>; /ja "Divine Seal" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +x /ma "Curaga" <stpc>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind c /ma "Sleep" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !c /ma "Sleep II" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +c /ma "Sleepga" <t>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +v /ja "Convert" <me>');
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
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind !2 /ma "Dia II" <t>');
        dia = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind !2 /ma "Dia" <t>');
    end

    -- Poison 
    if (myLevel >= 46) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind !5 /ma "Poison II" <t>');
        poison = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind !5 /ma "Poison" <t>');
    end

    -- Cure
    if (myLevel >= 48) then
        cure_big = 4;
        cure_mid = 3;
        cure_small = 2;
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Cure II" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Cure III" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /ma "Cure IV" <stpc>');
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 /ma "Cure" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 /ma "Cure II" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 /ma "Cure III" <stpc>');
    end

    -- Protect
    if (myLevel >= 63) then
        prot = 4;
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 8 /ma "Protect IV" <stpc>');
    elseif (myLevel >= 47) then
        prot = 3;
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 8 /ma "Protect III" <stpc>');
    elseif (myLevel >= 27) then
        prot = 2;
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 8 /ma "Protect II" <stpc>');
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 8 /ma "Protect" <stpc>');
    end

    -- Shell
    if (myLevel >= 68) then
        shell = 4;
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 9 /ma "Shell IV" <stpc>');
    elseif (myLevel >= 57) then
        shell = 3;
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 9 /ma "Shell III" <stpc>');
    elseif (myLevel >= 37) then
        shell = 2;
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 9 /ma "Shell II" <stpc>');
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind 9 /ma "Shell" <stpc>');
    end

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
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^6 /ma "Stone III" <t>');
        stone = 3;
    elseif (myLevel >= 35) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^6 /ma "Stone II" <t>');
        stone = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^6 /ma "Stone" <t>');
    end

    -- Water
    if (myLevel >= 67) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^5 /ma "Water III" <t>');
        water = 3;
    elseif (myLevel >= 40) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^5 /ma "Water II" <t>');
        water = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^5 /ma "Water" <t>');
    end

    -- Aero
    if (myLevel >= 69) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^4 /ma "Aero III" <t>');
        aero = 3;
    elseif (myLevel >= 45) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^4 /ma "Aero II" <t>');
        aero = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^4 /ma "Aero" <t>');
    end

    -- Fire
    if (myLevel >= 71) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^1 /ma "Fire III" <t>');
        fira = 3;
    elseif (myLevel >= 50) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^1 /ma "Fire II" <t>');
        fira = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^1 /ma "Fire" <t>');
    end

    -- Blizzard
    if (myLevel >= 73) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^2 /ma "Blizzard III" <t>');
        blizzard = 3;
    elseif (myLevel >= 55) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^2 /ma "Blizzard II" <t>');
        blizzard = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^2 /ma "Blizzard" <t>');
    end

    -- Thunder
    if (myLevel >= 75) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^3 /ma "Thunder III" <t>');
        thunder = 3;
    elseif (myLevel >= 60) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^3 /ma "Thunder II" <t>');
        thunder = 2;
    else
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^3 /ma "Thunder" <t>');
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
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !5');
    
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind e');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind x');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +v');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^!1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^!2');

end

binds.Unbind_All = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind 0');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +0');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !0');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^6');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^0');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind e');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +f');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind x');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +x');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !^c');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +v');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^!1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^!2');
end


return binds;