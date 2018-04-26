modifier_rebels_disarmor_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_rebels_disarmor_effect_lua:IsHidden()
    return false
end

--------------------------------------------------------------------------------

function modifier_rebels_disarmor_effect_lua:DestroyOnExpire()
    return true
end

--------------------------------------------------------------------------------

function modifier_rebels_disarmor_effect_lua:IsDebuff()
    return true
end

--------------------------------------------------------------------------------

function modifier_rebels_disarmor_effect_lua:GetEffectName()
    return "particles/disarmor/disarmor.vpcf"
end
--------------------------------------------------------------------------------

function modifier_rebels_disarmor_effect_lua:GetEffectAttachType()
    return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_rebels_disarmor_effect_lua:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    }
    return funcs
end

--------------------------------------------------------------------------------

function modifier_rebels_disarmor_effect_lua:GetModifierPhysicalArmorBonus( params )
    return -(self:GetStackCount())
end

--------------------------------------------------------------------------------