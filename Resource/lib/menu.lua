cocos2d.CCLuaLog( "Building the Game Menu" )

-- add a popup menu

function menuCallbackClosePopup()
-- stop test sound effect
CocosDenshion.SimpleAudioEngine:sharedEngine():stopEffect(effectID)  
menuPopup:setIsVisible(false)
end

menuPopupItem = cocos2d.CCMenuItemImage:itemFromNormalImage("menu2.png", "menu2.png")
menuPopupItem:setPosition( cocos2d.CCPoint(0, 0) )
menuPopupItem:registerScriptHandler("menuCallbackClosePopup")
menuPopup = cocos2d.CCMenu:menuWithItem(menuPopupItem)
menuPopup:setPosition( cocos2d.CCPoint(winSize.width/2, winSize.height/2) )
menuPopup:setIsVisible(false)
layerMenu:addChild(menuPopup)

-- add the left-bottom "tools" menu to invoke menuPopup

function menuCallbackOpenPopup()
-- loop test sound effect
-- NOTE: effectID is global, so it can be used to stop 
effectID = CocosDenshion.SimpleAudioEngine:sharedEngine():playEffect("effect1.wav")  
menuPopup:setIsVisible(true)
end

menuToolsItem = cocos2d.CCMenuItemImage:itemFromNormalImage("menu1.png","menu1.png")
menuToolsItem:setPosition( cocos2d.CCPoint(0, 0) )	
menuToolsItem:registerScriptHandler("menuCallbackOpenPopup")
menuTools = cocos2d.CCMenu:menuWithItem(menuToolsItem)
menuTools:setPosition( cocos2d.CCPoint(30, 40) )
layerMenu:addChild(menuTools)