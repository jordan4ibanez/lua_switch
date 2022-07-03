require("ecs")

-- build upon existing API
switch = ecs:new()

-- create a basic ecs with required internal components
function switch:new(case_table)

    local object = {}

    setmetatable(object, self)

    self.__index = self

    self.entity_count = 0

    object:add_components({
        "case",
        "func"
    })

    object:initialize(case_table)

    return object
end

-- allow end programmer to implement cases
function switch:initialize(case_table)

    -- see if there is already a case for it
    local cases = self:get_component("case")

    -- run through defined cases
    for case,defined_func in pairs(case_table) do

        -- only check against existing entities
        if self.entity_count > 0 then
            for i = 1,self.entity_count do
                -- don't allow duplicate cases
                assert(cases[i] ~= case, "CASE: " .. tostring(case) .. " IS A DUPLICATE SWITCH CASE!")
            end
        end

        -- successfully added case
        self:add_entity({
            case = case,
            func = defined_func
        })
    end

    return self
end

-- let the programmer actually use it during runtime for matching cases
function switch:match(case)
    -- see if there is already a case for it
    local cases = self:get_component("case")
    local funcs = self:get_component("func")

    -- only check against existing entities
    if self.entity_count > 0 then
        for i = 1,self.entity_count do
            if cases[i] == case then
                funcs[i]()
            end
        end
    end
end