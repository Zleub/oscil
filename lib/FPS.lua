--          `--::-.`
--      ./shddddddddhs+.
--    :yddddddddddddddddy:
--  `sdddddddddddddddddddds`
--  ydddh+sdddddddddy+ydddds  demo:FPS
-- /ddddy:oddddddddds:sddddd/ By adebray - adebray
-- sdddddddddddddddddddddddds
-- sdddddddddddddddddddddddds Created: 2015-03-30 15:47:55
-- :ddddddddddhyyddddddddddd: Modified: 2015-03-30 16:02:21
--  odddddddd/`:-`sdddddddds
--   +ddddddh`+dh +dddddddo
--    -sdddddh///sdddddds-
--      .+ydddddddddhs/.
--          .-::::-`

local FPS = {}

function FPS:new(delay)
	self.width = love.window.getWidth()
	self.height = love.window.getHeight()
	self.delay_max = delay
	self.delay = delay
	self.list = {}

	return self
end

function FPS:update(dt)
	self.delay = self.delay - dt
	if self.delay < 0 then
		table.insert(self.list, love.timer.getFPS())
		if #self.list - 1 > self.width / 3 then
			table.remove(self.list, 1)
		end
		self.delay = self.delay_max
	end
end

function FPS:draw()
	love.graphics.setColor(255, 255, 255, 100)
	for k,v in pairs(self.list) do
		if v < 30 then love.graphics.setColor(255, 0, 0, 100) end
		love.graphics.rectangle('fill',
			(k * 3),
			self.height - v,
			3, v)
		if v < 30 then love.graphics.setColor(255, 255, 255, 100) end
	end
	love.graphics.setColor(255, 255, 255, 255)
end

return FPS
