-- // Dependencies
local SignalManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Signal/main/Manager.lua"))()
local PacketSignal = SignalManager.new()

-- // Services
local RunService = game:GetService("RunService")

-- // Add the events
PacketSignal:Add("OnPacket")
PacketSignal:Add("OnRemoteEvent")

-- // OnPacket listener. Heartbeat since server runs at 60 fps.
RunService.Heartbeat:Connect(function(deltaTime)
    -- // Grab the next packet
    local packet = rnet.nextpacket()

    -- // Fire event
    PacketSignal:Fire("OnPacket", packet)
end)

-- // OnRemoteEvent
PacketSignal:Connect("OnPacket", function(Packet)
    -- // Make sure is an "event" packet
    if not (Packet.id == 0x83 and Packet.subid == 0x7) then
        return
    end

    -- //
    local Event = rnet.readeventpacket(Packet)
    PacketSignal:Fire("OnRemoteEvent", Event)
end)

-- // Return
return PacketSignal