
Optimized Graphic Presets for Kingdom Come Deliverance.

=== Description ===

- performance boost ; mainly due to disabling grass wind animations, grass-terrain color bending, and reducing the number of shadow cascades in lower presets.
- Better resolution for Global illumination, avoids flickering (Especially in Ratty's church and forests).
- Enhanced anti-aliasing (temporal SMAA with jittering)
- Enhanced shadows : higher res + grass projects shadows.
- Disabled rim lights (it caused NPC to glow at dusk)
- Disabled motion blur
- D key ensures native fullscreen "automatically" (when you go right). The game switches to borderless window on alt-tab, causing huge performance penalty on some hardware.


=== IMPORTANT : Upgrade form v1.x ===

If you are currently using older 1.x versions of this mod, you have to do the new installation process.


=== Installation ===

Note: root means the game's root folder, eg: "C:\Program Files (x86)\Steam\steamapps\common\KingdomComeDeliverance"

1) unzip in game root folder.
- ogp_hotkeys.cfg should be in game's root folder.
- zzz_optimized_graphic_presets.pak should be in game's Data folder.

2) Copy/move "root\optimized_graphic_presets\user.cfg" to "root\user.cfg"
Alternatively, if you already have your own user.cfg, copy the content of "root\optimized_graphic_presets\user.cfg" at the end of it.

3) Add "+exec user.cfg" (without quotes) as game's launch options. cf https://support.steampowered.com/kb_article.php?ref=1040-JWMT-2947


=== Usage ===

If you have already set up an user.cfg (and followed installation instructions), you can skip set 1 and 2.

1) Launch the game and use f1 to f4 keys to switch form ugly to high preset.
2) Once you found the best preset for you, edit user.cfg and set sys_spec_ogp_all to the corresponding value.
For example "sys_spec_ogp_all = 0" for ugly preset.

Important: if you modify in-game settings, you have to press F5 afterward, to reapply the modded settings.
Note: There's more hotkeys to switch presets for individual categories (shadows, grass, etc.), see ogp_hotkeys.cfg .


=== FAQ / TROUBLESHOOTING ===

Q: How to re-enable motion blur ?
edit user.cfg and add r_motionblur=1 (camera motion blur) or r_motionblur=2 (per-object motion blur) at the end.

Q: How to re-enable rim light ?
edit user.cfg and add r_DeferredShading3PL=2 at the end.

Q: How to re-enable wind on grass animation ?
edit user.cfg and add e_MergedMeshesUseSpines=1 at the end.

Q: I don't want to auto-switch to native fullscreen.
edit ogp_hotkeys.cfg and delete the line : bind d "r_fullscreen 1", then restart the game.


=== ChangeLog ===

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
minot global illumination settings tweaks

1.2
- disabled global illumination for ugly presets. As a result you will have to use torches more often but the fps boost is quite huge.
- made the "dark blocks"  less visible without impacting framerate too much. (may even boost quality for higher preset in the future)
- doubled the amount of cascades for GI, so it stop flickering due to resolution being to low.
- added hotkeys to change presets
- d key enables native fullscreen

1.1
disabled motionblur
