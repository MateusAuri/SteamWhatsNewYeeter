# Changelog

## 202606060230
- Now working with stable client v1780352834, build date Jun 01 2026
  - *it seems that a recent update added different heights for the WN shelf depending on the display size in the settings*
  - *so an older version of the script might still work depending on what you picked there*
- Now it only affects the specific CSS class used by the WN shelf, instead of doing it to whatever classes happened to be 324px tall
  - *I still have no clue what that other class that used to be affected was, honestly... I couldn't find it when inspecting the library's HTML*
- Now it asks if you want Steam to be force-closed and reopened, instead of just doing it, which was a bit rude in hindsight
- Code is less of a mess overall
- Reworded a few things

## 202312290855
- Now checks if Steam is running and closes it before modifying files
- Reopens Steam after it's done
- Checks if file exists
- Checks if file is already modified
- Added shameless begging at the end of the script

## 202311192247
- First working version
