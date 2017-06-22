local Currency_Symbol = "£"

-- Font --
surface.CreateFont( "HudFont", {
	font = "Cooper Black", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

surface.CreateFont( "SmallHudFont", {
	font = "Cooper Black", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )


-- Draw HUD --
hook.Add("HUDPaint", "DrawMyHud", function()

	-- Background
	draw.RoundedBox(10,10,ScrH()-110,250,100,Color(10,10,10,200))
	draw.RoundedBox(10,10,ScrH()-110,250,30,Color(245,245,245,200))

	-- Name
	draw.SimpleText("Name:","HudFont",20,ScrH()-95,Color(0,0,0),0,1)
	draw.SimpleText(LocalPlayer():Nick(),"SmallHudFont",92,ScrH()-95,Color(0,0,0),0,1)

	-- Money
	draw.SimpleText("Money:","HudFont",20,ScrH()-70,Color(255,255,255),0,1)
	draw.SimpleText(Currency_Symbol..tostring(LocalPlayer():GetMoney()),"HudFont",100,ScrH()-70,Color(255,255,255),0,1)

	-- Health
	draw.SimpleText("Health:","HudFont",20,ScrH()-50,Color(255,255,255),0,1)
	draw.SimpleText(LocalPlayer():Health(),"HudFont",100,ScrH()-50,Color(255,50,50),0,1)
	
	-- Health
	draw.SimpleText("Gmod Fraternal","HudFont",20,ScrH()-30,Color(255,255,255),0,1)
	--draw.SimpleText(LocalPlayer():Health(),"HudFont",100,ScrH()-30,Color(255,50,50),0,1)

end)

-- Disable Default --
hook.Add( "HUDShouldDraw", "hide hud", function( name )
     if ( name == "CHudHealth" or name == "CHudBattery" ) then
         return false
     end
   
     -- Never return anything default here, it will break other addons using this hook.
end )

