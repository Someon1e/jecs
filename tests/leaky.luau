local ecs = require("@jecs")

local world = ecs.World.new()
local A, B, C, D =
    world:component(),
    world:component(),
    world:component(),
    world:component()

local function flip()
	return math.random() >= 0.5
end

for i = 1, 2 ^ 16 - 2 do
	local entity = world:entity()

	if flip() then
	    world:set(entity, A, 10)
	end
	if flip() then
	    world:set(entity, B, 10)
	end
	if flip() then
	    world:set(entity, C, 10)
	end
	if flip() then
	    world:set(entity, D, 10)
	end
end

local m = collectgarbage("count")
local s = gcinfo()
local t = os.clock()
for i = 1, 100_000 do
    local q = world:query(A)
    q = world:query(B)
end
print("time took for queries: ", os.clock() - t)
print("allocated memory: ", collectgarbage("count") - m)
t = os.clock()
collectgarbage("collect")
print("gc cycle time:", os.clock() - t)
print("persistent memory left:", gcinfo() - s)
