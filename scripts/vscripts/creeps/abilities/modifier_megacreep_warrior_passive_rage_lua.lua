modifier_megacreep_warrior_passive_rage_lua = class({})

-----------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_lua:IsHidden()
	return true
end

--------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_lua:OnCreated( kv )
	self.duration = self:GetAbility():GetSpecialValueFor( "duration" )
end

-------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_lua:OnRefresh( kv )
	self.duration = self:GetAbility():GetSpecialValueFor( "duration" )
end

-------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_lua:DeclareFunctions()
	local funcs = {
			  MODIFIER_EVENT_ON_ATTACKED,
	}
	return funcs
end

-------------------------------------------------------------------------------

function modifier_megacreep_warrior_passive_rage_lua:OnAttacked(params)
    if self:GetParent():PassivesDisabled() then return end
    if not IsServer() then return end

    if params.target == self:GetParent() and ( not self:GetParent():IsIllusion() )  then
            params.target:AddNewModifier( params.target, self:GetAbility(), "modifier_megacreep_warrior_passive_rage_effect_lua", { duration = self.duration } )
            local stack_count = params.target:GetModifierStackCount("modifier_megacreep_warrior_passive_rage_effect_lua", self:GetParent())
            params.target:SetModifierStackCount("modifier_megacreep_warrior_passive_rage_effect_lua", self:GetParent(), stack_count + 1)
	end
end

-------------------------------------------------------------------------------