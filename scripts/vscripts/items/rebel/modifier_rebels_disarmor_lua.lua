modifier_rebels_disarmor_lua = class({})

-----------------------------------------------------------------------------
function modifier_rebels_disarmor_lua:IsHidden()
    return true
end

--------------------------------------------------------------------------------
function modifier_rebels_disarmor_lua:OnCreated(kv)
    self.duration = self:GetAbility():GetSpecialValueFor("duration")
    self.cooldown = self:GetAbility():GetSpecialValueFor("cooldown")
    self.disarmor_per_hit_const = self:GetAbility():GetSpecialValueFor("disarmor_per_hit_const")
    self.disarmor_per_hit_pct = self:GetAbility():GetSpecialValueFor("disarmor_per_hit_pct")
    self.max_disarmor_pct = self:GetAbility():GetSpecialValueFor("max_disarmor_pct")
end

-------------------------------------------------------------------------------
function modifier_rebels_disarmor_lua:OnRefresh(kv)
    self.duration = self:GetAbility():GetSpecialValueFor("duration")
    self.cooldown = self:GetAbility():GetSpecialValueFor("cooldown")
    self.disarmor_per_hit_const = self:GetAbility():GetSpecialValueFor("disarmor_per_hit_const")
    self.disarmor_per_hit_pct = self:GetAbility():GetSpecialValueFor("disarmor_per_hit_pct")
    self.max_disarmor_pct = self:GetAbility():GetSpecialValueFor("max_disarmor_pct")
end

-------------------------------------------------------------------------------
function modifier_rebels_disarmor_lua:DeclareFunctions()
    local funcs = {
        MODIFIER_EVENT_ON_ATTACK_LANDED,
    }
    return funcs
end

-------------------------------------------------------------------------------
function modifier_rebels_disarmor_lua:OnAttackLanded(params)
    if not IsServer() then return end
    local attacker = params.attacker
    if attacker:PassivesDisabled() or attacker:IsIllusion() then return end

    if attacker == self:GetParent() then
        local target = params.target

        if target:FindModifierByName("rebels_disarmor_cooldown_lua") then return end
        if attacker:FindModifierByName("rebels_disarmor_cooldown_lua") then return end

        if not target:FindModifierByName("rebels_disarmor_cooldown_lua") then
            attacker:AddNewModifier(attacker, self:GetAbility(), "rebels_disarmor_cooldown_lua", { duration = self.cooldown })
            target:AddNewModifier(attacker, self:GetAbility(), "rebels_disarmor_cooldown_lua", { duration = self.cooldown })
        end

        target:AddNewModifier(attacker, self:GetAbility(), "modifier_rebels_disarmor_effect_lua", { duration = self.duration })
        local stack_count = target:GetModifierStackCount("modifier_rebels_disarmor_effect_lua", self:GetParent())
        local total_target_armor = target:GetPhysicalArmorValue() + stack_count
        local disarmor_pct = total_target_armor / 100 * self.disarmor_per_hit_pct
        local max_disarmor = total_target_armor * (self.max_disarmor_pct / 100)

        --- Имеет ограничение в 100% дизармору, по аналогу с пасивкой пангольера, в +не вывыедет, но если у цели армор в минусе, просто нихуя не будет делать

        --  if stack_count + disarmor_pct + self.disarmor_per_hit_const > max_disarmor then
        --    target:SetModifierStackCount("modifier_rebels_disarmor_effect_lua", attacker, max_disarmor)
        --else
        --  target:SetModifierStackCount("modifier_rebels_disarmor_effect_lua", self:GetParent(), stack_count + self.disarmor_per_hit_const + disarmor_pct)
        --end

        --- Заходит за порог 100%, однако дает работать другому дизаормору

        if stack_count < max_disarmor then
            target:SetModifierStackCount("modifier_rebels_disarmor_effect_lua", attacker, stack_count + stack_count + self.disarmor_per_hit_const + disarmor_pct)
        end
    end
end

-------------------------------------------------------------------------------