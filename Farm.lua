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
	local UIS = game:GetService("UserInputService")
	local workspace = game.Workspace
	local camera = workspace.CurrentCamera
	local length = 20
	local params = RaycastParams.new()
	local netType = nil
	local avoidrange = 150
	local animationTrack, animationTrack2
	local name = Player.Name
	local close = false
	for i, v in pairs(game:GetService("ReplicatedStorage").PlayerData[name].Inventory:GetChildren()) do
		if string.match(v.Name, "Storage") then
			storage = v
		end
		wait()
	end
	--funct
	function addcfv3(a, b)
		local x, y, z, m11, m12, m13, m21, m22, m23, m31, m32, m33 = a:components()
		return CFrame.new(x + b.x, y + b.y, z + b.z, m11, m12, m13, m21, m22, m23, m31, m32, m33);
	end

	function fixtools()
		for i,v in pairs(game:GetService("ReplicatedStorage").PlayerData[name].Inventory:GetDescendants()) do
			if v.Name == "Durability" and string.match(v.Parent.Parent.Name, "Slot") and v.Value < 50 then
				local A_1 = {
					[1] = v,
					[2] = 100,
				}
				game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
				game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1) 
			end
		end
	end

	function isclosetoplayers(pos, distance)
		for _, v in pairs(game.Players:GetPlayers()) do
			if v ~= Player and v.Character then
				if v:DistanceFromCharacter(pos) < distance then
					return false
				end
			end
		end
		return true
	end

	--gui
	local Material = loadstring(
		game:HttpGet("https://raw.githubusercontent.com/boop71/some-useless-code/main/kinlei-ui-keybinds.lua")
	)()
	local UI = Material.Load({
		Title = "Land of the Rising Sun farm DLC -dubie",
		Style = 1,
		SizeX = 400,
		SizeY = 600,
		Theme = "Dark",
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
				game:GetService("CoreGui")["Land of the Rising Sun farm DLC -dubie"].MainFrame:TweenPosition(
					UDim2.new(0, 0,1, 0),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Sine,
					.5,
					true
				)
			else
				game:GetService("CoreGui")["Land of the Rising Sun farm DLC -dubie"].MainFrame:TweenPosition(
					UDim2.new(0, 0,0, 0),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Sine,
					.5,
					true
				)
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

	Page3.Button({
		Text = "Invis",
		Callback = function()
			if
				game
					:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Zone
					:FindFirstChild("PlayerLocation")
			then
				UI.Banner({
					Text = "Must bypass TP first",
				})
			else
				local Character = Player.Character
				local Clone = Character.LowerTorso.Root:Clone()
				Character.LowerTorso.Root:Destroy()
				Clone.Parent = Character.LowerTorso
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

	local Page5 = UI.New({
		Title = "Bots",
	})

	local botfarm = Page5.Toggle({
		Text = "On / Off (hbe for bot)",
		Enabled = false,
	})

	local Page5_delay_text = Page5.TextField({
		Text = "Delay after click",
		Type = "Number",
	})

	local pickup = Page5.Toggle({
		Text = "Auto Pickup Loot",
		Enabled = false,
	})

	local autofarm = Page5.Toggle({
		Text = "Autofarm",
		Callback = function(value)
			if value then
				local humanoid = Player.Character:FindFirstChild("Humanoid")
				animationTrack = humanoid:LoadAnimation(
					game:GetService("ReplicatedStorage").ReplicatedAnimations.Katana.BlockAnim
				)
				animationTrack2 = humanoid:LoadAnimation(
					game:GetService("ReplicatedStorage").ReplicatedAnimations.Kama.CenterAttackAnim
				)
			end
		end,
		Enabled = false,
	})

	local ActivateSpecificFarm = Page5.Toggle({
		Text = "ActivateSpecificFarm",
		Enabled = false,
	})

	local Page5_faction = Page5.TextField({
		Text = "Faction's Name/Leave none for bandits",
	})

	local AvoidPlayers = Page5.Toggle({
		Text = "AvoidPlayers",
		Enabled = false,
	})

	Page5.Slider({
		Text = "AvoidRange",
		Callback = function(value)
			avoidrange = value
		end,
		Min = 100,
		Max = 1000,
		Float = 1,
		Def = 250,
	})

	Page5.Button({
		Text = "Reduce lag",
		Callback = function()
			local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
			local g = game
			local w = g.Workspace
			local l = g.Lighting
			local t = w.Terrain
			local set_hidden_property = sethiddenproperty or set_hidden_prop
			local userGameSettings = UserSettings():FindService("UserGameSettings")
				or UserSettings():GetService("UserGameSettings")
			pcall(function()
				set_hidden_property(lighting, "Technology", Enum.Technology.Compatibility)
			end)
			t.WaterWaveSize = 0
			t.WaterWaveSpeed = 0
			t.WaterReflectance = 0
			t.WaterTransparency = 0
			l.GlobalShadows = false
			l.FogEnd = 9e9
			l.Brightness = 0
			settings().Rendering.QualityLevel = 1
			userGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
			settings().Rendering.EagerBulkExecution = false
			l.GlobalShadows = false
			for i, v in pairs(g:GetDescendants()) do
				if
					v:IsA("Part")
					or v:IsA("Union")
					or v:IsA("CornerWedgePart")
					or v:IsA("TrussPart")
					or v:IsA("WedgePart")
				then
					v.Material = "Plastic"
					v.Reflectance = 0
				elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
					v.Transparency = 1
				elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
					v.Lifetime = NumberRange.new(0)
				elseif v:IsA("Explosion") then
					v.BlastPressure = 1
					v.BlastRadius = 1
				elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
					v.Enabled = false
				elseif v:IsA("MeshPart") then
					v.Material = "Plastic"
					v.Reflectance = 0
					v.TextureID = 10385902758728957
				end
			end
			for i, e in pairs(l:GetChildren()) do
				if
					e:IsA("BlurEffect")
					or e:IsA("SunRaysEffect")
					or e:IsA("ColorCorrectionEffect")
					or e:IsA("BloomEffect")
					or e:IsA("DepthOfFieldEffect")
				then
					e.Enabled = false
				end
			end
			workspace.DescendantAdded:Connect(function(child)
				coroutine.wrap(function()
					if child:IsA("ForceField") then
						game:GetService("RunService").Heartbeat:Wait()
						child:Destroy()
					elseif child:IsA("Sparkles") then
						game:GetService("RunService").Heartbeat:Wait()
						child:Destroy()
					elseif child:IsA("Smoke") or child:IsA("Fire") then
						game:GetService("RunService").Heartbeat:Wait()
						child:Destroy()
					end
				end)()
			end)
			game:GetService("Workspace").Gates:Destroy()
			game:GetService("Workspace").MapBorders:Destroy()
			game:GetService("Workspace").Map:Destroy()
			game:GetService("Workspace").InteractiveBuildings:Destroy()
			game:GetService("Workspace").Walls:Destroy()
			game:GetService("Workspace").FireFlies:Destroy()
			game:GetService("Workspace").GatePlots:Destroy()
			game:GetService("Workspace").PlayerShops:Destroy()
			game:GetService("Workspace").Resources:Destroy()
			game:GetService("Workspace").CraftingBuildings:Destroy()
			game:GetService("Players").LocalPlayer.PlayerScripts.WindController:Destroy()
		end,
	})

	local Page6 = UI.New({
		Title = "Resources",
	})

	local resources = {}

	for i,v in pairs(game:GetService("Workspace").Resources:GetDescendants()) do
		if v.Name == "Type" and not has_value(resources,v.Value) then
			table.insert(resources, v.Value)
		end
		if v.Parent.Name == "Gatherables" and not has_value(resources,v.Name) and v.Name ~= "Part" then
			table.insert(resources, v.Name)
		end
	end

	local options = {}
	local chosen = {}

	for i, v in pairs(resources) do
		options[v] = false
	end

	Page6.DataTable({
		Text = "Resources",
		Callback = function(ChipSet)
			chosen = ChipSet
		end,
		Options = options
	})

	local resources_range = 0

	Page6.Slider({
		Text = "Avoid Range",
		Callback = function(value)
			resources_range = value
		end,
		Min = 0,
		Max = 1000,
		Float = 1,
		Def = 0,
	})

	local toggleAutofarm = Page6.Toggle({
		Text = "Autofarm",
		Enabled = false,
	})


	-- event

	-- loop
	UIS.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if botfarm:GetState() then
				if Page5_delay_text:GetText() then
					wait(Page5_delay_text:GetText())
					for i, v in pairs(game.Workspace.Mobs:GetChildren()) do
						if v.PrimaryPart and Player.Character and Player.Character.PrimaryPart then
							if Player:DistanceFromCharacter(v.PrimaryPart.Position) < 30 then
								game:GetService("Workspace").Remotes.Global.ProcessHitEvent:FireServer(v)
							end
						end
					end
				end
			end
		end
	end)

	coroutine.wrap(function()
		while true do
			if toggleAutofarm:GetState() and Player.Character:FindFirstChild("Humanoid") then
				game.Workspace.Gravity = 0
				local humanoid = Player.Character:FindFirstChild("Humanoid")
				local root = Player.Character:FindFirstChild("HumanoidRootPart")
				humanoid:UnequipTools()
				wait(2)
				for i,k in pairs(Player:FindFirstChildOfClass("Backpack"):GetChildren()) do
					if k:IsA("Tool") and string.match(k.Name,"Axe") then
						k.Parent = Player.Character
						wait(2)
						for _, v in pairs(game:GetService("Workspace").Resources.Tree:GetChildren()) do
							if v:FindFirstChild("TreeInfo") then
								if v.TreeInfo.Dead.Value == false and chosen[v.TreeInfo.Type.Value] then
									workspace.CurrentCamera.CameraSubject = v.Base
									wait(0.4)
									while v.TreeInfo.Dead.Value == false do
										local raycastResult = workspace:Raycast(camera.CFrame.Position, camera.CFrame.LookVector * length, params)
										if isclosetoplayers(raycastResult.Position, resources_range) then
											fixtools()
											root.CFrame = CFrame.new(raycastResult.Position + Vector3.new(0,-5,0))
											game:GetService("Workspace").Remotes.Tools.NodeTickFunction:InvokeServer(v, raycastResult.Position)
										else
											break
										end
										wait(0.15)
									end
								end
							end
						end
					end
				end
				humanoid:UnequipTools()
				wait(2)
				for i,k in pairs(Player:FindFirstChildOfClass("Backpack"):GetChildren()) do
					if k:IsA("Tool") and string.match(k.Name,"Pick") then
						k.Parent = Player.Character
						wait(2)
						for _, v in pairs(game:GetService("Workspace").Resources.Ore:GetChildren()) do
							if v:FindFirstChild("OreInfo") then
								if v.OreInfo.Dead.Value == false and chosen[v.OreInfo.Type.Value] then
									workspace.CurrentCamera.CameraSubject = v.Base
									wait(0.4)
									while v.OreInfo.Dead.Value == false do
										local raycastResult = workspace:Raycast(camera.CFrame.Position, camera.CFrame.LookVector * length, params)
										if isclosetoplayers(raycastResult.Position, resources_range) then
											fixtools()
											root.CFrame = CFrame.new(raycastResult.Position + Vector3.new(0,-5,0))
											game:GetService("Workspace").Remotes.Tools.NodeTickFunction:InvokeServer(v, raycastResult.Position)
										else
											break
										end
										wait(0.15)
									end
								end
							end
						end
					end
				end
				humanoid:UnequipTools()
				wait(2)
				for _, v in pairs(game:GetService("Workspace").Resources.Gatherables:GetChildren()) do
					if v.Name ~= "Part" and not v:FindFirstChild("OreInfo") then
						if v.Status.Value == true and chosen[v.Name] then
							workspace.CurrentCamera.CameraSubject = v
							wait(0.4)
							while v.Status.Value == true do
								local raycastResult = workspace:Raycast(camera.CFrame.Position, camera.CFrame.LookVector * length, params)
								if isclosetoplayers(raycastResult.Position, resources_range) then
									root.CFrame = CFrame.new(raycastResult.Position + Vector3.new(0,-5,0))
									game:GetService("Workspace").Remotes.Gathering.ManageResourceEvent:FireServer(v)
								else
									break
								end
								wait()
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
			if autofarm:GetState() then
				animationTrack2:Play(1, 0)
				wait(0.5)
				for i, v in pairs(game.Workspace.Mobs:GetChildren()) do
					if v.PrimaryPart and Player.Character and Player.Character.PrimaryPart then
						if Player:DistanceFromCharacter(v.PrimaryPart.Position) < 30 then
							game:GetService("Workspace").Remotes.Global.ProcessHitEvent:FireServer(v)
						end
					end
				end
				--wait(1)
			end
			wait()
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

	local mt = getrawmetatable(game) --get meta

	local oldnamecall = mt.__namecall --store namecall

	setreadonly(mt, false) --make mt writeable

	mt.__namecall = newcclosure(function(self, ...) --newcclosure yes
		local method = getnamecallmethod() --namecall
		local Args = {...} --args variable
		if not checkcaller() and method == "FireServer" and tostring(self) == "DrownEvent" then
			return
		end
		return oldnamecall(self, ...) --return old
	end)

	setreadonly(mt, true)

	while true do
		if game.Players.LocalPlayer.Character then
			if game.Players.LocalPlayer.Character.Name ~= nameplr then
				game.Players.LocalPlayer:Kick("dubie#6541")
			end
			if autofarm:GetState() then
				local PlayerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				local Closest = nil
				for _, v in pairs(workspace.Mobs:GetChildren()) do
					if v:FindFirstChild("Info") and v.PrimaryPart then
						if v.Info:FindFirstChild("Faction") then
							if ActivateSpecificFarm:GetState() then
								if v.Info.Faction.Value == Page5_faction:GetText() then
									if AvoidPlayers:GetState() then
										if isclosetoplayers(v.PrimaryPart.Position, avoidrange) then
											if Closest == nil then
												Closest = v
											else
												if
													(PlayerPosition - v.PrimaryPart.Position).magnitude
													< (Closest.PrimaryPart.Position - PlayerPosition).magnitude
												then
													Closest = v
												end
											end
										end
									else
										if Closest == nil then
											Closest = v
										else
											if
												(PlayerPosition - v.PrimaryPart.Position).magnitude
												< (Closest.PrimaryPart.Position - PlayerPosition).magnitude
											then
												Closest = v
											end
										end
									end
								end
							else
								if AvoidPlayers:GetState() then
									if isclosetoplayers(v.PrimaryPart.Position, avoidrange) then
										if Closest == nil then
											Closest = v
										else
											if
												(PlayerPosition - v.PrimaryPart.Position).magnitude
												< (Closest.PrimaryPart.Position - PlayerPosition).magnitude
											then
												Closest = v
											end
										end
									end
								else
									if Closest == nil then
										Closest = v
									else
										if
											(PlayerPosition - v.PrimaryPart.Position).magnitude
											< (Closest.PrimaryPart.Position - PlayerPosition).magnitude
										then
											Closest = v
										end
									end
								end
							end
						end
					end
				end
				if Closest then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = addcfv3(
						Closest.PrimaryPart.CFrame,
						Closest.PrimaryPart.CFrame.LookVector * -4
					)
				end
				game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
				animationTrack:Play(1, 0)
			end
		end
		if pickup:GetState() then
			if game.Workspace:FindFirstChild("LootDrop") then
				game.Workspace.LootDrop.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			end
		end
		wait()
	end
else
	game.Players.LocalPlayer:Kick("dubie#6541")
end