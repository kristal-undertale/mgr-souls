local YellowSoul, super = Class(Soul)

function YellowSoul:init(x, y, undertale, angle)
    super.init(self, x, y)

    self.undertale = undertale -- whether to use undertale yellow soul

    self.rotation = angle or (-math.pi / (self.undertale and 1 or 2))
    self.color = {1, 1, 0}

    -- customizable variables
    self.can_use_shots = true -- whether the soul can use normal shots
    self.can_shoot = true -- whether the soul is allowed to shoot in general

    -- internal variables
    self.shot_timer = 0
    self.ut_shot_timer = 0

    self:setMonsterSoul(false)
end

function YellowSoul:update()
    super.update(self)

    if self.transitioning then
        self.shot_timer = 0
        self.ut_shot_timer = 0
        return
    end

    if self.shot_timer > 0 then
        self.shot_timer = MathUtils.approach(self.shot_timer, 0, DTMULT)
    end
    if self.ut_shot_timer > 0 then
        self.ut_shot_timer = MathUtils.approach(self.ut_shot_timer, 0, DTMULT)
    end

    if not self:canShoot() then return end

    if Input.pressed("confirm") and self.shot_timer == 0 and self:canUseShots() then -- fire normal shot
        self:fireShot(false)
    end
end

function YellowSoul:canUseShots() return self.can_use_shots end
function YellowSoul:canShoot() return self.can_shoot end

function YellowSoul:fireShot(big)
    if self.undertale then
        if #Game.stage:getObjects(YellowSoulShotUndertale) > 0 and self.ut_shot_timer > 0 then return end -- only allow 1 at once or after half a second
        local radius = 2
        local px = math.sin(self.rotation) * radius
        local py = -math.cos(self.rotation) * radius
        Game.battle:addChild(YellowSoulShotUndertale(self.x + px, self.y + py, self.rotation + math.pi / 2))
        Assets.playSound("yellowsoul/heartshot_ut")
        self.ut_shot_timer = 15
    else
        if #Game.stage:getObjects(YellowSoulShot) >= 3 then return end -- only allow 3 at once
        Game.battle:addChild(YellowSoulShot(self.x, self.y, self.rotation + math.pi / 2))
        Assets.playSound("yellowsoul/heartshot")
    end
end

return YellowSoul
