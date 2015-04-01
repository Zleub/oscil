--          `--::-.`
--      ./shddddddddhs+.
--    :yddddddddddddddddy:
--  `sdddddddddddddddddddds`
--  ydddh+sdddddddddy+ydddds  demo:main
-- /ddddy:oddddddddds:sddddd/ By adebray - adebray
-- sdddddddddddddddddddddddds
-- sdddddddddddddddddddddddds Created: 2015-03-27 13:30:45
-- :ddddddddddhyyddddddddddd: Modified: 2015-03-31 18:50:11
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

cos_2t = function (x)
	x = x + (math.pi * (4 / 3))
	return (math.cos(x) / 2) + 0.5
end

cos_1t = function (x)
	x = x + (math.pi *(2 / 3))
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
	x = x - math.pi
	return (math.cos(x) / 2) + 0.5
end

function add(x)
	-- print((math.cos(x) + math.sin(x)) / 4)
	return ((math.cos(x) + math.sin(x)) / 4) + 0.5
end

scale = 100
var1 = 0
mode = 'line'
shape = 'circle'

function love.load()
	FPS:new(1)

	-- OverTime:new(math.tan, {r = 0, g = 0, b = 200, a = 255})
	cos = OverTime:new(cos_2, {r = 200, g = 150, b = 0, a = 255})
	cos3 = OverTime:new(cos_2, {r = 100, g = 100, b = 0, a = 255}, math.pi)
	cos1t = OverTime:new(cos_1t, {r = 200, g = 0, b = 0, a = 255})
	cos2t = OverTime:new(cos_2t, {r = 200, g = 0, b = 0, a = 255})
	--mcos = OverTime:new(megacos3, {r = 0, g = 0, b = 200, a = 255})
	-- cos_2 = OverTime:new(cos_2, {r = 100, g = 0, b = 0, a = 255})
	-- OverTime:new(math.sin, {r = 0, g = 255, b = 0, a = 255})
	-- OverTime:new(sin_1, {r = 0, g = 200, b = 0, a = 255})
	--sin = OverTime:new(sin_2, {r = 0, g = 100, b = 0, a = 255})
	--add = OverTime:new(add, {r = 0, g = 00, b = 200, a = 255})
	-- sin = OverTime:new(megasin)
	-- sin2 = OverTime:new(megasin2)
	-- ssin = OverTime:new(supersin)
	-- OverTime:new(math.tan)
	-- OverTime:new(math.exp)
	-- OverTime:new(math.frexp)
	-- log = OverTime:new(math.log, {r = 0, g = 0, b = 200, a = 255})

	-- max = tonumber(arg[2]) * tonumber(arg[2])
	if not arg[2] then arg[2] = 0 end
	if not arg[3] then arg[3] = 255 end

	max = scale * scale
	math.randomseed(love.timer.getTime())
	t1 = {}

	Wsize = love.window.getWidth() / scale
	Hsize = love.window.getHeight() / scale
	local x = 0
	local y = 0

	for i=1,max do
		-- if t1[i - 1] and t1[i - 1].n == 1 then
		-- 	table.insert(t1, {n = 0, x = x * size, y = y * size})
		-- else
		-- 	if t1[i - tonumber(arg[2])] and t1[i - tonumber(arg[2])].n == 1 then
		-- 		table.insert(t1, {n = 0, x = x * size, y = y * size})
		-- 	else
				table.insert(t1, {n = math.random(0, 255), x = x * Wsize, y = y * Hsize})
		-- 	end
		-- end
		y = y + 1
		if y >= scale then
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

	local j = 1
	for i=1,max do
		-- if t1[i].n == 0 then
		-- 	love.graphics.setColor(100, 100, 100, 100)
		-- else
		-- 	love.graphics.setColor(200, 200, 200, 200)
		-- end
		-- print((t1[i].x * t1[i].y + time) % 255)
		-- print(exec((t1[i].x * t1[i].y + time) % 255, 1))

		-- print(i, j)


		-- if math.floor((i % arg[2]) % 3) == 1 and math.floor(((i % arg[2]) + j) % 3) == 1 then
		-- 	love.graphics.setColor(
				--exec((t1[i].x * t1[i].y + time * 64) / 64, 1),
			-- 	exec(255, 1),
			-- 	exec(255, 1),
			-- 	exec(255, 1),
			-- 	exec(255, (t1[i].x * t1[i].y + time * var1) / var1)
			-- 	-- exec(255,1),
			-- 		--(t1[i].x * t1[i].y
			-- 	-- + sin:get()
			-- 		--)),
			-- 	-- exec(255,1),
			-- 	--(t1[i].x * t1[i].y
			-- 	-- + (cos:get() + sin:get())
			-- 		--)),
			-- 	-- exec(255, (t1[i].x * t1[i].y + time * scale) / scale)
			-- )
		-- else
			love.graphics.setColor(
				--exec((t1[i].x * t1[i].y + time * 64) / 64, 1),
				exec(255, 1),
				exec(255, 1),
				exec(255, 1),
				exec(255, (t1[i].x * t1[i].y + time * var1) / var1)
				-- exec(t1[i].n, cos:get()),
				-- exec(t1[i].n, cos1t:get()),
				-- exec(t1[i].n, cos2t:get()),
				-- exec(255, (t1[i].x * t1[i].y + time * var1) / var1)
				-- exec(255,1),
					--(t1[i].x * t1[i].y
				-- + sin:get()
					--)),
				-- exec(255,1),
				--(t1[i].x * t1[i].y
				-- + (cos:get() + sin:get())
					--)),
				-- exec(255, (t1[i].x * t1[i].y + time * scale) / scale)
			)
		-- end
			love.graphics.rectangle("fill", t1[i].x + 1, t1[i].y + 1, Wsize - 2, Hsize - 2)
			-- love.graphics.circle("fill", t1[i].x + 1, t1[i].y + 1, (size / 2) - 2)
			-- t1[i].n = time
			love.setBlank()
		if i % arg[2] == 0 then
			j = j + 1
		end
	end
	love.graphics.setCanvas()

	FPS:update(dt)
end

function love.draw()
	love.graphics.print(time, love.window.getWidth() - 52, 10)
	love.graphics.print(scale, love.window.getWidth() - 52, 25)
	love.graphics.draw(canvas)
	-- FPS:draw()
	-- OverTime:draw()
	-- love.setBlank()
end

function love.keypressed(key, unicode)
	if key == 'up' then
		var1 = var1 + 1
	elseif key == 'down' then
		var1 = var1 - 1
	end
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
	love.load()
end

function love.resize( w, h )

	love.load()
end
