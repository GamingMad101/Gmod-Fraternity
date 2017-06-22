-- OPTIONS -- 

MONEY_STARTAMOUNT = 1000 --Can be changed to your starting amount

local startweapons = {  -- weapons to spawn with
	"weapon_physgun",
	"gmod_camera",
	"weapon_pistol",
}

concommand.Add( "gimmiemoney", function( ply, cmd, args )
	if args[1] != nil then
		ply:AddMoney(args[1])
		print( "You gave yourself £"..args[1] )
	end
end)

-- DO NOT TOUCH ANYHTING BELOW THIS LINE -- 

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

-- Include other scripts --


include( 'sh_player.lua' )
AddCSLuaFile( "sh_player.lua" )
include( 'teleporter.lua')

-- money
--[[
concommand.Add("dropmoney",function(ply, cmd, args)
	if args[1] != nil or 0 then
		pos = ply:GetPos()
		ang = Angle(0,0,0)
		pos = pos + ply:GetForward()*10
		money = args[1]

		local coin = ents.Create("GMF_Money")
		if ( !IsValid( coin ) ) then return end // Check whether we successfully made an entity, if not - bail
		coin:SetPos(pos)
		coin.money = args[1]
		coin:Spawn()
	else
		print(ply:Nick().." has been trying to drop negative money! what an idiot!")

end
end)]]--

function FirstSpawn( ply )
	local cash = ply:GetPData("money") --Get the saved money amount
 
	if cash == nil then --If it doesn't exist supply the player with the starting money amount
		ply:SetPData("money", MONEY_STARTAMOUNT) --Save it
		ply:SetMoney( MONEY_STARTAMOUNT ) --Set it to the networked ints that can be called from the client too
	else
	ply:SetMoney( cash ) --If not, set the networked ints to what we last saved
	end

end
hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )
 
function PrintCash( pl )
	pl:ChatPrint("Your cash is: " .. pl:GetMoney())
end
 
function fPlayerDisconnect( ply )
	print("Player Disconnect: Money saved to SQLLite and TXT")
	ply:SaveMoney()
	--ply:SaveMoneyTXT()
end
 
concommand.Add("cash_get",PrintCash)


-- guns

ply = FindMetaTable("Player")

function Loadout(ply)
	ply:StripWeapons()
	ply:StripWeapon("gmod_tool")
	for k, v in pairs(startweapons) do
		ply:Give(v)
	end 
end


hook.Add( "PlayerLoadout", "loadout", Loadout)

-- Prop Spawner --
