modifier_harpy_small_dive_active = class({})
--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:IsHidden()
    return false
end

--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:RemoveOnDeath()
    return true
end

--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:IsDebuff()
    return false
end

--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:IsPurgable()
    return false
end

--------------------------------------------------------------------------------

function modifier_harpy_small_dive_active:DestroyOnExpire()
    return true
end

--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
    }

    return funcs
end

--------------------------------------------------------------------------------

function modifier_harpy_small_dive_active:CheckState()
    local state = {
        [MODIFIER_STATE_STUNNED] = true,
    }

    return state
end

--------------------------------------------------------------------------------

function modifier_harpy_small_dive_active:OnCreated(kv)

    if IsServer() then
        self.caster = self:GetParent()
        self.vfCaster = self:GetParent():GetForwardVector()
        self.fSpeed = kv.speed
        self.height = kv.height
        self.damage = kv.damage
        self.radius = kv.radius
        self.sPoint = self:GetParent():GetAbsOrigin()
        self.nTeam = self:GetParent():GetTeamNumber()
        self.vPoint = self:GetCaster():GetAbsOrigin() + Vector(0, 0, self.height)

        local motion = self:ApplyVerticalMotionController()

        if motion == false then
            self:Destroy()
        end
    end
end

--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:UpdateVerticalMotion(me, dt)
    if IsServer() then
--        if self and self:GetAbility() ~= nil and self:GetParent() ~= nil and self:GetParent():IsAlive() then
--            local vParent_point = self:GetParent():GetAbsOrigin()
--            self:GetParent():SetAbsOrigin(vParent_point + ((self.vPoint - vParent_point):Normalized()) * self.fSpeed)
--        else
--            self:GetParent():InterruptMotionControllers(true)
--        end
        if self and self:GetAbility() ~= nil and self:GetParent() ~= nil and self:GetParent():IsAlive() then
            local vParent_point = self:GetParent():GetAbsOrigin()
            if (self.vPoint - vParent_point):Length() < 150 then
                self:GetParent():InterruptMotionControllers(true)
            else
                if self:GetParent():IsAlive() then
                    self:GetParent():SetAbsOrigin( vParent_point + ((self.vPoint - vParent_point):Normalized() ) * self.fSpeed)
                end
            end

        else
            self:GetParent():InterruptMotionControllers(true)
        end
    end
end

--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:OnVerticalMotionInterrupted()
    if IsServer() then
        self:Destroy()
    end
end

--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:OnDestroy()
    if IsServer() then
        GridNav:DestroyTreesAroundPoint(self.sPoint, 150, true)
        self:GetParent():InterruptMotionControllers(true)
        local enemies = FindUnitsInRadius(self.nTeam, self.sPoint, nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)

        if #enemies > 0 then
            for _, enemy in pairs(enemies) do
                if enemy ~= nil and (not enemy:IsMagicImmune()) and (not enemy:IsInvulnerable()) then
                    local info = {
                        victim = enemy,
                        attacker = self:GetParent(),
                        damage = self.damage,
                        damage_type = DAMAGE_TYPE_MAGICAL,
                    }
                    ApplyDamage(info)
                end
            end
        end
    end
end

--------------------------------------------------------------------------------
function modifier_harpy_small_dive_active:GetOverrideAnimation(params)
    return ACT_DOTA_SLARK_POUNCE
end


--------------------------------------------------------------------------------