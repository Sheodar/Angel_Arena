modifier_item_battle_fury_splash2 = class({})

--------------------------------------------------------------------------------

function modifier_item_battle_fury_splash2:IsHidden()
    return false
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury_splash2:OnCreated( kv )
    self.splash_pct = self:GetAbility():GetSpecialValueFor( "splash_pct" )
    self.splash_range = self:GetAbility():GetSpecialValueFor( "splash_range" )
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury_splash2:OnRefresh( kv )
    self.splash_pct = self:GetAbility():GetSpecialValueFor( "splash_pct" )
    self.splash_range = self:GetAbility():GetSpecialValueFor( "splash_range" )
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury_splash2:DeclareFunctions()
    local funcs = {
        MODIFIER_EVENT_ON_ATTACK_LANDED,
    }
    return funcs
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury_splash2:OnAttackLanded( params )
    if IsServer() then
        if params.attacker == self:GetParent() and ( not self:GetParent():IsIllusion() ) then
            if self:GetParent():PassivesDisabled() then
                return 0
            end

            local target = params.target
            if target ~= nil and target:GetTeamNumber() ~= self:GetParent():GetTeamNumber() then
                local cleaveDamage = ( self.splash_pct * params.damage ) / 100.0
                DoCleaveAttack( self:GetParent(), target, self:GetAbility(), cleaveDamage, self.splash_range, "particles/units/heroes/hero_sven/sven_spell_great_cleave.vpcf" )
            end
        end
    end

    return 0
end