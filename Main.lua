local function load(...)
    local args = {...}
    local c = {}
    c.load = args.load or false
    if type(c.load):match("table") then
        return "not loading"    
    end
end

load()
error("remaking script")
