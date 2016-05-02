---------------------------------------------------------------------------------
--
-- scene.lua
--
---------------------------------------------------------------------------------

local sceneName = ...

local composer = require( "composer" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    
    local names = {"L", "T", "W", "A", "F", "I", "C"}   
            
        function changeStock( event )
          local target = event.target
          if (event.phase == "began") then
            local playerStock = self:getObjectByName(target.letter .. target.num)
            local baseStock = self:getObjectByName(target.letter .. "Count")
                       
            if ( tonumber(baseStock.text) > 0 and target.direction == "Up") then
              playerStock.text = tonumber(playerStock.text) + 1
              baseStock.text = tonumber(baseStock.text) - 1
            end
            
            if ( tonumber(playerStock.text) > 0 and target.direction == "Down") then
              playerStock.text = tonumber(playerStock.text) - 1
              baseStock.text = tonumber(baseStock.text) + 1
            end
            
            event.phase = "ended"
          end
        end
    
        function self.wireButtons(name)
          for i =1, 6, 1 do
            local direction = {"Up", "Down"}
            
            for j=1, 2, 1 do
              local object = self:getObjectByName(name .. i .. direction[j])
              
              object.num = i
              object.letter = name
              object.direction = direction[j]
              object:addEventListener( "touch", changeStock )
            end
          end
        end
        
        for i = 1, 7, 1 do
          self.wireButtons(names[i])
        end
end 



scene:addEventListener( "show", scene )

return scene
