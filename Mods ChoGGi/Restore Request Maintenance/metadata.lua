return PlaceObj("ModDef", {
	"dependencies", {
		PlaceObj("ModDependency", {
			"id", "ChoGGi_Library",
			"title", "ChoGGi's Library",
			"version_major", 6,
			"version_minor", 4,
		}),
	},
	"title", "Restore Request Maintenance",
	"version", 20,
	"version_major", 0,
	"version_minor", 9,
	"saved", 1539950400,
	"image", "Preview.png",
	"id", "ChoGGi_RestoreRequestMaintenance",
	"author", "ChoGGi",
	"steam_id", "1411114444",
	"code", {
		"Code/Script.lua"
	},
	"lua_revision", LuaRevision or 244275,
  "description", [[Restores "Request Maintenance" button.

It's set not to show up unless you can request maintenance.]],
})
