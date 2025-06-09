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

return zones;