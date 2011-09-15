function tick()

    point = spriteDog:getPosition();

    if point.x > winSize.width then
        point.x = 0
        spriteDog:setPosition(point)
    else
        point.x = point.x + 1 
        spriteDog:setPosition(point) 
    end

    if point.y > winSize.height then
        point.y = 0
    else
        point.y = point.y + 1 
    end
    spriteDog:setPosition(point)
end

cocos2d.CCScheduler:sharedScheduler():scheduleScriptFunc("tick", 0.01, false)
