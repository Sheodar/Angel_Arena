modifier_npc_aa_creep_salamander_big_hp_aura_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_big_hp_aura_effect_lua:IsHidden()
	return true
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_big_hp_aura_effect_lua:IsDebuff()
	return false
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_big_hp_aura_effect_lua:OnCreated( kv )
	self.bonus_hp = self:GetAbility():GetSpecialValueFor( "bonus_hp" )
end

-------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_big_hp_aura_effect_lua:OnRefresh( kv )
	self.bonus_hp = self:GetAbility():GetSpecialValueFor( "bonus_hp" )
end

-------------------------------------------------------------------------------
function modifier_npc_aa_creep_salamander_big_hp_aura_effect_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_BONUS,
	}
	return funcs
end

-------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_big_hp_aura_effect_lua:GetModifierHealthBonus ( params )
	if self:GetCaster():PassivesDisabled() then
		return 0
	end
	return self.bonus_hp
end

-------------------------------------------------------------------------------