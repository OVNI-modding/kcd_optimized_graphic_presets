
Optimized Graphic Presets for Kingdom Come Deliverance by OVNI
==============================================================

- Better performances and/or quality.
- More options in advanced settings menu.


Installation / Update
=====================

1. Go to game's root folder
eg: "C:\Program Files (x86)\Steam\steamapps\common\KingdomComeDeliverance"

2. Extract zip content there, overwrite files if asked (it will only overwrite files from older OGP version, not games files).
"ogp_setup.bat" and "optimized_graphic_presets" should be in game root folder.

3. Launch ogp_setup.bat and select "Install"


Removal
=======

Launch ogp_setup.bat (from game's root folder) and select uninstall


Hotkeys
=======

d = ensure game runs in native fullscreen
F1 to F5 = mod's presets: ugly, low, medium, high, ultra
F6 to F10 = vanilla's presets: low, medium, high, very high, ultra


FAQ / TROUBLESHOOTING
=====================

**Q: How to fix blocky faces ?**
Set an higher global illumination setting, or turn it off.

**Q: How to disable native fullscreen auto-switch ?**
Delete Mods\optimized_graphic_presets\Data\force_native_fullscreen.pak

**Q: How to disable F1-F10 hotkeys ?**
Delete Mods\optimized_graphic_presets\Data\hotkeys.pak

**Q: Why advanced settings menu has "Controls" title ?**
It's the only way to display more buttons in the menu.


ChangeLog
=========

3.0.0
- GUI integration
- settings load/saving
- added texture setting with fixed anisotropic values.
- Removed some settings (AA, motionblur, grass wind, grass shadows) so they can be set independently.

2.3
- BUGFIX commented vsync off in user.cfg
- BUGFIX typo ( `e_UberlodDistanceRatio )
- BUGFIX fixed "ugly preset crashing game" issue
- top-level profiles are now cfg files instead of var groups.
- always use e_svoti_ResScaleBase=0, modify e_svoti_LowSpecMode instead.
- added missing ultra preset for shading
- added missing ultra preset for GI
- e_ViewDistMin=40 instead of 50 for ultra
- removed e_UberlodActivate from var groups (had no effect there)
- added e_UberlodActivate in user.cfg
- reduced svoTI saturation
- added more commented tweaks in user.cfg
- replaced readme.txt by README.md

2.21
- bugfix highest preset uses highest settings (ultra was the same as high except for lod)
- shadow presets : r_ShadowCastingLightsMaxCount 0/10/15/20/25 instead of 3 for all (caused shadow flickering because engine looks to randomly pick light...)
- moved d and esc hotkey to user.cfg (so user can disable them)
- increased e_ViewDistMin for low and medium lod presets

2.2
- hopefully fixed blackface
- fixed some shadow flickering
- added CVarGroups to revert vanilla settings for each categories.
- disabled r_VolumetricFogSunLightCorrection (effect only visible if volfog enabled).
- reduced max shadow sources to 3 (should improve perfs vs npcs with torches)
- ugly presets is less ugly (enabled grass-terrain color blending + ssdo + less obvious grass popup), costs ~5% FPS more.
- added a new profile (low had became too heavy)
- increased ssdo str, reduced min radius (so shadow-less glass looks better).
- non-ugly presets use r_AntialiasingTAAPattern (better subsampling)

2.1
- bugfix: low grass preset disabling trees shadows
- shadows settings improvement

2.0
- Added multiple CVarGroups
- Does not reset every settings (physics, etc.)
- All presets use higher rendering quality (better normal mapping / POM / etc.)
- GI cascade lod 5 instead of 4 (vanilla was 2) to reduce flickering even more and marginally increase framerate.
- GI settings should hopefully no longer generate black eyes
- Tweaked shadows for each preset.
- Tweaked grass for each preset.
- Added hotkeys to switch individual sub-presets
- Reduced preset number to only 4 (was 5).

1.31
fixed black eyes

1.3
- interiors are darker (than presets v1.2, it's still a bit brighter than vanilla tho)
- increased ambient occlusion amount
- fixed black eyes
- ugly now show grass (very few)
- ugly now always use lowest lod models
- low preset is faster (should be on pair with vanilla low preset)

1.21
minor global illumination settings tweaks

1.2
- disabled global illumination for ugly presets. As a result you will have to use torches more often but the fps boost is quite huge.
- made the "dark blocks"  less visible without impacting framerate too much. (may even boost quality for higher preset in the future)
- doubled the amount of cascades for GI, so it stop flickering due to resolution being to low.
- added hotkeys to change presets
- d key enables native fullscreen

1.1
disabled motionblur
