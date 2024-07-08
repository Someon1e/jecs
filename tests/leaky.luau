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

for i = 1, 2 ^ 20 - 2 do
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

local s = gcinfo()
for i = 1, 100 do
    local q = world:query(A)
end

print(gcinfo() - s)
