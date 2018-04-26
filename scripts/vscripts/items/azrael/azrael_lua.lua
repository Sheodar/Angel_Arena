azrael_lua = class({})
LinkLuaModifier("azrael_lua_cooldown_lua", "items/azrael/azrael_lua_cooldown_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("azrael_lua_stopspam_lua", "items/azrael/azrael_lua_stopspam_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_azrael_lua", "items/azrael/modifier_azrael_lua", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------

function azrael_lua:GetIntrinsicModifierName()
    return "modifier_azrael_lua"
end

--------------------------------------------------------------------------------