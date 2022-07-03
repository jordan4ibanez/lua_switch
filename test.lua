require("switch")

local test_switch = switch:new({
    test = function()
        print("test worked")
    end,
    [5] = function()
        print("math is cool")
    end
})

test_switch:match("test")
test_switch:match(5)