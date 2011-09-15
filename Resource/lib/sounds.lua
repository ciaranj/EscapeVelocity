cocos2d.CCLuaLog( "Setting up background music and pre-loading sound effect" )

-- play background music
CocosDenshion.SimpleAudioEngine:sharedEngine():playBackgroundMusic("background.mp3", true);  
-- preload effect
CocosDenshion.SimpleAudioEngine:sharedEngine():preloadEffect("effect1.wav");
