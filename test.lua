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

-- another addition is allowing the switch statement to do some things with automated input!

local my_mathematical_switch = switch:new({
    add = function(input_table)
        local i = input_table
        print("add: " .. tostring(i[1]) .. " + " .. tostring(i[2]) .. "! " .. i[1] + i[2])
    end,
    subtract = function(input_table)
        local i = input_table
        print("subtract: " .. tostring(i[1]) .. " - " .. tostring(i[2]) .. "! " .. i[1] - i[2])
    end
}):match("add", {1,1})

my_mathematical_switch:match("subtract", {5,100})


print("\n")

--[[
we can take this even further!

we can utilize the tuple output to not only assign a value, but instantly get usable data from it!
]]--

local crazy_switch,an_important_message = switch:new({
    need_this = function(input_table)

        print("WE'RE DOING SOMETHING VERY IMPORTANT HERE!!")

        if input_table and #input_table > 1 then
            return "hi"
        end
    end
}):match("need_this", {"some", "data"})

print(an_important_message)

-- or we could do this without inlining, keep in mind this is an unpack, nullify the first value
local _,another_important_message = crazy_switch:match("need_this", {"more", "data"})

print(another_important_message)