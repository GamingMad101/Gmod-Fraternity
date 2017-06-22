AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

function ENT:Initialize( ) --This function is run when the entity is created so it's a good place to setup our entity.
 

	local Money = nil
	local Money = self.money
	local MModel = nil
	local ModelNum = nil

	if Money == nil or 0 then
		self:Remove()
	elseif Money <= 10000 then
		MModel = "models/props/cs_assault/money.mdl" 
		ModelNum = 1
	else 
		MModel = "models/props/cs_assault/moneypallete.mdl"
		ModelNum = 2
	end
	if MModel !=nil then
		self:SetModel( MModel ) -- Sets the model of the NPC.
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetPos(self:GetPos()+Vector(0,0,90))
	end

	local phys = self:GetPhysicsObject()

	if phys:IsValid() then

		phys:Wake()
	
	end
end

function ENT:AcceptInput( iName, Activator, Caller )	
	if iName == "Use" and Caller:IsPlayer() then
	-- if player presses e do this
	end
end