modifier_npc_aa_creep_wolf_small_crit_lua = class({})
--------------------------------------------------------------------------------
function modifier_npc_aa_creep_wolf_small_crit_lua:IsDebuff()
    return false
end

--------------------------------------------------------------------------------
function modifier_npc_aa_creep_wolf_small_crit_lua:IsHidden()
    return false
end

--------------------------------------------------------------------------------
function modifier_npc_aa_creep_wolf_small_crit_lua:OnCreated(kv)
    self.crit_chance = self:GetAbility():GetSpecialValueFor("crit_chance")
    self.crit_damage = self:GetAbility():GetSpecialValueFor("crit_damage")
end

-------------------------------------------------------------------------------
function modifier_npc_aa_creep_wolf_small_crit_lua:OnRefresh(kv)
    self.crit_chance = self:GetAbility():GetSpecialValueFor("crit_chance")
    self.crit_damage = self:GetAbility():GetSpecialValueFor("crit_damage")
end

--------------------------------------------------------------------------------
function modifier_npc_aa_creep_wolf_small_crit_lua:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
    }
    return funcs
end

--------------------------------------------------------------------------------
function modifier_npc_aa_creep_wolf_small_crit_lua:GetModifierPreAttack_CriticalStrike(params)
    if IsServer() then
        if self:GetCaster():PassivesDisabled() then
            return 0
        end
        if params.target ~= nil and RollPercentage(self.crit_chance) then
            return self.crit_damage
        end
    end
end

-----------------------------------------------------------------------------
