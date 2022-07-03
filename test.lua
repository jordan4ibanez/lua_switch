require("switch")

local test_switch = switch:new({
    test = function()
        print("test worked")
    end,

    [5] = function()
        print("math is cool")
    end
})


local name_switch = switch:new({
    fred = function()
        print("wow fred is awesome!")
    end,
    jonny = function()
        print("yeah that's jonny")
    end
})


test_switch:match("test")
test_switch:match(5)


local name_repo = {
    "frank", "fred", "john", "jonny", "zoop"
}



for _,name in ipairs(name_repo) do
    name_switch:match(name)
end
