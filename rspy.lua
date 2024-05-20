-- RemoteSpy.lua
local RemoteSpy = {}
local spyingEnabled = false
local logs = {}

local function logRemoteEvent(remote, ...)
    if spyingEnabled then
        table.insert(logs, {type = "RemoteEvent", name = remote.Name, args = {...}})
    end
end

local function logRemoteFunction(remote, ...)
    if spyingEnabled then
        table.insert(logs, {type = "RemoteFunction", name = remote.Name, args = {...}})
    end
    return ...
end

local originalFireServer = Instance.new("RemoteEvent").FireServer
hookfunction(originalFireServer, function(remote, ...)
    logRemoteEvent(remote, ...)
    return originalFireServer(remote, ...)
end)

local originalFireClient = Instance.new("RemoteEvent").FireClient
hookfunction(originalFireClient, function(remote, player, ...)
    logRemoteEvent(remote, player, ...)
    return originalFireClient(remote, player, ...)
end)

local originalInvokeServer = Instance.new("RemoteFunction").InvokeServer
hookfunction(originalInvokeServer, function(remote, ...)
    logRemoteFunction(remote, ...)
    return originalInvokeServer(remote, ...)
end)

local originalInvokeClient = Instance.new("RemoteFunction").InvokeClient
hookfunction(originalInvokeClient, function(remote, player, ...)
    logRemoteFunction(remote, player, ...)
    return originalInvokeClient(remote, player, ...)
end)

function RemoteSpy:ToggleSpying(state)
    spyingEnabled = state
end

function RemoteSpy:GetLogs()
    return logs
end

function RemoteSpy:ClearLogs()
    logs = {}
end

return RemoteSpy
