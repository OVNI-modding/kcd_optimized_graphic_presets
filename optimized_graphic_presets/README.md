
Optimized Graphic Presets for Kingdom Come Deliverance by OVNI v2.3
===================================================================

- performance boost ; mainly due to disabling grass wind animations, grass-terrain color bending, reducing shadow cascades in lower presets, increasing gi cascades.
- Better resolution for Global illumination, avoids flickering (Especially in Ratty's church and forests).
- Enhanced anti-aliasing (temporal SMAA with jittering)
- Enhanced shadows : higher res + grass projects shadows.
- Disabled rim lights (it caused NPC to glow at dusk)
- Disabled motion blur
- D key ensures native fullscreen "automatically" (when you go right). The game switches to borderless window on alt-tab, causing huge performance penalty on some hardware.


Installation **AND** Update from an older version
=================================================

Note: game root folder = the game's root folder, eg: "C:\Program Files (x86)\Steam\steamapps\common\KingdomComeDeliverance"

1. Unzip in game root folder. eg: with 7zip drag the zip file using *Right* mouse button, drop it in root folder by releasing button, then select 7zip->extract here. Override all files if asked (this will not override any vanilla files, only files from previous versions of this mod).

2. Copy/move the file "root\optimized_graphic_presets\user.cfg" to "root\user.cfg"
Alternatively, if you already have your own user.cfg, copy the content of "root\optimized_graphic_presets\user.cfg" at the end of your user.cfg.

3.  Add "+exec user.cfg" (without quotes) as game's launch options. cf https://support.steampowered.com/kb_article.php?ref=1040-JWMT-2947
If you are using non-steam version, create a shortcut for KingdomCome.exe, and add "+exec user.cfg" (without quotes) to its target property.
eg: "C:\Games\KCD\Bin\Win64\KingdomCome.exe" +exec user.cfg


Hotkeys
=======

F1 to F5 = mod's presets: ugly, low, medium, high, ultra
F6 to F10 = vanilla's presets: low, medium, high, very high, ultra
6 to 9 = global illumination quality levels (from ugly to high)
Numpad 0, 1, 4, 7 = shadows quality levels (from ugly to high)
Numpad 2, 5, 8, / = grass quality levels (from ugly to high)
Numpad 3, 6, 9, * = lod quality levels (from ugly to high)


FAQ / TROUBLESHOOTING
=====================

**Q: How to fix blocky faces ?**
Set an higher global illumination resolution using hotkeys and/or change sys_spec_ogp_gi value (0/1/2/3/4).

**Q: How to re-enable motion blur ?**
Edit user.cfg and add r_motionblur=1 (camera motion blur) or r_motionblur=2 (per-object motion blur) at the end.

**Q: How to re-enable rim light ?**
Edit user.cfg and add r_DeferredShading3PL=2 at the end.

**Q: How to re-enable wind on grass animation ?**
Edit user.cfg and add e_MergedMeshesUseSpines=1 at the end.

**Q: I don't want to auto-switch to native fullscreen.**
Edit user.cfg and delete the line : bind d "r_fullscreen 1", then restart the game.

**Q: How to XYZ ?**
Probably by creating you own profile.
- make a copy of Config/template.cfg and rename it as you please eg: my_profile.cfg
- make the change you which in that copy (documentation is within the file).
- edit user.cfg to replace "loadconfig medium" by "loadconfig my_profile" (or whatever you named it).


ChangeLog
=========

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
