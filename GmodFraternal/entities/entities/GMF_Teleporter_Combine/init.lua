AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

local Targets = {
[1] = Vector(-448,1856,0),
[2] = Vector(-448,1600,0),
[3] = Vector(-448,1344,0),  
}

local Guns = {
[1] = "smg1",
[2]	= "ar2",
[3] = "weapon_shotgun"
}

local PlayerModels = {
[1] = "models/player/police.mdl",
[2] = "models/player/police_fem.mdl",
[3] = "models/player/combine_soldier.mdl",
[4] = "models/player/combine_super_soldier.mdl",
[5] = "models/player/combine_soldier_prisonguard.mdl",
[6] = "models/player/barney.mdl",
}

function ENT:Initialize( ) --This function is run when the entity is created so it's a good place to setup our entity.
 
	self:SetModel( "models/maxofs2d/button_05.mdl" ) -- Sets the model of the NPC.
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetPos(self:GetPos()+Vector(0,0,90))

	local phys = self:GetPhysicsObject()

	if phys:IsValid() then

		phys:Wake()
	
	end
end 

function ENT:AcceptInput( iName, Activator, Caller )
	if iName == "Use" and Caller:IsPlayer() then
	
		-- TP into Arena
	Target = table.Random(Targets)
	
	Caller:SetPos(Target)
	Caller:SetEyeAngles(Angle(0,0,0))

		-- Give weapons
	ammo = table.Random(Guns)
	Caller:StripWeapons()
	if ammo != "weapon_shotgun" then
		Caller:Give("weapon_"..ammo)
		Caller:GiveAmmo(100, ammo ,true)
	end
		-- Playermodels
	pModel = table.Random(PlayerModels)
	Caller:SetModel(pModel)
		if pModel == PlayerModels[6] then
			Caller:Give("weapon_crowbar")
		end

		-- Misc HP Speed etc.
	if ammo == "ar2" then
		Caller:SetMaxHealth(100)
		Caller:SetHealth(100)
	elseif ammo == "smg1" then
		Caller:SetMaxHealth(125)
		Caller:SetHealth(125)
		Caller:Give("weapon_frag")
	elseif ammo == "weapon_shotgun" then
		Caller:SetMaxHealth(130)
		Caller:SetHealth(130)
		Caller:Give("weapon_shotgun")
		Caller:GiveAmmo("Buckshot")
	end
	end
end