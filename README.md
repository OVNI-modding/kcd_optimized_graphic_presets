
Optimized Graphic Presets for Kingdom Come Deliverance by OVNI
==============================================================

- Better performances and/or quality.
- Added graphic settings in menus.


Compatibility
=============

This mod is not compatible with mod that modify "Graphic Settings" or "Advanced Graphics settings" menus.


Installation / Update
=====================

Extract the content of the zip directly in game's root folder (eg: "C:\Program Files (x86)\Steam\steamapps\common\KingdomComeDeliverance")
Overwrite files if asked (it will only overwrite previous versions of this mod)


Removal
=======

Download 'ogp_uninstall.bat' from optional files and run it from game root folder
(eg: "C:\Program Files (x86)\Steam\steamapps\common\KingdomComeDeliverance")


Hotkeys
=======

d = ensure game runs in native fullscreen
F1 to F5 = mod's presets: ugly, low, medium, high, ultra
F6 to F10 = vanilla's presets: low, medium, high, very high, ultra


FAQ / TROUBLESHOOTING
=====================

**Q: How to fix "blocky pixels" ?**
Set an higher global illumination setting, or choose "baked".

**Q: How to disable native fullscreen auto-switch ?**
Delete Mods\optimized_graphic_presets\Data\force_native_fullscreen.pak

**Q: How to disable F1-F10 hotkeys ?**
Delete Mods\optimized_graphic_presets\Data\hotkeys.pak

**Q: Why advanced settings menu has "Controls" title ?**
It's the only way to display more buttons in the menu.


ChangeLog
=========

3.2.0
- NEW: Added SMAA T2x without subsampling as flicker-free AA option
- NEW: Save settings when leaving Simple Graphic Menu
- FIX: "Loaded settings overridden by vanilla ones"
- FIX: "no sunshafts even when r_sunshafts=1"
- FIX: ambient occlusion typo

3.1.0
- FIX: "Settings aren't saved" issue on Windows10
- FIX: ogp_set_3pl console command now works (to apply 3point lightning settings)
- MOD: Settings are now loaded from lua instead of flowgraph
- MOD: Removed ogp_setup.bat (symb link no longer needed)

3.0.2
- FIX: 75, 95, 100 fov settings

3.0.1
- FIX: Misleading outdated error message in ogp_setup.bat

3.0.0
- NEW: Can set all-in-one profile in (standard) graphic menu.
- NEW: Can change sub-profiles in advanced graphic menu
- NEW: Settings load/saving from user profile
- NEW: In adv Graphic Menu, disabled DoF and vignette effect to see applied changes.
- NEW: Adv Graphic Menu contains 13 options instead of 7
-	NEW: in Adv Graphic Menu, Apply does not require confirmation.
- NEW: more SSDO presets (old one is "strong").
- NEW: Unlimited range for rainy/wet terrain shader (practically free, and the seam looked weird).
- NEW: Added baked GI setting, replaces GI off (which made barns and interiors pitch black).
- NEW: Extended FOV choices
- NEW: texture sub-profile with consistent anisotropic values.
- NEW: drunk sharpening on/off
- NEW: 3PL on/off
- NEW: grass wind on/off
- NEW: DoF on/off
- MOD: Hotkeys are set using lua to avoid using user.cfg (also mod.cfg is broken...)
- MOD: Decoupled some settings (AA, motionblur, grass wind, etc.) from profiles so they can be set on their own.
- MOD: Reduced GI flickering even more.
- MOD: GI Settings closer to vanilla look (except baked).
- MOD: Kept only shadows settings with best quality/cost ratio, reduced flickering with lower setting.
- MOD: Redone grass, traded distance for fewer pop-in.
- FIX: "ugly preset crashing game"
- FIX: "Ultra preset typos"
- FIX: "heads disappearing using ugly preset"

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
