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
}

local PlayerModels = {
[1] = "models/player/Group03/male_01.mdl",
[2] = "models/player/Group03/male_02.mdl",
[3] = "models/player/Group03/male_03.mdl",
[4] = "models/player/Group03/male_04.mdl",
[5] = "models/player/Group03/male_05.mdl",
[6] = "models/player/Group03/male_06.mdl",
[7] = "models/player/Group03/male_07.mdl",
[8] = "models/player/Group03/male_08.mdl",
[9] = "models/player/Group03/male_09.mdl",
[10] = "models/player/Group03m/male_06.mdl",
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
	Caller:Give("weapon_"..ammo)
	Caller:GiveAmmo(100, ammo ,true)

		-- Playermodels
	pModel = table.Random(PlayerModels)
	Caller:SetModel(pModel)
		if rand3 == 10 then
			Caller:Give("weapon_medkit")
		end

		-- Misc HP Speed etc.
	if ammo == "ar2" then
		Caller:SetMaxHealth(200)
		Caller:SetHealth(200)
	elseif ammo == "smg1" then
		Caller:SetMaxHealth(250)
		Caller:SetHealth(250)
	end
	end
end