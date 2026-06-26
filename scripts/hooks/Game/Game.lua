local Game, super = HookSystem.hookScript(Game)

function Game:getMonsterSoul()
    local monster_soul = Kristal.callEvent("getMonsterSoul")
    if monster_soul ~= nil then
        return monster_soul
    end

    if self.state == "BATTLE" and self.battle and self.battle.encounter and self.battle.encounter.getMonsterSoul and self.battle.encounter:getMonsterSoul() then
        return self.battle.encounter:getMonsterSoul()
    end

    local chara = self:getSoulPartyMember()

    if chara and chara:getSoulPriority() >= 0 and chara:getMonsterSoul() then
        return chara:getMonsterSoul()
    end

    return false
end

return Game
