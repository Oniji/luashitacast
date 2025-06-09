local binds = T{};

--[[ Keybinds ]]

function binds.Keybinds_Common()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F1 /lac fwd main');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F2 /lac fwd fishing');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F3 /lac fwd chocobo');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F4 /lac fwd warpcudgel');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind +F5 /lac fwd empband');
end

function binds.Keybinds_WAR()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind q /attack');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind e /ra <t>; /p Fishing > <t>');
end

--[[ Unbinds ]]

function binds.Unbinds_Common()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F2');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F3');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind +F5');
end

function binds.Unbinds_WAR()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind q');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind e');
end

return binds