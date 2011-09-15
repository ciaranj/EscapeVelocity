require( 'lib/scene' )
-- create scene & layer
require( 'lib/touch' )

require( 'lib/menu' )
require( 'lib/gameloop' )
require( 'lib/sounds' )

-- run 
cocos2d.CCDirector:sharedDirector():runWithScene(sceneGame)
