local aliases = {};

--[[ Common ]]--

aliases.Common_Load = function()

        -- Party Related --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /add /pcmd add');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /leave /pcmd leave');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /disband /pcmd breakup');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /leader /pcmd leader');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /kick /pcmd kick');

        -- Addon Related --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /dig1 /addon load hgather');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /dig0 /addon unload hgather');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /digclear /hgather clear');

        -- Gear-Swaps --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /main /lac fwd main');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /fishing /lac fwd fishing');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /digging /lac fwd digging');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /logging /lac fwd logging');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /logging /lac fwd gearmode');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /warpcudgel /lac fwd warpcudgel');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /empband /lac fwd empband');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /gorget /lac fwd gorget');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /naked /lac fwd naked');
    
        -- Items --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /iwarp /item "Instant Warp" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /cwarp /item "Warp Cudgel" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /eband /item "Emperor Band" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /prism /item "Prism Powder" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /oil /item "Silent Oil" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ecd /item "Echo Drops" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /eyd /item "Eye Drops" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pp /item "Poison Potion" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /hw /item "Holy Water" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /aj /item "Apple Juice" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mj /item "Melon Juice" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /yag /item "Yagudo Drink" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /icarus /item "Icarus Wing" <me>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /prom1 /item "Hysteroanima" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /prom2 /item "Psychoanima" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /prom3 /item "Terroanima" <t>');

        -- Food -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /tuna /item "Tuna Sushi" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sole /item "Sole Sushi" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /squid /item "Squid Sushi" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /taco /item "Tavnazian Taco" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /apple /item "Apple Pie" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /apple1 /item "Apple Pie +1" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /melon /item "Melon Pie" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /melon1 /item "Melon Pie +1" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mith /item "Meat Mithkabob" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /chief /item "Meat Chiefkabob" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /rice /item "Rice Dumpling" <me>');

        -- Spells | Teleport -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /holla /ma "Teleport-Holla" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /dem /ma "Teleport-Dem" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mea /ma "Teleport-Mea" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /yhoat /ma "Teleport-Yhoat" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /altep /ma "Teleport-Altep" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /warp /ma Warp <me>');

        -- Spells | Protect/Shell -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pr1 /ma "Protectra" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pr2 /ma "Protectra II" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pr3 /ma "Protectra III" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pr4 /ma "Protectra IV" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pr5 /ma "Protectra V" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sr1 /ma "Shellra" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sr2 /ma "Shellra II" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sr3 /ma "Shellra III" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sr4 /ma "Shellra IV" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sr5 /ma "Shellra V" <me>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /p1 /ma "Protect" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /p2 /ma "Protect II" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /p3 /ma "Protect III" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /p4 /ma "Protect IV" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /p5 /ma "Protect V" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /s1 /ma "Shell" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /s2 /ma "Shell II" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /s3 /ma "Shell III" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /s4 /ma "Shell IV" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /s5 /ma "Shell V" <stpc>');

        -- Spells | Debuffs --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /po /ma "Poison" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /po2 /ma "Poison II" <t>');

        -- Spells | Enspells --

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ens /ma "Enstone" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /enw /ma "Enwater" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ena /ma "Enaero" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /enf /ma "Enfire" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /enb /ma "Enblizzard" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ent /ma "Enthunder" <me>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bsp /ma "Blaze Spikes" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /isp /ma "Ice Spikes" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ssp /ma "Shock Spikes" <me>');

        -- Spells | Heals --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /c1 /ma "Cure" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /c2 /ma "Cure II" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /c3 /ma "Cure III" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /c4 /ma "Cure IV" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /c5 /ma "Cure V" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /c6 /ma "Cure VI" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /regen /ma "Regen" <stpc>');

        -- Spells | Dispels --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bn /ma "Blindna" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /cn /ma "Cursna" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pon /ma "Poisona" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sn /ma "Silena" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /pan /ma "Paralyna" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /r1 /ma "Raise" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /rr /ma "Reraise" <me>');
    
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /blink /ma "Blink" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ss /ma "Stoneskin" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /aqua /ma "Aquaveil" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ph /ma "Phalanx" <me>');
    
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bs /ma "Barstonra" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bw /ma "Barwatera" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ba /ma "Baraera" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bf /ma "Barfira" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bb /ma "Barblizzara" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bt /ma "Barthundra" <me>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /er /ma "Erase" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sil /ma "Silence" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /dia /ma "Dia" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /dia2 /ma "Dia II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bio /ma "Bio" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bio2 /ma "Bio II" <t>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /frost /ma "Frost" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /rasp /ma "Rasp" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /choke /ma "Choke" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /drown /ma "Drown" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /shock /ma "Shock" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /burn /ma "Burn" <t>');

        -- Spells | Utility --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /d2 /ma "Warp II" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /tractor /ma "Tractor" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /escape /ma "Escape" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sneak /ma "Sneak" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /invis /ma "Invisible" <stpc>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sl1 /ma "Sleep" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sl2 /ma "Sleep II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /slg1 /ma "Sleepga" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /slg2 /ma "Sleepga II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /grav /ma "Gravity" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /blind /ma "Blind" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bind /ma "Bind" <t>');

        -- Spells | Ninjitsu -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ut1 /nin "Utsusemi: Ichi"');
    
        -- Job Abilities ---
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /es /ja "Elemental Seal" <me>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ds /ja "Divine Seal" <me>');

        -- Spells | Nukes (Single-Target) -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /1b /ma "Blizzard" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2b /ma "Blizzard II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /3b /ma "Blizzard III" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /4b /ma "Blizzard IV" <t>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /1t /ma "Thunder" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2t /ma "Thunder II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /3t /ma "Thunder III" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /4t /ma "Thunder IV" <t>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /1f /ma "Fire" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2f /ma "Fire II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /3f /ma "Fire III" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /4f /ma "Fire IV" <t>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /1a /ma "Aero" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2a /ma "Aero II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /3a /ma "Aero III" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /4a /ma "Aero IV" <t>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /1w /ma "Water" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2w /ma "Water II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /3w /ma "Water III" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /4w /ma "Water IV" <t>');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /1s /ma "Stone" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2s /ma "Stone II" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /3s /ma "Stone III" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /4s /ma "Stone IV" <t>');

    -- Spells | Nukes (Ancient) -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /fr /ma "Freeze" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /qu /ma "Quake" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /flo /ma "Flood" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /bu /ma "Burst" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /to /ma "Tornado" <t>');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias /fla /ma "Flare" <t>');
end

aliases.Common_Unload = function()

        -- Gear-Swaps --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /main');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /fishing');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /digging');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /logging');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /gearmode');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /warpcudgel');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /empband');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /gorget');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /naked');
    
        -- Items --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /iwarp');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /cwarp');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /eband');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /oil');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /prism');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /eyd');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ecd');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pp');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /hw');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mj');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /eye');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /icarus');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /prom1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /prom2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /prom3');

        -- Food --
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /tuna');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sole');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /squid');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /taco');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /apple');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /apple1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /melon');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /melon1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mith');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /chief');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /rice');

        -- Spells -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /warp');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /holla');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /dem');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mea');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /yhoat');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /altep');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pr1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pr2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pr3');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pr4');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pr5');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sr1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sr2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sr3');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sr4');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sr5');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /p1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /p2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /p3');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /p4');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /p5');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /s1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /s2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /s3');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /s4');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /s5');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bn');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /cn');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pon');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sn');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /pan');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /r1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /rr');
    
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /blink');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ss');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /aqua');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ph');
    
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bs');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bw');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ba');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bf');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bb');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bt');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /c1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /c2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /c3');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /c4');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /c5');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /c6');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /regen');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /er');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sil');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /dia');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /dia2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bio');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bio2');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sl1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sl2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /slg1');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /slg2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /grav');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /blind');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bind');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /d2');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /tractor');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /escape');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sneak');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /invis');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /frost');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /rasp');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /choke');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /burn');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /shock');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /drown');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /es');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ds');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /po');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /po2');

        -- Spells | Ninjitsu -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ut1');

        -- Spells | Nukes (Single-Target) -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /1b');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2b');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /3b');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /4b');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /1t');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2t');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /3t');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /4t');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /1f');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2f');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /3f');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /4f');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /1a');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2a');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /3a');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /4a');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /1w');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2w');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /3w');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /4w');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /1s');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2s');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /3s');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /4s');

        -- Spells | Nukes (Ancient) -- 
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /fr');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bu');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /qu');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /flo');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /fla');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /to');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ens');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /enw');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ena');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /enf');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /enb');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ent');

        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /isp');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /bsp');
        AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ssp');

end

--[[ BST ]]--

aliases.BST_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /maxmp /lac fwd maxmp');
end

aliases.BST_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /maxmp');
end

--[[ THF ]]--

aliases.THF_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2hr /ja "Perfect Dodge" <me>');

end

aliases.THF_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2hr');
end

--[[ WHM ]]--

aliases.WHM_Load= function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2hr /ja "Benediction" <me>');
end

aliases.WHM_Unload= function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2hr');
end

--[[ DRG ]]--

aliases.DRG_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mmp /lac fwd maxmp');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2hr /ja "Spirit Surge" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /blunt /lac fwd blunt');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /staff /lac fwd staff');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /solo /lac fwd solo');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /tpcycle /lac fwd tpcycle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wscycle /lac fwd wscycle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /easy /lac fwd easy');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /even /lac fwd even');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /tough /lac fwd tough');
end

aliases.DRG_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2hr');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mmp');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /blunt');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /solo');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /tpcycle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /wscycle');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /easy');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /even');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /tough');

end

--[[ BLM ]]--

aliases.BLM_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2hr /ja "Manafont" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sorcring /lac fwd sorcring');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /idle /lac fwd idle');
end

aliases.BLM_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2hr');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sorcring');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /idle');
end

--[[ RDM ]]--

aliases.RDM_Load = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /2hr /ja "Chainspell" <me>');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /convert /ja "Convert" <me>');
end

aliases.RDM_Unload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /2hr');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /convert');
end

return aliases;