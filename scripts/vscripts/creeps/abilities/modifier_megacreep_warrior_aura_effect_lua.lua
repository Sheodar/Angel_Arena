modifier_megacreep_warrior_aura_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_aura_effect_lua:IsHidden()
	return false
end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_aura_effect_lua:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_aura_effect_lua:OnCreated( kv )
	self.disarmor_start = self:GetAbility():GetSpecialValueFor( "disarmor_start" )
	self.time_tick_minute = self:GetAbility():GetSpecialValueFor( "time_tick_minute" )
	self.disarmor_per_tick = self:GetAbility():GetSpecialValueFor( "disarmor_per_tick" )

end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_aura_effect_lua:OnRefresh( kv )
	self.disarmor_start = self:GetAbility():GetSpecialValueFor( "disarmor_start" )
	self.time_tick_minute = self:GetAbility():GetSpecialValueFor( "time_tick_minute" )
	self.disarmor_per_tick = self:GetAbility():GetSpecialValueFor( "disarmor_per_tick" )
end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_aura_effect_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
	return funcs
end

--------------------------------------------------------------------------------
function modifier_megacreep_warrior_aura_effect_lua:GetModifierPhysicalArmorBonus( params )
	if self:GetCaster():PassivesDisabled() then
		return 0
	end
	self.extra_disarmor = math.floor(GameRules:GetGameTime() / (60*self.time_tick_minute)) * self.disarmor_per_tick
	return -(self.disarmor_start + self.extra_disarmor)
end

--------------------------------------------------------------------------------

