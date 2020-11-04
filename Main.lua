local function load(...)
    local args = {...}
    local c = {}
    c.load = args.load or false
    if type(c.load):match("table") then
        assert(c.load or not c.load, "not loading")
    end
end

load()
