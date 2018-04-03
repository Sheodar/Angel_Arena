windwing_big_stun_lua = class({})
LinkLuaModifier("modifier_windwing_big_stun_lua", "creeps/abilities/modifier_windwing_big_stun_lua", LUA_MODIFIER_MOTION_NONE )

function windwing_big_stun_lua:OnSpellStart()
        self.duration = self:GetSpecialValueFor( "duration" )
        self.damage = self:GetSpecialValueFor( "damage" )


        local info = {
                EffectName = "particles/neutral_fx/creep_mage_multi_ball.vpcf",
                Ability = self,
                iMoveSpeed = 600,
                Source = self:GetCaster(),
                Target = self:GetCursorTarget(),
                iVisionTeamNumber = self:GetCaster():GetTeamNumber(),
        }

        ProjectileManager:CreateTrackingProjectile( info )

end
function windwing_big_stun_lua:OnProjectileHit( hTarget, vLocation )
        if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) then
                hTarget:AddNewModifier( self:GetCaster(), self, "modifier_windwing_big_stun_lua", { duration = self.duration } )
                local info = {
                        victim = hTarget,
                        attacker = self:GetCaster(),
                        damage = self.damage,
                        damage_type = DAMAGE_TYPE_MAGICAL,
                }
                ApplyDamage( info )
        end
end