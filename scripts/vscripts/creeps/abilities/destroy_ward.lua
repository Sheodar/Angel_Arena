destroy_ward = class({})

--------------------------------------------------------------------------------
function destroy_ward:OnSpellStart()
    local target = self:GetCursorTarget()
    local targetName = self:GetCursorTarget():GetUnitName()
    if targetName == "npc_dota_observer_wards" or targetName == "npc_dota_sentry_wards" then
        target:Kill(self, self:GetCaster())
    else
        self:EndCooldown()
    end

end
--------------------------------------------------------------------------------
