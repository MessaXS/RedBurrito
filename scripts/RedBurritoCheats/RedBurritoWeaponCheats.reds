// RedBurritoWeaponCheats Ver.2.0 – 12 Jan 2026 @MessaXS
// Weapon stat cheats
module RedBurrito.Cheats.Weapons

module RedBurrito.Cheats.Weapons

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
        wrappedMethod(request);
        this.GiveMeRedBurritoWeaponCheats();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoWeaponCheats() -> Void {
        let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;
        let statsSystem = GameInstance.GetStatsSystem(player.GetGame());
        let ownerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
        
        // SUPER RELOAD
        this.ApplySuperReload(statsSystem, ownerID);
        
        // SUPER ACCURACY - does not work correctly
        this.ApplySuperAccuracy(statsSystem, ownerID);
        
        // SUPER ZOOM - does not work correctly
        this.ApplySuperZoom(statsSystem, ownerID);
        
        // SUPER RANGE - does not work correctly
        this.ApplySuperRange(statsSystem, ownerID);
        
        // NO RECOIL - does not work correctly
        this.ApplyNoRecoil(statsSystem, ownerID);
        
        // ULTRA KILL - mega crit damage
        this.ApplyUltraKill(statsSystem, ownerID);
        
        // PSYCHO MODE - rate of fire - does not work correctly
        this.ApplyPsychoMode(statsSystem, ownerID);
        
        // BEAST MODE - dismemberment (close combat) - may not work correctly
        this.ApplyBeastMode(statsSystem, ownerID);
        
        // BIG BRAIN - smart weapon - may not work correctly
        this.ApplyBigBrain(statsSystem, ownerID);
        
        // THE PENETRATOR - penetrating fire - does not work correctly
        this.ApplyPenetrator(statsSystem, ownerID);

        // INFINITE MAGAZINE - does not work correctly
        this.ApplyInfiniteMagazine(statsSystem, ownerID);
}

// =============================================
// SUPER RELOAD
// =============================================

@addMethod(VendingMachine)
private func ApplySuperReload(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let reloadBaseMod = RPGManager.CreateStatModifier(
                gamedataStatType.ReloadTimeBase,
                gameStatModifierType.Multiplier,
                0.2
        );
        let reloadEndMod = RPGManager.CreateStatModifier(
                gamedataStatType.ReloadEndTime,
                gameStatModifierType.Multiplier,
                0.1
        );
        let emptyReloadMod = RPGManager.CreateStatModifier(
                gamedataStatType.EmptyReloadTime,
                gameStatModifierType.Multiplier,
                0.2
        );
        let emptyReloadEndMod = RPGManager.CreateStatModifier(
                gamedataStatType.EmptyReloadEndTime,
                gameStatModifierType.Multiplier,
                0.1
        );
        
        statsSystem.AddSavedModifier(ownerID, reloadBaseMod);
        statsSystem.AddSavedModifier(ownerID, reloadEndMod);
        statsSystem.AddSavedModifier(ownerID, emptyReloadMod);
        statsSystem.AddSavedModifier(ownerID, emptyReloadEndMod);
}

// =============================================
// SUPER ACCURACY
// =============================================

@addMethod(VendingMachine)
private func ApplySuperAccuracy(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let spreadMinXMod = RPGManager.CreateStatModifier(
                gamedataStatType.SpreadMinX,
                gameStatModifierType.Multiplier,
                0.05
        );
        let spreadMinYMod = RPGManager.CreateStatModifier(
                gamedataStatType.SpreadMinY,
                gameStatModifierType.Multiplier,
                0.05
        );
        let spreadMaxXMod = RPGManager.CreateStatModifier(
                gamedataStatType.SpreadMaxX,
                gameStatModifierType.Multiplier,
                0.05
        );
        let spreadMaxYMod = RPGManager.CreateStatModifier(
                gamedataStatType.SpreadMaxY,
                gameStatModifierType.Multiplier,
                0.05
        );
        let spreadAdsMinXMod = RPGManager.CreateStatModifier(
                gamedataStatType.SpreadAdsMinX,
                gameStatModifierType.Multiplier,
                0.05
        );
        let spreadAdsMinYMod = RPGManager.CreateStatModifier(
                gamedataStatType.SpreadAdsMinY,
                gameStatModifierType.Multiplier,
                0.05
        );
        let spreadAdsMaxXMod = RPGManager.CreateStatModifier(
                gamedataStatType.SpreadAdsMaxX,
                gameStatModifierType.Multiplier,
                0.05
        );
        let spreadAdsMaxYMod = RPGManager.CreateStatModifier(
                gamedataStatType.SpreadAdsMaxY,
                gameStatModifierType.Multiplier,
                0.05
        );
        
        statsSystem.AddSavedModifier(ownerID, spreadMinXMod);
        statsSystem.AddSavedModifier(ownerID, spreadMinYMod);
        statsSystem.AddSavedModifier(ownerID, spreadMaxXMod);
        statsSystem.AddSavedModifier(ownerID, spreadMaxYMod);
        statsSystem.AddSavedModifier(ownerID, spreadAdsMinXMod);
        statsSystem.AddSavedModifier(ownerID, spreadAdsMinYMod);
        statsSystem.AddSavedModifier(ownerID, spreadAdsMaxXMod);
        statsSystem.AddSavedModifier(ownerID, spreadAdsMaxYMod);
}

// =============================================
// SUPER ZOOM
// =============================================

@addMethod(VendingMachine)
private func ApplySuperZoom(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let zoomMod = RPGManager.CreateStatModifier(
                gamedataStatType.ZoomLevel,
                gameStatModifierType.Multiplier,
                5.0
        );
        let sway1Mod = RPGManager.CreateStatModifier(
                gamedataStatType.SwaySideMinimumAngleDistance,
                gameStatModifierType.Multiplier,
                0.0
        );
        let sway2Mod = RPGManager.CreateStatModifier(
                gamedataStatType.SwaySideMaximumAngleDistance,
                gameStatModifierType.Multiplier,
                0.0
        );
        let sway3Mod = RPGManager.CreateStatModifier(
                gamedataStatType.SwaySideTopAngleLimit,
                gameStatModifierType.Multiplier,
                0.0
        );
        let sway4Mod = RPGManager.CreateStatModifier(
                gamedataStatType.SwayCenterMaximumAngleOffset,
                gameStatModifierType.Multiplier,
                0.0
        );
        
        statsSystem.AddSavedModifier(ownerID, zoomMod);
        statsSystem.AddSavedModifier(ownerID, sway1Mod);
        statsSystem.AddSavedModifier(ownerID, sway2Mod);
        statsSystem.AddSavedModifier(ownerID, sway3Mod);
        statsSystem.AddSavedModifier(ownerID, sway4Mod);
}

// =============================================
// SUPER RANGE
// =============================================

@addMethod(VendingMachine)
private func ApplySuperRange(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let effectiveRangeMod = RPGManager.CreateStatModifier(
                gamedataStatType.EffectiveRange,
                gameStatModifierType.Multiplier,
                100.0
        );
        let maxRangeMod = RPGManager.CreateStatModifier(
                gamedataStatType.MaximumRange,
                gameStatModifierType.Multiplier,
                100.0
        );
    
        statsSystem.AddSavedModifier(ownerID, effectiveRangeMod);
        statsSystem.AddSavedModifier(ownerID, maxRangeMod);
}

// =============================================
// NO RECOIL
// =============================================

@addMethod(VendingMachine)
private func ApplyNoRecoil(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let recoilMinMod = RPGManager.CreateStatModifier(
                gamedataStatType.RecoilKickMin,
                gameStatModifierType.Multiplier,
                0.0
        );
        let recoilMaxMod = RPGManager.CreateStatModifier(
                gamedataStatType.RecoilKickMax,
                gameStatModifierType.Multiplier,
                0.0
        );
        let recoilAdsMod = RPGManager.CreateStatModifier(
                gamedataStatType.RecoilUseDifferentStatsInADS,
                gameStatModifierType.Multiplier,
                0.0
        );
        
        statsSystem.AddSavedModifier(ownerID, recoilMinMod);
        statsSystem.AddSavedModifier(ownerID, recoilMaxMod);
        statsSystem.AddSavedModifier(ownerID, recoilAdsMod);
}

// =============================================
// ULTRA KILL
// =============================================

@addMethod(VendingMachine)
private func ApplyUltraKill(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let critChanceMod = RPGManager.CreateStatModifier(
                gamedataStatType.CritChance,
                gameStatModifierType.Additive,
                100.0
        );
        let critDamageMod = RPGManager.CreateStatModifier(
                gamedataStatType.CritDamage,
                gameStatModifierType.Additive,
                10000.0
        );
        
        statsSystem.AddSavedModifier(ownerID, critChanceMod);
        statsSystem.AddSavedModifier(ownerID, critDamageMod);
}

// =============================================
// PSYCHO MODE
// =============================================

@addMethod(VendingMachine)
private func ApplyPsychoMode(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let cycleTimeMod = RPGManager.CreateStatModifier(
                gamedataStatType.CycleTime,
                gameStatModifierType.Multiplier,
                0.2
        );
        let projectilesPerShotMod = RPGManager.CreateStatModifier(
                gamedataStatType.ProjectilesPerShot,
                gameStatModifierType.Additive,
                10.0
        );
        let damagePerHitMod = RPGManager.CreateStatModifier(
                gamedataStatType.DamagePerHit,
                gameStatModifierType.Multiplier,
                1.0
        );
        
        statsSystem.AddSavedModifier(ownerID, cycleTimeMod);
        statsSystem.AddSavedModifier(ownerID, projectilesPerShotMod);
        statsSystem.AddSavedModifier(ownerID, damagePerHitMod);
}

// =============================================
// BEAST MODE
// =============================================

@addMethod(VendingMachine)
private func ApplyBeastMode(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let dismemberMod = RPGManager.CreateStatModifier(
                gamedataStatType.HitDismembermentFactor,
                gameStatModifierType.Additive,
                10000.0
        );
        let blockMod = RPGManager.CreateStatModifier(
                gamedataStatType.BlockFactor,
                gameStatModifierType.Multiplier,
                100.0
        );
        let staminaCostMod = RPGManager.CreateStatModifier(
                gamedataStatType.StaminaCostReduction,
                gameStatModifierType.Additive,
                -2.0
        );
        let comboMod = RPGManager.CreateStatModifier(
                gamedataStatType.CanMeleeInfinitelyCombo,
                gameStatModifierType.Additive,
                1.0
        );
        
        statsSystem.AddSavedModifier(ownerID, dismemberMod);
        statsSystem.AddSavedModifier(ownerID, blockMod);
        statsSystem.AddSavedModifier(ownerID, staminaCostMod);
        statsSystem.AddSavedModifier(ownerID, comboMod);
}

// =============================================
// BIG BRAIN
// =============================================

@addMethod(VendingMachine)
private func ApplyBigBrain(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let lockPointsMod = RPGManager.CreateStatModifier(
                gamedataStatType.SmartGunMaxLockedPointsPerTarget,
                gameStatModifierType.Additive,
                1.0
        );
        let adsTimeMod = RPGManager.CreateStatModifier(
                gamedataStatType.SmartGunAdsTimeToLock,
                gameStatModifierType.Multiplier,
                0.1
        );
        let adsTargetsMod = RPGManager.CreateStatModifier(
                gamedataStatType.SmartGunAdsMaxLockedTargets,
                gameStatModifierType.Additive,
                10.0
        );
        let hipTimeMod = RPGManager.CreateStatModifier(
                gamedataStatType.SmartGunHipTimeToLock,
                gameStatModifierType.Multiplier,
                0.05
        );
        let hipTargetsMod = RPGManager.CreateStatModifier(
                gamedataStatType.SmartGunHipMaxLockedTargets,
                gameStatModifierType.Additive,
                10.0
        );
        let hitProbMod = RPGManager.CreateStatModifier(
                gamedataStatType.SmartGunHitProbability,
                gameStatModifierType.Additive,
                1.0
        );
        let velocityMod = RPGManager.CreateStatModifier(
                gamedataStatType.SmartGunPlayerProjectileVelocity,
                gameStatModifierType.Additive,
                100.0
        );
        let rangeMod = RPGManager.CreateStatModifier(
                gamedataStatType.SmartGunTargetAcquisitionRange,
                gameStatModifierType.Additive,
                500.0
        );
        
        statsSystem.AddSavedModifier(ownerID, lockPointsMod);
        statsSystem.AddSavedModifier(ownerID, adsTimeMod);
        statsSystem.AddSavedModifier(ownerID, adsTargetsMod);
        statsSystem.AddSavedModifier(ownerID, hipTimeMod);
        statsSystem.AddSavedModifier(ownerID, hipTargetsMod);
        statsSystem.AddSavedModifier(ownerID, hitProbMod);
        statsSystem.AddSavedModifier(ownerID, velocityMod);
        statsSystem.AddSavedModifier(ownerID, rangeMod);
}

// =============================================
// THE PENETRATOR
// =============================================

@addMethod(VendingMachine)
private func ApplyPenetrator(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let pierceMod = RPGManager.CreateStatModifier(
                gamedataStatType.TechPierceEnabled,
                gameStatModifierType.Additive,
                1.0
        );
        let ignoreArmorMod = RPGManager.CreateStatModifier(
                gamedataStatType.CanWeaponIgnoreArmor,
                gameStatModifierType.Additive,
                1.0
        );
        
        statsSystem.AddSavedModifier(ownerID, pierceMod);
        statsSystem.AddSavedModifier(ownerID, ignoreArmorMod);
}

// =============================================
// INFINITE MAGAZINE
// =============================================

@addMethod(VendingMachine)
private func ApplyInfiniteMagazine(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let magazineMod = RPGManager.CreateStatModifier(
                gamedataStatType.NumShotsToFire,
                gameStatModifierType.Multiplier,
                0.0  // 0 = infinite
        );
        
        statsSystem.AddSavedModifier(ownerID, magazineMod);
}