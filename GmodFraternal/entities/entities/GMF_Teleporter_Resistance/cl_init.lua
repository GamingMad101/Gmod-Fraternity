include('shared.lua')

surface.CreateFont( "TheDefaultSettings", {
	font = "Courier New",
	extended = false,
	size = 300,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function ENT:Draw()

	self:DrawModel()

	local pos = self:GetPos()
	local cpos = pos + (self:GetForward() * 0) + (self:GetUp() * 7.5)
	local ang = self:GetAngles()

	ang:RotateAroundAxis(self:GetAngles():Right(),0)
	ang:RotateAroundAxis(self:GetAngles():Forward(),0)
	ang:RotateAroundAxis(self:GetAngles():Up(),90)

	cam.Start3D2D(cpos , ang, 0.005)

	draw.RoundedBox(0,-700,-250,1400,500,Color(255,115,0))

	draw.SimpleText("Press To","TheDefaultSettings",0,-50,Color(0,0,0),1,1)
	draw.SimpleText("Join The Resistance","TheDefaultSettings",0,50,Color(0,0,0),1,1)
	
	cam.End3D2D()

end
