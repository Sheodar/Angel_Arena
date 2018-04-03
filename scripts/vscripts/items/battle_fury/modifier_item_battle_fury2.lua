modifier_item_battle_fury2 = class({})
--------------------------------------------------------------------------------

function modifier_item_battle_fury2:IsHidden()
    return false
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:IsPurgable()
    return false
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:DestroyOnExpire()
    return false
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:OnCreated( kv )
    self.bonus_stats = self:GetAbility():GetSpecialValueFor( "bonus_stats" )
    self.attack_speed = self:GetAbility():GetSpecialValueFor( "attack_speed" )
    self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
    self.splash_pct = self:GetAbility():GetSpecialValueFor( "splash_pct" )
    self.splash_radius = self:GetAbility():GetSpecialValueFor( "splash_radius" )
    self.splash_range = self:GetAbility():GetSpecialValueFor( "splash_range" )
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_EVENT_ON_ATTACK_LANDED,
    }

    return funcs
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_EVENT_ON_ATTACK_LANDED,
    }
    return funcs
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:GetModifierPreAttack_BonusDamage( params )
    return self.damage or 0
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:GetModifierAttackSpeedBonus_Constant( params )
    return self.attack_speed or 0
end


--------------------------------------------------------------------------------

function modifier_item_battle_fury2:GetModifierBonusStats_Strength( params )
    return self.bonus_stats or 0
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:GetModifierBonusStats_Agility( params )
    return self.bonus_stats or 0
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:GetModifierBonusStats_Intellect( params )
    return self.bonus_stats or 0
end

--------------------------------------------------------------------------------

function modifier_item_battle_fury2:OnAttackLanded( params )
    if IsServer() then
        if params.attacker == self:GetParent() and ( not self:GetParent():IsIllusion() ) then
            if self:GetParent():PassivesDisabled() then
                return 0
            end

            local target = params.target
            if target ~= nil and target:GetTeamNumber() ~= self:GetParent():GetTeamNumber() then
                local cleaveDamage = ( self.splash_pct * params.damage ) / 100.0
                DoCleaveAttack( self:GetParent(), target, self:GetAbility(), cleaveDamage, self.splash_radius, 150 , self.splash_range,"particles/units/heroes/hero_sven/sven_spell_great_cleave.vpcf" )
            end
        end
    end

    return 0
end