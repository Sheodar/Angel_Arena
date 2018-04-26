modifier_azrael_lua = class({})

-----------------------------------------------------------------------------
function modifier_azrael_lua:IsHidden()
    return true
end

--------------------------------------------------------------------------------
function modifier_azrael_lua:OnCreated(kv)
    self.cooldown = self:GetAbility():GetSpecialValueFor("cooldown")
end

--------------------------------------------------------------------------------
function modifier_azrael_lua:OnRefresh(kv)
    self.cooldown = self:GetAbility():GetSpecialValueFor("cooldown")
end

-------------------------------------------------------------------------------
function modifier_azrael_lua:DeclareFunctions()
    local funcs = {
        MODIFIER_EVENT_ON_ATTACK,
    }
    return funcs
end

-------------------------------------------------------------------------------
function modifier_azrael_lua:OnAttack(params)
    if not IsServer() then return end
    local caster = params.attacker

    if caster:FindModifierByName("azrael_lua_stopspam_lua") then return end
    if caster:FindModifierByName("azrael_lua_cooldown_lua") then return end

    caster:AddNewModifier(caster, self:GetAbility(), "azrael_lua_cooldown_lua", { duration = self.cooldown })
    self:GetAbility():StartCooldown(self.cooldown)
    local target = params.target
    if caster:GetUnitName() == "npc_dota_hero_weaver" or not caster:IsRangedAttacker() or caster:IsIllusion() or caster:IsHexed() then return end

    local attack_time = 1 / caster:GetAttacksPerSecond()
    local delay = attack_time / 3
    caster:AddNewModifier(caster, self:GetAbility(), "azrael_lua_stopspam_lua", { duration = delay })

    Timers:CreateTimer(delay / 1.5,
        function()
            caster:PerformAttack(target, true, true, true, true, true, false, false)
        end)
end

-------------------------------------------------------------------------------