modifier_windwing_small_aura_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_windwing_small_aura_effect_lua:IsHidden()
	return false
end

--------------------------------------------------------------------------------

function modifier_windwing_small_aura_effect_lua:IsDebuff()
	return false
end

--------------------------------------------------------------------------------

function modifier_windwing_small_aura_effect_lua:OnCreated( kv )
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor( "bonus_attack_speed" )
	self.bonus_armor = self:GetAbility():GetSpecialValueFor( "bonus_armor" )
end

--------------------------------------------------------------------------------

function modifier_windwing_small_aura_effect_lua:OnRefresh( kv )
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor( "bonus_attack_speed" )
	self.bonus_armor = self:GetAbility():GetSpecialValueFor( "bonus_armor" )
end

--------------------------------------------------------------------------------

function modifier_windwing_small_aura_effect_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
	return funcs
end

--------------------------------------------------------------------------------

function modifier_windwing_small_aura_effect_lua:GetModifierAttackSpeedBonus_Constant( params )
	if self:GetCaster():PassivesDisabled() then
		return 0
	end
	return self.bonus_attack_speed
end

--------------------------------------------------------------------------------

function modifier_windwing_small_aura_effect_lua:GetModifierPhysicalArmorBonus( params )
	if self:GetCaster():PassivesDisabled() then
		return 0
	end
	return self.bonus_armor
end

--------------------------------------------------------------------------------

