modifier_npc_aa_creep_centaur_small_disarmor_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:IsHidden()
    return false
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:DestroyOnExpire()
    return true
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:IsDebuff()
    return true
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:OnCreated( kv )
    self.disarmor_per_stack = self:GetAbility():GetSpecialValueFor( "disarmor_per_stack" )
end

--------------------------------------------------------------------------------
function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:OnRefresh( kv )
    self.disarmor_per_stack= self:GetAbility():GetSpecialValueFor( "disarmor_per_stack" )
end
-------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:GetEffectName()
    return "particles/disarmor/disarmor.vpcf"
end
--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:GetEffectAttachType()
    return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    }
    return funcs
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_small_disarmor_effect_lua:GetModifierPhysicalArmorBonus( params )
    return -(self.disarmor_per_stack * self:GetStackCount())
end

--------------------------------------------------------------------------------