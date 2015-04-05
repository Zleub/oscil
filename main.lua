--          `--::-.`
--      ./shddddddddhs+.
--    :yddddddddddddddddy:
--  `sdddddddddddddddddddds`
--  ydddh+sdddddddddy+ydddds  demo:main
-- /ddddy:oddddddddds:sddddd/ By adebray - adebray
-- sdddddddddddddddddddddddds
-- sdddddddddddddddddddddddds Created: 2015-03-27 13:30:45
-- :ddddddddddhyyddddddddddd: Modified: 2015-04-02 23:14:53
--  odddddddd/`:-`sdddddddds
--   +ddddddh`+dh +dddddddo
--    -sdddddh///sdddddds-
--      .+ydddddddddhs/.
--          .-::::-`

FPS = require 'lib.FPS'
OverTime = require 'lib.OverTime'
EasyColor = require 'lib.EasyColor'
EasyMath = require 'lib.EasyMath'

function add(x)
	-- print((math.cos(x) + math.sin(x)) / 4)
	return ((math.cos(x) + math.sin(x)) / 4) + 0.5
end

scale = 50
var1 = 0
mode = 'line'
shape = 'circle'

function love.load()
	FPS:new(1)

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
				table.insert(t1, {n = math.random(0, 255), x = x * Wsize, y = y * Hsize})
		y = y + 1
		if y >= scale then
			y = 0
			x = x + 1
		end
	end
	mouse_x, mouse_y = love.mouse.getPosition()

	time = 1

	canvas = love.graphics.newCanvas(love.window.getWidth(), love.window.getHeight())

	cos1 = OverTime:new(EasyMath.pnormal.cos, {r = 0, g = 0, b = 0}, 1 * math.pi / 3)
	cos2 = OverTime:new(EasyMath.pnormal.cos, {r = 0, g = 0, b = 0}, 3 * math.pi / 3)
	cos3 = OverTime:new(EasyMath.pnormal.cos, {r = 0, g = 0, b = 0}, 5 * math.pi / 3)
	-- cos5 = OverTime:new(math.cos, {r = 0, g = 0, b = 200}, math.pi / 2)
	-- cos5 = OverTime:new(EasyMath.pnormal.cos, {r = 200, g = 0, b = 0}, math.pi)
	add1 = OverTime:new(add, {r = 0, g = 200, b = 0})
	add2 = OverTime:new(add, {r = 0, g = 200, b = 0}, math.pi)
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


		-- if math.floor((i % scale) % 3) == 1 and math.floor(((i % scale) + j) % 3) == 1 then
		-- 	love.graphics.setColor(
		-- 		-- exec((t1[i].x * t1[i].y + time * 64) / 64, 1),
		-- 		exec(255, 1),
		-- 		exec(255, cos1:get()),
		-- 		exec(255, 0),
		-- 		exec(255, (t1[i].x * t1[i].y + time * var1) / var1)
		-- 		-- exec(255,1),
		-- 			--(t1[i].x * t1[i].y
		-- 		-- + sin:get()
		-- 			--)),
		-- 		-- exec(255,1),
		-- 		--(t1[i].x * t1[i].y
		-- 		-- + (cos:get() + sin:get())
		-- 			--)),
		-- 		-- exec(255, (t1[i].x * t1[i].y + time * scale) / scale)
		-- 	)
		-- else
			love.graphics.setColor(
				--exec((t1[i].x * t1[i].y + time * 64) / 64, 1),
				exec(255, cos1:get()),
				exec(255, cos2:get()),
				exec(255, cos3:get()),
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
		if shape == 'rect' then
			love.graphics.rectangle(mode, t1[i].x + 1, t1[i].y + 1, Wsize - 2, Hsize - 2)
		elseif shape == 'circle' then
			love.graphics.circle(mode, t1[i].x + (Wsize / 2), t1[i].y + (Hsize / 2), (Wsize / 2) - 2)
		end
			-- t1[i].n = time
			EasyColor.setBlank()
		if i % scale == 0 then
			j = j + 1
		end
	end

	love.graphics.setCanvas()

	FPS:update(dt)
end

-- function love.load()
-- 	t = {}

-- 	Wsize = love.window.getWidth() / scale
-- 	Hsize = love.window.getHeight() / scale

-- 	img = love.graphics.newImage("O.png")
-- 	data = img:getData()

-- 	i = 0
-- 	j = 0
-- 	data:mapPixel( function (x, y, r, g, b, a)
-- 		print("x", x, "y", y)
-- 		print("i", i, "j", j)
-- 		table.insert(t, {x = i * Wsize, y = j * Hsize, r = r, g = g, b = b, a = a})
-- 		j = j + 1
-- 		if j >= scale then
-- 			j = 0
-- 			i = i + 1
-- 		end
-- 		return r, g, b, a
-- 	end)

-- 	canvas = love.graphics.newCanvas(love.window.getWidth(), love.window.getHeight())
-- end

-- function love.update(dt)
-- 	love.graphics.setCanvas(canvas)
-- 		for i,v in ipairs(t) do
-- 			love.graphics.setColor(v.r, v.g, v.b, v.a)
-- 			love.graphics.rectangle('line', v.x, v.y, Wsize, Hsize)
-- 			EasyColor.setBlank()
-- 		end
-- 	love.graphics.setCanvas()
-- end

function love.draw()
	love.graphics.draw(canvas)
	-- OverTime:draw()
	-- EasyColor.setBlank()
	-- FPS:draw()
end

function love.keypressed(key, unicode)
	if key == 'up' then
		var1 = var1 + 1
	elseif key == 'down' then
		var1 = var1 - 1
	elseif key == '1' then
		if mode == 'line' then mode = 'fill'
		else mode = 'line' end
	elseif key == '2' then
		if shape == 'circle' then shape = 'rect'
		else shape = 'circle' end
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
