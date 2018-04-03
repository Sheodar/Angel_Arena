axe_counter_helix_recode = class({})
LinkLuaModifier( "modifier_axe_counter_helix_recode_lua", "heroes/axe/modifier_axe_counter_helix_recode_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_axe_counter_helix_recode_cooldown_lua", "heroes/axe/modifier_axe_counter_helix_recode_cooldown_lua", LUA_MODIFIER_MOTION_NONE )


--------------------------------------------------------------------------------

function axe_counter_helix_recode:GetIntrinsicModifierName()
    return "modifier_axe_counter_helix_recode_lua"
end

--------------------------------------------------------------------------------