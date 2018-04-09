modifier_npc_aa_creep_centaur_big_aura_effect_hp_regen_lua = class({})

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_big_aura_effect_hp_regen_lua:IsHidden()
	return true
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_big_aura_effect_hp_regen_lua:IsDebuff()
	return false
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_big_aura_effect_hp_regen_lua:OnCreated( kv )
	self.regen_hp = self:GetAbility():GetSpecialValueFor( "regen_hp" )
end

-------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_big_aura_effect_hp_regen_lua:OnRefresh( kv )
	self.regen_hp = self:GetAbility():GetSpecialValueFor( "regen_hp" )
end

-------------------------------------------------------------------------------
function modifier_npc_aa_creep_centaur_big_aura_effect_hp_regen_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
	}
	return funcs
end

-------------------------------------------------------------------------------

function modifier_npc_aa_creep_centaur_big_aura_effect_hp_regen_lua:GetModifierConstantHealthRegen( params )
	if self:GetCaster():PassivesDisabled() then
		return 0
	end
	return self.regen_hp
end

-------------------------------------------------------------------------------