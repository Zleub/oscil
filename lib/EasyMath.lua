--          `--::-.`
--      ./shddddddddhs+.
--    :yddddddddddddddddy:
--  `sdddddddddddddddddddds`
--  ydddh+sdddddddddy+ydddds  demo:EasyMath
-- /ddddy:oddddddddds:sddddd/ By adebray - adebray
-- sdddddddddddddddddddddddds
-- sdddddddddddddddddddddddds Created: 2015-04-02 15:33:19
-- :ddddddddddhyyddddddddddd: Modified: 2015-04-02 15:44:07
--  odddddddd/`:-`sdddddddds
--   +ddddddh`+dh +dddddddo
--    -sdddddh///sdddddds-
--      .+ydddddddddhs/.
--          .-::::-`

EasyMath = {}

EasyMath.positif = {} -- if math.X < 0 then return math.X * -1 end
EasyMath.pnormal = {} -- always positif in range [0-1]

function EasyMath.positif.cos(x)
	local c = math.cos(x)
	if c < 0 then
		return c * -1
	else
		return c
	end
end

function EasyMath.positif.sin(x)
	local s = math.sin(x)
	if s < 0 then
		return s * -1
	else
		return s
	end
end

function EasyMath.pnormal.cos(x)
	return (math.cos(x) / 2) + 0.5
end

function EasyMath.pnormal.sin(x)
	return (math.sin(x) / 2) + 0.5
end

return EasyMath
