-- // Vars
local PacketNames = {
    ["0x00"] = "ID_CONNECTED_PING",
    ["0x01"] = "ID_UNCONNECTED_PING",
	["0x03"] = "ID_CONNECTED_PONG",
	["0x04"] = "ID_DETECT_LOST_CONNECTIONS",
	["0x05"] = "ID_OPEN_CONNECTION_REQUEST_1",
	["0x06"] = "ID_OPEN_CONNECTION_REPLY_1",
	["0x07"] = "ID_OPEN_CONNECTION_REQUEST_2",
	["0x08"] = "ID_OPEN_CONNECTION_REPLY_2",
	["0x09"] = "ID_CONNECTION_REQUEST",
	["0x10"] = "ID_CONNECTION_REQUEST_ACCEPTED",
	["0x11"] = "ID_CONNECTION_ATTEMPT_FAILED",
	["0x13"] = "ID_NEW_INCOMING_CONNECTION",
	["0x15"] = "ID_DISCONNECTION_NOTIFICATION",
	["0x18"] = "ID_INVALID_PASSWORD",
	["0x1B"] = "ID_TIMESTAMP",
	["0x1C"] = "ID_UNCONNECTED_PONG",
	["0x81"] = "ID_SET_GLOBALS",
	["0x82"] = "ID_TEACH_DESCRIPTOR_DICTIONARIES",
	["0x83"] = "ID_DATA",
	["0x84"] = "ID_MARKER",
	["0x85"] = "ID_PHYSICS",
	["0x86"] = "ID_TOUCHES",
	["0x87"] = "ID_CHAT_ALL",
	["0x88"] = "ID_CHAT_TEAM",
	["0x89"] = "ID_REPORT_ABUSE",
	["0x8A"] = "ID_SUBMIT_TICKET",
	["0x8B"] = "ID_CHAT_GAME",
	["0x8C"] = "ID_CHAT_PLAYER",
	["0x8D"] = "ID_CLUSTER",
	["0x8E"] = "ID_PROTOCOL_MISMATCH",
	["0x8F"] = "ID_PREFERRED_SPAWN_NAME",
	["0x90"] = "ID_PROTOCOL_SYNC",
	["0x91"] = "ID_SCHEMA_SYNC",
	["0x92"] = "ID_PLACEID_VERIFICATION",
	["0x93"] = "ID_DICTIONARY_FORMAT",
	["0x94"] = "ID_HASH_MISMATCH",
	["0x95"] = "ID_SECURITYKEY_MISMATCH",
	["0x96"] = "ID_REQUEST_STATS",
	["0x97"] = "ID_NEW_SCHEMA",
}
local SubpacketNames = {
    ["0x83"] = {
        ["0x00"] = "ID_REPLIC_END",
        ["0x01"] = "ID_REPLIC_DELETE_INSTANCE",
        ["0x02"] = "ID_REPLIC_NEW_INSTANCE",
        ["0x03"] = "ID_REPLIC_PROP",
        ["0x04"] = "ID_REPLIC_MARKER",
        ["0x05"] = "ID_REPLIC_PING",
        ["0x06"] = "ID_REPLIC_PING_BACK",
        ["0x07"] = "ID_REPLIC_EVENT",
        ["0x08"] = "ID_REPLIC_REQUEST_CHAR",
        ["0x09"] = "ID_REPLIC_ROCKY",
        ["0x0A"] = "ID_REPLIC_CFRAME_ACK",
        ["0x0B"] = "ID_REPLIC_JOIN_DATA",
        ["0x0C"] = "ID_REPLIC_UPDATE_CLIENT_QUOTA",
        ["0x0D"] = "ID_REPLIC_STREAM_DATA",
        ["0x0E"] = "ID_REPLIC_REGION_REMOVAL",
        ["0x0F"] = "ID_REPLIC_INSTANCE_REMOVAL",
        ["0x10"] = "ID_REPLIC_TAG",
        ["0x11"] = "ID_REPLIC_STATS",
        ["0x12"] = "ID_REPLIC_HASH",
        ["0x13"] = "ID_REPLIC_ATOMIC",
        ["0x14"] = "ID_REPLIC_STREAM_DATA_INFO",
    }
}

-- // Functions
local function ResolvePacket(PacketId, SubpacketId)
    if (typeof(PacketId) == "number") then
        PacketId = "0x" .. string.format("%X", PacketId)
    end

    if (not SubpacketId) then
        return PacketNames[PacketId]
    end

    if (typeof(SubpacketId) == "number") then
        SubpacketId = "0x" .. string.format("%X", SubpacketId)
    end

    return SubpacketNames[PacketId][SubpacketId]
end

-- // Return
return ResolvePacket