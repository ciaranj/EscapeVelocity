cocos2d.CCLuaLog( "Constructing Scene" )

layerFarm= cocos2d.CCLayer:node()
layerMenu = cocos2d.CCLayer:node()
sceneGame = cocos2d.CCScene:node()
sceneGame:addChild(layerFarm)
sceneGame:addChild(layerMenu)

winSize = cocos2d.CCDirector:sharedDirector():getWinSize()

-- add in farm background
spriteFarm = cocos2d.CCSprite:spriteWithFile("farm.jpg")
spriteFarm:setPosition(cocos2d.CCPoint(winSize.width/2 + 80, winSize.height/2))
layerFarm:addChild(spriteFarm)

-- add land sprite
for i=0,3,1 do
    for j=0,1,1 do
        spriteLand = cocos2d.CCSprite:spriteWithFile("land.png")
        layerFarm:addChild(spriteLand)
        spriteLand:setPosition(cocos2d.CCPoint(200+j*180 - i%2*90, 10+i*95/2))
    end
end

-- add crop

for i=0,3,1 do
    for j=0,1,1 do

        textureCrop = cocos2d.CCTextureCache:sharedTextureCache():addImage("crop.png")
        frameCrop = cocos2d.CCSpriteFrame:frameWithTexture(textureCrop, cocos2d.CCRectMake(0, 0, 105, 95))
        spriteCrop = cocos2d.CCSprite:spriteWithSpriteFrame(frameCrop);

        layerFarm:addChild(spriteCrop)

        spriteCrop:setPosition(cocos2d.CCPoint(10+200+j*180 - i%2*90, 30+10+i*95/2))

    end
end

-- add the moving dog

FrameWidth = 105
FrameHeight = 95

textureDog = cocos2d.CCTextureCache:sharedTextureCache():addImage("dog.png")
frame0 = cocos2d.CCSpriteFrame:frameWithTexture(textureDog, cocos2d.CCRectMake(0, 0, FrameWidth, FrameHeight))
frame1 = cocos2d.CCSpriteFrame:frameWithTexture(textureDog, cocos2d.CCRectMake(FrameWidth*1, 0, FrameWidth, FrameHeight))

spriteDog = cocos2d.CCSprite:spriteWithSpriteFrame(frame0)
spriteDog:setPosition(cocos2d.CCPoint(0, winSize.height/4*3))
layerFarm:addChild(spriteDog)

animFrames = cocos2d.CCMutableArray_CCSpriteFrame__:new(2)
animFrames:addObject(frame0)
animFrames:addObject(frame1)

animation = cocos2d.CCAnimation:animationWithFrames(animFrames, 0.5)

animate = cocos2d.CCAnimate:actionWithAnimation(animation, false);
spriteDog:runAction(cocos2d.CCRepeatForever:actionWithAction(animate))





