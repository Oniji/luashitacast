local zones = {};

--local conquest = gFunc.LoadFile('common/conquest.lua');

local federation_aketon = false; -- Windurst
local republic_aketon = false; -- Bastok
local kingdom_aketon = false; -- San d'Oria
local ducal_aketon = true; -- All City States

local zone_windurst = {
    ["Port Windurst"] = true,
    ["Windurst Walls"] = true,
    ["Windurst Waters"] = true,
    ["Windurst Woods"] = true,
    ["Heavens Tower"] = true
};

local zone_sandoria = {
    ["Northern San d'Oria"] = true,
    ["Southern San d'Oria"] = true,
    ["Port San d'Oria"] = true,
    ["Chateau d'Oraguille"] = true
};

local zone_bastok = {
    ["Bastok Markets"] = true,
    ["Port Bastok"] = true,
    ["Bastok Mines"] = true,
    ["Metalworks"] = true
};

local zone_nation = {
    ["Port Windurst"] = true,
    ["Windurst Walls"] = true,
    ["Windurst Waters"] = true,
    ["Windurst Woods"] = true,
    ["Heavens Tower"] = true,
    ["Northern San d'Oria"] = true,
    ["Southern San d'Oria"] = true,
    ["Port San d'Oria"] = true,
    ["Chateau d'Oraguille"] = true,
    ["Bastok Markets"] = true,
    ["Port Bastok"] = true,
    ["Bastok Mines"] = true,
    ["Metalworks"] = true,
    ["Lower Jeuno"] = true,
    ["Upper Jeuno"] = true,
    ["Port Jeuno"] = true,
    ["Ru'Lude Gardens"] = true
};

local zone_town = {
    ["Port Windurst"] = true,
    ["Windurst Walls"] = true,
    ["Windurst Waters"] = true,
    ["Windurst Woods"] = true,
    ["Heavens Tower"] = true,
    ["Northern San d'Oria"] = true,
    ["Southern San d'Oria"] = true,
    ["Port San d'Oria"] = true,
    ["Chateau d'Oraguille"] = true,
    ["Bastok Markets"] = true,
    ["Port Bastok"] = true,
    ["Bastok Mines"] = true,
    ["Metalworks"] = true,
    ["Lower Jeuno"] = true,
    ["Upper Jeuno"] = true,
    ["Port Jeuno"] = true,
    ["Ru'Lude Gardens"] = true
};

local zone_abbr = {
    ["Bastok Markets"] = "BastokMark",
    ["Bastok Mines"] = "BastokMine",
    ["Metalworks"] = "Metalworks",
    ["Port Bastok"] = "PortBastok",
    ["Chateau d'Oraguille"] = "ChatdOrag",
    ["Northern San d'Oria"] = "NSandOria",
    ["Port San d'Oria"] = "PSandOria",
    ["Southern San d'Oria"] = "SSandOria",
    ["Heavens Tower"] = "HeavenTowr",
    ["Port Windurst"] = "PortWind",
    ["Windurst Walls"] = "WindWalls",
    ["Windurst Waters"] = "WindWaters",
    ["Windurst Woods"] = "WindWoods",
    ["Port Jeuno"] = "PortJeuno",
    ["Lower Jeuno"] = "LowJeuno",
    ["Upper Jeuno"] = "UpJeuno",
    ["Ru'Lude Gardens"] = "RuLudeGard",
    ["Selbina"] = "Selbina",
    ["Mhaura"] = "Mhaura",
    ["Tavnazian Safehold"] = "TavSafehld",
    ["Kazham"] = "Kazham",
    ["Norg"] = "Norg",
    ["Rabao"] = "Rabao",
    ["Altar Room"] = "AltarRoom",
    ["Attohwa Chasm"] = "AttohwaCsm",
    ["Boneyard Gully"] = "BoneyardGl",
    ["Castle Oztroja"] = "Oztroja",
    ["Garlaige Citadel"] = "Garlaige",
    ["Meriphataud Mountains"] = "Meriphataud",
    ["Sauromugue Champaign"] = "Sauromugue",
    ["Beadeaux"] = "Beadeaux",
    ["Crawlers' Nest"] = "CrawlNest",
    ["Pashhow Marshlands"] = "Pashhow",
    ["Qulun Dome"] = "QulunDome",
    ["Rolanberry Fields"] = "Rolanberry",
    ["Kazham"] = "Kazham",
    ["Norg"] = "Norg",
    ["Sea Serpent Grotto"] = "SeaGrotto",
    ["Yuhtunga Jungle"] = "YuhtunJng",
    ["Cloister of Flames"] = "ClstFlame",
    ["Cloister of Tides"] = "ClstTides",
    ["Den of Rancor"] = "RancorDen",
    ["Ifrit's Cauldron"] = "IfritCldrn",
    ["Sacrificial Chamber"] = "SacriChamb",
    ["Temple of Uggalepih"] = "Uggalepih",
    ["Yhoator Jungle"] = "YhoatorJng",
    ["Beaucedine Glacier"] = "Beaucedine",
    ["Cloister of Frost"] = "ClstFrost",
    ["Fei'Yin"] = "FeiYin",
    ["Pso'Xja"] = "PsoXja",
    ["Qu'Bia Arena"] = "QuBiaArena",
    ["Ranguemont Pass"] = "Ranguemont",
    ["The Shrouded Maw"] = "TheShroudMaw",
    ["Dangruf Wadi"] = "Dangruf",
    ["Korroloka Tunnel"] = "Korroloka",
    ["North Gustaberg"] = "NGustaberg",
    ["Palborough Mines"] = "Palborough",
    ["South Gustaberg"] = "SGustaberg",
    ["Waughroon Shrine"] = "Waughroon",
    ["Zeruhn Mines"] = "Zeruhn",
    ["Bibiki Bay"] = "BibikiBay",
    ["Bibiki Bay - Purgonorgo Isle"] = "BibikiBay",
    ["Buburimu Peninsula"] = "Buburimu",
    ["Labyrinth of Onzozo"] = "Onzozo",
    ["Manaclipper"] = "Manaclipper",
    ["Maze of Shakhrami"] = "Shakhrami",
    ["Mhaura"] = "Mhaura",
    ["Tahrongi Canyon"] = "Tahrongi",
    ["Cloister of Tremors"] = "ClstTremor",
    ["Eastern Altepa Desert"] = "EastAltepa",
    ["Chamber of Oracles"] = "OracleChmb",
    ["Quicksand Caves"] = "Quicksands",
    ["Rabao"] = "Rabao",
    ["Western Altepa Desert"] = "WestAltepa",
    ["The Boyahda Tree"] = "Boyahda",
    ["Cloister of Storms"] = "ClstStorms",
    ["Dragon's Aery"] = "DragonAery",
    ["Hall of the Gods"] = "HallOfGods",
    ["Ro'Maeve"] = "RoMaeve",
    ["The Sanctuary of Zi'Tah"] = "ZiTah",
    ["Al'Taieu"] = "AlTaieu",
    ["The Garden of Ru'Hmet"] = "RuHmet",
    ["Grand Palace of Hu'Xzoi"] = "HuXzoi",
    ["Empyreal Paradox"] = "EmParadox",
    ["Mine Shaft #2716"] = "Mine2716",
    ["Newton Movalpolos"] = "NewMoval",
    ["Oldton Movalpolos"] = "OldMoval",
    ["Batallia Downs"] = "Batallia",
    ["Carpenters' Landing"] = "CpntLanding",
    ["Davoi"] = "Davoi",
    ["The Eldieme Necropolis"] = "Eldieme",
    ["Jugner Forest"] = "Jugner",
    ["Monastic Cavern"] = "MonastiCav",
    ["Phanauet Channel"] = "PhanauetCh",
    ["Behemoth's Dominion"] = "BehemotDom",
    ["Lower Delkfutt's Tower"] = "LowDelkfut",
    ["Middle Delkfutt's Tower"] = "MidDelkfut",
    ["Qufim Island"] = "Qufim",
    ["Stellar Fulcrum"] = "StlrFulcrm",
    ["Upper Delkfutt's Tower"] = "UpDelkfut",
    ["Bostaunieux Oubliette"] = "Bostaunieu",
    ["East Ronfaure"] = "ERonfaure",
    ["Fort Ghelsba"] = "FtGhelsba",
    ["Ghelsba Outpost"] = "GhelsbaOp",
    ["Horlais Peak"] = "HorlaisPk",
    ["King Ranperre's Tomb"] = "RanpsTomb",
    ["West Ronfaure"] = "WRonfaure",
    ["Yughott Grotto"] = "Yughott",
    ["Lufaise Meadows"] = "LufaiseMds",
    ["Misareaux Coast"] = "Misareaux",
    ["Monarch Linn"] = "MonarchLinn",
    ["Phomiuna Aqueducts"] = "PhomiunaAq",
    ["Riverne - Site #A01"] = "RiverneA01",
    ["Riverne - Site #B01"] = "RiverneB01",
    ["Sacrarium"] = "Sacrarium",
    ["Sealion's Den"] = "SealionDen",
    ["Tavnazian Safehold"] = "TavSafehold",
    ["Celestial Nexus"] = "CelesNexus",
    ["La'Loff Amphitheater"] = "LaLoff",
    ["Ru'Aun Gardens"] = "RuAunGard",
    ["Shrine of Ru'Avitau"] = "RuAvitau",
    ["Ve'Lugannon Palace"] = "VeLugannon",
    ["Balga's Dais"] = "BalgasDias",
    ["East Sarutabaruta"] = "ESartaBarta",
    ["Full Moon Fountain"] = "FullMoonFn",
    ["Giddeus"] = "Giddeus",
    ["Inner Horutoto Ruins"] = "InHorutoto",
    ["Outer Horutoto Ruins"] = "OutHorutot",
    ["Toraimarai Canal"] = "Toraimarai",
    ["West Sarutabaruta"] = "WSartaBarta",
    ["Bearclaw Pinnacle"] = "BearclawPn",
    ["Castle Zvahl Baileys"] = "ZvahlBails",
    ["Castle Zvahl Keep"] = "ZvahlKeep",
    ["Throne Room"] = "ThroneRoom",
    ["Uleguerand Range"] = "Uleguerand",
    ["Xarcabard"] = "Xarcabard",
    ["Cape Teriggan"] = "Teriggan",
    ["Cloister of Gales"] = "ClstGales",
    ["Gustav Tunnel"] = "Gustav",
    ["Kuftal Tunnel"] = "Kuftal",
    ["Valley of Sorrows"] = "SorrowVall",
    ["Gusgen Mines"] = "Gusgen",
    ["Konschtat Highlands"] = "Konschtat",
    ["La Theine Plateau"] = "LaTheine",
    ["Ordelle's Caves"] = "Ordelles",
    ["Selbina"] = "Selbina",
    ["Valkurm Dunes"] = "Valkurm",
    ["Dynamis - Bastok"] = "DynamisBas",
    ["Dynamis - Jeuno"] = "DynamisJeu",
    ["Dynamis - San d'Oria"] = "DynamisSan",
    ["Dynamis - Windurst"] = "DynamisWin",
    ["Dynamis - Beaucedine"] = "DynamisBcd",
    ["Dynamis - Xarcabard"] = "DynamisXar",
    ["Dynamis - Buburimu"] = "DynamisBub",
    ["Dynamis - Qufim"] = "DynamisQuf",
    ["Dynamis - Valkurm"] = "DynamisVal",
    ["Dynamis - Tavnazia"] = "DynamisTav",
    ["Apollyon"] = "Apollyon",
    ["Temenos"] = "Temenos",
    ["Promyvion - Dem"] = "PromvDem",
    ["Spire of Dem"] = "SpireDem",
    ["Hall of Transference, Dem"] = "HallofTrns",
    ["Hall of Transference, Holla"] = "HallofTrns",
    ["Promyvion - Holla"] = "PromvHolla",
    ["Spire of Holla"] = "SpireHolla",
    ["Hall of Transference, Mea"] = "HallofTrns",
    ["Promyvion - Mea"] = "PromvMea",
    ["Spire of Mea"] = "SpireMea",
    ["Promyvion - Vahzl"] = "PromvVahzl",
    ["Spire of Vahzl"] = "SpireVahzl",
    ["Bastok-Jeuno Airship"] = "Airship",
    ["Kazham-Jeuno Airship"] = "Airship",
    ["San d'Oria-Jeuno Airship"] = "Airship",
    ["Windurst-Jeuno Airship"] = "Airship",
    ["Open sea route to Mhaura"] = "OpenseaMha",
    ["Silver Sea route to Nashmau"] = "SilvSeaNas",
    ["Ship bound for Mhaura"] = "ShipToSelb",
    ["Open sea route to Al Zahbi"] = "OpenseaZah",
    ["Silver Sea route to Al Zahbi"] = "SilvSeaZah",
    ["Ship bound for Mhaura"] = "ShipToMhau",
    ["Manaclipper"] = "Manaclipper",
    ["Phanauet Channel"] = "PhanauetCh"
};



zones.sets = sets;

zones.CityGear = function()
    local zone = gData.GetEnvironment().Area;
    if zone_nation[zone] and ducal_aketon then
        gFunc.Equip('Body','Ducal Aketon');
    elseif zone_sandoria[zone] and kingdom_aketon then
        gFunc.Equip('Body','Kingdom Aketon');
    elseif zone_windurst[zone] and republic_aketon then
        gFunc.Equip('Body','Federation Aketon');
    elseif zone_bastok[zone] and republic_aketon then
        gFunc.Equip('Body','Republic Aketon');
    end
end

zones.GetInsideControl = function()
    return lib:GetInsideControl();
end

zones.GetOutsideControl = function()
    return not lib:GetInsideControl();
end

zones.IsInTown = function()
    local zone = gData.GetEnvironment().Area;
    return zone_town[zone];
end

zones.GetZoneAbbr = function(search)
    local matches = {};

    if not search then
        return;
    end
    local search_lower = search:lower();

    for name, abbr in pairs(zone_abbr) do
        if name:lower():find(search_lower, 1, true) then
            table.insert(matches, { name = name, abbr = abbr})
        end
    end

    if #matches > 0 then
        return matches
    else
        return false
    end
end

return zones;