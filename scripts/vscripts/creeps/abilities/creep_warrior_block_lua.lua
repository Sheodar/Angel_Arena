creep_warrior_block_lua = class({})
LinkLuaModifier("modifier_creep_warrior_block_lua", "creeps/abilities/modifier_creep_warrior_block_lua", LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------
function creep_warrior_block_lua:OnSpellStart()
    self.duration = self:GetSpecialValueFor("duration")
    self.block = self:GetSpecialValueFor("block")

    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_creep_warrior_block_lua", { duration = self.duration })
--    self:GetCursorTarget():GetCaster():SetModifierStackCount("modifier_creep_warrior_block_lua", self:GetCaster(), self.block)

end

--------------------------------------------------------------------------------