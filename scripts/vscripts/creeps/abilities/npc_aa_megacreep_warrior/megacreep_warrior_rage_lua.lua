megacreep_warrior_rage_lua = class({})
LinkLuaModifier( "modifier_megacreep_warrior_rage_lua", "creeps/abilities/npc_aa_megacreep_warrior/modifier_megacreep_warrior_rage_lua", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function megacreep_warrior_rage_lua:OnSpellStart()
    self:GetCaster():AddNewModifier( self:GetCaster(), self, "modifier_megacreep_warrior_rage_lua", { duration = self:GetSpecialValueFor( "rage_duration" ) }  )
end

--------------------------------------------------------------------------------