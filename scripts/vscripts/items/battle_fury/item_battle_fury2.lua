item_battle_fury2 = class({})
LinkLuaModifier("modifier_item_battle_fury2", 'items/battle_fury/modifier_item_battle_fury2', LUA_MODIFIER_MOTION_NONE)
--LinkLuaModifier("modifier_item_battle_fury_splash2", 'items/battle_fury/modifier_item_battle_fury_splash2', LUA_MODIFIER_MOTION_NONE)

--------------------------------------------------------------------------------
function item_battle_fury2:GetIntrinsicModifierName()
    return "modifier_item_battle_fury2"
end

-----------------------------------------------------------------------------
function item_battle_fury2:GetCustomCastErrorTarget(hTarget)
    if self:GetCaster() == hTarget then
        return "#dota_hud_error_cant_cast_on_self"
    end

    if not hTarget:IsCreep() then
        return "#dota_hud_error_cant_cast_on_creep"
    end

    if self:GetCaster():GetTeamNumber() == hTarget:GetTeamNumber() then
        return "#dota_hud_error_cant_cast_friendly_hero"
    end

    if hTarget:IsHero() then
        return "#dota_hud_error_cant_cast_on_hero"
    end

    if hTarget:IsAncient() then
        return "#dota_hud_error_cant_cast_on_ancient"
    end

    return ""
end

-----------------------------------------------------------------------------
function item_battle_fury2:OnSpellStart()

    local target = self:GetCursorTarget()

    if target then
        GridNav:DestroyTreesAroundPoint(target:GetAbsOrigin(), 15, true)
    end

    if target:IsOther() then
        local targetName = self:GetCursorTarget():GetUnitName()
        if targetName == "npc_dota_observer_wards" or targetName == "npc_dota_sentry_wards" then
            target:Kill(self, self:GetCaster())
        else
            self:EndCooldown()
        end
    end
end

-----------------------------------------------------------------------------

--function item_battle_fury:DestroyTree(keys)
--    local target = keys.target
--
--    if target then
--        GridNav:DestroyTreesAroundPoint(target:GetAbsOrigin(), 15, true)
--    end
--end

-----------------------------------------------------------------------------
