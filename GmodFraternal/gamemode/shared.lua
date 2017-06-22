GM.Name = "Gmod Fraternal"
GM.Author = "GamingMad101"
GM.Email = "N/A"
GM.Website = "N/A"
DeriveGamemode( "sandbox" )

--include("sh_inventory_system.lua")

function GM:Initialize()
	if SERVER and game.GetMap() == "gmf_mainroom" then 
			local Teleporter_Combine = ents.Create("GMF_Teleporter_Combine")
		if ( !IsValid( Teleporter_Combine ) ) then return end // Check whether we successfully made an entity, if not - bail
		Teleporter_Combine:SetPos(Vector(848,960,-25))
		Teleporter_Combine:SetAngles(Angle(90,0,0))
		Teleporter_Combine:Spawn()

	local Teleporter_Resistance = ents.Create("GMF_Teleporter_Resistance")
		if ( !IsValid( Teleporter_Resistance ) ) then return end // Check whether we successfully made an entity, if not - bail
		Teleporter_Resistance:SetPos(Vector(848,832,-25))
		Teleporter_Resistance:SetAngles(Angle(90,0,0))
		Teleporter_Resistance:Spawn() 

	end
end

