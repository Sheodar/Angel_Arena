modifier_megacreep_warrior_passive_rage_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_effect_lua:IsHidden()
    return false
end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_effect_lua:DestroyOnExpire()
    return true
end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_effect_lua:IsDebuff()
    return false
end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_effect_lua:OnCreated( kv )
    self.bonus_damage_per_stack = self:GetAbility():GetSpecialValueFor( "bonus_damage_per_stack" )
end

--------------------------------------------------------------------------------
function modifier_megacreep_warrior_passive_rage_effect_lua:OnRefresh( kv )
    self.bonus_damage_per_stack= self:GetAbility():GetSpecialValueFor( "bonus_damage_per_stack" )
end
-------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_effect_lua:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    }
    return funcs
end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_effect_lua:GetModifierPreAttack_BonusDamage( params )
    return self.bonus_damage_per_stack * self:GetStackCount()
end

--------------------------------------------------------------------------------