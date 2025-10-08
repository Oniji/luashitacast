local macrobooks = {};

local BookTypes = {
    JOBS = 'Jobs',
    DIGGING = 'Digging',
    FISHING = 'Fishing',
    LOGGING = 'Logging'
};
macrobooks.BookTypes = BookTypes;

local BookSetIDs = {
    -- Custom --
    ["Digging"] = {
        bookID = 20,
        setID = 1,  -- default
        subjob = {}
    },
    ["Fishing"] = {
        bookID = 20,
        setID = 1,  -- default
        subjob = {}
    },
    ["Logging"] = {
        bookID = 20,
        setID = 1,  -- default
        subjob = {}
    },
    -- Job-specific --
    ["WHM"] = {
        bookID = 1,
        setID = 1, -- default
        subjob = {}
    },
    ["BLM"] = {
        bookID = 2,
        setID = 1, -- default
        subjob = {}
    },
    ["RDM"] = {
        bookID = 3,
        setID = 1, -- default
        subjob = {}
    },
    ["DRG"] = {
        bookID = 4,
        setID = 1, -- default
        subjob = {
            ["WHM"] = 1,
            ["RDM"] = 1,
            ["SAM"] = 8,
            ["WAR"] = 9
        }
    },
    ["NIN"] = {
        bookID = 6,
        setID = 1, -- default
        subjob = {}
    },
    ["THF"] = {
        bookID = 7,
        setID = 1, -- default
        subjob = {}
    },
    ["WAR"] = {
        bookID = 8,
        setID = 1, -- default
        subjob = {}
    },
    ["SAM"] = {
        bookID = 9,
        setID = 1, -- default
        subjob = {}
    },
    ["BST"] = {
        bookID = 10,
        setID = 1, -- default
        subjob = {}
    },
    ["SMN"] = {
        bookID = 5,
        setID = 1, -- default
        subjob = {}
    },
};

macrobooks.SetMacroBook = function(type)
    local book = "";
    local set = "";

    if not type then
        print("Invalid Macro Book Type.");
        return;
    end

    if type == BookTypes.JOBS then
        local player = gData.GetPlayer();
        book = player.MainJob;
        set = player.SubJob;
    else
        book = type;
    end

    if BookSetIDs[book] then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro book ' .. BookSetIDs[book].bookID);
        if BookSetIDs[book].subjob[set] then
            AshitaCore:GetChatManager():QueueCommand(1, '/macro set ' .. BookSetIDs[book].subjob[set]);
        else
            AshitaCore:GetChatManager():QueueCommand(1, '/macro set ' .. BookSetIDs[book].setID);
        end
    else
        print("Book not found. No macrobook set.");
        return;
    end

end

return macrobooks;