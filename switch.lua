-- blank class
switch = {}

local id = 0

-- create a basic switch utilizing predefined table
function switch:new(case_table)

    local object = {}

    object.case_table = case_table

    object.id = id

    id = id + 1

    setmetatable(object, self)

    self.__index = self

    return object
end

-- let the programmer actually use it during runtime for matching cases
function switch:match(case)

    -- only check against existing entities
    if self.case_table[case] then
        self.case_table[case]()
    end
end