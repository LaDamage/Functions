return function gaf_webber(pet_name, tier, rarity, discord_id)
    local WebhookData = {
        ["content"] = "<@"..discord_id..">", -- comma added here
        ["embeds"] = {{
            ["title"] = "A "..pet_name.." has spawned!",
            ["color"] = 0x00ff36,
            ["fields"] = {{
                ["name"] = "Tier",
                ["value"] = tier,
                ["inline"] = true
            },
            {
                ["name"] = "Rarity",
                ["value"] = rarity,
                ["inline"] = true
            }},
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }

    return WebhookData
end
