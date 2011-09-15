cocos2d.CCLuaLog( "Sorting out touch events.." )

layerFarm:setIsTouchEnabled(true)

-- touch handers
pointBegin = nil

function btnTouchMove(e)
    cocos2d.CCLuaLog("btnTouchMove")
    if pointBegin ~= nil then
        local v = e[1]
        local pointMove = v:locationInView(v:view())
        pointMove = cocos2d.CCDirector:sharedDirector():convertToGL(pointMove)
        local positionCurrent = layerFarm:getPosition()
        layerFarm:setPosition(cocos2d.CCPoint(positionCurrent.x + pointMove.x - pointBegin.x, positionCurrent.y + pointMove.y - pointBegin.y))
        pointBegin = pointMove
    end
end

function btnTouchBegin(e)
    cocos2d.CCLuaLog("btnTouchBegin")
    for k,v in ipairs(e) do
        pointBegin = v:locationInView(v:view())
        pointBegin = cocos2d.CCDirector:sharedDirector():convertToGL(pointBegin)
    end
end

function btnTouchEnd(e)
    cocos2d.CCLuaLog("btnTouchEnd")
    touchStart = nil
end

-- regiester touch handlers
layerFarm.__CCTouchDelegate__:registerScriptTouchHandler(cocos2d.CCTOUCHBEGAN, "btnTouchBegin")
layerFarm.__CCTouchDelegate__:registerScriptTouchHandler(cocos2d.CCTOUCHMOVED, "btnTouchMove")
layerFarm.__CCTouchDelegate__:registerScriptTouchHandler(cocos2d.CCTOUCHENDED, "btnTouchEnd")
