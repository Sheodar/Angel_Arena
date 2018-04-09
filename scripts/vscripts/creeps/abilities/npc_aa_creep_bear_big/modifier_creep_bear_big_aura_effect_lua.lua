modifier_creep_bear_big_aura_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_creep_bear_big_aura_effect_lua:IsHidden()
	return false
end

--------------------------------------------------------------------------------

function modifier_creep_bear_big_aura_effect_lua:IsDebuff()
	return false
end

--------------------------------------------------------------------------------

function modifier_creep_bear_big_aura_effect_lua:OnCreated( kv )
	self.bonus_attack = self:GetAbility():GetSpecialValueFor( "bonus_attack" )
end

--------------------------------------------------------------------------------

function modifier_creep_bear_big_aura_effect_lua:OnRefresh( kv )
	self.bonus_attack = self:GetAbility():GetSpecialValueFor( "bonus_attack" )
end

--------------------------------------------------------------------------------

function modifier_creep_bear_big_aura_effect_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
	}
	return funcs
end

--------------------------------------------------------------------------------

function modifier_creep_bear_big_aura_effect_lua:GetModifierBaseDamageOutgoing_Percentage( params )
	if self:GetCaster():PassivesDisabled() then
		return 0
	end
	return self.bonus_attack
end

--------------------------------------------------------------------------------

