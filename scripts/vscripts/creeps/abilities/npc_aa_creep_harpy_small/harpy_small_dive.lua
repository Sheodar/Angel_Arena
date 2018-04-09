harpy_small_dive = class({})
LinkLuaModifier( "modifier_harpy_small_dive_active", "creeps/abilities/npc_aa_creep_harpy_small/modifier_harpy_small_dive_active", LUA_MODIFIER_MOTION_VERTICAL )

--------------------------------------------------------------------------------

function harpy_small_dive:OnSpellStart()
	local height			= self:GetSpecialValueFor( "height" )
	local speed				= self:GetSpecialValueFor( "speed" )
	local damage				= self:GetSpecialValueFor( "damage" )
	local radius				= self:GetSpecialValueFor( "radius" )
	local caster 			= self:GetCaster()
--	caster:AddNewModifier(caster, self, "modifier_harpy_small_dive_active", { speed = speed, height = height, duration = 3, damage = damage, radius = radius })
	caster:AddNewModifier(caster, self, "modifier_harpy_small_dive_active", { speed = speed, height = height,  damage = damage, radius = radius })

end

--------------------------------------------------------------------------------