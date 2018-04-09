modifier_windwing_big_aura_effect_lua = class({})

--------------------------------------------------------------------------------

function modifier_windwing_big_aura_effect_lua:IsHidden()
	return false
end

--------------------------------------------------------------------------------

function modifier_windwing_big_aura_effect_lua:IsDebuff()
	return false
end

--------------------------------------------------------------------------------

function modifier_windwing_big_aura_effect_lua:OnCreated( kv )
	self.lifesteal = self:GetAbility():GetSpecialValueFor( "lifesteal" )
end

-------------------------------------------------------------------------------

function modifier_windwing_big_aura_effect_lua:OnRefresh( kv )
	self.lifesteal = self:GetAbility():GetSpecialValueFor( "lifesteal" )
end

-------------------------------------------------------------------------------
function modifier_windwing_big_aura_effect_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
	}
	return funcs
end

-------------------------------------------------------------------------------

function modifier_windwing_big_aura_effect_lua:	OnAttackLanded ( params )
	if self:GetParent() == params.attacker then
		local steal =  params.damage * (self.lifesteal/100)
		params.attacker:Heal(steal, self )
		local particle = ParticleManager:CreateParticle( "particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_OVERHEAD_FOLLOW, params.attacker )
		ParticleManager:SetParticleControl( particle, 0, params.attacker:GetAbsOrigin() )
		SendOverheadEventMessage( params.unit, OVERHEAD_ALERT_HEAL , params.attacker, steal, nil )
	end
end

-------------------------------------------------------------------------------