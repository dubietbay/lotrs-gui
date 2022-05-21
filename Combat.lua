--made by okami
local list = loadstring(game:HttpGet("https://pastebin.com/raw/5dxj2YZb"))()
-- funct
function has_value(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

local nameplr = game.Players:GetNameFromUserIdAsync(game.Players.LocalPlayer.UserId)
if
	has_value(list, game.Players.LocalPlayer.UserId)
	and "https://api.roblox.com/v1.1/avatar-fetch/?placeId=" .. game.PlaceId .. "&userId=" .. game.Players.LocalPlayer.UserId == game.Players.LocalPlayer.CharacterAppearance
	and nameplr == game.Players.LocalPlayer.Name
	and game:GetService("ReplicatedStorage").PlayerData:FindFirstChild(nameplr)
then
	-- var
	local Player = game:GetService("Players").LocalPlayer
	local workspace = game.Workspace
	local whitelist = {}
	local Mouse = game.Players.LocalPlayer:GetMouse()
	local whitelist_mode = ""
	local transparency = 0.5
	local size = 8
	local netType = nil
	local updateissue = false
	local name = Player.Name
	local storage = nil
	local close = false
	local vel = 300
	local MAX_TIME = 5
	local TIME_STEP = 0.001
	local autoblock = false
	local anim = {}
	local blockevents = {}
	local blockTrack
	local swinging = Instance.new("BoolValue",game.Workspace)
	local sound = Instance.new("Sound", game.Workspace)
	sound.SoundId = "rbxassetid://5606942182"
	local sound2 = Instance.new("Sound", game.Workspace)
	sound2.SoundId = "rbxassetid://6501521601"
	for i, v in pairs(game:GetService("ReplicatedStorage").PlayerData[name].Inventory:GetChildren()) do
		if string.match(v.Name, "Storage") then
			storage = v
		end
		wait()
	end
	--funct
	function CloneWithoutChildren(instance)
		local instance2 = instance:Clone()
		instance2:ClearAllChildren()
		return instance2
	end

	function antidebuff()
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Honor Bound"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Honor Bound"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Crippled"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Crippled"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Burning"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Burning"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Stunned"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Stunned"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Pressured"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Pressured"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Off Guard"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Off Guard"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Poisoned"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Poisoned"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Cursed"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Cursed"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if
			game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Bleeding"].Value
			~= 0
		then
			local A_1 = {
				[1] = "Tick Buff",
				[2] = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Bleeding"],
					[2] = 100,
				},
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
	end

	function getplr()
		local Target = Mouse.Target
		if Target == nil then return nil end
		local Checking = true
		local HighestAncestor = Target
		local name = nil
		while Checking == true do
			if HighestAncestor == game.Workspace then
				Checking = false
				break
			else
				HighestAncestor = HighestAncestor.Parent
			end
			if HighestAncestor:FindFirstChild("HumanoidRootPart") then
				if game.Players:FindFirstChild(HighestAncestor.Name) then
					name = HighestAncestor.Name
				end
			end
		end
		return name
	end

	function optimal_angle(x,y,v0,g)
		local root = v0 * v0 * v0 * v0 - g * (g * x * x + 2 * y * v0 * v0)
		if root < 0 then
			return
		end
		root = math.sqrt(root)
		local angle = (v0 * v0 - root) / (g * x)
		return angle
	end

	function travel_time(x,angle,v0)
		local angle = math.atan(angle)
	   return math.abs(x / (math.cos(angle) * v0))
	end

	function predict(time,target)
		return (target.Position + target.AssemblyLinearVelocity * time)
	end

	function direction(angle,x,target_pos,origin_pos)
		return Vector3.new(target_pos.X,origin_pos.Y + angle * x,target_pos.Z)
	end

	function solve(origin,target,g,vel)
		local target_time = 0
		while target_time < MAX_TIME do
			local target_pos = predict(target_time,target);
			local x = ((target_pos - origin.Position)*Vector3.new(1,0,1)).Magnitude
			local y = target_pos.Y - origin.Position.Y
			local sol_angle = optimal_angle(x, y,vel,g);
			local sol_time = travel_time(x, sol_angle, vel);
			if sol_time < target_time then
				return direction(sol_angle,x,target_pos,origin.Position);
			end
			target_time += TIME_STEP;
		end
	end

	--gui
	local Material = loadstring(
		game:HttpGet("https://raw.githubusercontent.com/boop71/some-useless-code/main/kinlei-ui-keybinds.lua")
	)()
	local UI = Material.Load({
		Title = "Land of the Rising Sun combat DLC -dubie",
		Style = 1,
		SizeX = 400,
		SizeY = 400,
		Theme = "Dark",
	})

	local Page1 = UI.New({
		Title = "HBE",
	})

	local Page1_Toggle = Page1.Toggle({
		Text = "On / Off",
		Callback = function(value)
			if value == false then
				for i, v in pairs(game.Players:GetChildren()) do
					if v.Character and v.Name ~= game.Players.LocalPlayer.Name then
						if v.Character:FindFirstChild("hitboxes") then
							v.Character["hitboxes"]:Destroy()
						end
					end
				end
			else
				updateissue = true
			end
		end,
		Enabled = false,
	})

	Page1.Slider({
		Text = "Hitbox size",
		Callback = function(value)
			size = value
			updateissue = true
		end,
		Min = 8,
		Max = 16,
		Def = 8,
		Float = 2,
	})

	Page1.Slider({
		Text = "Hitbox transparency",
		Callback = function(value)
			transparency = value
			updateissue = true
		end,
		Min = 0,
		Max = 1,
		Float = 0.05,
		Def = 0.5,
	})

	local Page1_Color = Page1.ColorPicker({
		Callback = function()
			updateissue = true
		end,
		Text = "Hitbox color",
		Default = Color3.fromRGB(0, 255, 0),
	})

	Page1.Dropdown({
		Text = "Whitelist option",
		Callback = function(value)
			whitelist_mode = value
		end,
		Options = { "Person", "Family", "Faction" },
	})

	Page1.Keybind({
		Text = "Add key",
		Key = Enum.KeyCode.K,
		Callback = function()
			if whitelist_mode == "Person" then
				local name = getplr()
				if name then
					if not has_value(whitelist, name) then
						table.insert(whitelist, name)
					end
					updateissue = true
					game.StarterGui:SetCore("SendNotification", {
						Title = "Added", -- the title (ofc)
						Text = name, -- what the text says (ofc)
						Duration = 5, -- how long the notification should in secounds
					})
				end
			elseif whitelist_mode == "Family" then
				local name = getplr()
				if name and #game:GetService("ReplicatedStorage").PlayerData[name].Family.Value > 3 then
					for i, v in pairs(game.Players:GetChildren()) do
						if
							game:GetService("ReplicatedStorage").PlayerData[v.Name].Family.Value
							== game:GetService("ReplicatedStorage").PlayerData[name].Family.Value
						then
							if not has_value(whitelist, v.Name) then
								table.insert(whitelist, v.Name)
							end
						end
					end
					updateissue = true
					game.StarterGui:SetCore("SendNotification", {
						Title = "Added", -- the title (ofc)
						Text = game:GetService("ReplicatedStorage").Families[game:GetService("ReplicatedStorage").PlayerData[name].Family.Value].FamilyName.Value, -- what the text says (ofc)
						Duration = 5, -- how long the notification should in secounds
					})
				end
			elseif whitelist_mode == "Faction" then
				local name = getplr()
				if name and #game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value > 3 then
					for i, v in pairs(game.Players:GetChildren()) do
						if
							game:GetService("ReplicatedStorage").PlayerData[v.Name].Faction.Value
							== game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value
						then
							if not has_value(whitelist, v.Name) then
								table.insert(whitelist, v.Name)
							end
						end
					end
					updateissue = true
					game.StarterGui:SetCore("SendNotification", {
						Title = "Added", -- the title (ofc)
						Text = game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value, -- what the text says (ofc)
						Duration = 5, -- how long the notification should in secounds
					})
				end
			end
		end,
	})

	Page1.Keybind({
		Text = "Remove key",
		Key = Enum.KeyCode.L,
		Callback = function()
			if whitelist_mode == "Person" then
				local name = getplr()
				if name then
					if has_value(whitelist, name) then
						table.remove(whitelist, table.find(whitelist, name))
					end
					updateissue = true
					game.StarterGui:SetCore("SendNotification", {
						Title = "Removed", -- the title (ofc)
						Text = name, -- what the text says (ofc)
						Duration = 5, -- how long the notification should in secounds
					})
				end
			elseif whitelist_mode == "Family" then
				local name = getplr()
				if name and #game:GetService("ReplicatedStorage").PlayerData[name].Family.Value > 3 then
					for i, v in pairs(game.Players:GetChildren()) do
						if
							game:GetService("ReplicatedStorage").PlayerData[v.Name].Family.Value
							== game:GetService("ReplicatedStorage").PlayerData[name].Family.Value
						then
							if has_value(whitelist, v.Name) then
								table.remove(whitelist, table.find(whitelist, v.Name))
							end
						end
					end
					updateissue = true
					game.StarterGui:SetCore("SendNotification", {
						Title = "Removed", -- the title (ofc)
						Text = game:GetService("ReplicatedStorage").Families[game:GetService("ReplicatedStorage").PlayerData[name].Family.Value].FamilyName.Value, -- what the text says (ofc)
						Duration = 5, -- how long the notification should in secounds
					})
				end
			elseif whitelist_mode == "Faction" then
				local name = getplr()
				if name and #game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value > 3 then
					for i, v in pairs(game.Players:GetChildren()) do
						if
							game:GetService("ReplicatedStorage").PlayerData[v.Name].Faction.Value
							== game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value
						then
							if has_value(whitelist, v.Name) then
								table.remove(whitelist, table.find(whitelist, v.Name))
							end
						end
					end
					updateissue = true
					game.StarterGui:SetCore("SendNotification", {
						Title = "Removed", -- the title (ofc)
						Text = game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value, -- what the text says (ofc)
						Duration = 5, -- how long the notification should in secounds
					})
				end
			end
		end,
	})

	Page1.Button({
		Text = "Clear whitelist",
		Callback = function()
			whitelist = {}
			updateissue = true
		end,
	})

	local Page2 = UI.New({
		Title = "Combat",
	})

	Page2.Button({
		Text = "Fill class juice",
		Menu = {
			Information = function(self)
				UI.Banner({
					Text = "You have to stand still then click, didnt work? click again lol.",
				})
			end,
		},
		Callback = function()
			for i = 1, 41 do
				game:GetService("Workspace").Remotes.Classes.MeditateEvent:FireServer()
			end
		end,
	})

	Page2.Keybind({
		Text = "Auto block",
		Key = Enum.KeyCode.Tab,
		Callback = function()
			autoblock = not autoblock
			if autoblock == true then
				swinging.Value = false
				anim = {}
				sound:Play()
				local humanoid = Player.Character:FindFirstChild("Humanoid")
				blockTrack = humanoid:LoadAnimation(
					game:GetService("ReplicatedStorage").ReplicatedAnimations.Tanto.BlockAnim
				)
			else
				swinging.Value = false
				anim = {}
				for i,v in pairs(blockevents) do
					v:Disconnect()
				end
				blockevents = {}
				sound2:Play()
			end
		end,
	})

	local Page2_AntiDebuff = Page2.Toggle({
		Text = "Anti debuff ON/OFF",
		Enabled = false,
	})

	local Page2_Autoloot = Page2.Toggle({
		Text = "Autoloot On/Off",
		Enabled = false,
	})

	local Page2_Aimbot = Page2.Toggle({
		Text = "Aimbot",
		Enabled = false,
	})


	local Page3 = UI.New({
		Title = "Utility",
	})

	Page3.Keybind({
		Text = "GUI away",
		Key = Enum.KeyCode.U,
		Callback = function()
			close = not close
			if close then
				game:GetService("CoreGui")["Land of the Rising Sun combat DLC -dubie"].MainFrame:TweenPosition(
					UDim2.new(0, 0,1, 0),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Sine,
					.5,
					true
				)
			else
				game:GetService("CoreGui")["Land of the Rising Sun combat DLC -dubie"].MainFrame:TweenPosition(
					UDim2.new(0, 0,0, 0),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Sine,
					.5,
					true
				)
			end
		end,
	})

	Page3.Button({
		Text = "Instant cap",
		Callback = function()
			for i, v in pairs(game:GetService("Workspace").InteractiveBuildings:GetChildren()) do
				if v:FindFirstChild("TerritoryInfo") then
					game:GetService("Workspace").Remotes.InventorySystem.CaptureTerritoryEvent:FireServer(v)
				end
			end
		end,
	})

	-- add cap lock with game scan to put datatable or chipset (ill miss u)

	local Page3_item_text = Page3.TextField({
		Text = "Item's name for repair (item must be in inventory).",
	})

	Page3.Button({
		Text = "Repair",
		Callback = function()
			local item = game
				:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items
				:FindFirstChild(Page3_item_text:GetText())
			if item then
				if item:FindFirstChild("PermanentDamage") then
					local A_1 = {
						[1] = item.PermanentDamage,
						[2] = 100,
					}
					game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
					game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
				end
				if item:FindFirstChild("Durability") then
					local A_1 = {
						[1] = item.Durability,
						[2] = 100,
					}
					game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
					game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
				end
			else
				UI.Banner({
					Text = "Couldn't find item.",
				})
			end
		end,
	})

	local Page3_mons_text = Page3.TextField({
		Text = "Mons.",
	})

	Page3.Button({
		Text = "Mons to ryo",
		Callback = function()
			local mons = tonumber(Page3_mons_text:GetText())
			if mons ~= nil then
				if mons >= 4000 then
					game:GetService("Workspace").Remotes.Storage.DepositFundsFunction:InvokeServer({mons,0})
					game:GetService("Workspace").Remotes.Storage.ExchangeMonFunction:InvokeServer(mons)
					local A_1 = 
					{
						[1] = game:GetService("ReplicatedStorage").PlayerData[name].Inventory.Bank, 
						[2] = 0, 
						[3] = math.floor(mons/4000)
					}
					game:GetService("Workspace").Remotes.Storage.WithdrawFundsEvent:FireServer(A_1)
				end
			end
		end,
	})

	Page3.Button({
		Text = "TPbypass",
		Callback = function()
			if
				game
					:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Zone
					:FindFirstChild("PlayerLocation")
			then
				local A_1 = {
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Zone.PlayerLocation,
					[2] = 100
				}
				game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
				game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
			else
				UI.Banner({
					Text = "Already bypassed",
				})
			end
		end,
	})

	Page3.Keybind({
		Text = "Gate toggle",
		Key = Enum.KeyCode.P,
		Callback = function()
			for i, v in pairs(game:GetService("Workspace").Gates:GetChildren()) do
				game:GetService("Workspace").Remotes.Doors.ToggleGateEvent:FireServer({v,true})
				game:GetService("Workspace").Remotes.Doors.ToggleGateEvent:FireServer({v,false})
			end
		end,
	})

	local Page4 = UI.New({
		Title = "Food",
	})

	Page4.Dropdown({
		Text = "Choose net",
		Callback = function(value)
			netType = value
		end,
		Options = { "Master Net", "Journeyman Net", "Apprentice Net", "Crude Net" },
	})

	local Page4_Net = Page4.Toggle({
		Text = "Start netting",
		Enabled = false,
	})

	local Page4_bait_text = Page4.TextField({
		Text = "Bait's name",
	})

	local Page4_fishing = Page4.Toggle({
		Text = "Start fishing",
		Enabled = false,
	})

	local Page4_food_cook_text = Page4.TextField({
		Text = "Food's name (to cook)",
	})

	local Page4_cooking = Page4.Toggle({
		Text = "Start cooking",
		Enabled = false,
	})

	local Page4_food_eat_text = Page4.TextField({
		Text = "Food's name (to eat)",
	})

	Page4.Keybind({
		Text = "Eat food key",
		Key = Enum.KeyCode.N,
		Callback = function()
			game:GetService("Workspace").Remotes.InventorySystem.EatEvent:FireServer(Page4_food_eat_text:GetText())
		end,
	})


	-- event

	local mt = getrawmetatable(game) --get meta

	local oldnamecall = mt.__namecall --store namecall

	setreadonly(mt, false) --make mt writeable

	mt.__namecall = newcclosure(function(self, ...) --newcclosure yes
		local method = getnamecallmethod() --namecall
		local Args = {...} --args variable
		if not checkcaller() and method == "FireServer" and tostring(self) == "MouseEvent" and Page2_Aimbot:GetState() and Args[4] == nil then
			local targetname = getplr()
			if targetname then
				local target = game:GetService("Workspace"):FindFirstChild(targetname):FindFirstChild("HumanoidRootPart")
				if Args[2] == "7 Monme Round" and game:GetService("ReplicatedStorage").PlayerData[name].CombatValues.InHand.Value == "Hazamatutu" then
					local origin = game:GetService("Workspace")[name].HazamatutuBody.Base.Target
					local aimat = solve(origin, target, 16.2, vel)
					local A_1 = (aimat - origin.Position).Unit
					local A_2 = "7 Monme Round"
					game:GetService("Workspace")[name].Hazamatutu.MouseEvent:FireServer(A_1, A_2,"None","a")
					return
				elseif string.find(Args[2], "Arrow") and game:GetService("ReplicatedStorage").PlayerData[name].CombatValues.InHand.Value == "Sanbonhigo Daikyu" then
					local origin = game:GetService("Workspace")[name]["Sanbonhigo DaikyuBody"].Hold.Target
					local aimat = solve(origin, target, 15.7, vel)
					local A_1 = (aimat - origin.Position).Unit
					game:GetService("Workspace")[name]["Sanbonhigo Daikyu"].MouseEvent:FireServer(A_1, Args[2],Args[3],"a")
					return
				elseif string.find(Args[2], "Arrow") and game:GetService("ReplicatedStorage").PlayerData[name].CombatValues.InHand.Value == "Sanbonhigo Hankyu" then
					local origin = game:GetService("Workspace")[name]["Sanbonhigo HankyuBody"].Hold.Target
					local aimat = solve(origin, target, 16, vel)
					local A_1 = (aimat - origin.Position).Unit
					game:GetService("Workspace")[name]["Sanbonhigo Hankyu"].MouseEvent:FireServer(A_1, Args[2],Args[3],"a")
					return
				end
			else return end
		end
		if not checkcaller() and method == "FireServer" and tostring(self) == "ProcessHitEvent" and Page1_Toggle:GetState() then
			if has_value(whitelist, Args[1].Name) then
				return
			end
		end
		if not checkcaller() and method == "FireServer" and tostring(self) == "DrownEvent" then
			return
		end
		return oldnamecall(self, ...) --return old
	end)

	setreadonly(mt, true)


	-- loop
	workspace.ChildAdded:Connect(function(child)
		if game.Players:FindFirstChild(child.Name) then
			wait(1)
			updateissue = true
		end
	end)

	coroutine.wrap(function()
		while true do
			if Page1_Toggle:GetState() then
				for i, v in pairs(game.Players:GetChildren()) do
					if
						v.Character
						and v.Character.PrimaryPart
						and v.Character:FindFirstChild("Humanoid")
						and v.Name ~= game.Players.LocalPlayer.Name
					then
						if v.Character:FindFirstChild("hitboxes") then
							local cf = v.Character.PrimaryPart.CFrame
							if game:GetService("ReplicatedStorage").PlayerData[v.Name].CombatValues.Blocking.Value ~= 0 then
								cf = CFrame.new()
							end
							for _, k in pairs(v.Character["hitboxes"]:GetChildren()) do
								k.CFrame = cf
							end
						end
					end
				end
			end
			task.wait()
		end
	end)()

	coroutine.wrap(function()
		while true do
			if Page2_Autoloot:GetState() and game:GetService("ReplicatedStorage").PlayerData[name].InvLoaded.Value == true then
				for i, v in pairs(game:GetService("Workspace").LootDrops:GetChildren()) do
					if v.PrimaryPart and v:FindFirstChild("InUse") then
						local a = Player:DistanceFromCharacter(v.PrimaryPart.Position)
						if v.InUse.Value == "" and a < 35 and a ~= 0 and not v:FindFirstChild("deez") then
							game:GetService("Workspace").Remotes.Storage.InteractWithGraveFunction:InvokeServer({ v, true })
						end
					end
				end
				if game:GetService("ReplicatedStorage").PlayerData[name].CombatValues.Equipped.Value == false then
					for i, v in pairs(game:GetService("Workspace").LootDrops:GetChildren()) do
						if v.PrimaryPart and v:FindFirstChild("InUse") then
							local a = Player:DistanceFromCharacter(v.PrimaryPart.Position)
							if v.InUse.Value == name and not v:FindFirstChild("deez") and a < 35 and a ~= 0 then
								coroutine.wrap(function()
									local folder = Instance.new("Folder",v)
									folder.Name = "deez"
									local inamelist = {}
									local ivaluelist = {}
									local ise = {}
									for i, k in pairs(v.ItemFolder:GetChildren()) do
										if not string.match(game:GetService("Lighting").GameStats.Items[k.Name].Type.Value, "Food") then
											local isequip = "nope"
											if k:FindFirstChild("Durability") or k:FindFirstChild("Quality") then
												isequip = "yes"
											end
											local A_1 = {
												[1] = v,
												[2] = k,
												[3] = k.Value,
											}
											game:GetService("Workspace").Remotes.Storage.TakeLootEvent:FireServer(A_1)
											if isequip == "yes" then
												table.insert(inamelist, k)
											else
												table.insert(inamelist, k.Name)
											end
											table.insert(ivaluelist, k.Value)
											table.insert(ise, isequip)
											wait()
										end
									end
									wait(0.2)
									for i = 1, table.getn(inamelist) do
										if ise[i] == "yes" then
											local A_1 = {
												[1] = "Warehouse",
												[2] = game:GetService("ReplicatedStorage").PlayerData[name].Inventory.Items,
												[3] = storage,
												[4] = inamelist[i],
												[5] = 1,
											}
											game:GetService("Workspace").Remotes.Storage.MoveUnitsEvent:FireServer(A_1)
										else
											local A_1 = {
												[1] = "Warehouse",
												[2] = game:GetService("ReplicatedStorage").PlayerData[name].Inventory.Items,
												[3] = storage,
												[4] = inamelist[i],
												[5] = ivaluelist[i],
											}
											game:GetService("Workspace").Remotes.Storage.MoveUnitsEvent:FireServer(A_1)
										end
										wait()
									end
									game:GetService("Workspace").Remotes.Storage.InteractWithGraveFunction:InvokeServer({ v, false })
									-- if folder then
									-- 	folder:Destroy()
									-- end
								end)()
							end
						end
					end
				end
			end
			wait()
		end
	end)()

	coroutine.wrap(function()
		while true do
			if autoblock and game:GetService("ReplicatedStorage").PlayerData[name].CombatValues.InHand.Value ~= "" then
				local animationTracks = Player.Character:FindFirstChild("Humanoid"):GetPlayingAnimationTracks()
				local swing = false
				for _, animationTrack in ipairs(animationTracks) do --"animationTracks" is an array of currently playing animation tracks.
					if string.match(animationTrack.Name, "Attack") then
						swing = true
						if not has_value(anim,animationTrack) then
							table.insert(anim, animationTrack)
							local event = animationTrack:GetMarkerReachedSignal("AttackManager"):Connect(function()
								swinging.Value = not swinging.Value
							end)
							table.insert(blockevents,event)
						end
					end
				end
				if swing == false then swinging.Value = false end
				if swinging.Value or game:GetService("ReplicatedStorage").PlayerData[name].CombatValues.Swinging.Value then
					blockTrack:Stop(0)
				else
					blockTrack:Play(1,0)
				end
			end
			task.wait()
		end
	end)()

	coroutine.wrap(function()
		while true do
			if Page4_cooking:GetState() then
				if
					game
						:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items
						:FindFirstChild(Page4_food_cook_text:GetText())
				then
					game:GetService("Workspace").Remotes.Cooking.CookItemEvent:FireServer(Page4_food_cook_text:GetText())
				end
			end
			if Page4_Net:GetState() then
				if netType ~= nil then
					game
						:GetService("Workspace").Remotes.Tools.NetGatherEvent
						:FireServer(game:GetService("Lighting").GameStats.Items[netType])
				end
			end
			if Page4_fishing:GetState() then
				if
					game
						:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items
						:FindFirstChild(Page4_bait_text:GetText())
					and game:GetService("Lighting").GameStats.Items.FishStats.Salt:FindFirstChild(Page4_bait_text:GetText())
				then
					game
						:GetService("Workspace").Remotes.Tools.UpdateFishingInfoFunction
						:InvokeServer(Page4_bait_text:GetText())
					game:GetService("Workspace").Remotes.Tools.CatchFishFunction:InvokeServer(
						game:GetService("Lighting").GameStats.Items.FishStats.Salt:FindFirstChild(Page4_bait_text:GetText())
					)
				end
			end
			wait()
		end
	end)()

	while true do
		if game.Players.LocalPlayer.Character then
			if game.Players.LocalPlayer.Character.Name ~= nameplr then
				game.Players.LocalPlayer:Kick("dubie#6541")
			end
		end
		if Page2_AntiDebuff:GetState() then
			antidebuff()
		end
		if Page1_Toggle:GetState() and updateissue == true then
			for _, v in pairs(game.Players:GetChildren()) do
				if
					v.Character
					and v.Character.PrimaryPart
					and v.Character:FindFirstChild("Humanoid")
					and v.Name ~= game.Players.LocalPlayer.Name
				then
					if not has_value(whitelist, v.Name) then
						--v.Character.Humanoid.BreakJointsOnDeath = false
						if v.Character:FindFirstChild("hitboxes") then
							v.Character["hitboxes"]:Destroy()
						end
						local folder = Instance.new("Folder", v.Character)
						folder.Name = "hitboxes"
						for i = 4, size, 2 do
							local part = CloneWithoutChildren(v.Character.PrimaryPart)
							part.Parent = folder
							part.Size = Vector3.new(i, i, i)
							part.TopSurface = "Smooth"
							part.BottomSurface = "Smooth"
							part.CanCollide = false
							part.Anchored = true
							if i == size then
								part.Transparency = transparency
								part.Color = Page1_Color:GetColor()
							else
								part.Transparency = 1
							end
						end
					else
						if v.Character:FindFirstChild("hitboxes") then
							v.Character["hitboxes"]:Destroy()
						end
					end
				end
			end
			updateissue = false
		end
		wait()
	end
else
	game.Players.LocalPlayer:Kick("dubie#6541")
end