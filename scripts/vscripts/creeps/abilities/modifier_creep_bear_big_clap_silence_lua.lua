modifier_creep_bear_big_clap_silence_lua = class({})
--------------------------------------------------------------------------------

function modifier_creep_bear_big_clap_silence_lua:IsDebuff()
    return true
end
--------------------------------------------------------------------------------

function modifier_creep_bear_big_clap_silence_lua:IsSilenced()
    return true
end
----------------------------------------------------------------------------------

function modifier_creep_bear_big_clap_silence_lua:GetEffectName()
    return "particles/generic_gameplay/generic_silenced.vpcf"
end

--------------------------------------------------------------------------------

function modifier_creep_bear_big_clap_silence_lua:GetEffectAttachType()
    return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_creep_bear_big_clap_silence_lua:CheckState()
    local state = {
        [MODIFIER_STATE_SILENCED] = true,
    }

    return state
end

--------------------------------------------------------------------------------