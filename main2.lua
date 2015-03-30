--          `--::-.`
--      ./shddddddddhs+.
--    :yddddddddddddddddy:
--  `sdddddddddddddddddddds`
--  ydddh+sdddddddddy+ydddds  demo:main
-- /ddddy:oddddddddds:sddddd/ By adebray - adebray
-- sdddddddddddddddddddddddds
-- sdddddddddddddddddddddddds Created: 2015-03-27 13:30:45
-- :ddddddddddhyyddddddddddd: Modified: 2015-03-30 22:08:54
--  odddddddd/`:-`sdddddddds
--   +ddddddh`+dh +dddddddo
--    -sdddddh///sdddddds-
--      .+ydddddddddhs/.
--          .-::::-`

function love.setBlank(val)
	if val then love.graphics.setColor(255 * val, 255 * val, 255 * val, 255)
	else love.graphics.setColor(255, 255, 255, 255) end
end

function love.setRed(val)
	if val then love.graphics.setColor(255 * val, 0, 0, 255)
	else love.graphics.setColor(255, 0, 0, 255) end
end

function love.setGreen(val)
	if val then love.graphics.setColor(0, 255 * val, 0, 255)
	else love.graphics.setColor(0, 255, 0, 255) end
end

function love.setBlue(val)
	if val then love.graphics.setColor(0, 0, 255 * val, 255)
	else love.graphics.setColor(0, 0, 255, 255) end
end

FPS = require 'lib.FPS'
OverTime = require 'lib.OverTime'

cos_1 = function (x)
	local c = math.cos(x)
	if c < 0 then
		return c * -1
	else
		return c
	end
end

sin_1 = function (x)
	local s = math.sin(x)
	if s < 0 then
		return s * -1
	else
		return s
	end
end

cos_2 = function (x)
	return (math.cos(x) / 2) + 0.5
end

sin_2 = function (x)
	return (math.sin(x) / 2) + 0.5
end

megacos2 = function (x)
	x = x - math.pi
	return (math.cos(x) / 2) + 0.5
end

megacos3 = function (x)
	x = x + (math.pi + 15.1)
	return (math.cos(x) / 2) + 0.5
end

scale = 64

function love.load()
	FPS:new(1)

	-- OverTime:new(math.tan, {r = 0, g = 0, b = 200, a = 255})
	cos = OverTime:new(cos_2, {r = 200, g = 0, b = 0, a = 255})
	-- cos = OverTime:new(megacos3, {r = 0, g = 0, b = 200, a = 255})
	-- cos_2 = OverTime:new(cos_2, {r = 100, g = 0, b = 0, a = 255})
	-- OverTime:new(math.sin, {r = 0, g = 255, b = 0, a = 255})
	-- OverTime:new(sin_1, {r = 0, g = 200, b = 0, a = 255})
	sin = OverTime:new(sin_2, {r = 0, g = 100, b = 0, a = 255})
	-- sin = OverTime:new(megasin)
	-- sin2 = OverTime:new(megasin2)
	-- ssin = OverTime:new(supersin)
	-- OverTime:new(math.tan)
	-- OverTime:new(math.exp)
	-- OverTime:new(math.frexp)
	log = OverTime:new(math.log)

	max = tonumber(arg[2]) * tonumber(arg[2])
	if not arg[2] then arg[2] = 0 end
	if not arg[3] then arg[3] = 255 end

	math.randomseed(love.timer.getTime())
	t1 = {}

	size = love.window.getWidth() / arg[2]
	local x = 0
	local y = 0

	for i=1,max do
		if t1[i - 1] and t1[i - 1].n == 1 then
			table.insert(t1, {n = 0, x = x * size, y = y * size})
		else
			if t1[i - tonumber(arg[2])] and t1[i - tonumber(arg[2])].n == 1 then
				table.insert(t1, {n = 0, x = x * size, y = y * size})
			else
				table.insert(t1, {n = math.random(0, 1), x = x * size, y = y * size})
			end
		end
		y = y + 1
		if y >= tonumber(arg[2]) then
			y = 0
			x = x + 1
		end
	end
	mouse_x, mouse_y = love.mouse.getPosition()

	time = 1

	canvas = love.graphics.newCanvas(love.window.getWidth(), love.window.getHeight())
end

function exec(val, op)
	return val * op
end

function love.update(dt)
	time = time + dt
	mouse_x, mouse_y = love.mouse.getPosition()
	OverTime:update(dt)

	love.graphics.setCanvas(canvas)
	canvas:clear()


	for i=1,max do
		-- if t1[i].n == 0 then
		-- 	love.graphics.setColor(100, 100, 100, 100)
		-- else
		-- 	love.graphics.setColor(200, 200, 200, 200)
		-- end
			love.graphics.setColor(
				--exec((t1[i].x * t1[i].y + time * 64) / 64, 1),
				exec(255, 1),
				exec(255, (t1[i].x * t1[i].y + cos:get() * 1)),
				exec(255, 1),
				-- exec(255,1),
					--(t1[i].x * t1[i].y
				-- + sin:get()
					--)),
				-- exec(255,1),
				--(t1[i].x * t1[i].y
				-- + (cos:get() + sin:get())
					--)),
				exec(255, (t1[i].x * t1[i].y) / scale)
			)
			-- love.graphics.rectangle("line", t1[i].x + 1, t1[i].y + 1, size - 2, size - 2)
			love.graphics.circle("fill", t1[i].x + 1, t1[i].y + 1, (size / 2) - 2)
			-- t1[i].n = time
			love.setBlank()
	end
	love.graphics.setCanvas()

	FPS:update(dt)
end

function love.draw()
	love.graphics.print(time, love.window.getWidth() - 52, 10)
	love.graphics.draw(canvas)
	-- FPS:draw()
	-- OverTime:draw()
	-- love.setBlank()
end

function love.mousepressed( x, y, button )
	if button == 'wu' then
		scale = scale + 1
	end
	if button == 'wd' then
		if scale > 1 then
			scale = scale - 1
		end
	end
end
