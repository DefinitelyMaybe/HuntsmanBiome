-------------------------------------------------------------------------------
-- Class HuntsmansGrounds
if HuntsmansGrounds == nil then
	HuntsmansGrounds = EternusEngine.BiomeClass.Subclass("HuntsmansGrounds")
end

-------------------------------------------------------------------------------
function HuntsmansGrounds:BuildTree()
	--Top level materials
	local theMaterialBlend = self:SwitchMaterial(self:Material("Mountain Green Grass"), self:Material("Green Hills"), self:Simplex((1.0 / 64.0) / 1.0, 2))

	--The small terrain wobbles
	local theWobbles = self:Multiply(self:Simplex(((1.0 / 32.0) / 1.0), 2), self:Constant(1))

	--Sparse hills
	local hills1 = self:Multiply(self:Simplex((1.0 / 128.0) / 3.0, 4), self:Constant(30))

	--blend the hills into the wobbles
	local theWorldBlend = self:Max(theWobbles, hills1)

	return theWorldBlend, theMaterialBlend
end

HuntsmansGrounds.Lighting =
{
	AmbientColor = vec3.new(1.0, 0.0, 0.0),
	Intensity = 1.0,
	DayColor = vec3.new(1.0, 0.0, 0.0),
	NightColor = vec3.new(1.0, 0.0, 0.0)
}

HuntsmansGrounds.Objects =
{
	--Characters 
	["MamaGoat Spawn Node"] =
	{
		density = 1,
		chance = 0.025,
		minScale = 1.0,
		maxScale = 1.0
	},
	--Plants
	["Lotus Teeth"] =
	{
		density = 1,
		chance = 0.25,
		minScale = 0.5,
		maxScale = 1.5
	},
	["Lilly Pad Nut"] =
	{
		density = 1,
		chance = 0.025,
		minScale = 0.5,
		maxScale = 1.0
	},
	["Green Vine"] =
	{
		density = 2,
		chance = 0.05,
		minScale = 1.0,
		maxScale = 1.5
	},
	["Gourd Vine"] =
	{
		density = 1,
		chance = 0.05,
		minScale = 0.5,
		maxScale = 1.0
	},
	["Bush Hosta A"] =
	{
		density = 3,
		chance = 0.15,
		minScale = 1.0,
		maxScale = 1.5
	},

	--Trees 
	["Maple Tree"] =
	{
		density = 4,
		chance = 0.4,
		minScale = 1.0,
		maxScale = 2.5
	},
	["Winter Maple Tree"] =
	{
		density = 1,
		chance = 0.05,
		minScale = 1.0,
		maxScale = 2.5
	},
	["Watouwr Tree"] =
	{
		density = 1,
		chance = 0.0012,
		minScale = 2.0,
		maxScale = 4.0
	},
	["Hardwood Sapling"] =
	{
		density = 1,
		chance = 0.03,
		minScale = 0.7,
		maxScale = 2.0
	},
	["Lightwood Sapling"] =
	{
		density = 1,
		chance = 0.03,
		minScale = 0.7,
		maxScale = 2.0
	}
}

HuntsmansGrounds.Clusters =
{
	--Needs Rocks
	["Camping Grounds"] =
	{
	 	density = 1,
	 	chance = 0.0025,
		Objects =
		{
			{
				name = "Fire Pit",
				minScale = 2.0,
				maxScale = 3.0,
				offset = vec3.new(0.0, 0.0, 0.0)
			},
			{
				name = "Leaf Backpack",
				minScale = 1.0,
				maxScale = 1.0,
				offset = vec3.new(-3.0, 0.0, 1.0)
			}
		}
	},
}

-------------------------------------------------------------------------------
-- Register the HuntsmansGrounds Generator with the engine.
Eternus.ScriptManager:NKRegisterGeneratorClass(HuntsmansGrounds)