// RedBurritoSurvival Ver.2.0 – 12 Jan 2026 @MessaXS
// Survival cheats: God Mode, Invisibility, Memory, Humanity, Disable Police
module RedBurrito.Cheats.Survival

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
	wrappedMethod(request);
	this.GiveMeRedBurritoSurvival();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoSurvival() -> Void {
	let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;
	let statsSystem = GameInstance.GetStatsSystem(player.GetGame());
	let ownerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());

	// GOD MODE
	this.ApplyGodMode(statsSystem, ownerID);

	// INVISIBILITY
	this.ApplyInvisibility(player);

	// MEMORY
	this.ApplyMemory(statsSystem, ownerID);

	// HUMANITY
	this.ApplyHumanity(statsSystem, ownerID);

	// DISABLE POLICE
	this.DisablePolice(player);
}

// =============================================
// GOD MODE
// =============================================

@addMethod(VendingMachine)
private func ApplyGodMode(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
	// regeneration
	let healthRegenMod = RPGManager.CreateStatModifier(
		gamedataStatType.HealthGeneralRegenRateMult,
		gameStatModifierType.Additive,
		9999.0
	);

	// armor
	let armorMod = RPGManager.CreateStatModifier(
		gamedataStatType.Armor,
		gameStatModifierType.Additive,
		99999999.0
	);

	// health
	let healthMod = RPGManager.CreateStatModifier(
		gamedataStatType.Health,
		gameStatModifierType.Additive,
		99999.0
	);

	// fall damage
	let fallDamageMod = RPGManager.CreateStatModifier(
		gamedataStatType.FallDamageReduction,
		gameStatModifierType.Additive,
		99.0
	);

	// regeneration in combat
	let combatRegenMod = RPGManager.CreateStatModifier(
		gamedataStatType.HealthInCombatRegenEnabled,
		gameStatModifierType.Additive,
		1.0
	);

	// resistance - explosion
	let explosionResMod = RPGManager.CreateStatModifier(
		gamedataStatType.ExplosionResistance,
		gameStatModifierType.Additive,
		99.0
	);

	// resistance - melee
	let meleeResMod = RPGManager.CreateStatModifier(
		gamedataStatType.MeleeResistance,
		gameStatModifierType.Additive,
		99.0
	);

	// resistance - thermal
	let thermalResMod = RPGManager.CreateStatModifier(
		gamedataStatType.ThermalResistance,
		gameStatModifierType.Additive,
		99.0
	);

	// resistance - chemical
	let chemResMod = RPGManager.CreateStatModifier(
		gamedataStatType.ChemicalResistance,
		gameStatModifierType.Additive,
		99.0
	);

	// resistance - electric
	let elecResMod = RPGManager.CreateStatModifier(
		gamedataStatType.ElectricResistance,
		gameStatModifierType.Additive,
		99.0
	);

	// resistance - physical
	let physResMod = RPGManager.CreateStatModifier(
		gamedataStatType.PhysicalResistance,
		gameStatModifierType.Additive,
		99.0
	);

	statsSystem.AddSavedModifier(ownerID, healthRegenMod);
	statsSystem.AddSavedModifier(ownerID, armorMod);
	statsSystem.AddSavedModifier(ownerID, healthMod);
	statsSystem.AddSavedModifier(ownerID, fallDamageMod);
	statsSystem.AddSavedModifier(ownerID, combatRegenMod);
	statsSystem.AddSavedModifier(ownerID, explosionResMod);
	statsSystem.AddSavedModifier(ownerID, meleeResMod);
	statsSystem.AddSavedModifier(ownerID, thermalResMod);
	statsSystem.AddSavedModifier(ownerID, chemResMod);
	statsSystem.AddSavedModifier(ownerID, elecResMod);
	statsSystem.AddSavedModifier(ownerID, physResMod);
}

// =============================================
// INVISIBILITY
// =============================================

@addMethod(VendingMachine)
private func ApplyInvisibility(player: ref<PlayerPuppet>) -> Void {
	StatusEffectHelper.ApplyStatusEffect(
		player,
		t"BaseStatusEffect.Cloaked",
		player.GetEntityID()
	);
	player.SetInvisible(true);
	player.UpdateVisibility();
}

// =============================================
// MEMORY
// =============================================

@addMethod(VendingMachine)
private func ApplyMemory(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
	let memoryMod = RPGManager.CreateStatModifier(
		gamedataStatType.Memory,
		gameStatModifierType.Additive,
		40.0
	);

	statsSystem.AddSavedModifier(ownerID, memoryMod);
}

// =============================================
// HUMANITY
// =============================================

@addMethod(VendingMachine)
private func ApplyHumanity(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
	let humanityMod = RPGManager.CreateStatModifier(
		gamedataStatType.Humanity,
		gameStatModifierType.Additive,
		10000.0
	);

	statsSystem.AddSavedModifier(ownerID, humanityMod);
}

// =============================================
// DISABLE POLICE
// =============================================

@addMethod(VendingMachine)
private func DisablePolice(player: ref<PlayerPuppet>) -> Void {
	let preventionSystem = player.GetPreventionSystem();
	let toggleRequest: ref<TogglePreventionSystem> = new TogglePreventionSystem();
	toggleRequest.sourceName = n"RedBurritoDisablePolice";
	toggleRequest.isActive = false;
	preventionSystem.QueueRequest(toggleRequest);
	preventionSystem.TogglePreventionSystem(false);
}
