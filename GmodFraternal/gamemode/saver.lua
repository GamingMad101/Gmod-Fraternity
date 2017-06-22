include("sh_player.lua")

local players = players.GetAll()

for k ,v in pairs(players) do
	local money = v:GetMoney()
	local steamID = v:SteamID()
	file.Write("Player_"..steamID..".txt", money)
end