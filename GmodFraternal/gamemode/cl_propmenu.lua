function GM:PopulatePropMenu()
	local ourtable = {
	"models/props_interiors/Furniture_Couch01a.mdl",
	"models/props_interiors/Furniture_Couch02a.mdl",
	"models/props_interiors/Furniture_Desk01a.mdl",
	"models/props_interiors/Furniture_Lamp01a.mdl",
	"models/props_interiors/Furniture_shelf01a.mdl",
	"models/props_interiors/Furniture_Vanity01a.mdl",
	"models/props_interiors/BathTub01a.mdl",
	"models/props_interiors/Furniture_chair01a.mdl",
	"models/props_interiors/Furniture_chair03a.mdl",
	"models/props_c17/FurnitureWashingmachine001a.mdl",
	"models/props_c17/FurnitureToilet001a.mdl",
	"models/props_c17/FurnitureSink001a.mdl",
	"",
	"",
	}
	
	for number, model in pairs(ourtable) do
		ourtable[number] = {}
		ourtable[number].type = "model"
		ourtable[number].model = model
	end
	
	spawnmenu.AddPropCategory( "gmodfraternal", "GMod Fraternal", ourtable, "icon16/page.png")
	
	hook.Remove("SpawnlistContentChanged", "ShowSaveButton") -- Prevents the save button from showing. Works together with the hook.Remove below to prevent users from fucking themselves up. (either one is enough alone, but I like to keep safe)
end


--[[------------------------------------------------------
	!!!SUPER IMPORTANT!!!
	Disable saving of spawn list so that the user doesn't
	accidentally overwrite his normal Sandbox spawnlist
	and gets himself fucked.
---------------------------------------------------------]]
hook.Remove("OnSaveSpawnlist", "DoSaveSpawnlist")