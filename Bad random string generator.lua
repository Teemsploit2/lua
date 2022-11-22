--[[
 ____   __   ____        ____  ____  ____   __   __ _   ___         ___  ____  __ _  ____  ____   __   ____   __   ____ 
(  _ \ / _\ (    \      / ___)(_  _)(  _ \ (  ) (  ( \ / __)       / __)(  __)(  ( \(  __)(  _ \ / _\ (_  _) /  \ (  _ \
 ) _ (/    \ ) D (      \___ \  )(   )   /  )(  /    /( (_ \      ( (_ \ ) _) /    / ) _)  )   //    \  )(  (  O ) )   /
(____/\_/\_/(____/      (____/ (__) (__\_) (__) \_)__) \___/       \___/(____)\_)__)(____)(__\_)\_/\_/ (__)  \__/ (__\_)
]]--
local a = math.random(1, 20)
local i = math.random(a, a)
local b = 0
local function c(d, e)
    b = b + 1
    if d ~= nil and e ~= nil then
        return math.floor(d + math.random(math.randomseed(os.clock() + b)) * 999999 % e)
    else
        return math.floor(math.random(math.randomseed(os.clock() + b)) * 100)
    end
end
function h(f)
    local g = ""
    for h = 1, f do
        g = g .. string.char(math.random(97, 122))
    end
    return g
end
local i = c()
print(h(c(i, i)))
