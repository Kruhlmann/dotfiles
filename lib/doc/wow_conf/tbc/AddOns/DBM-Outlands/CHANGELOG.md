# <DBM> Outlands

## [2.5.20](https://github.com/DeadlyBossMods/DBM-TBC-Classic/tree/2.5.20) (2021-11-20)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-TBC-Classic/compare/2.5.19...2.5.20) [Previous Releases](https://github.com/DeadlyBossMods/DBM-TBC-Classic/releases)

- prep new tags  
- Fix a nil error in DBT  
- SoM removed debuff cap, as such this should no longer be restricted.  
- Fixed a bad copy-paste in the error correcting code.  
    Was calling DBT, not DBM >.>  
- Add a migration for ElvUI due to changes they made in folder structure;  
    - ElvUI assets are now located in a nested Core folder  
    This was causing bar textures, fonts, etc. to start being a little weird when depending on old ElvUI assets.  
- Add localization for LurkerBelow name  
    This should fix the spew announce, as it depends on this localization.  
- Update localization.ru.lua (#21)  
    Translated some phrases. Fixed some existing phrases.  
- Update localization.ru.lua (#20)  
    Translated some phrases. Fixed some existing phrases.  
- Update DBM-Serpentshrine.toc (#82)  
    * Update DBM-Serpentshrine.toc  
    * Update DBM-TheEye.toc  
- Add TheEye FR localization  
    Big thanks to Ocsa on discord for this submition.  
- Add phase change messages for FR - Lady Vashj (#80)  
- Bump dev.  
- bump classic toc while testing my new unified cloud based source code folder across multiple computers  
- Fix for Vashj shields (#79)  
- Update localization.cn.lua (#19)  
- Possible fix for early invalid combat detection fo Leotheras  
- bump next alpha cycle  
