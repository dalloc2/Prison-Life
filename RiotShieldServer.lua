local event = script.Parent

event.OnServerEvent:connect(function(plyr,tool)
	local isRiotShield = tool.Name == "Riot Shield"
	if not isRiotShield then return end
	local isEquipped = tool:findFirstChild("isEquipped")
	if not isEquipped then return end
	if isEquipped.Value then
		isEquipped.Value = false
		local fsh = plyr.Character.Torso:findFirstChild("ShieldFolder")
		if fsh then
			fsh:Destroy()
			tool.Handle.Transparency = 0
		end
	else
		isEquipped.Value = true
		local fold = Instance.new("Folder",plyr.Character.Torso)
		tool.Handle.Transparency = 1
		fold.Name = "ShieldFolder"
		local sh = tool.Handle:clone()
		sh.Name = "shield"
		sh.Transparency = 0
		sh.Parent = fold
		local w = Instance.new("Weld")
		w.Part0 = sh
		if plyr.Character:findFirstChild("Left Arm") then
			w.Part1 = plyr.Character:findFirstChild("Left Arm")
		end
		w.C1 = CFrame.new(.2,.2,1)*CFrame.Angles(0,math.rad(90),math.rad(270))
		w.Parent = sh
	end
end)
