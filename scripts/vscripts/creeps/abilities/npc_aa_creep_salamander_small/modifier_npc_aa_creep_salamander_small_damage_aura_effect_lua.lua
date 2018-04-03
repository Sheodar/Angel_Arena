modifier_npc_aa_creep_salamander_small_damage_aura_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_small_damage_aura_effect_lua:IsHidden()
	return true
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_small_damage_aura_effect_lua:IsDebuff()
	return false
end

--------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_small_damage_aura_effect_lua:OnCreated( kv )
	self.bonus_dmg = self:GetAbility():GetSpecialValueFor( "bonus_dmg" )
end

-------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_small_damage_aura_effect_lua:OnRefresh( kv )
	self.bonus_dmg = self:GetAbility():GetSpecialValueFor( "bonus_dmg" )
end

-------------------------------------------------------------------------------
function modifier_npc_aa_creep_salamander_small_damage_aura_effect_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
	}
	return funcs
end

-------------------------------------------------------------------------------

function modifier_npc_aa_creep_salamander_small_damage_aura_effect_lua:GetModifierPreAttack_BonusDamage ( params )
	if self:GetCaster():PassivesDisabled() then
		return 0
	end
	return self.bonus_dmg
end

-------------------------------------------------------------------------------