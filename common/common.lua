local shared = {};

local sets = {
    Chocobo = {
        Body = 'Choc. Jack Coat',
        Hands = 'Chocobo gloves',
        Legs = 'Chocobo hose',
        Feet = 'Chocobo boots'
    },
    Fishing = {
        Body = 'Angler\'s tunica',
        Hands = 'Angler\'s gloves',
        Legs = 'Angler\'s hose',
        Feet = 'Angler\'s boots',
        Range = 'Halcyon Rod',
        Ammo = 'Fly Lure'
    },
};

shared.sets = sets;

shared.UnequipGear = function()
    gFunc.Equip('main', 'remove');
    gFunc.Equip('sub', 'remove');
    gFunc.Equip('ammo', 'remove');
    gFunc.Equip('range', 'remove');
    gFunc.Equip('head', 'remove');
    gFunc.Equip('body', 'remove');
    gFunc.Equip('ear1', 'remove');
    gFunc.Equip('ear2', 'remove');
    gFunc.Equip('ring1', 'remove');
    gFunc.Equip('ring2', 'remove');
    gFunc.Equip('hands', 'remove');
    gFunc.Equip('waist', 'remove');
    gFunc.Equip('back', 'remove');
    gFunc.Equip('legs', 'remove');
    gFunc.Equip('feet', 'remove');
    gFunc.Equip('neck', 'remove');
end

return shared;