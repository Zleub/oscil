--          `--::-.`
--      ./shddddddddhs+.
--    :yddddddddddddddddy:
--  `sdddddddddddddddddddds`
--  ydddh+sdddddddddy+ydddds  demo:OverTime
-- /ddddy:oddddddddds:sddddd/ By adebray - adebray
-- sdddddddddddddddddddddddds
-- sdddddddddddddddddddddddds Created: 2015-03-30 16:03:49
-- :ddddddddddhyyddddddddddd: Modified: 2015-03-30 17:10:23
--  odddddddd/`:-`sdddddddds
--   +ddddddh`+dh +dddddddo
--    -sdddddh///sdddddds-
--      .+ydddddddddhs/.
--          .-::::-`

local OverTime = {}

OverTime.list = {}
OverTime.time = 0

function OverTime:new(f, color)
	new = {
		ft = f,
		table = {},
		get = function (self)
			return self.table[#self.table].n
		end,
		update = function (self, time)
			table.insert(self.table, {n = self.ft(time), x = time, y = self.ft(time) * -100 + love.window.getHeight() / 2})
			if #self.table > love.window.getWidth() then
				table.remove(self.table, 1)
			end
		end,
		draw = function (self)
			love.graphics.setColor(color.r, color.g, color.b, color.a)
			for i,v in ipairs(self.table) do
				love.graphics.circle('fill', i, v.y, 2)
			end
			love.setBlank()
		end
	}
	table.insert(self.list, new)
	return new
end

function OverTime:update(dt)
	self.time = self.time + dt
	for i,v in ipairs(self.list) do
		v:update(time)
	end
end

function OverTime:draw()
	for i,v in ipairs(self.list) do
		v:draw()
	end
end

return OverTime
