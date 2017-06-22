AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

function ENT:Initialize( ) --This function is run when the entity is created so it's a good place to setup our entity.
 
	self:SetModel( "models/hunter/plates/plate1x2.mdl" ) -- Sets the model of the NPC.
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
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
	print(Caller:GetMaxSpeed())
	end
end