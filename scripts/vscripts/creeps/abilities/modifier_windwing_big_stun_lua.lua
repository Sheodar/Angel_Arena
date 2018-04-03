modifier_windwing_big_stun_lua = class({})
--------------------------------------------------------------------------------

function modifier_windwing_big_stun_lua:IsDebuff()
    return true
end
--------------------------------------------------------------------------------

function modifier_windwing_big_stun_lua:GetEffectName()
    return "particles/econ/generic/generic_projectile_tracking_1/generic_projectile_tracking_1_explosion.vpcf"
end

--------------------------------------------------------------------------------

function modifier_windwing_big_stun_lua:GetEffectAttachType()
    return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_windwing_big_stun_lua:CheckState()
    local state = {
        [MODIFIER_STATE_STUNNED] = true,
    }

    return state
end

--------------------------------------------------------------------------------