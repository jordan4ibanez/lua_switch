require("switch")

-- a basic switch statement definition
local test_switch = switch:new({
    test = function()
        print("test worked")
    end,

    [5] = function()
        print("math is cool")
    end
})

-- we utilize it
test_switch:match("test")
test_switch:match(5)

-- another one defined
local name_switch = switch:new({
    fred = function()
        print("wow fred is awesome!")
    end,
    jonny = function()
        print("yeah that's jonny")
    end
})

print("\n")

-- we utilize it like so
local name_repo = {
    "frank", "fred", "john", "jonny", "zoop"
}

for _,name in ipairs(name_repo) do
    name_switch:match(name)
end

print("\n")

-- we can also inline this whole thing
local my_functional_switch = switch:new({
    test = function()
        print("YEAH THIS WORKS BOI")
    end,
    [100] = function()
        print("that's a pretty big number")
    end,
    [false] = function()
        print("yeah that's wrong")
    end
}):match(false)