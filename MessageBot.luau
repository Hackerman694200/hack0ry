local Players = game:GetService("Players")

local function onPlayerChatted(player, message)
local data = {
    ["content"] = "Player Chatted In Hack0ry's Game",
    ["embeds"] = {{
        ["title"] = "",
        ["description"] = (player.Name .. "said  : " .. message),
        ["type"] = "rich",
        ["color"] = tonumber(0xff0000),
        ["fields"] = {{
            ["name"] = "",
            ["value"] = "",
            ["inline"] = true
        }}
    }}
}

local jsonData = game:GetService("HttpService"):JSONEncode(data)

local response = request({
    Url = "https://discord.com/api/webhooks/1268604763138949226/AoX85XI6q4OLqOrr5Js8vvqnKZkrSUeFvulCi-hP1LTQnxayc3bCgT4c8mwf5N3c8etO",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = jsonData
})

end

local function setupPlayer(player)
    player.Chatted:Connect(function(message)
        onPlayerChatted(player, message)
    end)
end
for _, player in ipairs(Players:GetPlayers()) do
    setupPlayer(player)
end

Players.PlayerAdded:Connect(function(player)
    setupPlayer(player)
end)
