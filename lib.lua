local Lib = {}

function Lib:assetsMonsterSoulCheckOverwrite(path)
    if StringUtils.sub(path, 1, 7) == "player/" and Game:getMonsterSoul() then
        path = StringUtils.sub(path, 1, 7) .. "monster" .. "/" .. StringUtils.sub(path, 8)
    elseif StringUtils.sub(path, 1, 8) == "!player/" then
        return StringUtils.sub(path, 2)
    end

    return path
end

return Lib
