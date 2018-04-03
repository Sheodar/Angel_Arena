modifier_axe_counter_helix_recode_lua = class({})

-----------------------------------------------------------------------------
function modifier_axe_counter_helix_recode_lua:IsHidden()
    return false
end

--------------------------------------------------------------------------------
function modifier_axe_counter_helix_recode_lua:OnCreated(kv)
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
    self.damage_for_base_damage_pct = self:GetAbility():GetSpecialValueFor("damage_for_base_damage_pct")
end

-------------------------------------------------------------------------------
function modifier_axe_counter_helix_recode_lua:OnRefresh(kv)
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
    self.damage_for_base_damage_pct = self:GetAbility():GetSpecialValueFor("damage_for_base_damage_pct")
end

-------------------------------------------------------------------------------
function modifier_axe_counter_helix_recode_lua:DeclareFunctions()
    local funcs = {
        MODIFIER_EVENT_ON_ATTACKED,
        MODIFIER_EVENT_ON_ATTACK_LANDED,
    }
    return funcs
end

-------------------------------------------------------------------------------
function modifier_axe_counter_helix_recode_lua:OnAttacked(params)
    if self:GetParent():PassivesDisabled() then return end
    if not IsServer() then return end
    local caster = self:GetParent()
    local enemies = FindUnitsInRadius(caster:GetTeamNumber(), caster:GetOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
    local allDamage = self.damage + caster:GetAverageTrueAttackDamage(nil);

    if params.target == caster then
        if RollPercentage(self.chance) then
            local particle = ParticleManager:CreateParticle("particles/econ/items/axe/axe_weapon_bloodchaser/axe_attack_blur_counterhelix_bloodchaser.vpcf", PATTACH_CUSTOMORIGIN, caster)
            ParticleManager:SetParticleControl(particle, 0, caster:GetOrigin())
            for _, enemy in pairs(enemies) do
                ApplyDamage({ victim = enemy, attacker = caster, damage = allDamage, damage_type = DAMAGE_TYPE_PHYSICAL })
            end
        end
    end
end

-------------------------------------------------------------------------------
function modifier_axe_counter_helix_recode_lua:OnAttackLanded(params)
    if self:GetParent():PassivesDisabled() then return end
    if not IsServer() then return end
    local caster = self:GetParent()
    local enemies = FindUnitsInRadius(caster:GetTeamNumber(), caster:GetOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
    local allDamage = self.damage + caster:GetAverageTrueAttackDamage(nil);

    if params.attacker == caster then
        local talent_ability = self:GetCaster():FindAbilityByName("special_bonus_unique_axe_3")

        local has_talent = (talent_ability and talent_ability:GetLevel() ~= 0)

        if RollPercentage(self.chance) and has_talent then
            local particle = ParticleManager:CreateParticle("particles/econ/items/axe/axe_weapon_bloodchaser/axe_attack_blur_counterhelix_bloodchaser.vpcf", PATTACH_CUSTOMORIGIN, caster)
            ParticleManager:SetParticleControl(particle, 0, caster:GetOrigin())
            for _, enemy in pairs(enemies) do
                ApplyDamage({ victim = enemy, attacker = caster, damage = allDamage, damage_type = DAMAGE_TYPE_PHYSICAL })
            end
        end
    end
end

-------------------------------------------------------------------------------


