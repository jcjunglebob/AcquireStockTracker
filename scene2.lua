---------------------------------------------------------------------------------
--
-- scene.lua
--
---------------------------------------------------------------------------------

local sceneName = ...

local composer = require( "composer" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------

local nextSceneButton

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

        nextSceneButton = self:getObjectByName( "GoToScene3Btn" )

        	function nextSceneButton:touch ( event )
        		local phase = event.phase
        			composer.gotoScene( "scene3", { effect = "fade", time = 300 } )
        	end

        	nextSceneButton:addEventListener( "touch", nextSceneButton )

end

scene:addEventListener( "show", scene )

return scene
