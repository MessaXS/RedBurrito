// RedBurrito Items Ver.1.5 – 29 Dec 2025 @MessaXS

module EnhancedMachines.VendingMachine.RedBurrito

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
		wrappedMethod(request);
		this.GiveMeRedBurritoStuff();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoStuff() -> Void {
		let TS: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGame());
		let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject();

		let items: array<TweakDBID>;
		let counts: array<Int32>;

		// ↓↓↓ ADD ITEMS HERE ↓↓↓
		// Materials
			ArrayPush(items, t"Items.CommonMaterial1"); ArrayPush(counts, 100); // Common Material
			ArrayPush(items, t"Items.UncommonMaterial1"); ArrayPush(counts, 100); // Uncommon Material
			ArrayPush(items, t"Items.RareMaterial1"); ArrayPush(counts, 100); // Rare Material
			ArrayPush(items, t"Items.EpicMaterial1"); ArrayPush(counts, 100); // Epic Material
			ArrayPush(items, t"Items.LegendaryMaterial1"); ArrayPush(counts, 100); // Legendary Material
		// Quick Hack Materials
			ArrayPush(items, t"Items.QuickHackUncommonMaterial1"); ArrayPush(counts, 100); // Quick Hack Uncommon Material
			ArrayPush(items, t"Items.QuickHackRareMaterial1"); ArrayPush(counts, 100); // Quick Hack Rare Material
			ArrayPush(items, t"Items.QuickHackEpicMaterial1"); ArrayPush(counts, 100); // Quick Hack Epic Material
			ArrayPush(items, t"Items.QuickHackLegendaryMaterial1"); ArrayPush(counts, 100); // Quick Hack Legendary Material
		// Buffs
			ArrayPush(items, t"Items.Blackmarket_CarryCapacityBooster"); ArrayPush(counts, 1); // OL' DONKEY - +100% CARRY CAPACITY | -20% MAX HEALTH
			ArrayPush(items, t"Items.Blackmarket_HealthBooster"); ArrayPush(counts, 1); // ASSKICK - +20% MAX HEALTH | -50% STAMINA REGEN
			ArrayPush(items, t"Items.Blackmarket_StaminaBooster"); ArrayPush(counts, 1); // JELLYTRICITY - +20% STAMINA REGEN | -15% MAX HEALTH
			ArrayPush(items, t"Items.Blackmarket_MemoryBooster"); ArrayPush(counts, 1); // RAM NUGS - +4 MAX RAM | -20% MAX HEALTH
			ArrayPush(items, t"Items.OxyBooster"); ArrayPush(counts, 1); // OXY BOOSTER - BREATHE UNDERWATER
			ArrayPush(items, t"Items.CarryCapacityBooster"); ArrayPush(counts, 1); // CAPACITY BOOSTER - MAX CARRY CAPACITY +50%
			ArrayPush(items, t"Items.HealthBooster"); ArrayPush(counts, 1); // HEALTH BOOSTER - MAX HEALTH +20%
			ArrayPush(items, t"Items.MemoryBooster"); ArrayPush(counts, 1); // RAM JOLT - MAX RAM UNITS +2
			ArrayPush(items, t"Items.StaminaBooster"); ArrayPush(counts, 1); // STAMINA BOOSTER - MAX STAMINA +50%
			ArrayPush(items, t"Items.BlackLaceV0"); ArrayPush(counts, 1); // BLACK LACE MK.1 - ARMOR +20 | +15% STAMINA REGEN | +5% DAMAGE | +5% CRIT CHANCE | +15% CRIT DAMAGE | -35% MAX HEALTH
			ArrayPush(items, t"Items.BlackLaceV1"); ArrayPush(counts, 1); // BLACK LACE MK.2 - ARMOR +30 | +25% STAMINA REGEN | +15% DAMAGE | +15% CRIT CHANCE | +25% CRIT DAMAGE | -50% MAX HEALTH
			ArrayPush(items, t"Items.StealthFood1"); ArrayPush(counts, 1); // EXOTIC FLORA AND FUNGI MYSTERY BAG - -30% VISIBILITY | -30% MAX HEALTH
			ArrayPush(items, t"Items.CarFood1"); ArrayPush(counts, 1); // HOT RODDY'S ROAD-READY COFFEE (RECALLED) - +20% DAMAGE WHILE DRIVING | +25% DAMAGE RECEIVED WHILE DRIVING
			ArrayPush(items, t"Items.HealthFood2"); ArrayPush(counts, 1); // MILITECH MRE (EXPIRED) - +20% MAX HEALTH | -25% HEALTH ITEMS EFFECTS
			ArrayPush(items, t"Items.HealthFood1"); ArrayPush(counts, 1); // COMRADE KOLYA'S PREMIUM BLACK CAVIAR - +25% HEALTH ITEMS EFFECTS | -20% MAX HEALTH
			ArrayPush(items, t"Items.HealthFood3"); ArrayPush(counts, 1); // HEFTY CHEF FETTUCCINE ALFREDO XXL (DISCONTINUED) - +25% MAX HEALTH | DEACTIVATED ATHLETICS ABILITIES
			ArrayPush(items, t"Items.NetrunnerFood2"); ArrayPush(counts, 1); // PHISH & CHIPS - +25% RAM RECOVERY RATE | -50% HEALTH ITEM EFFECTS
			ArrayPush(items, t"Items.CombatFood2"); ArrayPush(counts, 1); // CREATINE-LOADED PROTEIN LOG - +30% CRIT DAMAGE | -15% CRIT CHANCE
			ArrayPush(items, t"Items.CombatFood1"); ArrayPush(counts, 1); // DEVILDICK PEPPER CHIPS - +30% MELEE DAMAGE | +30% DAMAGE RECEIVED
			ArrayPush(items, t"Items.NetrunnerFood1"); ArrayPush(counts, 1); // BZZZZT! ENERGY DRINK (RECALLED) - +4 MAX RAM | -50% RAM RECOVERY RATE
			ArrayPush(items, t"Items.CombatFood3"); ArrayPush(counts, 1); // DOLPHIN JERKY - +5% DAMAGE | +10% CRIT CHANCE | +20% CRIT DAMAGE | -35% MAX HEALTH
		// Alcohol
			ArrayPush(items, t"Items.KerryAlcohol1"); ArrayPush(counts, 1); // 	CENTZON TOTOCHTIN INDIGO	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol10"); ArrayPush(counts, 1); // 	THE DAVID MARTINEZ	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol8"); ArrayPush(counts, 1); // 	JOHNNY SILVERHAND	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol9"); ArrayPush(counts, 1); // 	JACKIE WELLES	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.GoodQualityAlcohol1"); ArrayPush(counts, 1); // 	DONAGHY'S	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.GoodQualityAlcohol2"); ArrayPush(counts, 1); // 	CENTZON TOTOCHTIN	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.GoodQualityAlcohol3"); ArrayPush(counts, 1); // 	RANDVER	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.GoodQualityAlcohol4"); ArrayPush(counts, 1); // 	AB-SYNTH	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.GoodQualityAlcohol5"); ArrayPush(counts, 1); // 	CHAMPARADISE	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.GoodQualityAlcohol6"); ArrayPush(counts, 1); // 	LA PERLE DES ALPES	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol1"); ArrayPush(counts, 1); // 	ABYDOS CLASSIC	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol2"); ArrayPush(counts, 1); // 	ABYDOS KING SIZE	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol3"); ArrayPush(counts, 1); // 	BROSEPH ALE	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol4"); ArrayPush(counts, 1); // 	BROSEPH LAGER	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol5"); ArrayPush(counts, 1); // 	21ST STOUT	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol6"); ArrayPush(counts, 1); // 	BUMELANT	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol7"); ArrayPush(counts, 1); // 	CHIRRISCO	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol8"); ArrayPush(counts, 1); // 	PITORRO	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.LowQualityAlcohol9"); ArrayPush(counts, 1); // 	TEQUILA ESPECIAL	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.MediumQualityAlcohol1"); ArrayPush(counts, 1); // 	PINGO PALIDO	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.MediumQualityAlcohol2"); ArrayPush(counts, 1); // 	O'DICKIN WHISKEY	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.MediumQualityAlcohol3"); ArrayPush(counts, 1); // 	BOLSHEVIK VODKA	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.MediumQualityAlcohol4"); ArrayPush(counts, 1); // 	CONINE	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.MediumQualityAlcohol5"); ArrayPush(counts, 1); // 	JOE TIEL'S OKIE HOOCH	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.MediumQualityAlcohol6"); ArrayPush(counts, 1); // 	PAPA GARCIN	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.MediumQualityAlcohol7"); ArrayPush(counts, 1); // 	BLUE GRASS	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.NomadsAlcohol1"); ArrayPush(counts, 1); // 	MOONSHINE	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.NomadsAlcohol2"); ArrayPush(counts, 1); // 	TRAILERBREEW BEER	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol1"); ArrayPush(counts, 1); // 	CALAVERA FELIZ	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol2"); ArrayPush(counts, 1); // 	CHATEAU DELEN 2012	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol3"); ArrayPush(counts, 1); // 	ARMAGNAC MASSY	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol4"); ArrayPush(counts, 1); // 	SAKE UTAGAWA	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol5"); ArrayPush(counts, 1); // 	BAALBEK ARAK	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol6"); ArrayPush(counts, 1); // 	ROMVLVS GIN	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
			ArrayPush(items, t"Items.TopQualityAlcohol7"); ArrayPush(counts, 1); // 	PAUL NIGHT	 MOVEMENT SPEED -10% | WEAPON ACCURACY -50% | DURATION 30SEC
		// Drinks
			ArrayPush(items, t"Items.GoodQualityDrink1"); ArrayPush(counts, 1); // 	SAIN RUISSEAU	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink10"); ArrayPush(counts, 1); // 	WATER	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink11"); ArrayPush(counts, 1); // 	TOMATO JUICE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink2"); ArrayPush(counts, 1); // 	CHROMANTICORE LIME	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink3"); ArrayPush(counts, 1); // 	VITAMINE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink4"); ArrayPush(counts, 1); // 	CHROMANTICORE CARNIVAL	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink5"); ArrayPush(counts, 1); // 	TE MATCHA	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink6"); ArrayPush(counts, 1); // 	TE SENCHA	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink7"); ArrayPush(counts, 1); // 	TE OOLONG	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink8"); ArrayPush(counts, 1); // 	VATNOJOKULL	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityDrink9"); ArrayPush(counts, 1); // 	VATNOJOKULL	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink1"); ArrayPush(counts, 1); // 	MATAPANG COFFEE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink10"); ArrayPush(counts, 1); // 	NICOLA	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink11"); ArrayPush(counts, 1); // 	COFFEE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink12"); ArrayPush(counts, 1); // 	COFFEE SYNMILK	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink13"); ArrayPush(counts, 1); // 	LATTE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink2"); ArrayPush(counts, 1); // 	MATAPANG DECA	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink3"); ArrayPush(counts, 1); // 	DAIRING DAIRY	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink4"); ArrayPush(counts, 1); // 	SPUNKY MONKEY	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink5"); ArrayPush(counts, 1); // 	SPUNKY MONKEY MINT	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink6"); ArrayPush(counts, 1); // 	CIRRUS COLA 1	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink7"); ArrayPush(counts, 1); // 	CIRRUS COLA 2	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink8"); ArrayPush(counts, 1); // 	CIRRUS COLA 3	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityDrink9"); ArrayPush(counts, 1); // 	NICOLA BLUE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink1"); ArrayPush(counts, 1); // 	NICOLA FIRE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink10"); ArrayPush(counts, 1); // 	SOULHIKER	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink11"); ArrayPush(counts, 1); // 	OOLONG TEA	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink12"); ArrayPush(counts, 1); // 	TIANCHA 1	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink13"); ArrayPush(counts, 1); // 	TIANCHA 2	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink14"); ArrayPush(counts, 1); // 	SOOP	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink2"); ArrayPush(counts, 1); // 	NICOLA SAKURA	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink3"); ArrayPush(counts, 1); // 	REAL WATER 1	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink4"); ArrayPush(counts, 1); // 	REAL WATER 2	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink5"); ArrayPush(counts, 1); // 	NARANJITA CLASSIC	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink6"); ArrayPush(counts, 1); // 	NARANJITA ZERO	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink7"); ArrayPush(counts, 1); // 	CHROMANTICORE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink8"); ArrayPush(counts, 1); // 	TIANCHA KUMQUAT	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityDrink9"); ArrayPush(counts, 1); // 	TIANCHA POMELO	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.NomadsDrink1"); ArrayPush(counts, 1); // 	FILTERED RAINWATER	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
			ArrayPush(items, t"Items.NomadsDrink2"); ArrayPush(counts, 1); // 	CACTUS JUICE	 HYDRATION STATUS: MAX STAMINA +10% | STAMINA REGEN +50% PER SEC | DURATION 450SEC
		// Food
			ArrayPush(items, t"Items.HawtDawgCheese"); ArrayPush(counts, 1); // 	CHEESE HAWTDAWG	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.HawtDawgChilli"); ArrayPush(counts, 1); // 	CHILLI HAWTDAWG	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.HawtDawgClassic"); ArrayPush(counts, 1); // 	HAWT DAWG	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.HawtDawgKabanos"); ArrayPush(counts, 1); // 	PREMIUM HAWTDAWG	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.JudyFood1"); ArrayPush(counts, 1); // 	HAM AND MUSHROOM PIZZA	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.PanamFood1"); ArrayPush(counts, 1); // 	GALICIAN PIEROGI	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.RiverFood1"); ArrayPush(counts, 1); // 	SWEETS FOR SWEETIE CUPCAKE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.sq026_judy_sandwich"); ArrayPush(counts, 1); // 	HAM AND CHEESE SANDWICH	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood1"); ArrayPush(counts, 1); // 	REALFRUIT	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood10"); ArrayPush(counts, 1); // 	LOCUST PEPPERONI PIZZA	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood11"); ArrayPush(counts, 1); // 	ARTICHOKE AVACADO PIZZA	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood12"); ArrayPush(counts, 1); // 	TOFU'D TUNA PINEAPPLE PIZZA	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood13"); ArrayPush(counts, 1); // 	LOADED TAMALE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood2"); ArrayPush(counts, 1); // 	TAJINE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood3"); ArrayPush(counts, 1); // 	DARK CHOCOLATE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood4"); ArrayPush(counts, 1); // 	MILK CHOCOLATE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood5"); ArrayPush(counts, 1); // 	NORIMAKI	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood6"); ArrayPush(counts, 1); // 	NIGIRI	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood7"); ArrayPush(counts, 1); // 	PIERRE'S CROISSANTS	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood8"); ArrayPush(counts, 1); // 	GOT ESCARGOT	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.GoodQualityFood9"); ArrayPush(counts, 1); // 	GOJILLA	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood1"); ArrayPush(counts, 1); // 	EEZYBEEF	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood10"); ArrayPush(counts, 1); // 	WONTONS	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood12"); ArrayPush(counts, 1); // 	HOLOBITES GRAPE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood13"); ArrayPush(counts, 1); // 	HOLOBITES MINT	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood14"); ArrayPush(counts, 1); // 	HOLOBITES PEACH	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood15"); ArrayPush(counts, 1); // 	ORGIATIC SALSA AGAVE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood16"); ArrayPush(counts, 1); // 	ORGIATIC VINEGAR CHILI	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood17"); ArrayPush(counts, 1); // 	MOONCHIES ANDROMEDA	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood18"); ArrayPush(counts, 1); // 	MOONCHIES PULSAR	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood19"); ArrayPush(counts, 1); // 	MOONCHIES SOUR PLANET	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood20"); ArrayPush(counts, 1); // 	LEELOU BEANS LAGOON	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood21"); ArrayPush(counts, 1); // 	LEELOU BEANS MEYER LEMON	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood22"); ArrayPush(counts, 1); // 	LEELOU BEANS PLANTAIN	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood23"); ArrayPush(counts, 1); // 	LEELOU BEANS TROPICAL	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood24"); ArrayPush(counts, 1); // 	SOJASIL ERUPTION	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood25"); ArrayPush(counts, 1); // 	SOJASIL MOLOTOV COCKTAIL	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood26"); ArrayPush(counts, 1); // 	SOJASIL NITROGLYCERIN	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood27"); ArrayPush(counts, 1); // 	SOJASIL RADIOACTIVE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood28"); ArrayPush(counts, 1); // 	SOJASIL SECOND IMPACT	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood3"); ArrayPush(counts, 1); // 	HAWT DAWG	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood5"); ArrayPush(counts, 1); // 	MOONCHIES	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood6"); ArrayPush(counts, 1); // 	MR. WHITEY	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood7"); ArrayPush(counts, 1); // 	ORGIATIC OMNIFLAVE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood8"); ArrayPush(counts, 1); // 	POP-TURD	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.LowQualityFood9"); ArrayPush(counts, 1); // 	SOJASIL DYNAMITE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood1"); ArrayPush(counts, 1); // 	SYNTHSNACK	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood10"); ArrayPush(counts, 1); // 	JAMBALAYA	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood11"); ArrayPush(counts, 1); // 	MR. WHITEY MINT	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood12"); ArrayPush(counts, 1); // 	BURRITO XXL 1	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood13"); ArrayPush(counts, 1); // 	BURRITO XXL 2	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood14"); ArrayPush(counts, 1); // 	MR. WHITEY CRYSTAL	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood15"); ArrayPush(counts, 1); // 	MR. WHITEY SPICED	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood16"); ArrayPush(counts, 1); // 	TACO	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood17"); ArrayPush(counts, 1); // 	SHWABSHWAB GRAPE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood18"); ArrayPush(counts, 1); // 	SHWABSHWAB KETCHUP	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood19"); ArrayPush(counts, 1); // 	SHWABSHWAB BLUE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood2"); ArrayPush(counts, 1); // 	RAMMMMEN	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood20"); ArrayPush(counts, 1); // 	SLAUGHTERHOUSE VEGGIE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood3"); ArrayPush(counts, 1); // 	SLAUGHTERHOUSE JERKY	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood4"); ArrayPush(counts, 1); // 	BURRITO XXL	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood5"); ArrayPush(counts, 1); // 	ALL FOODS MEAT DELIGHT	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood6"); ArrayPush(counts, 1); // 	ALL FOODS VEGGIE DELIGHT	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood7"); ArrayPush(counts, 1); // 	SLAUGHTERHOUSE PRIME	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood8"); ArrayPush(counts, 1); // 	YIKES TOFU	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.MediumQualityFood9"); ArrayPush(counts, 1); // 	AVE SAITAN	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.NomadsFood1"); ArrayPush(counts, 1); // 	SOY PASTE	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
			ArrayPush(items, t"Items.NomadsFood2"); ArrayPush(counts, 1); // 	DRIED MEAT	 NOURISHMENT STATUS: MAX HEALTH +5% | HEALTH REGEN +0.5% PER SEC OUTSIDE OF COMBAT | DURATION 450SEC
		// ↑↑↑ ADD ITEMS HERE ↑↑↑

		let i = 0;
		while i < ArraySize(items) {
				let id: ItemID = ItemID.FromTDBID(items[i]);
				if TDBID.IsValid(ItemID.GetTDBID(id)) {
						TS.GiveItem(player, id, counts[i]);
				};
				i += 1;
		};
}
