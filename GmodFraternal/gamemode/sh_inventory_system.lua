-- This file is redundant and need fixing
-- re-enable in shared.lua at your own risk

StartInv = {
[1] = {
		["Name"]	= "Washing Machine",
		["Model"]	= "models/props_c17/FurnitureWashingmachine001a.mdl",
		["QTY"]		= 1,
		["Colour"]	= Color(255,255,255),
		["Type"] 	= "Prop",
	},
}
if SERVER then
	function Emptyinv( ply )
		if (ply != nil) and (ply:IsPlayer()) then
			local inv = ply:GetPData("inv") --Get the saved money amount

			if inv == nil then --If it doesn't exist supply the player with the starting money amount
				ply:SetPData("inv", START_INV) --Save it
				ply.inv = START_INV --Set it to the networked ints that can be called from the client too
			else
				ply.inv = inven --If not, set the networked ints to what we last saved
			end
		else
			print("Error 404: Player Not found in sh_inventory_system line 11")
		end
	end

	hook.Add("FirstSpawn","Empty Inv",Emptyinv(ply))
end

function ply:GetInv()
	return ply.Inv
end


-- Add an Item
function ply:Additem(slot, model, QTY, Colour, Type)
	ply.Inv[slot] = {}
	local inv = ply.Inv[slot]
	inv["Model"]	= model
	inv["QTY"] 		= QTY
	inv["Type"] 	= Type
	inv["Colour"]	= Colour

	return "Success"
end

function InvAdditem(slot, model, QTY, Colour, Type)
	ply:Additem(slot, model, QTY, Colour, Type)
end

function ply:PrintInv()
	for k , v in pairs( self:GetInv() ) do
		print(tostring(K)..tostring(V))
	end
	return "Success"
end

function PrintInv(ply)
	ply:PrintInv()
end
concommand.Add("PrintInv",PrintInv(ply))