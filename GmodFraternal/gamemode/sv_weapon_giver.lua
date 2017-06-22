local startweapons = {
	"weapon_physgun",
	"gmod_camera",
	"weapon_pistol",
}

ply = FindMetaTable("Player")

function ply:GiveLoadout()

	for k, v in pairs(startweapons) do
		self:Give(v)
	end
end