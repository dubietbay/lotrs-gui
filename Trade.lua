local Material = loadstring(
    game:HttpGet("https://raw.githubusercontent.com/boop71/some-useless-code/main/kinlei-ui-keybinds.lua")
)()
local UI = Material.Load({
    Title = "Land of the Rising Sun trade DLC -dubie",
    Style = 1,
    SizeX = 400,
    SizeY = 400,
    Theme = "Dark",
})

local Page1 = UI.New({
    Title = "Trade"
})

Page1.Button({
    Text = "Spawn",
    Callback = function()
        local A_1 = game:GetService("Workspace").Spawns["0"]
        game:GetService("Workspace").Remotes.Global.SpawnEvent:FireServer(A_1)
    end,
})

local Page1_trade_name = Page1.TextField({
    Text = "Name",
})

Page1.Button({
    Text = "Send trade",
    Callback = function()
        local A_1 = game:GetService("Players")[Page1_trade_name:GetText()]
        game:GetService("Workspace").Remotes.Notifications.SendTradeRequestEvent:FireServer(A_1)
    end
})

Page1.Button({
    Text = "Offer all",
    Callback = function()
        for i, v in pairs(game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items:GetChildren()) do
            if not v:FindFirstChild("Durability") then
                local A_1 =
                {
                    [1] = v.Name,
                    [2] = v.Value
                }
                game:GetService("Workspace").Remotes.Trade.OfferItemsFunction:InvokeServer(A_1)
            else
                local A_1 =
                {
                    [1] = v,
                    [2] = v.Value
                }
                game:GetService("Workspace").Remotes.Trade.OfferItemsFunction:InvokeServer(A_1)
            end
        end
    end
})

Page1.Button({
    Text = "Accept",
    Callback = function()
        local A_1 = true
        game:GetService("Workspace").Remotes.Trade.UpdateTradeEvent:FireServer(A_1)
    end
})

local Page2 = UI.New({
    Title = "inventory"
})

local Page2_trade_amount = Page2.TextField({
    Text = "Amount"
})

for i, v in pairs(game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items:GetChildren()) do
    if v:FindFirstChild("Durability") then
        Page2.Button({
            Text = v.Name,
            Callback = function()
                local A_1 =
                    {
                        [1] = v,
                        [2] = tonumber(Page2_trade_amount:GetText())
                    }
                game:GetService("Workspace").Remotes.Trade.OfferItemsFunction:InvokeServer(A_1)
            end
        })
    else
        Page2.Button({
            Text = v.Name,
            Callback = function()
                local A_1 =
                    {
                        [1] = v.Name,
                        [2] = tonumber(Page2_trade_amount:GetText())
                    }
                game:GetService("Workspace").Remotes.Trade.OfferItemsFunction:InvokeServer(A_1)
            end
        })
    end
end