// Double Sandevistan Duration - BALANCED x2
// VER.1.0 @MessaXS @annix91

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
    wrappedMethod(request);
    this.GiveMeSandevistanBoost();
}

@addMethod(VendingMachine)
protected func GiveMeSandevistanBoost() -> Void {
    let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;
    let statsSystem = GameInstance.GetStatsSystem(player.GetGame());
    let ownerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
    
    // Use an empty stat as a flag to check if mod is active
    let flagValue: Float = statsSystem.GetStatValue(ownerID, gamedataStatType.IsItemCrafted);
    
    if flagValue >= 1.0 {
        // MOD IS ACTIVE - DISABLE IT
        statsSystem.RemoveAllModifiers(ownerID, gamedataStatType.TimeDilationSandevistanDuration, true);
        statsSystem.RemoveAllModifiers(ownerID, gamedataStatType.TimeDilationSandevistanRechargeDuration, true);
        statsSystem.RemoveAllModifiers(ownerID, gamedataStatType.IsItemCrafted, true);
        
        let msg: String = "Double Sandevistan Duration\nDisabled";
        player.SetWarningMessage(msg);
    } else {
        // MOD IS DISABLED - ENABLE IT
        
        // Set flag
        let flag = RPGManager.CreateStatModifier(
            gamedataStatType.IsItemCrafted,
            gameStatModifierType.Additive,
            1.0
        );
        statsSystem.AddSavedModifier(ownerID, flag);
        
        // SANDEVISTAN - Duration x2
        let sandevistanDuration = RPGManager.CreateStatModifier(
            gamedataStatType.TimeDilationSandevistanDuration,
            gameStatModifierType.Multiplier,
            2.0
        );
        statsSystem.AddSavedModifier(ownerID, sandevistanDuration);
        
        // SANDEVISTAN - Cooldown 50% faster (0.5 = half the recharge time)
        let sandevistanCooldown = RPGManager.CreateStatModifier(
            gamedataStatType.TimeDilationSandevistanRechargeDuration,
            gameStatModifierType.Multiplier,
            0.5
        );
        statsSystem.AddSavedModifier(ownerID, sandevistanCooldown);
        
        let msg: String = "Double Sandevistan Duration\nActivated (x2 Duration, 50% Cooldown)";
        player.SetWarningMessage(msg);
    }
}