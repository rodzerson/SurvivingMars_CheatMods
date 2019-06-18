DefineClass("ModOptions_ChoGGi_PassengerRocketTweaks", {
	__parents = {
		"ModOptionsObject",
	},
	properties = {
		{
			default = false,
			editor = "bool",
			id = "HideRocket",
			name = T(302535920011127, "Hide Background"),
		},
		{
			default = false,
			editor = "bool",
			id = "MoreSpecInfo",
			name = T(302535920011128, "More Spec Info"),
		},
		{
			default = false,
			editor = "bool",
			id = "PosPassList",
			name = T(302535920011129, "Position Pass List"),
		},
		{
			default = 700,
			editor = "number",
			id = "PosX",
			max = 1000,
			min = 1,
			name = T(302535920011130, "X Margin"),
		},
		{
			default = 500,
			editor = "number",
			id = "PosY",
			max = 1000,
			min = 1,
			name = T(302535920011131, "Y Margin"),
		},
	},
})