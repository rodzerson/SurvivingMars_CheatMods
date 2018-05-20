You should buy a copy: http://store.steampowered.com/app/464920

### No warranty implied or otherwise!

Enables cheat menu, cheat info pane, console, adds a whole bunch of menuitems: set gravity, follow camera, higher render/shadow distance, larger shadow map, change logo/sponsor/commander, unlimited wonders, build almost anywhere, instant mysteries, useful shortcuts, etc... Requests are welcome.

##### Install help
```
Place CheatMod_CheatMenu folder in %AppData%\Surviving Mars\Mods
(create Mods folder if it doesn't exist)
Other OS locations: https://pcgamingwiki.com/wiki/Surviving_Mars#Save_game_data_location
Enable with in-game mod manager
```

##### Info
```
F2: Toggle the cheats menu.
F3: Set object opacity.
F4: Open object examiner.
F5: Open object manipulator (or use edit button in examiner).
F6: Change building colour (Shift or Ctrl to apply random/default).
F7: Toggle using last building orientation.
F9: Clear the console log.
Ctrl+F: Fill resource of object.
Enter or Tilde: Show the console.
Number keys: Toggle build menu (Shift-*Num for menus above 10).
Ctrl-Alt-Shift-R: Opens console and places "restart" in it.
Ctrl-Space: Opens placement mode with the last built object.
Ctrl-Shift-Space: Opens placement mode with selected object (works with deposits).
Ctrl-Shift-F: Follow Camera (follow an object around).
Ctrl-Alt-F: Toggle mouse cursor (useful in follow mode to select stuff).
Ctrl-Shift-E: Toggle editor mode (select object then hold ctrl/shift/alt and drag mouse).
Ctrl-Alt-Shift-D: Delete object.
Shift-Q: Clone selected object to mouse position.
More shortcut keys are available, see menu items.

When I say object that means either the selected object or the object under the mouse cursor.

There's a cheats section in most selection panels on the right side of the screen.
Menu>Gameplay>QoL>Infopanel Cheats (on by default)
Hover over menu items for a description (will say if enabled or disabled).

To edit and use files from Files.hpk, use HPK archiver to extract them into the mod folder.
If Defaults.lua is in the same place as Init.lua you did it correctly.
```

##### List of some stuff added (not up to date)
```
Add Applicants
Add Funds/Reset Funds
Add Mystery Buildings
Add Prefabs
Add Research Points
Allow Dome Forbidden Buildings
Allow Dome Required Buildings
Allow Tall Buildings Under Pipes
Amount of BreakThrough Techs Per Game
Asteroids (single,multi,storm)
Avoid Workplace
Border Scrolling
Build Spires Outside of Spire Point
Building Damage Crime
Cables & Pipes: Instant Build
Cables & Pipes: Instant Repair
Cables & Pipes: No Chance of Break
Camera Zoom Dist
Chance of Negative Trait
Chance of Sanity Damage
Change Logo
Change Occurrence Level of Disasters
Change Sponsor/Commander
Colonist Residence Capacity
Colonists Add Specialization To All
Colonists Chance of Suicide
Colonists Morale Max
Colonists Min birth threshold
Colonists Per Rocket
Colonists Starve
Colonists Suffocate
Construction For Cheap
Crop Fail Threshold (lower the threshold to 0)
Deep Scan
Deeper Scan Enable
Disable Texture Compression
Drone Battery Infinite
Drone Build Speed
Drone Carry Amount Increase
Drone Meteor Malfunction
Drone Recharge Time
Drone Repair Supply Leak
Drones Per DroneHub Increase
Drones Per RC Rover Increase
Fill Resource Selected
Food Per Rocket Passenger Increase
Fully Automated Buildings
Game Speed Default,Double,Triple,Quad,Octuple,Sexdecuple,Duotriguple,Quattuorsexaguple
Increasable Capacity Colonist/Visitor/Battery/Air/Water
Instant Build (most items)
Maintenance Free Buildings
Meteor Health Damage
Moisture Vaporator Penalty
No Home Comfort Damage
Open In Ged Editor (lets you open some objects in the ged editor)
Outside Workplace Radius Increase
Outsource Points 1000000
Outsourcing Free
Performance Penalty Non-Specialist
Positive Playground
Project Morpheus Positive Trait
RC Rover Drone Recharge Free
RC Transport Storage Increase
RC Transport Transfer Speed
Remove Building Limits (they can be placed almost anywhere: no uneven terrain, it messes the buildings up)
Renegade Creation
Research Every Breakthrough
Research Every Mystery
Research Queue Larger
Rocket Cargo Capacity
Rocket Travel Instant
Sanatorium Cure All Traits
Sanatorium/School Show All Traits
Scanner Queue Larger
School Train All Traits
See Dead Sanity Damage
Set Colonists Age,Sex,Comfort,Health,Morale,Sanity
Set Death Age
Set New Colonists Age,Sex
Set Shadow Map Size
Set Transparency of UI items
Set Opacity of objects
Show All Traits in Sanatorium/School
Show Hidden Buildings
ShuttleHub Shuttles Increase
Spacing between Pipe Pillars
Start Mysteries (mysteries don't start till after you have 100 colonists, and an amount of time has passed. they stack up, so I wouldn't start too many)
Storage Depot / Waste Dump capacity increase
Toggle Editor (you can move stuff around: if you really want a bunch of colonists moving around inside a dome that isn't there anymore)
Toggle Infopanel Cheats
Traits: Add/Remove All Negative or Positive
Unlimited Wonders
Unlock Every Breakthrough
Visit Fail Penalty
Write Logs

Settings are saved at %APPDATA%\Surviving Mars\CheatMenuModSettings.lua
^ delete to reset to default settings (unless it's something like changing capacity of RC Transports, that's kept in savegame)
```



##### Fixes
```
Menu>ECM>Fixes>
Drones Keep Trying Blocked Rocks:
If you have a certain dronehub who's drones keep trying to get rock they can't reach, try this.

Idle Drones Won't Build When Resources Available
If you have drones that are idle while contruction sites need to be built and resources are available then you likely have some unreachable building sites.
This removes any of those (resources won't be touched).

Remove Yellow Grid Marks
If you have any buildings with those yellow grid marks around them (or anywhere else), then this will remove them

Drone Carry Amount
Drones only pick up resources from buildings when the amount stored is equal or greater then their carry amount.
This forces them to pick up whenever there's more then one resource).
If you have an insane production amount set then it'll take an (in-game) hour between calling drones.

Project Morpheus Radar Fell Down
Sometimes the blue radar thingy falls off.

Cables & Pipes: Instant Repair
Instantly repair all broken pipes and cables.

```

##### Console
```
Toggle showing history/results on-screen (Menu>Debug, it's on by default)
type any name in to see it in the console log (ex: Consts)
exit : or quit
restart : or reboot
examine(Consts) : or ex(SelectedObj)
dump(12345) : dump puts files in AppData/logs
dumplua(dlgConsole) : dump using ValueToLuaCode()
dumpobject(SelectedObj) : or dumpo
dumptable(Consts) : or dumpt
trans() : translate userdata: ********** to text
SelectedObj : or s
SelectionMouseObj() : or m, object under mouse cursor
GetPreciseCursorObj() : or mc, like SelectionMouseObj but compact
GetTerrainCursorObjSel() : or mh, just the handle
GetTerrainCursor() : or c, position of cursor: use with s:SetPos(c()), or point(c():x(), c():y(), c():z())
terminal.GetMousePos : or cs, mouse pos on screen, not map

If you want to overwrite instead of append text: dumpobject(TechTree,"w")
If you want to dump functions as well: dumptable(TechTree,nil,true)
If you want to save the console text: Debug>Write Logs (very helpful for examining an object)

you can paste chunks of scripts to test out:
local templates = DataInstances.BuildingTemplate
for i = 1, #templates do
  local building = templates[i]
	print(building.name)
end
```

##### Known issues
```
Going above 4096 capacity will make certain buildings laggy (houses/schools), and around 64K will crash.
  >Don't go too high...

If you increase a number high enough it'll go negative.
  >Don't go too high or use the menu to reset to default (if it's still broken send me your save).

You can't cheat fill concrete deposits.
  >Got me.
```

##### Thanks
```
chippydip (for the original mod): http://steamcommunity.com/sharedfiles/filedetails/?id=1336604230
HPK archiver: https://github.com/nickelc/hpk
```