creep_bear_small_regen_lua = class({})
LinkLuaModifier( "modifier_creep_bear_small_regen_lua", "creeps/abilities/npc_aa_creep_bear_small/modifier_creep_bear_small_regen_lua", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function creep_bear_small_regen_lua:GetIntrinsicModifierName()
    return "modifier_creep_bear_small_regen_lua"
end

--------------------------------------------------------------------------------