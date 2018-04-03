creep_mage_multi_ball_lua = class({})

--------------------------------------------------------------------------------

function creep_mage_multi_ball_lua:GetChannelTime()
    self.duration = self:GetSpecialValueFor("duration")
    if IsServer() then
        return self.duration
    end
    return self.duration
end

--------------------------------------------------------------------------------
function creep_mage_multi_ball_lua:OnSpellStart()
    self.damage = self:GetSpecialValueFor("damage")
    self.interval = self:GetSpecialValueFor("interval")
    self.duration = self:GetSpecialValueFor("duration")
    self.radius = self:GetSpecialValueFor("radius")
    self.speed_ball = self:GetSpecialValueFor("speed_ball")
    self.ball_width = self:GetSpecialValueFor("ball_width")
    print ("1", self:GetCaster())
    if IsServer() then
        print ("serv", self:GetCaster())
        Timers:CreateTimer(0.01, function()
            print ("timer", self:GetCaster())
            local vDirection = RandomVector(self.radius)
            local info = {
                EffectName = "particles/units/heroes/hero_vengeful/vengeful_wave_of_terror.vpcf",
                Ability = self,
                vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
                fStartRadius = self.ball_width,
                fEndRadius = self.ball_width,
                vVelocity = vDirection:Normalized() * self.speed_ball,
                fDistance = self:GetCastRange( self:GetCaster():GetOrigin(), self:GetCaster() ),
                Source = self:GetCaster(),
                iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
                iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
                iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
            }
            ProjectileManager:CreateLinearProjectile(info)
            for i,x in pairs(info) do print(i,x) end
            return self.interval
        end)
    end
end

--------------------------------------------------------------------------------
function creep_mage_multi_ball_lua:GetChannelTime()
    if IsServer() then
        return self.duration
    end
    return self.duration
end

--------------------------------------------------------------------------------