-- See LICENSE for terms

local LICENSE = [[
Any code from https://github.com/HaemimontGames/SurvivingMars is copyright by their LICENSE

All of my code is licensed under the MIT License as follows:

MIT License

Copyright (c) [2018] [ChoGGi]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

-- if we use global func more then once: make them local for that small bit o' speed
local dofile,select,tostring,type,table = dofile,select,tostring,type,table
local AsyncGetFileAttribute,Mods,dofolder,dofolder_files = AsyncGetFileAttribute,Mods,dofolder,dofolder_files

-- thanks for replacing concat... what's wrong with using table.concat2?
local TableConcat = oldTableConcat or table.concat

local function FileExists(file)
  -- AsyncFileOpen may not work that well under linux?
  local err,_ = AsyncGetFileAttribute(file,"size")
  if not err then
    return true
  end
end

-- this is used instead of "str .. str"; anytime you do that lua will check for the hashed string, if not then hash the new string, and store it till exit (which means this is faster, and uses less memory)
local concat_table = {}
local function Concat(...)
  -- sm devs added a c func to clear tables, which does seem to be faster than a lua loop
  table.iclear(concat_table)
  -- build table from args
  local concat_value
  local concat_type
  for i = 1, select("#",...) do
    concat_value = select(i,...)
    -- no sense in calling a func more then we need to
    concat_type = type(concat_value)
    if concat_type == "string" or concat_type == "number" then
      concat_table[i] = concat_value
    else
      concat_table[i] = tostring(concat_value)
    end
  end
  -- and done
  return TableConcat(concat_table)
end

--~ ChoGGi.CodeFuncs.TestConcatExamine()

-- I should really split this into funcs and settings... one of these days
ChoGGi = {
  -- see above
  _LICENSE = LICENSE,
  -- get version of mod from metadata.lua
  _VERSION = false,
  -- is ECM shanghaied by the blacklist?
  blacklist = Mods.ChoGGi_CheatMenu.env,
  -- constants
  Consts = false,
  -- default ECM settings
  Defaults = false,
  -- means of communication
  email = "SM_Mods@choggi.org",
  -- used for FilesHPK stuff
  ExtractPath = false,
  -- font used for various UI stuff
  font = "droid",
  -- used to access Mods[id]
  id = "ChoGGi_CheatMenu",
  -- Wha'choo talkin' 'bout, Willis?
  lang = GetLanguage(),
  -- path to this mods' folder
  ModPath = false,
  -- pretty much the same, but for mounting Files.hpk
  MountPath = false,
  -- Console>Scripts folder
  scripts = "AppData/ECM Scripts",
  -- i tend to be forgetful in my old age
  SettingsFile = "AppData/CheatMenuModSettings.lua",
  -- i translate all my strings at startup (and a couple of the built-in ones
  Strings = false,
  -- easy access to some data (traits,cargo,mysteries,colonist data)
  Tables = false,
  -- stuff that isn't ready for release, more print msgs, and some default settings
  testing = false,

  -- CommonFunctions.lua
  ComFuncs = {
    FileExists = FileExists,
    TableConcat = TableConcat,
    Concat = Concat,
    DebugGetInfo = format_value,
  },
  -- orig funcs that get replaced
  OrigFuncs = {},
  -- _Functions.lua
  CodeFuncs = {},
  -- /Menus/*
  MenuFuncs = {},
  -- OnMsgs.lua
  MsgFuncs = {},
  -- InfoPaneCheats.lua
  InfoFuncs = {},
  -- Defaults.lua
  SettingFuncs = {},
  -- ConsoleControls.lua
  Console = {},
  -- temporary... stuff
  Temp = {
    -- collect msgs to be displayed when game is loaded
    StartupMsgs = {},
    -- we build a list of menuitems and shortcut keys called on Msg("ShortcutsReloaded")
    Actions = {},
  },
  -- settings that are saved to SettingsFile
  UserSettings = {
    BuildingSettings = {},
    Transparency = {},
  },
}
local ChoGGi = ChoGGi
ChoGGi._VERSION = Mods[ChoGGi.id].version
ChoGGi.ModPath = Mods[ChoGGi.id].content_path
ChoGGi.ExtractPath = Concat(ChoGGi.ModPath,"FilesHPK/")

do -- load script files
  -- used to let the mod know if we're on my computer
  if Mods.ChoGGi_testing then
    ChoGGi.testing = true
    -- i keep Files/ unpacked for easy access
    ChoGGi.MountPath = Concat(ChoGGi.ModPath,"Files/")
  elseif type(FileExists) == "function" and FileExists(Concat(ChoGGi.ExtractPath,"TheIncal.tga")) then
    -- if exists then user unpacked the files to Files/
    ChoGGi.MountPath = ChoGGi.ExtractPath
  else
    -- load up the hpk
    AsyncMountPack("ChoGGi_Mount",Concat(ChoGGi.ModPath,"Files.hpk"))
    ChoGGi.MountPath = "ChoGGi_Mount/"
  end
end

do -- translate
  -- load locale translation (if any, not likely with the amount of text, but maybe a partial one)
  local locale_path = Concat(ChoGGi.ModPath,"Locales/%s.csv")
  if not LoadTranslationTableFile(locale_path:format(GetLanguage())) then
    LoadTranslationTableFile(locale_path:format("English"))
  end
  Msg("TranslationChanged")
end

do -- ECM settings
  -- translate all the strings before anything else
  dofile(Concat(ChoGGi.MountPath,"Strings.lua"))
  -- functions that need to be loaded before they get called...
  dofile(Concat(ChoGGi.MountPath,"CommonFunctions.lua"))
  -- get saved settings for this mod
  dofile(Concat(ChoGGi.MountPath,"Defaults.lua"))
  -- new ui classes
  dofolder_files(Concat(ChoGGi.MountPath,"Dialogs"))
  -- OnMsgs and functions that don't need to be in CommonFunctions
  dofolder_files(Concat(ChoGGi.MountPath,"Code"))

  -- read settings from AppData/CheatMenuModSettings.lua
  ChoGGi.SettingFuncs.ReadSettings()

  if ChoGGi.testing or ChoGGi.UserSettings.ShowStartupTicks then
    -- from here to the end of OnMsg.ChoGGi_Loaded()
    ChoGGi.Temp.StartupTicks = GetPreciseTicks()
  end

  --bloody hint popups
  if ChoGGi.UserSettings.DisableHints then
    mapdata.DisableHints = true
    HintsEnabled = false
  end

  -- why would anyone ever turn this off? console logging ftw, and why did the devs make their log print only after quitting...!? unless of course it crashes in certain ways, then fuck you no log for you... Thank the Gods for FlushLogFile() (or whichever dev added it; Thank YOU!)
  if ChoGGi.testing then
    ChoGGi.UserSettings.WriteLogs = true
  end

  -- if writelogs option
  if ChoGGi.UserSettings.WriteLogs then
    ChoGGi.ComFuncs.WriteLogs_Toggle(ChoGGi.UserSettings.WriteLogs)
  end

  local Platform = Platform
  Platform.editor = true

  -- fixes UpdateInterface nil value in editor mode
  local d_before = Platform.developer
  Platform.developer = true
  editor.LoadPlaceObjConfig()
  Platform.developer = d_before

  -- needed for HashLogToTable(), SM was planning to have multiple cities (or from a past game from this engine)?
  GlobalVar("g_Cities",{})
  -- editor wants a table
  GlobalVar("g_revision_map",{})
  -- stops some log spam in editor (function doesn't exist in SM)
  function UpdateMapRevision()end
  function AsyncGetSourceInfo()end

--~   ClassesGenerate
--~   ClassesPreprocess
--~   ClassesPostprocess
--~   ClassesBuilt
--~   OptionsApply
--~   Autorun
--~   ModsLoaded
--~   EntitiesLoaded
--~   BinAssetsLoaded

--~   -- be nice to get a remote debugger working
--~   Platform.editor = true
--~   config.LuaDebugger = true
--~   GlobalVar("outputSocket", false)
--~   dofile("CommonLua/Core/luasocket.lua")
--~   dofile("CommonLua/Core/luadebugger.lua")
--~   outputSocket = LuaSocket:new()
--~   outputThread = false
--~   dofile("CommonLua/Core/luaDebuggerOutput.lua")
--~   dofile("CommonLua/Core/ProjectSync.lua")
--~   config.LuaDebugger = false
end
