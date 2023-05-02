local Player = game:GetService("Players").LocalPlayer
local workspace = game.Workspace
local whitelist = {}
local Mouse = game.Players.LocalPlayer:GetMouse()
local whitelist_mode = ""
local transparency = 0.5
local size = 8
local updateissue = false
local name = Player.Name
local storage = nil
local close = false
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
local bullet_type 
local range_weapon
local aim_assist = false
local beam, attach0, attach1
local beam_width = 0.5
local page4_height = 0

function gettargetpart(weapon)
	for i,v in pairs(weapon:GetDescendants()) do
		if v.Name == "Target" then return v end
	end
	return nil
end

function has_value(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

function optimal_angle(x, y, v0, g)
    local root = v0 * v0 * v0 * v0 - g * (g * x * x + 2.0 * y * v0 * v0)
    if root < 0 then return end
    local root = math.sqrt(root)
    return math.atan((v0 * v0 - root) / (g * x))
end

function lob_angle(x, y, v0, g)
    local root = v0 * v0 * v0 * v0 - g * (g * x * x + 2.0 * y * v0 * v0)
    if root < 0 then return end
    local root = math.sqrt(root)
    return math.atan((v0 * v0 - root) / (g * x))
end

function travel_time(x, angle, v0)
    return x / (math.cos(angle) * v0)
end

function direction(angle, origin_pos, target_pos)
    local AB = target_pos - origin_pos
    return (AB * Vector3.new(1,0,1) + Vector3.new(0,math.sin(angle)*AB.Magnitude,0)).unit
end

function solve(origin, target, speed, gravity)
	local origin_pos = origin.Position
	local target_pos = target
	local x = ((target_pos - origin_pos) * Vector3.new(1,0,1)).Magnitude
	local y = target_pos.Y - origin_pos.Y
	local solved_angle = optimal_angle(x, y, speed, -gravity)
	if not solved_angle then return nil end
	return direction(solved_angle, origin_pos, target_pos)
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

local function beamProjectile(g, x1, x0, v0, t1)
	-- calculate the bezier points
	local c = 0.5*0.5*0.5
	local p2 = x1 - (g*t1*t1 + v0*t1)/3
	local p1 = (c*g*t1*t1 + 0.5*v0*t1 + x0 - c*(x0+x1))/(3*c) - p2
	
	-- the curve sizes
	local curve0 = (p1 - x0).magnitude;
	local curve1 = (p2 - x1).magnitude;
	
	-- build the world CFrames for the attachments
	local b = (x0 - x1).unit;
	local r1 = (p1 - x0).unit;
	local u1 = r1:Cross(b).unit;
	local r2 = (p2 - x1).unit;
	local u2 = r2:Cross(b).unit;
	b = u1:Cross(r1).unit;
	
	local cf1 = CFrame.new(
		x0.x, x0.y, x0.z,
		r1.x, u1.x, b.x,
		r1.y, u1.y, b.y,
		r1.z, u1.z, b.z
	)
	
	local cf2 = CFrame.new(
		x1.x, x1.y, x1.z,
		r2.x, u2.x, b.x,
		r2.y, u2.y, b.y,
		r2.z, u2.z, b.z
	)
	
	return curve0, -curve1, cf1, cf2;
end

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
				Text = "You have to stand still then click, didnt work? click again lol. \n -london",
			})
		end,
	},
	Callback = function()
		for i = 1, 41 do
			workspace.Remotes.ClassRemotes.MeditateEvent:FireServer()
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
	Text = "Anti debuff OFF/ON",
	Enabled = false,
})

local Page2_Autoloot = Page2.Toggle({
	Text = "Autoloot OFF/ON",
	Menu = {
		Information = function(self)
			UI.Banner({
				Text = "On activate every grave in range will be locked by you causing it to be unable to open for everyone. Once you unequip your weapon the loot will fly in your warehouse MAKE SURE YOUR WAREHOUSE ISNT FULL OR U SLOW AND DIE A HORRIBLE DEAD. \n -kai",
			})
		end,
	},
	Enabled = false,
})

local Page3 = UI.New({
	Title = "Food",
})

local Page3_food_cook_text = Page3.TextField({
	Text = "Food's name (to cook)",
})

local Page3_cooking = Page3.Toggle({
	Text = "Start cooking",
	Enabled = false,
})

local Page3_food_eat_text = Page3.TextField({
	Text = "Food's name (to eat)",
	Menu = {
		Information = function(self)
			UI.Banner({
				Text = "Why this ? Because you can eat while holding weapons thats why. \n -dubie",
			})
		end,
	},
})

Page3.Keybind({
	Text = "Eat food key",
	Key = Enum.KeyCode.B,
	Callback = function()
		workspace.Remotes.InventorySystem.EatEvent:FireServer(Page3_food_eat_text:GetText())
	end,
})

local Page4 = UI.New({
	Title = "Aim Assist"
})

local Page4_mode = Page4.Toggle({
	Text = "Mode: Normal/Direct",
	Enabled = false
})

local Page4_Color = Page4.ColorPicker({
	Text = "Beam color",
	Default = Color3.fromRGB(255, 0, 0),
})

Page4.Slider({
	Text = "Beam width",
	Menu = {
		Information = function(self)
			UI.Banner({
				Text = "Toggle beam again to apply. \n -dubie",
			})
		end,
	},
	Callback = function(value)
		beam_width = value
	end,
	Min = 0.05,
	Max = 1,
	Def = 0.5,
	Float = 0.05,
})

Page4.Keybind({
	Text = "Toggle",
	Key = Enum.KeyCode.J,
	Callback = function()
		if not aim_assist then
			attach0 = Instance.new("Attachment", game.Workspace.Terrain);
			attach0.Name = "okami"
			attach1 = Instance.new("Attachment", game.Workspace.Terrain);
			attach1.Name = "okomoy"

			beam = Instance.new("Beam", game.Workspace.Terrain);
			beam.Attachment0 = attach0;
			beam.Attachment1 = attach1;
			beam.Segments = 1000
			beam.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Page4_Color:GetColor()),
				ColorSequenceKeypoint.new(1, Page4_Color:GetColor())
			})
			beam.LightEmission = 1
			beam.FaceCamera = true
			beam.Width0 = beam_width
			beam.Width1 = beam_width
			beam.Name = "omo"
		else
			game.Workspace.Terrain.okami:Destroy()
			game.Workspace.Terrain.okomoy:Destroy()
			game.Workspace.Terrain.omo:Destroy()
			beam = nil
			attach0 = nil
			attach1 = nil
		end
		aim_assist = not aim_assist
	end,
})

Page4.Dropdown({
	Text = "Weapon",
	Callback = function(value)
		range_weapon = value
	end,
	Options = { "Bajoututu", "Fusetake Yumi", "Hazamatutu", "Hinawaju", "Sanbonhigo Daikyu", "Sanbonhigo Hankyu", "Sanmaiuchi Daikyu", "Sanmaiuchi Hankyu", "Shihodake Daikyu", "Shihodake Hankyu" },
})

Page4.Dropdown({
	Text = "Bullet",
	Callback = function(value)
		bullet_type = value
	end,
	Options = {"5 Monme Round", "7 Monme Round", "Arrows"}
})

Page4.Keybind({
	Text = "Higher (only Direct mode)",
	Key = Enum.KeyCode.F1,
	Callback = function()
		page4_height = page4_height + 0.5
	end
})

Page4.Keybind({
	Text = "Lower (only Direct mode)",
	Key = Enum.KeyCode.F2,
	Callback = function()
		page4_height = page4_height - 0.5
	end
})

Page4.Keybind({
	Text = "Reset Height (only Direct mode)",
	Key = Enum.KeyCode.F3,
	Callback = function()
		page4_height = 0
	end
})



local mt = getrawmetatable(game) --get meta

local oldnamecall = mt.__namecall --store namecall

setreadonly(mt, false) --make mt writeable

mt.__namecall = newcclosure(function(self, ...) --newcclosure yes
	local method = getnamecallmethod() --namecall
	local Args = {...} --args variable
	if not checkcaller() and method == "FireServer" and tostring(self) == "MouseEvent" and Page4_mode:GetState() and Args[4] == nil then
		local weaponname = self.Parent.Name
		local weaponstat = game:GetService("Lighting").GameStats.WeaponStats.FastCastValues[weaponname]
		local weapontarget = gettargetpart(game.Players.LocalPlayer.Character[weaponname.."Body"])
		if weapontarget == nil then return end
		local target = Mouse.Hit.p + Vector3.new(0,page4_height,0)
		local speed = weaponstat:FindFirstChild("Speed") ~= nil and weaponstat.Speed.Value or weaponstat[Args[2]].Speed.Value
		local gravity = weaponstat:FindFirstChild("Gravity") ~= nil and weaponstat.Gravity.Value or weaponstat[Args[2]].Gravity.Value
		Args[1] = solve(weapontarget,target,speed,gravity)
		Args[4] = "a"
		self:FireServer(unpack(Args))
		return
	end
	if not checkcaller() and method == "FireServer" and tostring(self) == "ProcessHitEvent" and Page1_Toggle:GetState() then
		if has_value(whitelist, Args[1].Name) then
			return
		end
		Args[3] = Args[1].Head
		return oldnamecall(self, unpack(Args))
	end
	if not checkcaller() and method == "FireServer" and tostring(self) == "DrownEvent" then
		return
	end
	return oldnamecall(self, ...) --return old
end)

setreadonly(mt, true)

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
		if not workspace:FindFirstChild(Player.Name) then wait() continue end
		if Page2_Autoloot:GetState() and workspace:FindFirstChild(Player.Name).Humanoid.Health ~= 0 then
			for i, v in pairs(game:GetService("Workspace").LootDrops:GetChildren()) do
				if v.PrimaryPart and v:FindFirstChild("InUse") then
					local a = Player:DistanceFromCharacter(v.PrimaryPart.Position)
					if v.InUse.Value == "" and a < 35 and a ~= 0 and not v:FindFirstChild("deez") then
						workspace.Remotes.Storage.InteractWithGraveFunction:InvokeServer({ v, true })
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
									local isequip = "nope"
									if k:FindFirstChild("Durability") or k:FindFirstChild("Quality") then
										isequip = "yes"
									end
									local A_1 = {
										[1] = v,
										[2] = k,
										[3] = k.Value,
									}
									workspace.Remotes.Storage.TakeLootEvent:FireServer(A_1)
									if isequip == "yes" then
										table.insert(inamelist, k)
									else
										table.insert(inamelist, k.Name)
									end
									table.insert(ivaluelist, k.Value)
									table.insert(ise, isequip)
									wait()
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
											[6] = "Universal"
										}
										workspace.Remotes.Storage.MoveUnitsFunction:InvokeServer(A_1)
									else
										local A_1 = {
											[1] = "Warehouse",
											[2] = game:GetService("ReplicatedStorage").PlayerData[name].Inventory.Items,
											[3] = storage,
											[4] = inamelist[i],
											[5] = ivaluelist[i],
											[6] = "Universal"
										}
										workspace.Remotes.Storage.MoveUnitsFunction:InvokeServer(A_1)
									end
									wait()
								end
								workspace.Remotes.Storage.InteractWithGraveFunction:InvokeServer({ v, false })
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
		if Page3_cooking:GetState() then
			if
				game
					:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name].Inventory.Items
					:FindFirstChild(Page3_food_cook_text:GetText())
			then
				game:GetService("Workspace").Remotes.Cooking.CookItemEvent:FireServer(Page3_food_cook_text:GetText())
			end
		end
		wait()
	end
end)()

coroutine.wrap(function()
	while true do
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
end)()

game:GetService("RunService").RenderStepped:Connect(function(dt)
	if aim_assist and range_weapon and beam and attach0 and attach1 and game.Players.LocalPlayer.Character:FindFirstChild(range_weapon.."Body") and bullet_type and Page4_mode:GetState() == false then
		local t1 = 2
		local weaponstat = game:GetService("Lighting").GameStats.WeaponStats.FastCastValues[range_weapon]
		local speed = weaponstat:FindFirstChild("Speed") ~= nil and weaponstat.Speed.Value or weaponstat[bullet_type].Speed.Value
		local gravity = weaponstat:FindFirstChild("Gravity") ~= nil and weaponstat.Gravity.Value or weaponstat[bullet_type].Gravity.Value
		local g = Vector3.new(0,gravity,0)
		local x0 = gettargetpart(game.Players.LocalPlayer.Character[range_weapon.."Body"]).Position
		local v0 = (Mouse.Hit.p - x0).unit * speed
		local x1 = (1/2)*g*t1*t1 + v0*t1 + x0
		
		local curve0, curve1, cf1, cf2 = beamProjectile(g, x1, x0, v0, t1);
		beam.CurveSize0 = curve0;
		beam.CurveSize1 = curve1;
		-- convert world space CFrames to be relative to the attachment parent
		attach0.CFrame = attach0.Parent.CFrame:inverse() * cf1;
		attach1.CFrame = attach1.Parent.CFrame:inverse() * cf2;
	end
	if aim_assist and range_weapon and beam and attach0 and attach1 and game.Players.LocalPlayer.Character:FindFirstChild(range_weapon.."Body") and bullet_type and Page4_mode:GetState() == true then
		local x1 = Mouse.Hit.p + Vector3.new(0,page4_height,0)
		local weaponstat = game:GetService("Lighting").GameStats.WeaponStats.FastCastValues[range_weapon]
		local speed = weaponstat:FindFirstChild("Speed") ~= nil and weaponstat.Speed.Value or weaponstat[bullet_type].Speed.Value
		local gravity = weaponstat:FindFirstChild("Gravity") ~= nil and weaponstat.Gravity.Value or weaponstat[bullet_type].Gravity.Value
		local g = Vector3.new(0,gravity,0)
		local x0 = gettargetpart(game.Players.LocalPlayer.Character[range_weapon.."Body"]).Position
		local x = ((x1 - x0) * Vector3.new(1,0,1)).Magnitude
        local y = x1.Y - x0.Y
        local solved_angle = optimal_angle(x, y, speed, -gravity)
		if solved_angle then
			local solved_travel_time = travel_time(x, solved_angle, speed)
			local v0 = direction(solved_angle, x0, x1) * speed
			local t1 = travel_time(x, solved_angle, speed)
			
			local curve0, curve1, cf1, cf2 = beamProjectile(g, x1, x0, v0, t1);
			beam.CurveSize0 = curve0;
			beam.CurveSize1 = curve1;
			-- convert world space CFrames to be relative to the attachment parent
			attach0.CFrame = attach0.Parent.CFrame:inverse() * cf1;
			attach1.CFrame = attach1.Parent.CFrame:inverse() * cf2;
		end
	end
end)