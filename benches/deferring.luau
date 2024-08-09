--!optimize 2
--!native

local testkit = require("@testkit")
local BENCH, START = testkit.benchmark()
local function TITLE(title: string)
	print()
	print(testkit.color.white(title))
end

local jecs = require("@jecs")
local mirror = require("../mirror/init")

type i53 = number

local N = 1000
do TITLE "deferring"
    local world = jecs.World.new()
    local A = world:component()
    local B = world:component()
    local C = world:component()
    local D = world:component()
    local E = world:component()
    local F = world:component()

    BENCH("", function()
        for i = 1, START(N) do
            world:defer()

            for i = 1, 10 do
                local e = world:entity()
                world:set(e, A, 1)
                world:set(e, B, 1)
                world:set(e, C, 1)
                world:set(e, D, 1)
                world:set(e, E, 1)
                world:set(e, F, 1)
            end

            world:merge()
        end
    end)

end

do TITLE "immediate"
    local world = jecs.World.new()
    local A = world:component()
    local B = world:component()
    local C = world:component()
    local D = world:component()
    local E = world:component()
    local F = world:component()

    BENCH("", function()
        for i = 1, START(N) do
            for i = 1, 10 do
                local e = world:entity()
                world:set(e, A, 1)
                world:set(e, B, 1)
                world:set(e, C, 1)
                world:set(e, D, 1)
                world:set(e, E, 1)
                world:set(e, F, 1)
            end

        end
    end)
end
