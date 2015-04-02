--          `--::-.`
--      ./shddddddddhs+.
--    :yddddddddddddddddy:
--  `sdddddddddddddddddddds`
--  ydddh+sdddddddddy+ydddds  demo:EasyColor
-- /ddddy:oddddddddds:sddddd/ By adebray - adebray
-- sdddddddddddddddddddddddds
-- sdddddddddddddddddddddddds Created: 2015-04-02 15:31:16
-- :ddddddddddhyyddddddddddd: Modified: 2015-04-02 15:31:43
--  odddddddd/`:-`sdddddddds
--   +ddddddh`+dh +dddddddo
--    -sdddddh///sdddddds-
--      .+ydddddddddhs/.
--          .-::::-`

EasyColor = {}

function EasyColor.setBlank(val)
	if val then love.graphics.setColor(255 * val, 255 * val, 255 * val, 255)
	else love.graphics.setColor(255, 255, 255, 255) end
end

function EasyColor.setRed(val)
	if val then love.graphics.setColor(255 * val, 0, 0, 255)
	else love.graphics.setColor(255, 0, 0, 255) end
end

function EasyColor.setGreen(val)
	if val then love.graphics.setColor(0, 255 * val, 0, 255)
	else love.graphics.setColor(0, 255, 0, 255) end
end

function EasyColor.setBlue(val)
	if val then love.graphics.setColor(0, 0, 255 * val, 255)
	else love.graphics.setColor(0, 0, 255, 255) end
end

return EasyColor
