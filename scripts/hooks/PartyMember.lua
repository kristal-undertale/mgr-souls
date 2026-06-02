local PartyMember, super = HookSystem.hookScript(PartyMember)

function PartyMember:init()
    super.init(self)

    -- Whether the soul will be upside-down or not (optional)
    self.monster_soul = false
end

function PartyMember:getMonsterSoul() return self.monster_soul end

return PartyMember
