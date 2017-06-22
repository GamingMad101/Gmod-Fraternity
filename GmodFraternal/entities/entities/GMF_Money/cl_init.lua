include('shared.lua')

surface.CreateFont( "TheDefaultSettings", {
	font = "Courier New",
	extended = false,
	size = 190,
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
	local cpos = pos + (self:GetForward() * 0) + (self:GetUp() * 1.6)
	local ang = self:GetAngles()

	ang:RotateAroundAxis(self:GetAngles():Right(),0)
	ang:RotateAroundAxis(self:GetAngles():Forward(),0)
	ang:RotateAroundAxis(self:GetAngles():Up(),90)

	cam.Start3D2D(cpos , ang, 0.05)

	draw.RoundedBox(0,-940,-465,1880,930,Color(144,255,255))

	draw.SimpleText("Temporary Text","TheDefaultSettings",0,-50,Color(0,0,0),1,1)
	draw.SimpleText("A Placeholder","TheDefaultSettings",0,50,Color(0,0,0),1,1)

	cam.End3D2D()

end
