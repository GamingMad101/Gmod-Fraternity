AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

local Target = Vector(50,0,592)

function ENT:Initialize( ) --This function is run when the entity is created so it's a good place to setup our entity.
 
	self:SetModel( "models/maxofs2d/button_05.mdl" ) -- Sets the model of the NPC.
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
	Caller:SetPos(Target)
	end
end