--made by okami
local list = loadstring(game:HttpGet("https://pastebin.com/raw/xBQrbkcV"))()
-- funct
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
local nameplr = game.Players:GetNameFromUserIdAsync(game.Players.LocalPlayer.UserId)
if has_value(list, game.Players.LocalPlayer.UserId) and "https://api.roblox.com/v1.1/avatar-fetch/?placeId="..game.PlaceId.."&userId="..game.Players.LocalPlayer.UserId == game.Players.LocalPlayer.CharacterAppearance and nameplr == game.Players.LocalPlayer.Name and game:GetService("ReplicatedStorage").PlayerData:FindFirstChild(nameplr) then
	-- var
	local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local UIS = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local whitelist = {}
	local Mouse = game.Players.LocalPlayer:GetMouse()
	local whitelist_mode = ""
	local transparency = 0.5
	local size = 6
	local netType = nil
	local range = 6
	local connection = {}
	local onstop = nil
	local count = 0
	local mode = 2
	local swinging = true
	local animationTrack, animationTrack2
	--funct
	function antidebuff()
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Honor Bound"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Honor Bound"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Crippled"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Crippled"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Burning"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Burning"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Stunned"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Stunned"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Pressured"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Pressured"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Off Guard"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Off Guard"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Poisoned"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Poisoned"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Cursed"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Cursed"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
		if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Bleeding"].Value ~= 0 then
			local A_1 = 
			{
				[1] = "Tick Buff", 
				[2] = 
			{
				[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].CombatValues.Buffs["Bleeding"], 
				[2] = 100
			}
			}
			game:GetService("Workspace").Remotes.InventorySystem.ManageInventoryValues:FireServer(A_1)
		end
	end

	function getplr()
		local Target = Mouse.Target
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

	--gui
	local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/boop71/some-useless-code/main/kinlei-ui-keybinds.lua"))()
	local UI = Material.Load({
		Title = "Land of the Rising Sun quality of life DLC -dubie",
		Style = 1,
		SizeX = 400,
		SizeY = 400,
		Theme = "Dark"
   	})
   
   	local Page1 = UI.New({
	   Title = "HBE"
   	})

   	local Page1_Toggle = Page1.Toggle({
		Text = "On / Off",
		Callback = function(value)
			if value == false then
				for i,v in pairs(game.Players:GetChildren()) do
					if v.Character and v.Name ~= game.Players.LocalPlayer.Name then
						local part = v.Character.PrimaryPart
						part.Size = Vector3.new(2,2,1)
						part.Transparency = 1
						part.Color = Color3.fromRGB(163, 162, 165)
						part.CanCollide = true
					end
				end
			end
		end,
		Enabled = false
	})

	Page1.Slider({
		Text = "Hitbox size",
		Callback = function(value)
			size = value
		end,
		Min = 8,
		Max = 13,
		Def = 8,
		Float = 0.25
	})

	Page1.Slider({
		Text = "Hitbox transparency",
		Callback = function(value)
			transparency = value
		end,
		Min = 0,
		Max = 1,
		Float = 0.05,
		Def = 0.5
	})

	local Page1_Color = Page1.ColorPicker({
		Text = "Hitbox color",
		Default = Color3.fromRGB(0, 255, 0),
	})

	Page1.Dropdown({
		Text = "Whitelist option",
		Callback = function(value)
			whitelist_mode = value
		end,
		Options = {"Person","Family","Faction"}
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
					game.StarterGui:SetCore("SendNotification", {
					Title = "Added"; -- the title (ofc)
					Text = name; -- what the text says (ofc)
					Duration = 5; -- how long the notification should in secounds
					})
				end
			elseif whitelist_mode == "Family" then
				local name = getplr()
				if name and #game:GetService("ReplicatedStorage").PlayerData[name].Family.Value > 3 then
					for i,v in pairs (game.Players:GetChildren()) do
						if game:GetService("ReplicatedStorage").PlayerData[v.Name].Family.Value == game:GetService("ReplicatedStorage").PlayerData[name].Family.Value then
							if not has_value(whitelist, v.Name) then
								table.insert(whitelist, v.Name)
							end
						end
					end
					game.StarterGui:SetCore("SendNotification", {
					Title = "Added"; -- the title (ofc)
					Text = game:GetService("ReplicatedStorage").Families[game:GetService("ReplicatedStorage").PlayerData[name].Family.Value].FamilyName.Value; -- what the text says (ofc)
					Duration = 5; -- how long the notification should in secounds
					})
				end
			elseif whitelist_mode == "Faction" then
				local name = getplr()
				if name and #game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value > 3 then
					for i,v in pairs (game.Players:GetChildren()) do
						if game:GetService("ReplicatedStorage").PlayerData[v.Name].Faction.Value == game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value then
							if not has_value(whitelist, v.Name) then
								table.insert(whitelist, v.Name)
							end
						end
					end
					game.StarterGui:SetCore("SendNotification", {
					Title = "Added"; -- the title (ofc)
					Text = game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value; -- what the text says (ofc)
					Duration = 5; -- how long the notification should in secounds
					})
				end
			end
		end
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
					game.StarterGui:SetCore("SendNotification", {
					Title = "Removed"; -- the title (ofc)
					Text = name; -- what the text says (ofc)
					Duration = 5; -- how long the notification should in secounds
					})
				end
			elseif whitelist_mode == "Family" then
				local name = getplr()
				if name and #game:GetService("ReplicatedStorage").PlayerData[name].Family.Value > 3 then
					for i,v in pairs (game.Players:GetChildren()) do
						if game:GetService("ReplicatedStorage").PlayerData[v.Name].Family.Value == game:GetService("ReplicatedStorage").PlayerData[name].Family.Value then
							if has_value(whitelist, v.Name) then
								table.remove(whitelist, table.find(whitelist, v.Name))
							end
						end
					end
					game.StarterGui:SetCore("SendNotification", {
					Title = "Removed"; -- the title (ofc)
					Text = game:GetService("ReplicatedStorage").Families[game:GetService("ReplicatedStorage").PlayerData[name].Family.Value].FamilyName.Value; -- what the text says (ofc)
					Duration = 5; -- how long the notification should in secounds
					})
				end
			elseif whitelist_mode == "Faction" then
				local name = getplr()
				if name and #game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value > 3 then
					for i,v in pairs (game.Players:GetChildren()) do
						if game:GetService("ReplicatedStorage").PlayerData[v.Name].Faction.Value == game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value then
							if has_value(whitelist, v.Name) then
								table.remove(whitelist, table.find(whitelist, v.Name))
							end
						end
					end
					game.StarterGui:SetCore("SendNotification", {
					Title = "Removed"; -- the title (ofc)
					Text = game:GetService("ReplicatedStorage").PlayerData[name].Faction.Value; -- what the text says (ofc)
					Duration = 5; -- how long the notification should in secounds
					})
				end
			end
		end
	})

	Page1.Button({
		Text = "Clear whitelist",
		Callback = function()
			whitelist = {} 
		end
	})

	local Page2 = UI.New({
		Title = "Combat"
	})

	Page2.Button({
		Text = "Fill class juice",
		Menu = {
			Information = function(self)
				UI.Banner({
					Text = "You have to stand still then click, didnt work? click again lol."            
				})
			end
		},
		Callback = function()
			for i=1, 41 do
				game:GetService("Workspace").Remotes.Classes.MeditateEvent:FireServer()
			end   
		end
	})

	local Page2_AntiDebuff = Page2.Toggle({
		Text = "Anti debuff ON/OFF",
		Enabled = false
	})

	local Page3 = UI.New({
		Title = "Utility"
	})

	Page3.Button({
		Text = "Instant cap",
		Callback = function()
			for i,v in pairs(game:GetService("Workspace").InteractiveBuildings:GetChildren()) do
				if v:FindFirstChild("TerritoryInfo") then
					game:GetService("Workspace").Remotes.InventorySystem.CaptureTerritoryEvent:FireServer(v)  
				end   
			end    
		end
	})

	-- add cap lock with game scan to put datatable or chipset (ill miss u)

	local Page3_item_text = Page3.TextField({
		Text = "Item's name for repair (item must be in inventory)."
	})

	Page3.Button({
		Text = "Repair",
		Callback = function()
			local item = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(Page3_item_text:GetText())
			if item then
				if item:FindFirstChild("PermanentDamage") then
					local A_1 = 
					{
						[1] = item.PermanentDamage,
						[2] = 100
					}
					game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
					game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
				end
				if item:FindFirstChild("Durability") then
					local A_1 = 
					{
						[1] = item.Durability,
						[2] = 100
					}
					game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
					game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
				end
			else
				UI.Banner({
					Text = "Couldn't find item."
				})
			end  
		end
	})

	Page3.Button({
		Text = "TPbypass",
		Callback = function()
			if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Zone:FindFirstChild("PlayerLocation") then
				local A_1 = 
				{
					[1] = game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Zone.PlayerLocation,
					[2] = 100
				}
				game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
				game:GetService("Workspace").Remotes.Tools.TickDurabilityEvent:FireServer(A_1)
			else
				UI.Banner({
					Text = "Already bypassed"
				})
			end
		end
	})

	Page3.Keybind({
		Text = "Open gate",
		Key = Enum.KeyCode.P,
		Callback = function() 
			for i,v in pairs(game:GetService("Workspace").Gates:GetChildren()) do
				local A_1 = 
				{
					[1] = v, 
					[2] = true
				}
				game:GetService("Workspace").Remotes.Doors.ToggleGateEvent:FireServer(A_1)
			end
		end
	})

	Page3.Button({
		Text = "Invis",
		Callback = function()
			if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Zone:FindFirstChild("PlayerLocation") then
				UI.Banner({
					Text = "Must bypass TP first"
				})
			else
				local Character = Player.Character
				local Clone = Character.LowerTorso.Root:Clone()
				Character.LowerTorso.Root:Destroy()
				Clone.Parent = Character.LowerTorso
			end
		end
	})

	local Page4 = UI.New({
		Title = "Food"
	})

	Page4.Dropdown({
		Text = "Choose net",
		Callback = function(value)
			netType = value
		end,
		Options = {"Master Net","Journeyman Net","Apprentice Net","Crude Net"}
	})

	local Page4_Net = Page4.Toggle({
		Text = "Start netting",
		Enabled = false
	})

	local Page4_bait_text = Page4.TextField({
		Text = "Bait's name"
	})

	local Page4_fishing = Page4.Toggle({
		Text = "Start fishing",
		Enabled = false
	})

	local Page4_food_cook_text = Page4.TextField({
		Text = "Food's name (to cook)"
	})

	local Page4_cooking = Page4.Toggle({
		Text = "Start cooking",
		Enabled = false
	})

	local Page4_food_eat_text = Page4.TextField({
		Text = "Food's name (to eat)"
	})

	Page4.Keybind({
		Text = "Eat food key",
		Key = Enum.KeyCode.N,
		Callback = function() 
			game:GetService("Workspace").Remotes.InventorySystem.EatEvent:FireServer(Page4_food_eat_text:GetText())
		end
	})

	local Page5 = UI.New({
		Title = "Bots"
	})

	local botfarm = Page5.Toggle({
		Text = "On / Off (hbe for bot)",
		Enabled = false
	})

	local Page5_delay_text = Page5.TextField({
		Text = "Delay after click",
		Type = "Number"
	})

	local pickup = Page5.Toggle({
		Text = "Auto Pickup Loot",
		Enabled = false
	})

	local autofarm = Page5.Toggle({
		Text = "Autofarm", 
		Callback = function(value)
			if value then
				local humanoid = Player.Character:FindFirstChild("Humanoid")
				animationTrack = humanoid:LoadAnimation(game:GetService("ReplicatedStorage").ReplicatedAnimations.Katana.BlockAnim)
				animationTrack2 = humanoid:LoadAnimation(game:GetService("ReplicatedStorage").ReplicatedAnimations.Kama.CenterAttackAnim)
			end
		end,
		Enabled = false
	})

	local Page5_faction = Page5.TextField({
		Text = "Faction's Name"
	})

	local Page6 = UI.New({
		Title = "OldHBE"
	})

	local Page6_killaura = Page6.Toggle({
		Text = "On/Off",
		Enabled = false
	})

	Page6.Slider({
		Text = "Range",
		Callback = function(value)
			range = value
		end,
		Min = 0,
		Max = 12,
		Float = 0.5,
		Def = 6
	})

	local Page6_Show_Range = Page6.Toggle({
		Text = "Show Range",
		Callback = function(value)
			if value then
				pcall(function()
					if not workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart:FindFirstChild("Range") then
						local Part = Instance.new("Part",workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart)
						Part.Shape = "Ball"
						Part.Name = "Range"
						Part.CanCollide = false
						Part.Anchored = false
						Part.CFrame = Part.Parent.CFrame
						Part.Color = Color3.fromRGB(200,100,100)
						Part.Transparency = .75
						Part.TopSurface = "Smooth"
						Part.BottomSurface = "Smooth"
						Part.Size = Vector3.new(1,1,1)
						
						local Mesh = Instance.new("SpecialMesh",Part)
						Mesh.MeshType = "Sphere"
						Mesh.Name = "Range_Mesh"
						
						local Weld = Instance.new("Weld",Part.Parent)
						Weld.Name = "range"
						Weld.Part1 = Part
						Weld.Part0 = Part.Parent
					end
				end)
			else
				pcall(function()
					workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart:FindFirstChild("Range"):Destroy()
					workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart:FindFirstChild("range"):Destroy()
				end)
			end
		end,
		Enabled = false
	})

	local Page6_Show_Whitelist = Page6.Toggle({
		Text = "Show Whitelist",
		Callback = function(value)
			if not value then
				for i,v in pairs (game.Players:GetChildren()) do
					pcall(function()
						workspace:FindFirstChild(v.Name).Head:FindFirstChild("Range"):Destroy()
						workspace:FindFirstChild(v.Name).Head:FindFirstChild("range"):Destroy()
					end)
				end
			end
		end,
		Enabled = false
	})

	Page6.Toggle({
		Text = "mode (Late/Early)",
		Callback = function(value)
			if value then mode = 1 else mode = 2 end
		end,
		Enabled = false
	})

	-- event

	-- loop	
	UIS.InputBegan:Connect(function(input, gameProcessedEvent)
		if (input.UserInputType == Enum.UserInputType.MouseButton1) then
			if botfarm:GetState() then
				if Page5_delay_text:GetText() then
					wait(Page5_delay_text:GetText())
					for i,v in pairs(game.Workspace.Mobs:GetChildren()) do
						if v.PrimaryPart and Player.Character and Player.Character.PrimaryPart then
							if Player:DistanceFromCharacter(v.PrimaryPart.Position) < 30 then
								game:GetService("Workspace").Remotes.Global.ProcessHitEvent:FireServer(v)
							end
						end
					end
				end
			end
			if Page6_killaura:GetState() then
				local tracks = game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()
				for _,v in pairs(tracks) do
					if string.match(v.Name,"Attack") and connection[v.Name] == nil then
						connection[v.Name] = v:GetMarkerReachedSignal("AttackManager"):Connect(function()
							count = count + 1
							if count == mode then
								count = 0
								connection[v.Name]:Disconnect()
								connection[v.Name] = "."
								for _,j in pairs(game.Players:GetPlayers()) do
									if j.Name ~= Player.Name then
										if not has_value(whitelist, j.Name) then
											if j.Character and j.Character.PrimaryPart and Player.Character and Player.Character.PrimaryPart then
												if Player:DistanceFromCharacter(j.Character.PrimaryPart.Position) < range then
													game:GetService("Workspace").Remotes.Global.ProcessHitEvent:FireServer(j.Character)
												end
											end
										end
									end
								end
							end
						end)
						onstop = v.Stopped:Connect(function()
							connection = {}
							onstop:Disconnect()
							onstop = nil
							count = 0
						end)
					end
				end
			end
		end
	end)

	coroutine.wrap(function()
		while true do 
			if autofarm:GetState() then
				animationTrack2:Play(1)
				wait(0.5)
				for i,v in pairs(game.Workspace.Mobs:GetChildren()) do
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

	while true do
		if game.Players.LocalPlayer.Character then
			if game.Players.LocalPlayer.Character.Name ~= nameplr then
				game.Players.LocalPlayer:Kick("dubie#6541")
			end
			if Page6_killaura:GetState() then
				for i,v in pairs(Player.Character:GetDescendants()) do
					if v.Name == "HitPoint" or v.Name == "Shaft" and v.ClassName == "Attachment" then
						v.Position = Vector3.new(999,999,999)
					end
				end
			end
			if autofarm:GetState() then
				local PlayerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				local Closest = nil
				for i,v in pairs(workspace.Mobs:GetChildren()) do
					if v:FindFirstChild("Info") and v.PrimaryPart then
						if v.Info:FindFirstChild("Faction") then
							if v.Info.Faction.Value == Page5_faction:GetText() then 
								if Closest == nil then
									Closest = v
								else
									if (PlayerPosition - v.PrimaryPart.Position).magnitude < (Closest.PrimaryPart.Position - PlayerPosition).magnitude then
										Closest = v
									end
								end
							end	
						end
					end
				end
				if Closest then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Closest.PrimaryPart.CFrame + Vector3.new(0,1,1)
				end
				game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
				animationTrack:Play()
			end
		end
		if not workspace:FindFirstChild(game.Players.LocalPlayer.Name) then
			connection = {}
			onstop = nil
			count = 0
		end
		if Page6_Show_Whitelist:GetState() then
			for i,v in pairs (game.Players:GetChildren()) do
                pcall(function()
                    if has_value(whitelist, v.Name) then
                        if not workspace:FindFirstChild(v.Name).Head:FindFirstChild("Range") then
                            local Part = Instance.new("Part",workspace:FindFirstChild(v.Name).Head)
                            Part.Shape = "Ball"
                            Part.Name = "Range"
                            Part.CanCollide = false
                            Part.Anchored = false
                            Part.CFrame = Part.Parent.CFrame
                            Part.Color = Color3.fromRGB(100,200,100)
                            Part.Transparency = .75
                            Part.Material = Enum.Material.Neon
                            Part.TopSurface = "Smooth"
                            Part.BottomSurface = "Smooth"
                            Part.Size = Vector3.new(2.5,2.5,2.5)
                            
                            local Mesh = Instance.new("SpecialMesh",Part)
                            Mesh.MeshType = "Sphere"
                            Mesh.Name = "Range_Mesh"

                            local Weld = Instance.new("Weld",Part.Parent)
                            Weld.Name = "range"
                            Weld.Part1 = Part
                            Weld.Part0 = Part.Parent
                        end
                    else
						pcall(function()
							workspace:FindFirstChild(v.Name).Head:FindFirstChild("Range"):Destroy()
							workspace:FindFirstChild(v.Name).Head:FindFirstChild("range"):Destroy()
						end)
                    end
                end)
            end
		end
		if Page6_Show_Range:GetState() then
			pcall(function()
				workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Range.Range_Mesh.Scale = Vector3.new(range*2,range*2,range*2)
			end)
		end
		if Page4_cooking:GetState() then
			if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(Page4_food_cook_text:GetText()) then
				game:GetService("Workspace").Remotes.Cooking.CookItemEvent:FireServer(Page4_food_cook_text:GetText())
			end
		end
		if Page4_Net:GetState() then
			if netType ~= nil then
				game:GetService("Workspace").Remotes.Tools.NetGatherEvent:FireServer(game:GetService("Lighting").GameStats.Items[netType])
			end
		end
		if Page4_fishing:GetState() then
			if game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(Page4_bait_text:GetText()) and game:GetService("Lighting").GameStats.Items.FishStats.Salt:FindFirstChild(Page4_bait_text:GetText()) then
				game:GetService("Workspace").Remotes.Tools.UpdateFishingInfoFunction:InvokeServer(Page4_bait_text:GetText())
				game:GetService("Workspace").Remotes.Tools.CatchFishFunction:InvokeServer(game:GetService("Lighting").GameStats.Items.FishStats.Salt:FindFirstChild(Page4_bait_text:GetText()))
			end
		end
		if pickup:GetState() then
			if game.Workspace:FindFirstChild("LootDrop") then
				game.Workspace.LootDrop.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			end
		end
		if Page2_AntiDebuff:GetState() then
			antidebuff()
		end
		if Page1_Toggle:GetState() then
			for i,v in pairs(game.Players:GetChildren()) do
				if v.Character and v.Character.PrimaryPart and v.Character:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Name then
					if not has_value(whitelist,v.Name) then
						local part = v.Character.PrimaryPart
						part.Size = Vector3.new(size,size,size)
						part.Transparency = transparency
						part.Color = Page1_Color:GetColor()
						part.CanCollide = false
						part.TopSurface = "Smooth"
                        part.BottomSurface = "Smooth"
						v.Character.Humanoid.BreakJointsOnDeath = false
					else
						local part = v.Character.PrimaryPart
						part.Size = Vector3.new(2,2,1)
						part.Transparency = 1
						part.CanCollide = true
					end
				end
			end
		end
	wait()
	end
else
	game.Players.LocalPlayer:Kick("dubie#6541")
end