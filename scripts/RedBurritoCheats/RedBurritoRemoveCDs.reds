// RedBurritoRemoveCDs Ver.2.0 – 12 Jan 2026 @MessaXS
// Remove cooldowns for cyberware and abilities
module RedBurrito.Cheats.RemoveCDs

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
	wrappedMethod(request);
	this.GiveMeRedBurritoRemoveCDs();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoRemoveCDs() -> Void {
	let TS: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGame());
	let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;

	let items: array<TweakDBID>;
	let counts: array<Int32>;

	let statsSystem = GameInstance.GetStatsSystem(player.GetGame());
	let ownerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());

	// SANDEVISTAN
	let sandevistanMod = RPGManager.CreateStatModifier(
		gamedataStatType.TimeDilationSandevistanRechargeDuration,
		gameStatModifierType.Multiplier,
		0.01 // 1% from 100%
	);
	statsSystem.AddSavedModifier(ownerID, sandevistanMod);

	// BERSERK
	let berserkMod = RPGManager.CreateStatModifier(
		gamedataStatType.BerserkChargesRegenRate,
		gameStatModifierType.Additive,
		100.0
	);
	statsSystem.AddSavedModifier(ownerID, berserkMod);

	// KERENZIKOV
	let kerenzikovMod = RPGManager.CreateStatModifier(
		gamedataStatType.KerenzikovCooldownDuration,
		gameStatModifierType.Multiplier,
		0.01
	);
	statsSystem.AddSavedModifier(ownerID, kerenzikovMod);

	// OPTICAL CAMO
	let camoMod1 = RPGManager.CreateStatModifier(
		gamedataStatType.OpticalCamoRechargeDuration,
		gameStatModifierType.Multiplier,
		0.01
	);
	let camoMod2 = RPGManager.CreateStatModifier(
		gamedataStatType.OpticalCamoChargesRegenRate,
		gameStatModifierType.Additive,
		100.0
	);
	statsSystem.AddSavedModifier(ownerID, camoMod1);
	statsSystem.AddSavedModifier(ownerID, camoMod2);

	// GRENADES
	let grenadeMod = RPGManager.CreateStatModifier(
		gamedataStatType.GrenadesChargesRegenMult,
		gameStatModifierType.Additive,
		10000.0
	);
	statsSystem.AddSavedModifier(ownerID, grenadeMod);

	// HEALING ITEMS
	let healMod = RPGManager.CreateStatModifier(
		gamedataStatType.HealingItemsChargesRegenMult,
		gameStatModifierType.Additive,
		10000.0
	);
	statsSystem.AddSavedModifier(ownerID, healMod);

	// PROJECTILE LAUNCHER
	let projectileMod = RPGManager.CreateStatModifier(
		gamedataStatType.ProjectileLauncherChargesRegenMult,
		gameStatModifierType.Additive,
		10000.0
	);
	statsSystem.AddSavedModifier(ownerID, projectileMod);

	// OVERCLOCK (Cyberdeck)
	let overclockMod1 = RPGManager.CreateStatModifier(
		gamedataStatType.CyberdeckOverclockRegenRate,
		gameStatModifierType.Additive,
		100.0
	);
	let overclockMod2 = RPGManager.CreateStatModifier(
		gamedataStatType.CyberdeckOverclockCooldown,
		gameStatModifierType.Multiplier,
		0.01
	);
	statsSystem.AddSavedModifier(ownerID, overclockMod1);
	statsSystem.AddSavedModifier(ownerID, overclockMod2);

	// QUICKHACKS
	let quickhackCooldownMod = RPGManager.CreateStatModifier(
		gamedataStatType.QuickhacksCooldownReduction,
		gameStatModifierType.Additive,
		1.0
	);
	let quickhackCostMod = RPGManager.CreateStatModifier(
		gamedataStatType.MemoryCostReduction,
		gameStatModifierType.Additive,
		10000.0
	);
	statsSystem.AddSavedModifier(ownerID, quickhackCooldownMod);
	statsSystem.AddSavedModifier(ownerID, quickhackCostMod);

	// MEMORY REGENERATION
	let memoryRegenMod = RPGManager.CreateStatModifier(
		gamedataStatType.MemoryRegenRateMult,
		gameStatModifierType.Additive,
		100.0
	);
	statsSystem.AddSavedModifier(ownerID, memoryRegenMod);

	// FACEPLATE (MASK)
	let faceplateMod1 = RPGManager.CreateStatModifier(
		gamedataStatType.CWMaskRechargeDuration,
		gameStatModifierType.Multiplier,
		0.05
	);
	let faceplateMod2 = RPGManager.CreateStatModifier(
		gamedataStatType.CWMaskChargesRegenRate,
		gameStatModifierType.Additive,
		100.0
	);
	statsSystem.AddSavedModifier(ownerID, faceplateMod1);
	statsSystem.AddSavedModifier(ownerID, faceplateMod2);
}
