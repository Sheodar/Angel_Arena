rebels_disarmor_lua = class({})
LinkLuaModifier( "modifier_rebels_disarmor_lua", "items/rebel/modifier_rebels_disarmor_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_rebels_disarmor_effect_lua", "items/rebel/modifier_rebels_disarmor_effect_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "rebels_disarmor_cooldown_lua", "items/rebel/rebels_disarmor_cooldown_lua", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function rebels_disarmor_lua:GetIntrinsicModifierName()
    return "modifier_rebels_disarmor_lua"
end

--------------------------------------------------------------------------------