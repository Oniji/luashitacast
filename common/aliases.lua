local aliases = {};

--[[ Common ]]--

aliases.Common_Load = function()

    -- Assist and Targetnpc
    aliases.remove('/assist');

    -- HELM --
    aliases.add('/logging_binds', '/lac fwd logging_binds');

    -- Lockstyle --
    aliases.add('/lsfsh', '/lac fwd lsfsh');
    aliases.add('/lsbot', '/lac fwd lsbot');
    aliases.add('/lsdig', '/lac fwd lsdig');
    aliases.add('/lsblm', '/lac fwd lsblm');
    aliases.add('/lsdrg', '/lac fwd lsdrg');
    aliases.add('/lsrdm', '/lac fwd lsrdm');

    -- Party Related --
    aliases.add('/add', '/pcmd add');
    aliases.add('/leave', '/pcmd leave');
    aliases.add('/disband', '/pcmd breakup');
    aliases.add('/leader', '/pcmd leader');
    aliases.add('/kick', '/pcmd kick');

    -- Addon Related --
    aliases.add('/dig1', '/addon load hgather');
    aliases.add('/dig0', '/addon unload hgather');
    aliases.add('/digclear', '/hgather clear');
    aliases.add('/au', '/addon unload');
    aliases.add('/al', '/addon load');
    aliases.add('/l', '/load');
    aliases.add('/u', '/unload');

    -- Gear-Swaps --
    aliases.add('/main', '/lac fwd main');
    aliases.add('/fishing', '/lac fwd fishing');
    aliases.add('/digging', '/lac fwd digging');
    aliases.add('/logging', '/lac fwd logging');
    aliases.add('/logging', '/lac fwd gearmode');
    aliases.add('/warpcudgel', '/lac fwd warpcudgel');
    aliases.add('/empband', '/lac fwd empband');
    aliases.add('/gorget', '/lac fwd gorget');
    aliases.add('/naked', '/lac fwd naked');
    aliases.add('/rrh', '/lac fwd reraise_hairpin');
    aliases.add('/hairpin', '/lac fwd reraise_hairpin');

    -- Items --
    aliases.add('/iwarp', '/item "Instant Warp" <me>');
    aliases.add('/cwarp', '/item "Warp Cudgel" <me>');
    aliases.add('/eband', '/item "Emperor Band" <me>');
    aliases.add('/prism', '/item "Prism Powder" <me>');
    aliases.add('/oil', '/item "Silent Oil" <me>');
    aliases.add('/ecd', '/item "Echo Drops" <me>');
    aliases.add('/eyd', '/item "Eye Drops" <me>');
    aliases.add('/pp', '/item "Poison Potion" <me>');
    aliases.add('/hw', '/item "Holy Water" <me>');
    aliases.add('/aj', '/item "Apple Juice" <me>');
    aliases.add('/mj', '/item "Melon Juice" <me>');
    aliases.add('/yag', '/item "Yagudo Drink" <me>');
    aliases.add('/icarus', '/item "Icarus Wing" <me>');

    aliases.add('/prom1', '/item "Hysteroanima" <t>');
    aliases.add('/prom2', '/item "Psychoanima" <t>');
    aliases.add('/prom3', '/item "Terroanima" <t>');

    -- Food -- 
    aliases.add('/tuna', '/item "Tuna Sushi" <me>');
    aliases.add('/sole', '/item "Sole Sushi" <me>');
    aliases.add('/squid', '/item "Squid Sushi" <me>');
    aliases.add('/taco', '/item "Tavnazian Taco" <me>');
    aliases.add('/apple', '/item "Apple Pie" <me>');
    aliases.add('/apple1', '/item "Apple Pie +1" <me>');
    aliases.add('/melon', '/item "Melon Pie" <me>');
    aliases.add('/melon1', '/item "Melon Pie +1" <me>');
    aliases.add('/mith', '/item "Meat Mithkabob" <me>');
    aliases.add('/chief', '/item "Meat Chiefkabob" <me>');
    aliases.add('/rice', '/item "Rice Dumpling" <me>');

    -- Spells | Teleport -- 
    aliases.add('/holla', '/ma "Teleport-Holla" <me>');
    aliases.add('/dem', '/ma "Teleport-Dem" <me>');
    aliases.add('/mea', '/ma "Teleport-Mea" <me>');
    aliases.add('/yhoat', '/ma "Teleport-Yhoat" <me>');
    aliases.add('/altep', '/ma "Teleport-Altep" <me>');
    aliases.add('/warp', '/ma Warp <me>');

    -- Spells | Protect/Shell -- 
    aliases.add('/pr1', '/ma "Protectra" <me>');
    aliases.add('/pr2', '/ma "Protectra II" <me>');
    aliases.add('/pr3', '/ma "Protectra III" <me>');
    aliases.add('/pr4', '/ma "Protectra IV" <me>');
    aliases.add('/pr5', '/ma "Protectra V" <me>');
    aliases.add('/sr1', '/ma "Shellra" <me>');
    aliases.add('/sr2', '/ma "Shellra II" <me>');
    aliases.add('/sr3', '/ma "Shellra III" <me>');
    aliases.add('/sr4', '/ma "Shellra IV" <me>');
    aliases.add('/sr5', '/ma "Shellra V" <me>');

    aliases.add('/p1', '/ma "Protect" <stpc>');
    aliases.add('/p2', '/ma "Protect II" <stpc>');
    aliases.add('/p3', '/ma "Protect III" <stpc>');
    aliases.add('/p4', '/ma "Protect IV" <stpc>');
    aliases.add('/p5', '/ma "Protect V" <stpc>');
    aliases.add('/s1', '/ma "Shell" <stpc>');
    aliases.add('/s2', '/ma "Shell II" <stpc>');
    aliases.add('/s3', '/ma "Shell III" <stpc>');
    aliases.add('/s4', '/ma "Shell IV" <stpc>');
    aliases.add('/s5', '/ma "Shell V" <stpc>');

    -- Spells | Debuffs --
    aliases.add('/po', '/ma "Poison" <t>');
    aliases.add('/po2', '/ma "Poison II" <t>');

    -- Spells | Enspells --

    aliases.add('/ens', '/ma "Enstone" <me>');
    aliases.add('/enw', '/ma "Enwater" <me>');
    aliases.add('/ena', '/ma "Enaero" <me>');
    aliases.add('/enf', '/ma "Enfire" <me>');
    aliases.add('/enb', '/ma "Enblizzard" <me>');
    aliases.add('/ent', '/ma "Enthunder" <me>');

    aliases.add('/bsp', '/ma "Blaze Spikes" <me>');
    aliases.add('/isp', '/ma "Ice Spikes" <me>');
    aliases.add('/ssp', '/ma "Shock Spikes" <me>');

    -- Spells | Heals --
    aliases.add('/c1', '/ma "Cure" <stpc>');
    aliases.add('/c2', '/ma "Cure II" <stpc>');
    aliases.add('/c3', '/ma "Cure III" <stpc>');
    aliases.add('/c4', '/ma "Cure IV" <stpc>');
    aliases.add('/c5', '/ma "Cure V" <stpc>');
    aliases.add('/c6', '/ma "Cure VI" <stpc>');
    aliases.add('/regen', '/ma "Regen" <stpc>');

    -- Spells | Dispels --
    aliases.add('/bn', '/ma "Blindna" <stpc>');
    aliases.add('/cn', '/ma "Cursna" <stpc>');
    aliases.add('/pon', '/ma "Poisona" <stpc>');
    aliases.add('/sn', '/ma "Silena" <stpc>');
    aliases.add('/pan', '/ma "Paralyna" <stpc>');
    aliases.add('/r1', '/ma "Raise" <stpc>');
    aliases.add('/rr', '/ma "Reraise" <me>');
    aliases.add('/dispel', '/ma "Dispel" <t>');

    aliases.add('/blink', '/ma "Blink" <me>');
    aliases.add('/ss', '/ma "Stoneskin" <me>');
    aliases.add('/aqua', '/ma "Aquaveil" <me>');
    aliases.add('/ph', '/ma "Phalanx" <me>');

    aliases.add('/er', '/ma "Erase" <stpc>');
    aliases.add('/sil', '/ma "Silence" <t>');
    aliases.add('/dia', '/ma "Dia" <t>');
    aliases.add('/dia2', '/ma "Dia II" <t>');
    aliases.add('/bio', '/ma "Bio" <t>');
    aliases.add('/bio2', '/ma "Bio II" <t>');

    aliases.add('/frost', '/ma "Frost" <t>');
    aliases.add('/rasp', '/ma "Rasp" <t>');
    aliases.add('/choke', '/ma "Choke" <t>');
    aliases.add('/drown', '/ma "Drown" <t>');
    aliases.add('/shock', '/ma "Shock" <t>');
    aliases.add('/burn', '/ma "Burn" <t>');

    -- Spells | Utility --
    aliases.add('/d2', '/ma "Warp II" <stpc>');
    aliases.add('/tractor', '/ma "Tractor" <stpc>');
    aliases.add('/escape', '/ma "Escape" <me>');
    aliases.add('/sneak', '/ma "Sneak" <stpc>');
    aliases.add('/invis', '/ma "Invisible" <stpc>');
    aliases.add('/sl1', '/ma "Sleep" <t>');
    aliases.add('/sl2', '/ma "Sleep II" <t>');
    aliases.add('/slg1', '/ma "Sleepga" <t>');
    aliases.add('/slg2', '/ma "Sleepga II" <t>');
    aliases.add('/grav', '/ma "Gravity" <t>');
    aliases.add('/blind', '/ma "Blind" <t>');
    aliases.add('/bind', '/ma "Bind" <t>');

    -- Spells | Ninjitsu -- 
    aliases.add('/ut1', '/nin "Utsusemi: Ichi"');

    -- Job Abilities ---
    aliases.add('/es', '/ja "Elemental Seal" <me>');
    aliases.add('/ds', '/ja "Divine Seal" <me>');

    -- Spells | Nukes (Single-Target) -- 
    aliases.add('/1b', '/ma "Blizzard" <t>');
    aliases.add('/2b', '/ma "Blizzard II" <t>');
    aliases.add('/3b', '/ma "Blizzard III" <t>');
    aliases.add('/4b', '/ma "Blizzard IV" <t>');

    aliases.add('/1t', '/ma "Thunder" <t>');
    aliases.add('/2t', '/ma "Thunder II" <t>');
    aliases.add('/3t', '/ma "Thunder III" <t>');
    aliases.add('/4t', '/ma "Thunder IV" <t>');

    aliases.add('/1f', '/ma "Fire" <t>');
    aliases.add('/2f', '/ma "Fire II" <t>');
    aliases.add('/3f', '/ma "Fire III" <t>');
    aliases.add('/4f', '/ma "Fire IV" <t>');

    aliases.add('/1a', '/ma "Aero" <t>');
    aliases.add('/2a', '/ma "Aero II" <t>');
    aliases.add('/3a', '/ma "Aero III" <t>');
    aliases.add('/4a', '/ma "Aero IV" <t>');

    aliases.add('/1w', '/ma "Water" <t>');
    aliases.add('/2w', '/ma "Water II" <t>');
    aliases.add('/3w', '/ma "Water III" <t>');
    aliases.add('/4w', '/ma "Water IV" <t>');

    aliases.add('/1s', '/ma "Stone" <t>');
    aliases.add('/2s', '/ma "Stone II" <t>');
    aliases.add('/3s', '/ma "Stone III" <t>');
    aliases.add('/4s', '/ma "Stone IV" <t>');

    -- Spells | Nukes (Ancient) -- 
    aliases.add('/fr', '/ma "Freeze" <t>');
    aliases.add('/qu', '/ma "Quake" <t>');
    aliases.add('/flo', '/ma "Flood" <t>');
    aliases.add('/bu', '/ma "Burst" <t>');
    aliases.add('/to', '/ma "Tornado" <t>');
    aliases.add('/fla', '/ma "Flare" <t>');

    -- Ranged/Ammo
    aliases.add('/ranged_bolt', '/lac fwd ranged_bolt');
    aliases.add('/ranged_acid_bolt', '/lac fwd ranged_acid_bolt');
    aliases.add('/ranged_sleep_bolt', '/lac fwd ranged_sleep_bolt');
    aliases.add('/ranged_bloody_bolt', '/lac fwd ranged_bloody_bolt');

    -- Custom Utilities --
    aliases.add('/zone', '/lac fwd find_zone')

    aliases.Common_BarSpells();

end

aliases.Common_BarSpells = function()
    local player = gData.GetPlayer();
    if player.MainJob == 'WHM' or player.SubJob == 'WHM' then
        aliases.add('/bs', '/ma "Barstonra" <me>');
        aliases.add('/bw', '/ma "Barwatera" <me>');
        aliases.add('/ba', '/ma "Baraera" <me>');
        aliases.add('/bf', '/ma "Barfira" <me>');
        aliases.add('/bb', '/ma "Barblizzara" <me>');
        aliases.add('/bt', '/ma "Barthundra" <me>');
        aliases.add('/bsil', '/ma "Barsilencera" <me>');
        aliases.add('/bsleep', '/ma "Barsleepra" <me>');
        aliases.add('/bpara', '/ma "Barparalyzra" <me>');
        aliases.add('/bpetri', '/ma "Barpetrify" <me>');
        aliases.add('/bpoison', '/ma "Barpoisonra" <me>');

    else
        aliases.add('/bs', '/ma "Barstone" <me>');
        aliases.add('/bw', '/ma "Barwater" <me>');
        aliases.add('/ba', '/ma "Baraero" <me>');
        aliases.add('/bf', '/ma "Barfire" <me>');
        aliases.add('/bb', '/ma "Barblizzard" <me>');
        aliases.add('/bt', '/ma "Barthunder" <me>');
        aliases.add('/bsil', '/ma "Barsilence" <me>');
        aliases.add('/bsleep', '/ma "Barsleep" <me>');
        aliases.add('/bpara', '/ma "Barparalyze" <me>');
        aliases.add('/bpetri', '/ma "Barpetrify" <me>');
        aliases.add('/bpoison', '/ma "Barpoison" <me>');
    end
end

aliases.Common_Unload = function()

    -- Gear-Swaps --
    aliases.remove('/main');
    aliases.remove('/fishing');
    aliases.remove('/digging');
    aliases.remove('/logging');
    aliases.remove('/gearmode');
    aliases.remove('/warpcudgel');
    aliases.remove('/empband');
    aliases.remove('/gorget');
    aliases.remove('/naked');
    aliases.remove('/rrh');
    aliases.remove('/hairpin');

    -- Lockstyle --
    aliases.remove('/lsfsh');
    aliases.remove('/lsbot');
    aliases.remove('/lsdig');
    aliases.remove('/lsblm');
    aliases.remove('/lsdrg');
    aliases.remove('/lsrdm');

    aliases.remove('/al');
    aliases.remove('/au');
    aliases.remove('/l');
    aliases.remove('/u');

    -- Items --
    aliases.remove('/iwarp');
    aliases.remove('/cwarp');
    aliases.remove('/eband');
    aliases.remove('/oil');
    aliases.remove('/prism');
    aliases.remove('/eyd');
    aliases.remove('/ecd');
    aliases.remove('/pp');
    aliases.remove('/hw');
    aliases.remove('/mj');
    aliases.remove('/eye');
    aliases.remove('/icarus');

    aliases.remove('/prom1');
    aliases.remove('/prom2');
    aliases.remove('/prom3');

    -- Food --
    aliases.remove('/tuna');
    aliases.remove('/sole');
    aliases.remove('/squid');
    aliases.remove('/taco');
    aliases.remove('/apple');
    aliases.remove('/apple1');
    aliases.remove('/melon');
    aliases.remove('/melon1');
    aliases.remove('/mith');
    aliases.remove('/chief');
    aliases.remove('/rice');

    -- Spells -- 
    aliases.remove('/warp');
    aliases.remove('/holla');
    aliases.remove('/dem');
    aliases.remove('/mea');
    aliases.remove('/yhoat');
    aliases.remove('/altep');

    aliases.remove('/pr1');
    aliases.remove('/pr2');
    aliases.remove('/pr3');
    aliases.remove('/pr4');
    aliases.remove('/pr5');
    aliases.remove('/sr1');
    aliases.remove('/sr2');
    aliases.remove('/sr3');
    aliases.remove('/sr4');
    aliases.remove('/sr5');

    aliases.remove('/p1');
    aliases.remove('/p2');
    aliases.remove('/p3');
    aliases.remove('/p4');
    aliases.remove('/p5');
    aliases.remove('/s1');
    aliases.remove('/s2');
    aliases.remove('/s3');
    aliases.remove('/s4');
    aliases.remove('/s5');

    aliases.remove('/bn');
    aliases.remove('/cn');
    aliases.remove('/pon');
    aliases.remove('/sn');
    aliases.remove('/pan');
    aliases.remove('/r1');
    aliases.remove('/rr');

    aliases.remove('/blink');
    aliases.remove('/ss');
    aliases.remove('/aqua');
    aliases.remove('/ph');

    aliases.remove('/bs');
    aliases.remove('/bw');
    aliases.remove('/ba');
    aliases.remove('/bf');
    aliases.remove('/bb');
    aliases.remove('/bt');

    aliases.remove('/c1');
    aliases.remove('/c2');
    aliases.remove('/c3');
    aliases.remove('/c4');
    aliases.remove('/c5');
    aliases.remove('/c6');
    aliases.remove('/regen');

    aliases.remove('/er');
    aliases.remove('/sil');
    aliases.remove('/dia');
    aliases.remove('/dia2');
    aliases.remove('/bio');
    aliases.remove('/bio2');

    aliases.remove('/sl1');
    aliases.remove('/sl2');
    aliases.remove('/slg1');
    aliases.remove('/slg2');
    aliases.remove('/grav');
    aliases.remove('/blind');
    aliases.remove('/bind');

    aliases.remove('/d2');
    aliases.remove('/tractor');
    aliases.remove('/escape');
    aliases.remove('/sneak');
    aliases.remove('/invis');

    aliases.remove('/frost');
    aliases.remove('/rasp');
    aliases.remove('/choke');
    aliases.remove('/burn');
    aliases.remove('/shock');
    aliases.remove('/drown');

    aliases.remove('/es');
    aliases.remove('/ds');

    aliases.remove('/po');
    aliases.remove('/po2');

    -- Spells | Ninjitsu -- 
    aliases.remove('/ut1');

    -- Spells | Nukes (Single-Target) -- 
    aliases.remove('/1b');
    aliases.remove('/2b');
    aliases.remove('/3b');
    aliases.remove('/4b');

    aliases.remove('/1t');
    aliases.remove('/2t');
    aliases.remove('/3t');
    aliases.remove('/4t');

    aliases.remove('/1f');
    aliases.remove('/2f');
    aliases.remove('/3f');
    aliases.remove('/4f');

    aliases.remove('/1a');
    aliases.remove('/2a');
    aliases.remove('/3a');
    aliases.remove('/4a');

    aliases.remove('/1w');
    aliases.remove('/2w');
    aliases.remove('/3w');
    aliases.remove('/4w');

    aliases.remove('/1s');
    aliases.remove('/2s');
    aliases.remove('/3s');
    aliases.remove('/4s');

    -- Spells | Nukes (Ancient) -- 
    aliases.remove('/fr');
    aliases.remove('/bu');
    aliases.remove('/qu');
    aliases.remove('/flo');
    aliases.remove('/fla');
    aliases.remove('/to');

    aliases.remove('/ens');
    aliases.remove('/enw');
    aliases.remove('/ena');
    aliases.remove('/enf');
    aliases.remove('/enb');
    aliases.remove('/ent');

    aliases.remove('/isp');
    aliases.remove('/bsp');
    aliases.remove('/ssp');

    aliases.remove('/dispel');
    aliases.remove('/assist');

end

--[[ BST ]]--

aliases.BST_Load = function()
    aliases.add('/maxmp', '/lac fwd maxmp');
end

aliases.BST_Unload = function()
    aliases.remove('/maxmp');
end

--[[ THF ]]--

aliases.THF_Load = function()
    aliases.add('/2hr', '/ja "Perfect Dodge" <me>');
    aliases.add('/th', '/lac fwd th');

end

aliases.THF_Unload = function()
    aliases.remove('/2hr');
    aliases.remove('/th');
end

--[[ WHM ]]--

aliases.WHM_Load= function()
    aliases.add('/2hr', '/ja "Benediction" <me>');
end

aliases.WHM_Unload= function()
    aliases.remove('/2hr');
end

--[[ DRG ]]--

aliases.DRG_Load = function()
    aliases.add('/mmp', '/lac fwd maxmp');
    aliases.add('/2hr', '/ja "Spirit Surge" <me>');
    aliases.add('/blunt', '/lac fwd blunt');
    aliases.add('/staff', '/lac fwd staff');
    aliases.add('/solo', '/lac fwd solo');
    aliases.add('/tpcycle', '/lac fwd tpcycle');
    aliases.add('/wscycle', '/lac fwd wscycle');
    aliases.add('/easy', '/lac fwd easy');
    aliases.add('/even', '/lac fwd even');
    aliases.add('/tough', '/lac fwd tough');
    aliases.add('/tank', '/lac fwd tank');
end

aliases.DRG_Unload = function()
    aliases.remove('/2hr');
    aliases.remove('/mmp');
    aliases.remove('/blunt');
    aliases.remove('/solo');
    aliases.remove('/tpcycle');
    aliases.remove('/wscycle');
    aliases.remove('/easy');
    aliases.remove('/even');
    aliases.remove('/tough');
    aliases.remove('/tank');

end

--[[ BLM ]]--

aliases.BLM_Load = function()
    aliases.add('/2hr', '/ja "Manafont" <me>');
    aliases.add('/sorcring', '/lac fwd sorcring');
    aliases.add('/nuke', '/lac fwd nuke');
    aliases.add('/idle', '/lac fwd idle');
end

aliases.BLM_Unload = function()
    aliases.remove('/2hr');
    aliases.remove('/sorcring');
    aliases.remove('/nuke');
    aliases.remove('/idle');
end

--[[ RDM ]]--

aliases.RDM_Load = function()
    aliases.add('/2hr', '/ja "Chainspell" <me>');
    aliases.add('/convert', '/ja "Convert" <me>');
    aliases.add('/sorcring', '/lac fwd sorcring');
    aliases.add('/nuke', '/lac fwd nuke');
    aliases.add('/idle', '/lac fwd idle');
    aliases.add('/melee', '/lac fwd melee');
end

aliases.RDM_Unload = function()
    aliases.remove('/2hr');
    aliases.remove('/convert');
    aliases.remove('/melee');
end

--[[ SMN ]]--

aliases.SMN_Load = function()
    aliases.add('/2hr', '/ja "Astral Flow" <me>');
    aliases.add('/carbuncle', '/ma "Carbuncle" <me>');
end

aliases.SMN_Unload = function()
    aliases.remove('/2hr');
end

--[[ DRK ]]--

aliases.DRK_Load = function()
    aliases.add('/2hr', '/ja "Blood Weapon" <me>');
end

aliases.DRK_Unload = function()
    aliases.remove('/2hr');
end


aliases.add = function(name, command)
    if name and command then
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias ' .. name .. ' ' .. command); 
    end
end

aliases.remove = function(command)
    if command then
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete ' .. command); 
    end
end

return aliases;