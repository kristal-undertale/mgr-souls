local LightSoul, super = HookSystem.hookScript(LightSoul)

function LightSoul:setMonsterSoul(value)
    if self.sprite then
        if value == true then
            self.sprite:setSprite("player/monster/heart_light")
        elseif value == false then
            self.sprite:setSprite("!player/heart_light")
        else
            self.sprite:setSprite("player/heart_light")
        end
    end
    if self.graze_sprite then
        if value == true then
            self.graze_sprite.texture = Assets.getTexture("player/monster/graze")
        elseif value == false then
            self.graze_sprite.texture = Assets.getTexture("!player/graze")
        else
            self.graze_sprite.texture = Assets.getTexture("player/graze")
        end
    end
end

return LightSoul
