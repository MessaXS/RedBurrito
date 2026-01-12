// RedBurritoCrafting Ver.2.0 – 12 Jan 2026 @MessaXS

module RedBurrito.Items.Crafting

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
	wrappedMethod(request);
	this.GiveMeRedBurritoCrafting();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoCrafting() -> Void {
	let TS: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGame());
	let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject();

	let items: array<TweakDBID>;
	let counts: array<Int32>;

	// ↓↓↓ ADD ITEMS HERE ↓↓↓
        ArrayPush(items, t"Items.UncommonVestRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	5HI3LD SUPERB BREASTPLATE	TIER 2
        ArrayPush(items, t"Items.CommonChaoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	A-22B CHAO	TIER 1
        ArrayPush(items, t"Items.UncommonChaoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	A-22B CHAO	TIER 2
        ArrayPush(items, t"Items.RareChaoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	A-22B CHAO	TIER 3
        ArrayPush(items, t"Items.EpicChaoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	A-22B CHAO	TIER 4
        ArrayPush(items, t"Items.LegendaryChaoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	A-22B CHAO	TIER 5
        ArrayPush(items, t"Items.RareFormalShoesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	ABENDSTERN POLYCARBONATE DRESS WEDGES	TIER 3
        ArrayPush(items, t"Items.MeleeMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	AIRSTRIKE	TIER 2
        ArrayPush(items, t"Items.MeleeMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	AIRSTRIKE	TIER 3
        ArrayPush(items, t"Items.MeleeMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	AIRSTRIKE	TIER 4
        ArrayPush(items, t"Items.MeleeMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	AIRSTRIKE	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Overture_Cassidy_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	AMNESTY	TIER 5
        ArrayPush(items, t"Items.LegendaryTechRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	AOI TORA ENHANCED BD WREATH	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Kenshin_Frank_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	APPARITION	TIER 5
        ArrayPush(items, t"Items.EpicLooseShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	AQUA UNIVERSE LUXE ARAMID WEAVE SHIRT	TIER 4
        ArrayPush(items, t"Items.UncommonVisorRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	ARASAKA TACTICAL TECHGOGS	TIER 2
        ArrayPush(items, t"Items.Recipe_Preset_Overture_Kerry_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	ARCHANGEL	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Overture_Kerry_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	ARCHANGEL	TIER 5
        ArrayPush(items, t"Items.Recipe_BerserkFragment3"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	ARMORED BERSERK	TIER 5
        ArrayPush(items, t"Items.CommonAshuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	ASHURA	TIER 1
        ArrayPush(items, t"Items.UncommonAshuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	ASHURA	TIER 2
        ArrayPush(items, t"Items.RareAshuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	ASHURA	TIER 3
        ArrayPush(items, t"Items.EpicAshuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	ASHURA	TIER 4
        ArrayPush(items, t"Items.LegendaryAshuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	ASHURA	TIER 5
        ArrayPush(items, t"Items.Recipe_Common_Zhuo_Eight_Star"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	BA XING CHONG	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Zhuo_Eight_Star"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	BA XING CHONG	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Zhuo_Eight_Star"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	BA XING CHONG	TIER 3
        ArrayPush(items, t"Items.Recipe_Epic_Zhuo_Eight_Star"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	BA XING CHONG	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Zhuo_Eight_Star"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	BA XING CHONG	TIER 5
        ArrayPush(items, t"Items.Recipe_Legendary_Zhuo_Eight_Star"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	BA XING CHONG	TIER 5
        ArrayPush(items, t"Items.RareFormalPantsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	BAI LONG FORMAL PANTS	TIER 3
        ArrayPush(items, t"Items.Recipe_WhistleLvl0Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	BAIT	TIER 1
        ArrayPush(items, t"Items.Recipe_WhistleLvl1Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	BAIT	TIER 2
        ArrayPush(items, t"Items.Recipe_WhistleLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	BAIT	TIER 5
        ArrayPush(items, t"Items.Recipe_WhistleLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	BAIT (ICONIC)	TIER 5
        ArrayPush(items, t"Items.BluntMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	BARBARIAN	TIER 5
        ArrayPush(items, t"Items.CommonBatRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	BASEBALL BAT	TIER 1
        ArrayPush(items, t"Items.UncommonBatRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	BASEBALL BAT	TIER 2
        ArrayPush(items, t"Items.RareBatRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	BASEBALL BAT	TIER 3
        ArrayPush(items, t"Items.EpicBatRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	BASEBALL BAT	TIER 4
        ArrayPush(items, t"Items.EpicBatRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	BASEBALL BAT	TIER 4
        ArrayPush(items, t"Items.LegendaryBatRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	BASEBALL BAT	TIER 5
        ArrayPush(items, t"Items.Recipe_HighChargedBattery"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BATTERY HIGH CAPACITY	TIER 4
        ArrayPush(items, t"Items.Recipe_LowChargedBattery"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BATTERY LOW CAPACITY	TIER 3
        ArrayPush(items, t"Items.Recipe_MediumChargedBattery"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BATTERY MEDIUM CAPACITY	TIER 4
        ArrayPush(items, t"Items.Recipe_AnimalsBerserkFragment1"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BEAST MODE	TIER 5
        ArrayPush(items, t"Items.RangedMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	BETTER HALF	TIER 5
        ArrayPush(items, t"Items.ARSMGLMGMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	BIG MAG	TIER 2
        ArrayPush(items, t"Items.ARSMGLMGMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	BIG MAG	TIER 3
        ArrayPush(items, t"Items.ARSMGLMGMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	BIG MAG	TIER 4
        ArrayPush(items, t"Items.ARSMGLMGMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	BIG MAG	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Katana_GoG"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BLACK UNICORN	TIER 1
        ArrayPush(items, t"Items.Recipe_Preset_Katana_GoG_Epic"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BLACK UNICORN	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Katana_GoG_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BLACK UNICORN	TIER 5
        ArrayPush(items, t"Items.Recipe_ChemicalDamageEdge"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BLADE CHEMICAL	TIER 3
        ArrayPush(items, t"Items.Recipe_ElectricDamageEdge"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BLADE ELECTRIC	TIER 3
        ArrayPush(items, t"Items.Recipe_PhysicalDamageEdge"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BLADE PHYSICAL	TIER 3
        ArrayPush(items, t"Items.Recipe_ThermalDamageEdge"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BLADE THERMAL	TIER 3
        ArrayPush(items, t"Items.BladeMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	BLADE	BLEEDOUT	TIER 2
        ArrayPush(items, t"Items.BladeMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	BLADE	BLEEDOUT	TIER 3
        ArrayPush(items, t"Items.BladeMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	BLADE	BLEEDOUT	TIER 4
        ArrayPush(items, t"Items.BladeMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	BLADE	BLEEDOUT	TIER 5
        ArrayPush(items, t"Items.BluntMod2_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	BLOODBRUISER	TIER 2
        ArrayPush(items, t"Items.BluntMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	BLOODBRUISER	TIER 3
        ArrayPush(items, t"Items.BluntMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	BLOODBRUISER	TIER 4
        ArrayPush(items, t"Items.BluntMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	BLOODBRUISER	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Tactician_Dino_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	BLOODY MARIA	TIER 1
        ArrayPush(items, t"Items.EpicShortsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	BLUE BRICK HOTPANTS	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Neurotoxin_Knife_Iconic_Epic"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BLUE FANG	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Neurotoxin_Knife_Iconic_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BLUE FANG	TIER 5
        ArrayPush(items, t"Items.ThrowMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	BOOMERANG	TIER 2
        ArrayPush(items, t"Items.ThrowMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	BOOMERANG	TIER 3
        ArrayPush(items, t"Items.ThrowMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	BOOMERANG	TIER 4
        ArrayPush(items, t"Items.ThrowMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	BOOMERANG	TIER 5
        ArrayPush(items, t"Items.EpicHatRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	BOSS MAFIOSO TRIBLY	TIER 4
        ArrayPush(items, t"Items.RecipeBonesMcCoy70VUncommon"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	BOUNCE BACK MK.2	TIER 2
        ArrayPush(items, t"Items.RecipeBonesMcCoy70VEpic"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	BOUNCE BACK MK.4	TIER 4
        ArrayPush(items, t"Items.RecipeBonesMcCoy70V0"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	BOUNCEBACK MK.I	TIER 1
        ArrayPush(items, t"Items.RecipeBonesMcCoy70V1"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	BOUNCEBACK MK.III	TIER 2
        ArrayPush(items, t"Items.RecipeBonesMcCoy70V2"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	BOUNCEBACK MK.III	TIER 3
        ArrayPush(items, t"Items.Recipe_Common_Nekomata_Breakthrough"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	BREAKTHROUGH	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Nekomata_Breakthrough"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	BREAKTHROUGH	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Nekomata_Breakthrough"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	BREAKTHROUGH	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Nekomata_Breakthrough"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	BREAKTHROUGH	TIER 4
        ArrayPush(items, t"Items.Recipe_Epic_Nekomata_Breakthrough"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	BREAKTHROUGH	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Nekomata_Breakthrough_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	BREAKTHROUGH	TIER 5
        ArrayPush(items, t"Items.Recipe_Legendary_Nekomata_Breakthrough"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	BREAKTHROUGH	TIER 5
        ArrayPush(items, t"Items.Recipe_BerserkFragment4"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	BRUISING BERSERK	TIER 5
        ArrayPush(items, t"Items.CommonButchersKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BUTCHER'S CLEAVER	TIER 1
        ArrayPush(items, t"Items.UncommonButchersKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BUTCHER'S CLEAVER	TIER 2
        ArrayPush(items, t"Items.RareButchersKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BUTCHER'S CLEAVER	TIER 3
        ArrayPush(items, t"Items.EpicButchersKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BUTCHER'S CLEAVER	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Butchers_Knife_Iconic_Epic"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BUTCHER'S CLEAVER	TIER 4
        ArrayPush(items, t"Items.LegendaryButchersKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BUTCHER'S CLEAVER	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Butchers_Knife_Iconic_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BUTCHER'S CLEAVER	TIER 5
        ArrayPush(items, t"Items.Recipe_Common_Pulsar_Buzzsaw"); ArrayPush(counts, 1); // 	WEAPONS	SMG	BUZZSAW	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Pulsar_Buzzsaw"); ArrayPush(counts, 1); // 	WEAPONS	SMG	BUZZSAW	TIER 2
        ArrayPush(items, t"Items.Recipe_Preset_Pulsar_Buzzsaw"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	BUZZSAW	TIER 3
        ArrayPush(items, t"Items.Recipe_Rare_Pulsar_Buzzsaw"); ArrayPush(counts, 1); // 	WEAPONS	SMG	BUZZSAW	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Pulsar_Buzzsaw_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	BUZZSAW	TIER 4
        ArrayPush(items, t"Items.Recipe_Epic_Pulsar_Buzzsaw"); ArrayPush(counts, 1); // 	WEAPONS	SMG	BUZZSAW	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Pulsar_Buzzsaw_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	BUZZSAW	TIER 5
        ArrayPush(items, t"Items.Recipe_Legendary_Pulsar_Buzzsaw"); ArrayPush(counts, 1); // 	WEAPONS	SMG	BUZZSAW	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Wakako_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	BYAKKO	TIER 1
        ArrayPush(items, t"Items.RecipeCarryCapacityBooster"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	CAPACITY BOOSTER	TIER 2
        ArrayPush(items, t"Items.CommonCarnageRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CARNAGE	TIER 1
        ArrayPush(items, t"Items.UncommonCarnageRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CARNAGE	TIER 2
        ArrayPush(items, t"Items.RareCarnageRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CARNAGE	TIER 3
        ArrayPush(items, t"Items.EpicCarnageRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CARNAGE	TIER 4
        ArrayPush(items, t"Items.LegendaryCarnageRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CARNAGE	TIER 5
        ArrayPush(items, t"Items.LegendaryCarnageRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CARNAGE	TIER 5
        ArrayPush(items, t"Items.Recipe_BerserkFragment2"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	CHAINED BERSERK	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Kenshin_Royce_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	CHAOS	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Kenshin_Royce_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	CHAOS	TIER 5
        ArrayPush(items, t"Items.RecipeGrenadeIncendiaryRare"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	CHAR INCENDIARY GRENADE	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeIncendiaryLegendary"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	CHAR INCENDIARY GRENADE	TIER 5
        ArrayPush(items, t"Items.RecipeGrenadeIncendiaryHoming"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	CHAR INCENDIARY GRENADE [HOMING]	TIER 4
        ArrayPush(items, t"Items.RecipeGrenadeIncendiaryRegular"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	CHAR INCENDIARY GRENADE [REGULAR]	TIER 2
        ArrayPush(items, t"Items.RecipeGrenadeIncendiarySticky"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	CHAR INCENDIARY GRENADE [STICKY]	TIER 3
        ArrayPush(items, t"Items.CommonChefsKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CHEF'S KNIFE	TIER 1
        ArrayPush(items, t"Items.UncommonChefsKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CHEF'S KNIFE	TIER 2
        ArrayPush(items, t"Items.RareChefsKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CHEF'S KNIFE	TIER 3
        ArrayPush(items, t"Items.EpicChefsKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CHEF'S KNIFE	TIER 4
        ArrayPush(items, t"Items.LegendaryChefsKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CHEF'S KNIFE	TIER 5
        ArrayPush(items, t"Items.Recipe_ChemicalDamageRound"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	CHEMICAL ROUND	TIER 3
        ArrayPush(items, t"Items.LegendaryFormalSkirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	CHICK PINK DRAGON SKIRT	TIER 5
        ArrayPush(items, t"Items.RareShortsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	CLASSIC ARAMI-WEAVE DENIM SHORTS	TIER 3
        ArrayPush(items, t"Items.UncommonFormalShoesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	CLASSIC EVENING PUMPS	TIER 2
        ArrayPush(items, t"Items.CommonFangedAxeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CLAW	TIER 1
        ArrayPush(items, t"Items.UncommonFangedAxeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CLAW	TIER 2
        ArrayPush(items, t"Items.RareFangedAxeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CLAW	TIER 3
        ArrayPush(items, t"Items.EpicFangedAxeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CLAW	TIER 4
        ArrayPush(items, t"Items.LegendaryFangedAxeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CLAW	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Cocktail_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	COCKTAIL STICK	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Cocktail_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	COCKTAIL STICK	TIER 5
        ArrayPush(items, t"Items.LegendaryShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	COMPOSITE GEISHA COMBAT SHIRT	TIER 5
        ArrayPush(items, t"Items.LegendaryShortsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	COMPOSITE KO JAGA SILK-THREADED HOTPANTS	TIER 5
        ArrayPush(items, t"Items.Recipe_Common_Burya_Comrade"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	COMRADE’S HAMMER	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Burya_Comrade"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	COMRADE’S HAMMER	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Burya_Comrade"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	COMRADE’S HAMMER	TIER 3
        ArrayPush(items, t"Items.Recipe_Epic_Burya_Comrade"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	COMRADE’S HAMMER	TIER 4
        ArrayPush(items, t"Items.Recipe_Legendary_Burya_Comrade"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	COMRADE’S HAMMER	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Burya_Comrade"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	COMRADE'S HAMMER	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Burya_Comrade_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	COMRADE'S HAMMER	TIER 5
        ArrayPush(items, t"Items.ShotgunMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	SHOTGUN	CONDENSER	TIER 2
        ArrayPush(items, t"Items.ShotgunMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	SHOTGUN	CONDENSER	TIER 3
        ArrayPush(items, t"Items.ShotgunMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	SHOTGUN	CONDENSER	TIER 4
        ArrayPush(items, t"Items.ShotgunMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	SHOTGUN	CONDENSER	TIER 5
        ArrayPush(items, t"Items.Recipe_ContagionProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CONTAGION	TIER 2
        ArrayPush(items, t"Items.Recipe_ContagionLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CONTAGION	TIER 3
        ArrayPush(items, t"Items.Recipe_ContagionLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CONTAGION	TIER 4
        ArrayPush(items, t"Items.Recipe_ContagionLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CONTAGION	TIER 5
        ArrayPush(items, t"Items.Recipe_ContagionLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CONTAGION (ICONIC)	TIER 5
        ArrayPush(items, t"Items.UncommonCapRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	COTTON MOTORCYCLE CAP WITH PROTECTIVE INSET	TIER 2
        ArrayPush(items, t"Items.Recipe_Preset_Cane_Fingers_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	COTTONMOUTH	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Cane_Fingers_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	COTTONMOUTH	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Overture_River_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	CRASH	TIER 5
        ArrayPush(items, t"Items.Recipe_LocomotionMalfunctionProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CRIPPLE MOVEMENT	TIER 2
        ArrayPush(items, t"Items.Recipe_LocomotionMalfunctionLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CRIPPLE MOVEMENT	TIER 3
        ArrayPush(items, t"Items.Recipe_LocomotionMalfunctionLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CRIPPLE MOVEMENT	TIER 4
        ArrayPush(items, t"Items.Recipe_LocomotionMalfunctionLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CRIPPLE MOVEMENT	TIER 5
        ArrayPush(items, t"Items.Recipe_LocomotionMalfunctionLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CRIPPLE MOVEMENT (ICONIC)	TIER 5
        ArrayPush(items, t"Items.PowerMod3_Uncommon_Recipe_1"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	CRITOCHET	TIER 2
        ArrayPush(items, t"Items.PowerMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	CRITOCHET	TIER 3
        ArrayPush(items, t"Items.PowerMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	CRITOCHET	TIER 4
        ArrayPush(items, t"Items.PowerMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	CRITOCHET	TIER 5
        ArrayPush(items, t"Items.CommonCrowbarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	CROWBAR	TIER 1
        ArrayPush(items, t"Items.UncommonCrowbarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	CROWBAR	TIER 2
        ArrayPush(items, t"Items.RareCrowbarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	CROWBAR	TIER 3
        ArrayPush(items, t"Items.EpicCrowbarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	CROWBAR	TIER 4
        ArrayPush(items, t"Items.LegendaryCrowbarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	CROWBAR	TIER 5
        ArrayPush(items, t"Items.CommonCrusherRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CRUSHER	TIER 1
        ArrayPush(items, t"Items.UncommonCrusherRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CRUSHER	TIER 2
        ArrayPush(items, t"Items.RareCrusherRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CRUSHER	TIER 3
        ArrayPush(items, t"Items.EpicCrusherRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CRUSHER	TIER 4
        ArrayPush(items, t"Items.LegendaryCrusherRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	CRUSHER	TIER 5
        ArrayPush(items, t"Items.LegendaryFormalShoesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	CRYSTAL LYLY EVENING PUMPS (SHOES) WITH EXTRA-DURABLE SOLES	TIER 5
        ArrayPush(items, t"Items.TechMod2_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	C-THRU	TIER 2
        ArrayPush(items, t"Items.TechMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	C-THRU	TIER 3
        ArrayPush(items, t"Items.TechMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	C-THRU	TIER 4
        ArrayPush(items, t"Items.TechMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	C-THRU	TIER 5
        ArrayPush(items, t"Items.CommonChainswordRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CUT-O-MATIC	TIER 1
        ArrayPush(items, t"Items.UncommonChainswordRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CUT-O-MATIC	TIER 2
        ArrayPush(items, t"Items.RareChainswordRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CUT-O-MATIC	TIER 3
        ArrayPush(items, t"Items.EpicChainswordRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CUT-O-MATIC	TIER 4
        ArrayPush(items, t"Items.LegendaryChainswordRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	CUT-O-MATIC	TIER 5
        ArrayPush(items, t"Items.EpicFormalJacketRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	CYAN MULTIRESIST EVENING JACKET	TIER 4
        ArrayPush(items, t"Items.Recipe_MadnessLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CYBERPSYCHOSIS	TIER 4
        ArrayPush(items, t"Items.Recipe_MadnessLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CYBERPSYCHOSIS	TIER 5
        ArrayPush(items, t"Items.Recipe_MadnessLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CYBERPSYCHOSIS (ICONIC)	TIER 5
        ArrayPush(items, t"Items.Recipe_DisableCyberwareProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CYBERWARE MALFUNCTION	TIER 2
        ArrayPush(items, t"Items.Recipe_DisableCyberwareLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CYBERWARE MALFUNCTION	TIER 3
        ArrayPush(items, t"Items.Recipe_DisableCyberwareLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CYBERWARE MALFUNCTION	TIER 4
        ArrayPush(items, t"Items.Recipe_DisableCyberwareLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CYBERWARE MALFUNCTION	TIER 5
        ArrayPush(items, t"Items.Recipe_DisableCyberwareLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	CYBERWARE MALFUNCTION (ICONIC)	TIER 5
        ArrayPush(items, t"Items.MeleeMod2_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	CYCLONE	TIER 2
        ArrayPush(items, t"Items.MeleeMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	CYCLONE	TIER 3
        ArrayPush(items, t"Items.MeleeMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	CYCLONE	TIER 4
        ArrayPush(items, t"Items.MeleeMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	CYCLONE	TIER 5
        ArrayPush(items, t"Items.CommonCopperheadRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 COPPERHEAD	TIER 1
        ArrayPush(items, t"Items.UncommonCopperheadRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 COPPERHEAD	TIER 2
        ArrayPush(items, t"Items.UncommonCopperheadRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 COPPERHEAD	TIER 2
        ArrayPush(items, t"Items.RareCopperheadRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 COPPERHEAD	TIER 3
        ArrayPush(items, t"Items.EpicCopperheadRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 COPPERHEAD	TIER 4
        ArrayPush(items, t"Items.LegendaryCopperheadRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 COPPERHEAD	TIER 5
        ArrayPush(items, t"Items.CommonSidewinderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 SIDEWINDER	TIER 1
        ArrayPush(items, t"Items.UncommonSidewinderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 SIDEWINDER	TIER 2
        ArrayPush(items, t"Items.RareSidewinderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 SIDEWINDER	TIER 3
        ArrayPush(items, t"Items.EpicSidewinderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 SIDEWINDER	TIER 4
        ArrayPush(items, t"Items.LegendarySidewinderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	D5 SIDEWINDER	TIER 5
        ArrayPush(items, t"Items.CommonUmbraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	DA8 UMBRA	TIER 1
        ArrayPush(items, t"Items.UncommonUmbraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	DA8 UMBRA	TIER 2
        ArrayPush(items, t"Items.RareUmbraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	DA8 UMBRA	TIER 3
        ArrayPush(items, t"Items.EpicUmbraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	DA8 UMBRA	TIER 4
        ArrayPush(items, t"Items.LegendaryUmbraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	DA8 UMBRA	TIER 5
        ArrayPush(items, t"Items.LegendaryTShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	DAEMON HUNTER RESISTANCE-COATED TANK TOP	TIER 5
        ArrayPush(items, t"Items.UncommonBalaclavaRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	DARRA POLYTEHCNIC TACTICAL BALACLAVA	TIER 2
        ArrayPush(items, t"Items.CommonSataraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 SATARA	TIER 1
        ArrayPush(items, t"Items.UncommonSataraRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 SATARA	TIER 2
        ArrayPush(items, t"Items.UncommonSataraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 SATARA	TIER 2
        ArrayPush(items, t"Items.RareSataraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 SATARA	TIER 3
        ArrayPush(items, t"Items.EpicSataraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 SATARA	TIER 4
        ArrayPush(items, t"Items.LegendarySataraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 SATARA	TIER 5
        ArrayPush(items, t"Items.CommonTesteraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 TESTERA	TIER 1
        ArrayPush(items, t"Items.UncommonTesteraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 TESTERA	TIER 2
        ArrayPush(items, t"Items.RareTesteraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 TESTERA	TIER 3
        ArrayPush(items, t"Items.EpicTesteraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 TESTERA	TIER 4
        ArrayPush(items, t"Items.LegendaryTesteraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-2 TESTERA	TIER 5
        ArrayPush(items, t"Items.CommonIglaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 IGLA	TIER 1
        ArrayPush(items, t"Items.UncommonIglaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 IGLA	TIER 2
        ArrayPush(items, t"Items.RareIglaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 IGLA	TIER 3
        ArrayPush(items, t"Items.EpicIglaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 IGLA	TIER 4
        ArrayPush(items, t"Items.LegendaryIglaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 IGLA	TIER 5
        ArrayPush(items, t"Items.CommonPalicaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 PALICA	TIER 1
        ArrayPush(items, t"Items.UncommonPalicaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 PALICA	TIER 2
        ArrayPush(items, t"Items.RarePalicaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 PALICA	TIER 3
        ArrayPush(items, t"Items.EpicPalicaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 PALICA	TIER 4
        ArrayPush(items, t"Items.LegendaryPalicaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	DB-4 PALICA	TIER 5
        ArrayPush(items, t"Items.LegendaryJacketRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	DEADLY LAGOON ARMORED SYN-SILK POZER-JACKET	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Nue_Maiko_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DEATH AND TAXES	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Nue_Maiko_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DEATH AND TAXES	TIER 5
        ArrayPush(items, t"Items.RareJacketRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	DENKI-SHIN THERMOSET HYBRID CRYSTALJOCK BOMBER	TIER 3
        ArrayPush(items, t"Items.Recipe_GrenadeExplodeLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	DETONATE GRENADE	TIER 4
        ArrayPush(items, t"Items.Recipe_GrenadeExplodeLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	DETONATE GRENADE	TIER 5
        ArrayPush(items, t"Items.Recipe_GrenadeExplodeLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	DETONATE GRENADE (ICONIC)	TIER 5
        ArrayPush(items, t"Items.Recipe_BerserkFragment7"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	DEVASTATING BERSERK	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Sidewinder_Divided_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DIVIDED WE STAND	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Sidewinder_Divided_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DIVIDED WE STAND	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Nova_Doom_Doom_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DOOM DOOM	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Nova_Doom_Doom_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DOOM DOOM	TIER 5
        ArrayPush(items, t"Items.CommonQuasarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR12 QUASAR	TIER 1
        ArrayPush(items, t"Items.UncommonQuasarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR12 QUASAR	TIER 2
        ArrayPush(items, t"Items.RareQuasarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR12 QUASAR	TIER 3
        ArrayPush(items, t"Items.EpicQuasarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR12 QUASAR	TIER 4
        ArrayPush(items, t"Items.LegendaryQuasarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR12 QUASAR	TIER 5
        ArrayPush(items, t"Items.LegendaryQuasarRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR12 QUASAR	TIER 5
        ArrayPush(items, t"Items.CommonNovaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR5 NOVA	TIER 1
        ArrayPush(items, t"Items.UncommonNovaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR5 NOVA	TIER 2
        ArrayPush(items, t"Items.RareNovaRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR5 NOVA	TIER 3
        ArrayPush(items, t"Items.RareNovaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR5 NOVA	TIER 3
        ArrayPush(items, t"Items.EpicNovaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR5 NOVA	TIER 4
        ArrayPush(items, t"Items.LegendaryNovaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	DR5 NOVA	TIER 5
        ArrayPush(items, t"Items.CommonPulsarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	DS1 PULSAR	TIER 1
        ArrayPush(items, t"Items.UncommonPulsarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	DS1 PULSAR	TIER 2
        ArrayPush(items, t"Items.RarePulsarRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	SMG	DS1 PULSAR	TIER 3
        ArrayPush(items, t"Items.RarePulsarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	DS1 PULSAR	TIER 3
        ArrayPush(items, t"Items.EpicPulsarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	DS1 PULSAR	TIER 4
        ArrayPush(items, t"Items.LegendaryPulsarRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	DS1 PULSAR	TIER 5
        ArrayPush(items, t"Items.LegendaryCapRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	DURABLE EMERALD SPEED POLYAMIDE BEANIE	TIER 5
        ArrayPush(items, t"Items.UncommonHelmetRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	DURABLE LIME SPEED MODULAR HELMET	TIER 2
        ArrayPush(items, t"Items.UncommonPantsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	DURABLE SMILEY HARD LOOSE-FITS	TIER 2
        ArrayPush(items, t"Items.RareFormalJacketRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	DURABLE SYNSILK BLAZER	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Lexington_Wilson_Rare"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DYING NIGHT	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Lexington_Wilson_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DYING NIGHT	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Lexington_Wilson_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	DYING NIGHT	TIER 5
        ArrayPush(items, t"Items.CommonBatonAlphaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON ALPHA	TIER 1
        ArrayPush(items, t"Items.UncommonBatonRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON ALPHA	TIER 2
        ArrayPush(items, t"Items.UncommonBatonRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON ALPHA	TIER 2
        ArrayPush(items, t"Items.RareBatonAlphaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON ALPHA	TIER 3
        ArrayPush(items, t"Items.EpicBatonAlphaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON ALPHA	TIER 4
        ArrayPush(items, t"Items.LegendaryBatonAlphaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON ALPHA	TIER 5
        ArrayPush(items, t"Items.CommonBatonBetaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON BETA	TIER 1
        ArrayPush(items, t"Items.UncommonBatonBetaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON BETA	TIER 2
        ArrayPush(items, t"Items.RareBatonBetaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON BETA	TIER 3
        ArrayPush(items, t"Items.EpicBatonBetaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON BETA	TIER 4
        ArrayPush(items, t"Items.LegendaryBatonBetaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON BETA	TIER 5
        ArrayPush(items, t"Items.CommonBatonGammaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON GAMMA	TIER 1
        ArrayPush(items, t"Items.UncommonBatonGammaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON GAMMA	TIER 2
        ArrayPush(items, t"Items.RareBatonGammaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON GAMMA	TIER 3
        ArrayPush(items, t"Items.EpicBatonGammaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON GAMMA	TIER 4
        ArrayPush(items, t"Items.LegendaryBatonGammaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	ELECTRIC BATON GAMMA	TIER 5
        ArrayPush(items, t"Items.Recipe_ElectricDamageRound"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	ELECTRICAL ROUND	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeEMPUncommon"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	EMP GRENADE	TIER 2
        ArrayPush(items, t"Items.RecipeGrenadeEMPRare"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	EMP GRENADE	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeEMPLegendary"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	EMP GRENADE	TIER 5
        ArrayPush(items, t"Items.RecipeGrenadeEMPHoming"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	EMP GRENADE [HOMING]	TIER 4
        ArrayPush(items, t"Items.RecipeGrenadeEMPRegular"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	EMP GRENADE [REGULAR]	TIER 2
        ArrayPush(items, t"Items.RecipeGrenadeEMPSticky"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	EMP GRENADE [STICKY]	TIER 3
        ArrayPush(items, t"Items.LegendaryCasualShoesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	ENHANCED DAEMON HUNTER TONGUES (SLIP-ON SNEAKERS)	TIER 5
        ArrayPush(items, t"Items.RangedMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	EQUALIZER	TIER 2
        ArrayPush(items, t"Items.RangedMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	EQUALIZER	TIER 3
        ArrayPush(items, t"Items.RangedMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	EQUALIZER	TIER 4
        ArrayPush(items, t"Items.RangedMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	EQUALIZER	TIER 5
        ArrayPush(items, t"Items.Recipe_Common_Borg4a_HauntedGun"); ArrayPush(counts, 1); // 	WEAPONS	SMG	EREBUS	TIER 1
        ArrayPush(items, t"Items.Recipe_Preset_Borg4a_HauntedGun"); ArrayPush(counts, 1); // 	WEAPONS	SMG	EREBUS	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Borg4a_HauntedGun"); ArrayPush(counts, 1); // 	WEAPONS	SMG	EREBUS	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Borg4a_HauntedGun"); ArrayPush(counts, 1); // 	WEAPONS	SMG	EREBUS	TIER 3
        ArrayPush(items, t"Items.Recipe_Epic_Borg4a_HauntedGun"); ArrayPush(counts, 1); // 	WEAPONS	SMG	EREBUS	TIER 4
        ArrayPush(items, t"Items.Recipe_Legendary_Borg4a_HauntedGun"); ArrayPush(counts, 1); // 	WEAPONS	SMG	EREBUS	TIER 5
        ArrayPush(items, t"Items.Recipe_KiroshiOpticsFragment2"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	EXPLOSIVE ANALYSIS	TIER 2
        ArrayPush(items, t"Items.Recipe_ExplosiveDamageRound"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	EXPLOSIVE ROUND	TIER 3
        ArrayPush(items, t"Items.Recipe_BerserkFragment1"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	EXTENDED BERSERK	TIER 5
        ArrayPush(items, t"Items.Recipe_FastRotor"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	FAST ROTOR	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Saratoga_Maelstrom_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	FENRIR	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Saratoga_Maelstrom_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	FENRIR	TIER 5
        ArrayPush(items, t"Items.RecipeGrenadeFragUncommon"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	F-GX FRAG GRENADE	TIER 2
        ArrayPush(items, t"Items.RecipeGrenadeFragEpic"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	F-GX FRAG GRENADE	TIER 4
        ArrayPush(items, t"Items.RecipeGrenadeFragHoming"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	F-GX FRAG GRENADE [HOMING]	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeFragRegular"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	F-GX FRAG GRENADE [REGULAR]	TIER 1
        ArrayPush(items, t"Items.RecipeGrenadeFragSticky"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	F-GX FRAG GRENADE [STICKY]	TIER 2
        ArrayPush(items, t"Items.ChimeraPowerMod_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	FIRECRACKER	TIER 5
        ArrayPush(items, t"Items.PRSRMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	FLEETSHOT	TIER 2
        ArrayPush(items, t"Items.PRSRMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	FLEETSHOT	TIER 3
        ArrayPush(items, t"Items.PRSRMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	FLEETSHOT	TIER 4
        ArrayPush(items, t"Items.PRSRMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	FLEETSHOT	TIER 5
        ArrayPush(items, t"Items.ARSMGLMGMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	FOCUS FIRE	TIER 2
        ArrayPush(items, t"Items.ARSMGLMGMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	FOCUS FIRE	TIER 3
        ArrayPush(items, t"Items.ARSMGLMGMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	FOCUS FIRE	TIER 4
        ArrayPush(items, t"Items.ARSMGLMGMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	FOCUS FIRE	TIER 5
        ArrayPush(items, t"Items.Recipe_BerserkFragment5"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	FOCUSED BERSERK	TIER 5
        ArrayPush(items, t"Items.CommonDianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	G-58 DIAN	TIER 1
        ArrayPush(items, t"Items.UncommonDianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	G-58 DIAN	TIER 2
        ArrayPush(items, t"Items.RareDianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	G-58 DIAN	TIER 3
        ArrayPush(items, t"Items.EpicDianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	G-58 DIAN	TIER 4
        ArrayPush(items, t"Items.LegendaryDianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	G-58 DIAN	TIER 5
        ArrayPush(items, t"Items.Recipe_GOG_Galaxy_TShirt_Epic"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	GALAXY TSHIRT	TIER 4
        ArrayPush(items, t"Items.Recipe_GOG_Galaxy_TShirt_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	GALAXY TSHIRT	TIER 5
        ArrayPush(items, t"Items.Recipe_GOG_Galaxy_TShirt"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	GALAXY T-SHIRT	TIER 3
        ArrayPush(items, t"Items.SmartMod2_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	GAMBITEER	TIER 2
        ArrayPush(items, t"Items.SmartMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	GAMBITEER	TIER 3
        ArrayPush(items, t"Items.SmartMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	GAMBITEER	TIER 4
        ArrayPush(items, t"Items.SmartMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	GAMBITEER	TIER 5
        ArrayPush(items, t"Items.SmartMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	GAMBITEER	TIER 5
        ArrayPush(items, t"Items.RecipeGrenadeCuttingRegular"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	GASH "ANTIPERSONNEL" GRENADE	TIER 4
        ArrayPush(items, t"Items.EpicPantsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	GEISHA FLEXI-WEAVE CARGO PANTS	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Yukimura_Kiji_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	GENJIROH	TIER 5
        ArrayPush(items, t"Items.RareBootsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	GLITTER LACELESS STURDY-STITCHED STEEL-TOES	TIER 3
        ArrayPush(items, t"Items.LegendaryPantsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	GOLD FURY NEOTAC BULLETPROOF PANTS	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Baseball_Bat_Denny_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	GOLD PLATED BASEBALL BAT	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Baseball_Bat_Denny_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	GOLD PLATED BASEBALL BAT	TIER 5
        ArrayPush(items, t"Items.EpicGlassesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	GOLD PUNK AVIATORS WITH COATED GLASS	TIER 4
        ArrayPush(items, t"Items.UncommonFormalSkirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	GOLDEN MEAN ARAMID-STITCH FORMAL SKIRT	TIER 2
        ArrayPush(items, t"Items.EpicScarfRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	GRAFFITI THERMOSET SYN-WEAVE HIJAB (KEFFIYEH)	TIER 4
        ArrayPush(items, t"Items.EpicCasualShoesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	GREEN GRAFFITI ARMOR-COATED ATHLETIC SHOES	TIER 4
        ArrayPush(items, t"Items.UncommonDressRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	GREEN VIPER DOUBLE NANOWEAVE PENCIL DRESS	TIER 2
        ArrayPush(items, t"Items.CommonGuillotineRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	GUILLOTINE	TIER 1
        ArrayPush(items, t"Items.UncommonGuillotineRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	GUILLOTINE	TIER 2
        ArrayPush(items, t"Items.RareGuillotineRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	GUILLOTINE	TIER 3
        ArrayPush(items, t"Items.EpicGuillotineRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	GUILLOTINE	TIER 4
        ArrayPush(items, t"Items.LegendaryGuillotineRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	GUILLOTINE	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Carnage_Edgerunners_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	GUTS	TIER 5
        ArrayPush(items, t"Items.CommonGritRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HA-4 GRIT	TIER 1
        ArrayPush(items, t"Items.UncommonGritRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HA-4 Grit	TIER 2
        ArrayPush(items, t"Items.RareGritRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HA-4 GRIT	TIER 3
        ArrayPush(items, t"Items.EpicGritRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HA-4 GRIT	TIER 4
        ArrayPush(items, t"Items.LegendaryGritRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HA-4 Grit	TIER 5
        ArrayPush(items, t"Items.ChimeraSmartMod_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	HACKATOMY	TIER 5
        ArrayPush(items, t"Items.BladeMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	BLADE	HAEMOCIDE	TIER 2
        ArrayPush(items, t"Items.BladeMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	BLADE	HAEMOCIDE	TIER 3
        ArrayPush(items, t"Items.BladeMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	BLADE	HAEMOCIDE	TIER 4
        ArrayPush(items, t"Items.BladeMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	BLADE	HAEMOCIDE	TIER 5
        ArrayPush(items, t"Items.CommonHammerRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	HAMMER	TIER 1
        ArrayPush(items, t"Items.UncommonHammerRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	HAMMER	TIER 2
        ArrayPush(items, t"Items.RareHammerRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	HAMMER	TIER 3
        ArrayPush(items, t"Items.EpicHammerRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	HAMMER	TIER 4
        ArrayPush(items, t"Items.LegendaryHammerRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	HAMMER	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Punk_Knife_Iconic_Epic"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	HEADHUNTER	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Punk_Knife_Iconic_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	HEADHUNTER	TIER 5
        ArrayPush(items, t"Items.PRSRMod2_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	HEADTOLL	TIER 2
        ArrayPush(items, t"Items.PRSRMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	HEADTOLL	TIER 3
        ArrayPush(items, t"Items.PRSRMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	HEADTOLL	TIER 4
        ArrayPush(items, t"Items.PRSRMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	HEADTOLL	TIER 5
        ArrayPush(items, t"Items.RecipeHealthBooster"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	HEALTH BOOSTER	TIER 3
        ArrayPush(items, t"Items.UncommonShirtLooseRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	HEBI TSUKAI CASHMERE-NANOFIBER SHIRT	TIER 2
        ArrayPush(items, t"Items.EpicFormalSkirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	HEISE TRILAYER FORMAL SKIRT	TIER 4
        ArrayPush(items, t"Items.CommonYukimuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HJKE-11 YUKIMURA	TIER 1
        ArrayPush(items, t"Items.UncommonYukimuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HJKE-11 YUKIMURA	TIER 2
        ArrayPush(items, t"Items.RareYukimuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HJKE-11 YUKIMURA	TIER 3
        ArrayPush(items, t"Items.EpicYukimuraRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HJKE-11 YUKIMURA	TIER 4
        ArrayPush(items, t"Items.EpicYukimuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HJKE-11 YUKIMURA	TIER 4
        ArrayPush(items, t"Items.LegendaryYukimuraRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	HJKE-11 YUKIMURA	TIER 5
        ArrayPush(items, t"Items.CommonMasamuneRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	HJSH-18 MASAMUNE	TIER 1
        ArrayPush(items, t"Items.UncommonMasamuneRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	HJSH-18 MASAMUNE	TIER 2
        ArrayPush(items, t"Items.RareMasamuneRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	HJSH-18 MASAMUNE	TIER 3
        ArrayPush(items, t"Items.EpicMasamuneRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	HJSH-18 MASAMUNE	TIER 4
        ArrayPush(items, t"Items.LegendaryMasamuneRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	HJSH-18 MASAMUNE	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Kolac_Tiny_Mike_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	HYPERCRITICAL	TIER 5
        ArrayPush(items, t"Items.UncommonJacketRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	INNER FLAME FLAME-RESISTANT ROCKERJACK	TIER 2
        ArrayPush(items, t"Items.Recipe_BerserkFragment6"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	INVIGORATING BERSERK	TIER 5
        ArrayPush(items, t"Items.ThrowMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	JAVELIN	TIER 2
        ArrayPush(items, t"Items.ThrowMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	JAVELIN	TIER 3
        ArrayPush(items, t"Items.ThrowMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	JAVELIN	TIER 4
        ArrayPush(items, t"Items.ThrowMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	JAVELIN	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Takemura_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	JINCHU-MARU	TIER 5
        ArrayPush(items, t"Items.CommonKenshinRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	JKE-X2 KENSHIN	TIER 1
        ArrayPush(items, t"Items.UncommonKenshinRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	JKE-X2 KENSHIN	TIER 2
        ArrayPush(items, t"Items.RareKenshinRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	JKE-X2 KENSHIN	TIER 3
        ArrayPush(items, t"Items.EpicKenshinRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	JKE-X2 KENSHIN	TIER 4
        ArrayPush(items, t"Items.LegendaryKenshinRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	JKE-X2 KENSHIN	TIER 5
        ArrayPush(items, t"Items.Recipe_Q005_Johnny_Glasses_Epic"); ArrayPush(counts, 1); // 	CLOTHES	FACE	JOHNNY'S AVIATORS	TIER 4
        ArrayPush(items, t"Items.Recipe_Q005_Johnny_Glasses_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	FACE	JOHNNY'S AVIATORS	TIER 5
        ArrayPush(items, t"Items.Recipe_Q005_Johnny_Pants_Epic"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	JOHNNY'S PANTS	TIER 4
        ArrayPush(items, t"Items.Recipe_Q005_Johnny_Pants_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	JOHNNY'S PANTS	TIER 5
        ArrayPush(items, t"Items.Recipe_Q005_Johnny_Shoes_Epic"); ArrayPush(counts, 1); // 	CLOTHES	FEET	JOHNNY'S SHOES	TIER 4
        ArrayPush(items, t"Items.Recipe_Q005_Johnny_Shoes_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	FEET	JOHNNY'S SHOES	TIER 5
        ArrayPush(items, t"Items.Recipe_Q005_Johnny_Shirt_Epic"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	JOHNNY'S TANK TOP	TIER 4
        ArrayPush(items, t"Items.Recipe_Q005_Johnny_Shirt_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	JOHNNY'S TANK TOP	TIER 5
        ArrayPush(items, t"Items.BluntMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	K.O.	TIER 2
        ArrayPush(items, t"Items.BluntMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	K.O.	TIER 3
        ArrayPush(items, t"Items.BluntMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	K.O.	TIER 4
        ArrayPush(items, t"Items.BluntMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	BLUNT	K.O.	TIER 5
        ArrayPush(items, t"Items.CommonKanaboRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	KANABO	TIER 1
        ArrayPush(items, t"Items.UncommonKanaboRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	KANABO	TIER 2
        ArrayPush(items, t"Items.RareKanaboRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	KANABO	TIER 3
        ArrayPush(items, t"Items.EpicKanaboRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	KANABO	TIER 4
        ArrayPush(items, t"Items.LegendaryKanaboRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	KANABO	TIER 5
        ArrayPush(items, t"Items.CommonKappaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	KAPPA	TIER 1
        ArrayPush(items, t"Items.UncommonKappaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	KAPPA	TIER 2
        ArrayPush(items, t"Items.RareKappaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	KAPPA	TIER 3
        ArrayPush(items, t"Items.EpicKappaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	KAPPA	TIER 4
        ArrayPush(items, t"Items.LegendaryKappaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	KAPPA	TIER 5
        ArrayPush(items, t"Items.CommonKatanaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA	TIER 1
        ArrayPush(items, t"Items.UncommonKatanaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA	TIER 2
        ArrayPush(items, t"Items.RareKatanaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA	TIER 3
        ArrayPush(items, t"Items.EpicKatanaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA	TIER 4
        ArrayPush(items, t"Items.LegendaryKatanaRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA	TIER 5
        ArrayPush(items, t"Items.LegendaryKatanaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA	TIER 5
        ArrayPush(items, t"Items.CommonKatanaMilitaryRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA [MIILITARY TEXTURE]	TIER 1
        ArrayPush(items, t"Items.UncommonKatanaMilitaryRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA [MIILITARY TEXTURE]	TIER 2
        ArrayPush(items, t"Items.RareKatanaMilitaryRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA [MIILITARY TEXTURE]	TIER 3
        ArrayPush(items, t"Items.EpicKatanaMilitaryRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA [MIILITARY TEXTURE]	TIER 4
        ArrayPush(items, t"Items.LegendaryKatanaMilitaryRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KATANA [MIILITARY TEXTURE]	TIER 5
        ArrayPush(items, t"Items.CommonKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KNIFE	TIER 1
        ArrayPush(items, t"Items.UncommonKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KNIFE	TIER 2
        ArrayPush(items, t"Items.RareKnifeRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KNIFE	TIER 3
        ArrayPush(items, t"Items.RareKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KNIFE	TIER 3
        ArrayPush(items, t"Items.EpicKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KNIFE	TIER 4
        ArrayPush(items, t"Items.LegendaryKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KNIFE	TIER 5
        ArrayPush(items, t"Items.Recipe_ChemicalDamageKnuckles"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	KNUCKLES CHEMICAL	TIER 3
        ArrayPush(items, t"Items.Recipe_ElectricDamageKnuckles"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	KNUCKLES ELECTRIC	TIER 3
        ArrayPush(items, t"Items.Recipe_PhysicalDamageKnuckles"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	KNUCKLES PHYSICAL	TIER 3
        ArrayPush(items, t"Items.Recipe_ThermalDamageKnuckles"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	KNUCKLES THERMAL	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Liberty_Yorinobu_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	KONGOU	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Liberty_Yorinobu_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	KONGOU	TIER 5
        ArrayPush(items, t"Items.CommonKukriRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KUKRI	TIER 1
        ArrayPush(items, t"Items.UncommonKukriRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KUKRI	TIER 2
        ArrayPush(items, t"Items.RareKukriRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KUKRI	TIER 3
        ArrayPush(items, t"Items.EpicKukriRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KUKRI	TIER 4
        ArrayPush(items, t"Items.LegendaryKukriRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	KUKRI	TIER 5
        ArrayPush(items, t"Items.CommonKyubiRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	KYUBI	TIER 1
        ArrayPush(items, t"Items.UncommonKyubiRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	KYUBI	TIER 2
        ArrayPush(items, t"Items.RareKyubiRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	KYUBI	TIER 3
        ArrayPush(items, t"Items.EpicKyubiRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	KYUBI	TIER 4
        ArrayPush(items, t"Items.LegendaryKyubiRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	KYUBI	TIER 5
        ArrayPush(items, t"Items.CommonZhuoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	L-69 ZHUO	TIER 1
        ArrayPush(items, t"Items.UncommonZhuoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	L-69 ZHUO	TIER 2
        ArrayPush(items, t"Items.RareZhuoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	L-69 ZHUO	TIER 3
        ArrayPush(items, t"Items.EpicZhuoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	L-69 ZHUO	TIER 4
        ArrayPush(items, t"Items.LegendaryZhuoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	L-69 ZHUO	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Nue_Jackie_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	LA CHINGONA DORADA	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Nue_Jackie_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	LA CHINGONA DORADA	TIER 5
        ArrayPush(items, t"Items.EpicHelmetRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	LAMINATED SECURITY HARDHAT WITH HEADSET	TIER 4
        ArrayPush(items, t"Items.CommonLibertyRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	LIBERTY	TIER 1
        ArrayPush(items, t"Items.UncommonLibertyRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	LIBERTY	TIER 2
        ArrayPush(items, t"Items.RareLibertyRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	LIBERTY	TIER 3
        ArrayPush(items, t"Items.EpicLibertyRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	LIBERTY	TIER 4
        ArrayPush(items, t"Items.LegendaryLibertyRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	LIBERTY	TIER 5
        ArrayPush(items, t"Items.LegendaryJumpsuitRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	LIGHTNING RIDER REINFORCED RACING SUIT	TIER 5
        ArrayPush(items, t"Items.UncommonTechRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	LIGHTWEIGHT TUNGSTEN-STEEL BD WREATH	TIER 2
        ArrayPush(items, t"Items.Recipe_Preset_Omaha_Suzie_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	LIZZIE	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Omaha_Suzie_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	LIZZIE	TIER 5
        ArrayPush(items, t"Items.Recipe_Jacket_19_basic_04_DLC_Epic"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	LUMINESCENT PUNK JACKET	TIER 3
        ArrayPush(items, t"Items.Recipe_Jacket_19_basic_04_DLC_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	LUMINESCENT PUNK JACKET	TIER 3
        ArrayPush(items, t"Items.Recipe_Jacket_19_basic_04_DLC"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	LUMINESCENT PUNK JACKET	TIER 3
        ArrayPush(items, t"Items.CommonLexingtonRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-10AF LEXINGTON	TIER 1
        ArrayPush(items, t"Items.UncommonLexingtonRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-10AF LEXINGTON	TIER 2
        ArrayPush(items, t"Items.RareLexingtonRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-10AF LEXINGTON	TIER 3
        ArrayPush(items, t"Items.EpicLexingtonRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-10AF LEXINGTON	TIER 4
        ArrayPush(items, t"Items.LegendaryLexingtonRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-10AF LEXINGTON	TIER 5
        ArrayPush(items, t"Items.CommonAchillesRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	M-179E ACHILLES	TIER 1
        ArrayPush(items, t"Items.UncommonAchillesRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	M-179E ACHILLES	TIER 2
        ArrayPush(items, t"Items.RareAchillesRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	M-179E ACHILLES	TIER 3
        ArrayPush(items, t"Items.EpicAchillesRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	M-179E ACHILLES	TIER 4
        ArrayPush(items, t"Items.LegendaryAchillesRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	M-179E ACHILLES	TIER 5
        ArrayPush(items, t"Items.CommonTacticianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	M2038 TACTICIAN	TIER 1
        ArrayPush(items, t"Items.UncommonTacticianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	M2038 TACTICIAN	TIER 2
        ArrayPush(items, t"Items.RareTacticianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	M2038 TACTICIAN	TIER 3
        ArrayPush(items, t"Items.EpicTacticianRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	M2038 TACTICIAN	TIER 4
        ArrayPush(items, t"Items.EpicTacticianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	M2038 TACTICIAN	TIER 4
        ArrayPush(items, t"Items.LegendaryTacticianRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	M2038 TACTICIAN	TIER 5
        ArrayPush(items, t"Items.CommonDefenderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	M2067 DEFENDER	TIER 1
        ArrayPush(items, t"Items.UncommonDefenderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	M2067 DEFENDER	TIER 2
        ArrayPush(items, t"Items.RareDefenderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	M2067 DEFENDER	TIER 3
        ArrayPush(items, t"Items.EpicDefenderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	M2067 DEFENDER	TIER 4
        ArrayPush(items, t"Items.LegendaryDefenderRecipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	M2067 DEFENDER	TIER 5
        ArrayPush(items, t"Items.CommonSaratogaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	M221 SARATOGA	TIER 1
        ArrayPush(items, t"Items.UncommonSaratogaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	M221 SARATOGA	TIER 2
        ArrayPush(items, t"Items.RareSaratogaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	M221 SARATOGA	TIER 3
        ArrayPush(items, t"Items.EpicSaratogaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	M221 SARATOGA	TIER 4
        ArrayPush(items, t"Items.LegendarySaratogaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	M221 SARATOGA	TIER 5
        ArrayPush(items, t"Items.CommonAjaxRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	M251S AJAX	TIER 1
        ArrayPush(items, t"Items.UncommonAjaxRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	M251S AJAX	TIER 2
        ArrayPush(items, t"Items.RareAjaxRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	M251S AJAX	TIER 3
        ArrayPush(items, t"Items.EpicAjaxRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	M251S AJAX	TIER 4
        ArrayPush(items, t"Items.LegendaryAjaxRecipe"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	M251S AJAX	TIER 5
        ArrayPush(items, t"Items.CommonOmahaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-76E OMAHA	TIER 1
        ArrayPush(items, t"Items.UncommonOmahaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-76E OMAHA	TIER 2
        ArrayPush(items, t"Items.RareOmahaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-76E OMAHA	TIER 3
        ArrayPush(items, t"Items.EpicOmahaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-76E OMAHA	TIER 4
        ArrayPush(items, t"Items.LegendaryOmahaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	M-76E OMAHA	TIER 5
        ArrayPush(items, t"Items.CommonMA70Recipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	MA70 HB	TIER 1
        ArrayPush(items, t"Items.UncommonMA70Recipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	MA70 HB	TIER 2
        ArrayPush(items, t"Items.RareMA70Recipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	MA70 HB	TIER 3
        ArrayPush(items, t"Items.EpicMA70Recipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	MA70 HB	TIER 4
        ArrayPush(items, t"Items.LegendaryMA70Recipe"); ArrayPush(counts, 1); // 	WEAPONS	LMG	MA70 HB	TIER 5
        ArrayPush(items, t"Items.CommonMacheteRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	MACHETE	TIER 1
        ArrayPush(items, t"Items.UncommonMacheteRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	MACHETE	TIER 2
        ArrayPush(items, t"Items.RareMacheteRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	MACHETE	TIER 3
        ArrayPush(items, t"Items.EpicMacheteRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	MACHETE	TIER 4
        ArrayPush(items, t"Items.LegendaryMacheteRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	MACHETE	TIER 5
        ArrayPush(items, t"Items.RecipeUncommonCraftingMaterial"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - ITEM COMPONENTS	TIER 2
        ArrayPush(items, t"Items.RecipeRareCraftingMaterial"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - ITEM COMPONENTS	TIER 3
        ArrayPush(items, t"Items.RecipeEpicCraftingMaterial"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - ITEM COMPONENTS	TIER 4
        ArrayPush(items, t"Items.RecipeLegendaryCraftingMaterial"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - ITEM COMPONENTS	TIER 5
        ArrayPush(items, t"Items.RecipeQuickHackRareMaterial1"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - QUICKHACK COMPONENTS	TIER 3
        ArrayPush(items, t"Items.RecipeQuickHackEpicMaterial1"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - QUICKHACK COMPONENTS	TIER 4
        ArrayPush(items, t"Items.RecipeQuickHackLegendaryMaterial1"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - QUICKHACK COMPONENTS	TIER 5
        ArrayPush(items, t"Items.RecipeRareCraftingMaterial2"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - UPGRADE COMPONENTS	TIER 3
        ArrayPush(items, t"Items.RecipeEpicCraftingMaterial2"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - UPGRADE COMPONENTS	TIER 4
        ArrayPush(items, t"Items.RecipeLegendaryCraftingMaterial2"); ArrayPush(counts, 1); // 	COMPONENTS	CRAFTING MATS	MATERIALS - UPGRADE COMPONENTS	TIER 5
        ArrayPush(items, t"Items.RecipeFirstAidWhiffVUncommon"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	MAXDOC MK.2	TIER 2
        ArrayPush(items, t"Items.RecipeFirstAidWhiffVEpic"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	MAXDOC MK.4	TIER 4
        ArrayPush(items, t"Items.RecipeFirstAidWhiffV0"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	MAXDOC MK.I	TIER 2
        ArrayPush(items, t"Items.RecipeFirstAidWhiffV1"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	MAXDOC MK.II	TIER 3
        ArrayPush(items, t"Items.RecipeFirstAidWhiffV2"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	MAXDOC MK.III	TIER 4
        ArrayPush(items, t"Items.Recipe_MemoryWipeLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	MEMORY WIPE	TIER 3
        ArrayPush(items, t"Items.Recipe_MemoryWipeLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	MEMORY WIPE	TIER 4
        ArrayPush(items, t"Items.Recipe_MemoryWipeLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	MEMORY WIPE	TIER 5
        ArrayPush(items, t"Items.Recipe_MemoryWipeLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	MEMORY WIPE (ICONIC)	TIER 5
        ArrayPush(items, t"Items.EpicMaskRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	MENPO WITH PROTECTIVE PADDING	TIER 4
        ArrayPush(items, t"Items.Recipe_MetalPlating"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	METAL PLATING	TIER 3
        ArrayPush(items, t"Items.CommonMetelRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	METEL	TIER 1
        ArrayPush(items, t"Items.UncommonMetelRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	METEL	TIER 2
        ArrayPush(items, t"Items.RareMetelRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	METEL	TIER 3
        ArrayPush(items, t"Items.EpicMetelRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	METEL	TIER 4
        ArrayPush(items, t"Items.LegendaryMetelRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	METEL	TIER 5
        ArrayPush(items, t"Items.EpicFormalShoesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	MIDDAY GLOW POLYCARBONATE FORMAL PUMPS (DRESS SHOES)	TIER 4
        ArrayPush(items, t"Items.Recipe_HauntedCyberdeck"); ArrayPush(counts, 1); // 	CYBERWARE	OPERATIVE SYSTEM	MILITECH CANTO MK.6	TIER 3
        ArrayPush(items, t"Items.Recipe_Rare_HauntedCyberdeck"); ArrayPush(counts, 1); // 	CYBERWARE	OPERATIVE SYSTEM	MILITECH CANTO MK.6	TIER 3
        ArrayPush(items, t"Items.Recipe_Epic_HauntedCyberdeck"); ArrayPush(counts, 1); // 	CYBERWARE	OPERATIVE SYSTEM	MILITECH CANTO MK.6	TIER 4
        ArrayPush(items, t"Items.Recipe_Legendary_HauntedCyberdeck"); ArrayPush(counts, 1); // 	CYBERWARE	OPERATIVE SYSTEM	MILITECH CANTO MK.6	TIER 5
        ArrayPush(items, t"Items.CommonTiconRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	MILITECH TICON	TIER 1
        ArrayPush(items, t"Items.UncommonTiconRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	MILITECH TICON	TIER 2
        ArrayPush(items, t"Items.RareTiconRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	MILITECH TICON	TIER 3
        ArrayPush(items, t"Items.EpicTiconRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	MILITECH TICON	TIER 4
        ArrayPush(items, t"Items.LegendaryTiconRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	MILITECH TICON	TIER 5
        ArrayPush(items, t"Items.LegendaryBootsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	MILITOXIC CERAMIC-LAYER COMBAT EXO-JACKS	TIER 5
        ArrayPush(items, t"Items.RareCoatRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	MILKY GOLD TRENCH COAT WITH BULLETPROOF TRIWEAVE	TIER 3
        ArrayPush(items, t"Items.LegendaryHatRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	MIRAME REINFORCED-COMPOSITE COWBOY HAT	TIER 5
        ArrayPush(items, t"Items.RecipeGrenadeBiohazardHoming"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	MOLODETS BIO GRENADE [HOMING]	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeBiohazardRegular"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	MOLODETS BIO GRENADE [REGULAR]	TIER 1
        ArrayPush(items, t"Items.RecipeGrenadeBiohazardLegendary"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	MOLODETS BIOHAZ GRENADE	TIER 5
        ArrayPush(items, t"Items.Recipe_HighChargedWiresBattery"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	MONOWIRE BATTERY HIGH CAPACITY	TIER 4
        ArrayPush(items, t"Items.Recipe_LowChargedWiresBattery"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	MONOWIRE BATTERY LOW CAPACITY	TIER 4
        ArrayPush(items, t"Items.Recipe_MediumChargedWiresBattery"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	MONOWIRE BATTERY MEDIUM CAPACITY	TIER 4
        ArrayPush(items, t"Items.Recipe_ChemicalDamageCable"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	MONOWIRE CHEMICAL	TIER 3
        ArrayPush(items, t"Items.Recipe_ElectricDamageCable"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	MONOWIRE ELECTRIC	TIER 3
        ArrayPush(items, t"Items.Recipe_PhysicalDamageCable"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	MONOWIRE PHYSICAL	TIER 3
        ArrayPush(items, t"Items.Recipe_ThermalDamageCable"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	MONOWIRE THERMAL	TIER 3
        ArrayPush(items, t"Items.Recipe_Common_Ajax_Moron"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	MORON LABE	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Ajax_Moron"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	MORON LABE	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Ajax_Moron"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	MORON LABE	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Ajax_Moron"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	MORON LABE	TIER 4
        ArrayPush(items, t"Items.Recipe_Epic_Ajax_Moron"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	MORON LABE	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Ajax_Moron_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	MORON LABE	TIER 5
        ArrayPush(items, t"Items.Recipe_Legendary_Ajax_Moron"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	MORON LABE	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Carnage_Mox_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	MOX	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Carnage_Mox_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	MOX	TIER 5
        ArrayPush(items, t"Items.UncommonMaskRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	MOX GAS MASK WITH CUSTOM PROTECTIVE LAYER	TIER 2
        ArrayPush(items, t"Items.Recipe_Jacket_20_basic_01_DLC_Epic"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	MULTILAYERED SYN-LEATHER DELTAJOCK JACKET	TIER 3
        ArrayPush(items, t"Items.Recipe_Jacket_20_basic_01_DLC_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	MULTILAYERED SYN-LEATHER DELTAJOCK JACKET	TIER 3
        ArrayPush(items, t"Items.Recipe_Jacket_20_basic_01_DLC"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	MULTILAYERED SYN-LEATHER DELTAJOCK JACKET	TIER 3
        ArrayPush(items, t"Items.CommonNekomataRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	NEKOMATA	TIER 1
        ArrayPush(items, t"Items.UncommonNekomataRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	NEKOMATA	TIER 2
        ArrayPush(items, t"Items.RareNekomataRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	NEKOMATA	TIER 3
        ArrayPush(items, t"Items.EpicNekomataRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	NEKOMATA	TIER 4
        ArrayPush(items, t"Items.LegendaryNekomataRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	NEKOMATA	TIER 5
        ArrayPush(items, t"Items.LegendaryNekomataRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	NEKOMATA	TIER 5
        ArrayPush(items, t"Items.Recipe_NeoplasticPlating"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	NEOPLASTIC PLATING	TIER 3
        ArrayPush(items, t"Items.CommonNeurotoxinKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	NEUROTOXIN KNIFE	TIER 1
        ArrayPush(items, t"Items.UncommonNeurotoxinKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	NEUROTOXIN KNIFE	TIER 2
        ArrayPush(items, t"Items.RareNeurotoxinKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	NEUROTOXIN KNIFE	TIER 3
        ArrayPush(items, t"Items.EpicNeurotoxinKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	NEUROTOXIN KNIFE	TIER 4
        ArrayPush(items, t"Items.LegendaryNeurotoxinKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	NEUROTOXIN KNIFE	TIER 5
        ArrayPush(items, t"Items.CommonNueRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	NUE	TIER 1
        ArrayPush(items, t"Items.UncommonNueRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	NUE	TIER 2
        ArrayPush(items, t"Items.UncommonNueRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	NUE	TIER 2
        ArrayPush(items, t"Items.RareNueRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	NUE	TIER 3
        ArrayPush(items, t"Items.EpicNueRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	NUE	TIER 4
        ArrayPush(items, t"Items.LegendaryNueRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	NUE	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Grad_Buck_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	O'FIVE	TIER 5
        ArrayPush(items, t"Items.Recipe_OverheatProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	OVERHEAT	TIER 2
        ArrayPush(items, t"Items.Recipe_OverheatLvl1Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	OVERHEAT	TIER 2
        ArrayPush(items, t"Items.Recipe_OverheatLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	OVERHEAT	TIER 3
        ArrayPush(items, t"Items.Recipe_OverheatLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	OVERHEAT	TIER 4
        ArrayPush(items, t"Items.Recipe_OverheatLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	OVERHEAT	TIER 5
        ArrayPush(items, t"Items.Recipe_OverheatLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	OVERHEAT (ICONIC)	TIER 5
        ArrayPush(items, t"Items.CommonOvertureRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	OVERTURE	TIER 1
        ArrayPush(items, t"Items.UncommonOvertureRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	OVERTURE	TIER 2
        ArrayPush(items, t"Items.RareOvertureRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	OVERTURE	TIER 3
        ArrayPush(items, t"Items.EpicOvertureRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	OVERTURE	TIER 4
        ArrayPush(items, t"Items.LegendaryOvertureRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	OVERTURE	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Grad_Panam"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	OVERWATCH	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Grad_Panam_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	OVERWATCH	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Grad_Panam_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	OVERWATCH	TIER 5
        ArrayPush(items, t"Items.RecipeOxyBooster"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	OXY BOOSTER	TIER 1
        ArrayPush(items, t"Items.RecipeGrenadeOzobsNose"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	OZOB'S NOSE [REGULAR]	TIER 5
        ArrayPush(items, t"Items.EpicUndershirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	PADDED DENKI HACHI HYBRID-WEAVE BRA	TIER 4
        ArrayPush(items, t"Items.SmartMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	PANORAMA	TIER 2
        ArrayPush(items, t"Items.SmartMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	PANORAMA	TIER 3
        ArrayPush(items, t"Items.SmartMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	PANORAMA	TIER 4
        ArrayPush(items, t"Items.SmartMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	SMART WEAPON	PANORAMA	TIER 5
        ArrayPush(items, t"Items.HGMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	PARALLAX	TIER 2
        ArrayPush(items, t"Items.HGMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	PARALLAX	TIER 3
        ArrayPush(items, t"Items.HGMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	PARALLAX	TIER 4
        ArrayPush(items, t"Items.HGMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	PARALLAX	TIER 5
        ArrayPush(items, t"Items.EpicFormalShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	PARIS BLUE OFFICE SHIRT AND VEST WITH REINFORCED SEAMS	TIER 4
        ArrayPush(items, t"Items.GenericMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	WEAPONS	PAX	TIER 2
        ArrayPush(items, t"Items.GenericMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	WEAPONS	PAX	TIER 3
        ArrayPush(items, t"Items.GenericMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	WEAPONS	PAX	TIER 4
        ArrayPush(items, t"Items.GenericMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	WEAPONS	PAX	TIER 5
        ArrayPush(items, t"Items.Recipe_PingProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	PING	TIER 2
        ArrayPush(items, t"Items.Recipe_PingLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	PING	TIER 3
        ArrayPush(items, t"Items.Recipe_PingLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	PING	TIER 4
        ArrayPush(items, t"Items.Recipe_PingLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	PING	TIER 5
        ArrayPush(items, t"Items.Recipe_PingLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	PING (ICONIC)	TIER 5
        ArrayPush(items, t"Items.HGMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	PINPOINT	TIER 2
        ArrayPush(items, t"Items.HGMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	PINPOINT	TIER 3
        ArrayPush(items, t"Items.HGMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	PINPOINT	TIER 4
        ArrayPush(items, t"Items.HGMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	PINPOINT	TIER 5
        ArrayPush(items, t"Items.EpicBootsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	PIXEL NEIGE SNOW BOOTS WITH CANVAS DUOLAYER	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Liberty_Dex_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	PLAN B	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Liberty_Dex_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	PLAN B	TIER 5
        ArrayPush(items, t"Items.RareVestRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	POLYCARBONATE WESTEN FRINGE VEST	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Saratoga_Raffen_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	PROBLEM SOLVER	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Saratoga_Raffen_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	PROBLEM SOLVER	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Copperhead_Genesis"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	PSALM 11:16	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Copperhead_Genesis_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	PSALM 11:16	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Copperhead_Genesis_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	PSALM 11:16	TIER 5
        ArrayPush(items, t"Items.Recipe_Common_Copperhead_Genesis"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	PSALM 11:6	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Copperhead_Genesis"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	PSALM 11:6	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Copperhead_Genesis"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	PSALM 11:6	TIER 3
        ArrayPush(items, t"Items.Recipe_Epic_Copperhead_Genesis"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	PSALM 11:6	TIER 4
        ArrayPush(items, t"Items.Recipe_Legendary_Copperhead_Genesis"); ArrayPush(counts, 1); // 	WEAPONS	ASSAULT RIFLE	PSALM 11:6	TIER 5
        ArrayPush(items, t"Items.RareShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	PSYCHO FLEXIWEAVE LONG-SLEEVE	TIER 3
        ArrayPush(items, t"Items.RareTShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	PUNCTURE-RESISTANT NUSA T-SHIRT	TIER 3
        ArrayPush(items, t"Items.CommonPunkKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	PUNKNIFE	TIER 1
        ArrayPush(items, t"Items.UncommonPunkKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	PUNKNIFE	TIER 2
        ArrayPush(items, t"Items.RarePunkKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	PUNKNIFE	TIER 3
        ArrayPush(items, t"Items.EpicPunkKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	PUNKNIFE	TIER 4
        ArrayPush(items, t"Items.LegendaryPunkKnifeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	PUNKNIFE	TIER 5
        ArrayPush(items, t"Items.PowerMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	PYRO	TIER 2
        ArrayPush(items, t"Items.PowerMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	PYRO	TIER 3
        ArrayPush(items, t"Items.PowerMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	PYRO	TIER 4
        ArrayPush(items, t"Items.PowerMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	PYRO	TIER 5
        ArrayPush(items, t"Items.RecipeMemoryBooster"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	RAM JOLT	TIER 2
        ArrayPush(items, t"Items.CommonMacheteBorgRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	RAZOR	TIER 1
        ArrayPush(items, t"Items.UncommonMacheteBorgRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	RAZOR	TIER 2
        ArrayPush(items, t"Items.RareMacheteBorgRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	RAZOR	TIER 3
        ArrayPush(items, t"Items.EpicMacheteBorgRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	RAZOR	TIER 4
        ArrayPush(items, t"Items.LegendaryMacheteBorgRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	RAZOR	TIER 5
        ArrayPush(items, t"Items.ARSMGLMGMod2_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	READY STEADY	TIER 2
        ArrayPush(items, t"Items.ARSMGLMGMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	READY STEADY	TIER 3
        ArrayPush(items, t"Items.ARSMGLMGMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	READY STEADY	TIER 4
        ArrayPush(items, t"Items.ARSMGLMGMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	AR / SMG / LMG	READY STEADY	TIER 5
        ArrayPush(items, t"Items.Recipe_BlindProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REBOOT OPTICS	TIER 2
        ArrayPush(items, t"Items.Recipe_BlindLvl1Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REBOOT OPTICS	TIER 2
        ArrayPush(items, t"Items.Recipe_BlindLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REBOOT OPTICS	TIER 3
        ArrayPush(items, t"Items.Recipe_BlindLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REBOOT OPTICS	TIER 4
        ArrayPush(items, t"Items.Recipe_BlindLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REBOOT OPTICS	TIER 5
        ArrayPush(items, t"Items.Recipe_BlindLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REBOOT OPTICS (ICONIC)	TIER 5
        ArrayPush(items, t"Items.RecipeGrenadeReconRare"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	RECON GRENADE	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeReconLegendary"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	RECON GRENADE	TIER 5
        ArrayPush(items, t"Items.RecipeGrenadeReconRegular"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	RECON GRENADE [REGULAR]	TIER 2
        ArrayPush(items, t"Items.RecipeGrenadeReconSticky"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	RECON GRENADE [STICKY]	TIER 2
        ArrayPush(items, t"Items.LegendaryTightJumpsuitRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	RED ALERT ANTI SURGE-NETRUNNING SUIT	TIER 5
        ArrayPush(items, t"Items.UncommonFormalShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	RED LEOPARD BUTTON-UP WITH COMPOSITE INSERT	TIER 2
        ArrayPush(items, t"Items.UncommonBootsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	REINFORCED BIKER BOOTS	TIER 2
        ArrayPush(items, t"Items.Recipe_SQ031_Samurai_Jacket_Epic"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	REPLICA OF JOHNNY'S SAMURAI JACKET	TIER 4
        ArrayPush(items, t"Items.Recipe_SQ031_Samurai_Jacket_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	REPLICA OF JOHNNY'S SAMURAI JACKET	TIER 5
        ArrayPush(items, t"Items.Recipe_CommsCallInProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REQUEST BACKUP	TIER 2
        ArrayPush(items, t"Items.Recipe_CommsCallInLvl1Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REQUEST BACKUP	TIER 2
        ArrayPush(items, t"Items.Recipe_CommsCallInLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REQUEST BACKUP	TIER 3
        ArrayPush(items, t"Items.Recipe_CommsCallInLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REQUEST BACKUP	TIER 4
        ArrayPush(items, t"Items.Recipe_CommsCallInLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REQUEST BACKUP	TIER 5
        ArrayPush(items, t"Items.Recipe_CommsCallInLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	REQUEST BACKUP (ICONIC)	TIER 5
        ArrayPush(items, t"Items.RareCasualShoesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	ROBUST SPUNKY MONKEY KICKS	TIER 3
        ArrayPush(items, t"Items.CommonBuryaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	RT-46 BURYA	TIER 1
        ArrayPush(items, t"Items.UncommonBuryaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	RT-46 BURYA	TIER 2
        ArrayPush(items, t"Items.RareBuryaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	RT-46 BURYA	TIER 3
        ArrayPush(items, t"Items.EpicBuryaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	RT-46 BURYA	TIER 4
        ArrayPush(items, t"Items.LegendaryBuryaRecipe"); ArrayPush(counts, 1); // 	WEAPONS	REVOLVER	RT-46 BURYA	TIER 5
        ArrayPush(items, t"Items.Recipe_ArasakaSandevistanFragment1"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SANDEVISTAN ARASAKA SOFTWARE	TIER 5
        ArrayPush(items, t"Items.Recipe_SandevistanFragment4"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SANDEVISTAN HEATSINK	TIER 1
        ArrayPush(items, t"Items.Recipe_SandevistanFragment3"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SANDEVISTAN NEUROTRANSMITTERS	TIER 3
        ArrayPush(items, t"Items.Recipe_SandevistanFragment1"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SANDEVISTAN OVERCLOCKED PROCESSOR	TIER 1
        ArrayPush(items, t"Items.Recipe_SandevistanFragment2"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SANDEVISTAN PROTOTYPE CHIP	TIER 3
        ArrayPush(items, t"Items.Recipe_ValentinosSandevistanFragment1"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SANDEVISTAN RABID BULL	TIER 4
        ArrayPush(items, t"Items.Recipe_TygerClawsSandevistanFragment1"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SANDEVISTAN TYGER PAW	TIER 4
        ArrayPush(items, t"Items.LegendaryScarfRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	SANDY BOA SHOCK-ABSORBENT HEADBAND	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Saburo_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	SATORI	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Saburo_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	SATORI	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Surgeon_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	SCALPEL	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Surgeon_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	SCALPEL	TIER 5
        ArrayPush(items, t"Items.CommonSenkohRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	SENKOH LX	TIER 1
        ArrayPush(items, t"Items.UncommonSenkohRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	SENKOH LX	TIER 2
        ArrayPush(items, t"Items.RareSenkohRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	SENKOH LX	TIER 3
        ArrayPush(items, t"Items.EpicSenkohRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	SENKOH LX	TIER 4
        ArrayPush(items, t"Items.LegendarySenkohRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	SENKOH LX	TIER 5
        ArrayPush(items, t"Items.Recipe_ArmsCyberwareSharedFragment1"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SENSORY AMPLIFIER	TIER 3
        ArrayPush(items, t"Items.Recipe_ArmsCyberwareSharedFragment2"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SENSORY AMPLIFIER	TIER 3
        ArrayPush(items, t"Items.Recipe_ArmsCyberwareSharedFragment3"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SENSORY AMPLIFIER	TIER 3
        ArrayPush(items, t"Items.Recipe_ArmsCyberwareSharedFragment4"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SENSORY AMPLIFIER	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Liberty_Padre_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	SERAPH	TIER 1
        ArrayPush(items, t"Items.ChimeraMeleeMod_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	SEVERANCE	TIER 5
        ArrayPush(items, t"Items.Recipe_BerserkFragment8"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SHARPENED BERSERK	TIER 3
        ArrayPush(items, t"Items.Recipe_EMPOverloadProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SHORT CIRCUIT	TIER 2
        ArrayPush(items, t"Items.Recipe_EMPOverloadLvl1Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SHORT CIRCUIT	TIER 2
        ArrayPush(items, t"Items.Recipe_EMPOverloadLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SHORT CIRCUIT	TIER 3
        ArrayPush(items, t"Items.Recipe_EMPOverloadLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SHORT CIRCUIT	TIER 4
        ArrayPush(items, t"Items.Recipe_EMPOverloadLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SHORT CIRCUIT	TIER 5
        ArrayPush(items, t"Items.Recipe_EMPOverloadLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SHORT CIRCUIT (ICONIC)	TIER 5
        ArrayPush(items, t"Items.RangedMod2_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	SHUFFLER	TIER 2
        ArrayPush(items, t"Items.RangedMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	SHUFFLER	TIER 3
        ArrayPush(items, t"Items.RangedMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	SHUFFLER	TIER 4
        ArrayPush(items, t"Items.RangedMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	RANGED WEAPON	SHUFFLER	TIER 5
        ArrayPush(items, t"Items.MeleeMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	SILENCIO	TIER 2
        ArrayPush(items, t"Items.MeleeMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	SILENCIO	TIER 3
        ArrayPush(items, t"Items.MeleeMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	SILENCIO	TIER 4
        ArrayPush(items, t"Items.MeleeMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	MELEE	SILENCIO	TIER 5
        ArrayPush(items, t"Items.LegendaryVestRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	SILVEROCK BULLETPROOF-LAMINATE BIKER VEST	TIER 5
        ArrayPush(items, t"Items.UncommonShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	SIMPLE BIKER ARAMID-WEAVE TURTLENECK	TIER 2
        ArrayPush(items, t"Items.Recipe_Preset_Dildo_Stout_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	SIR JOHN PHALLUSTIFF	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Dildo_Stout_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	SIR JOHN PHALLUSTIFF	TIER 5
        ArrayPush(items, t"Items.Recipe_SlowRotor"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	SLOW ROTOR	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeSmokeRegular"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	SMOKE GRENADE	TIER 2
        ArrayPush(items, t"Items.RecipeGrenadeSmokeRare"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	SMOKE GRENADE	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeSmokeEpic"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	SMOKE GRENADE	TIER 4
        ArrayPush(items, t"Items.RecipeGrenadeSmokeLegendary"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	SMOKE GRENADE	TIER 5
        ArrayPush(items, t"Items.CommonPipeWrenchRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	SOCKET WRENCH	TIER 1
        ArrayPush(items, t"Items.UncommonPipeWrenchRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	SOCKET WRENCH	TIER 2
        ArrayPush(items, t"Items.RarePipeWrenchRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	SOCKET WRENCH	TIER 3
        ArrayPush(items, t"Items.LegendaryPipeWrenchRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	SOCKET WRENCH	TIER 5
        ArrayPush(items, t"Items.Recipe_CommsNoiseProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SONIC SHOCK	TIER 2
        ArrayPush(items, t"Items.Recipe_CommsNoiseLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SONIC SHOCK	TIER 3
        ArrayPush(items, t"Items.Recipe_CommsNoiseLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SONIC SHOCK	TIER 4
        ArrayPush(items, t"Items.Recipe_CommsNoiseLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SONIC SHOCK	TIER 5
        ArrayPush(items, t"Items.Recipe_CommsNoiseLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SONIC SHOCK (ICONIC)	TIER 5
        ArrayPush(items, t"Items.CommonSor22Recipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	SOR-22	TIER 1
        ArrayPush(items, t"Items.UncommonSor22Recipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	SOR-22	TIER 2
        ArrayPush(items, t"Items.RareSor22Recipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	SOR-22	TIER 3
        ArrayPush(items, t"Items.EpicSor22Recipe_2"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	SOR-22	TIER 4
        ArrayPush(items, t"Items.EpicSor22Recipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	SOR-22	TIER 4
        ArrayPush(items, t"Items.LegendarySor22Recipe"); ArrayPush(counts, 1); // 	WEAPONS	PRECISION RIFLE	SOR-22	TIER 5
        ArrayPush(items, t"Items.Recipe_Common_Igla_Sovereign"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	SOVEREIGN	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Igla_Sovereign"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	SOVEREIGN	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Igla_Sovereign"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	SOVEREIGN	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Igla_Sovereign"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	SOVEREIGN	TIER 4
        ArrayPush(items, t"Items.Recipe_Epic_Igla_Sovereign"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	SOVEREIGN	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Igla_Sovereign_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	SOVEREIGN	TIER 5
        ArrayPush(items, t"Items.Recipe_Legendary_Igla_Sovereign"); ArrayPush(counts, 1); // 	WEAPONS	DB SHOTGUN	SOVEREIGN	TIER 5
        ArrayPush(items, t"Items.TechMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	SPINETICKLER	TIER 2
        ArrayPush(items, t"Items.TechMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	SPINETICKLER	TIER 3
        ArrayPush(items, t"Items.TechMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	SPINETICKLER	TIER 4
        ArrayPush(items, t"Items.TechMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	SPINETICKLER	TIER 5
        ArrayPush(items, t"Items.UncommonUndershirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	SPOTTED FLEXI-MEMBRANE BUSTIER	TIER 2
        ArrayPush(items, t"Items.CommonGradRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	SPT32 GRAD	TIER 1
        ArrayPush(items, t"Items.UncommonGradRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	SPT32 GRAD	TIER 2
        ArrayPush(items, t"Items.RareGradRecipe_2"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	SPT32 GRAD	TIER 3
        ArrayPush(items, t"Items.RareGradRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	SPT32 GRAD	TIER 3
        ArrayPush(items, t"Items.EpicGradRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	SPT32 GRAD	TIER 4
        ArrayPush(items, t"Items.LegendaryGradRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SNIPER RIFLE	SPT32 GRAD	TIER 5
        ArrayPush(items, t"Items.PRSRMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	STABILIZER	TIER 2
        ArrayPush(items, t"Items.PRSRMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	STABILIZER	TIER 3
        ArrayPush(items, t"Items.PRSRMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	STABILIZER	TIER 4
        ArrayPush(items, t"Items.PRSRMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	SNIPER	STABILIZER	TIER 5
        ArrayPush(items, t"Items.RecipeStaminaBooster"); ArrayPush(counts, 1); // 	CONSUMABLE	MEDS	STAMINA BOOSTER	TIER 2
        ArrayPush(items, t"Items.RareHelmetRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	STEEL MICROPLATED KABUTO	TIER 3
        ArrayPush(items, t"Items.CommonIronPipeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	STEEL PIPE	TIER 1
        ArrayPush(items, t"Items.UncommonIronPipeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	STEEL PIPE	TIER 2
        ArrayPush(items, t"Items.RareIronPipeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	STEEL PIPE	TIER 3
        ArrayPush(items, t"Items.EpicIronPipeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	STEEL PIPE	TIER 4
        ArrayPush(items, t"Items.LegendaryIronPipeRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	STEEL PIPE	TIER 5
        ArrayPush(items, t"Items.Recipe_Preset_Knife_Stinger_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	STINGER	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Knife_Stinger_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	STINGER	TIER 5
        ArrayPush(items, t"Items.UncommonFormalPantsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	STURDY SYNFIBER PLEATED PANTS	TIER 2
        ArrayPush(items, t"Items.RareUndershirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	STYLISH ATOMC BLAST COMPOSITE BUSTIER	TIER 3
        ArrayPush(items, t"Items.EpicCapRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	STYLISH LEATHER FLAT CAP WITH LIGHT ARMOR LAYER	TIER 4
        ArrayPush(items, t"Items.EpicCoatRecipe"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	STYLISH TEN70 DAEMON HUNTER COAT	TIER 4
        ArrayPush(items, t"Items.RareGlassesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	STYLISH TURQUOISE SPORT GLASSES	TIER 3
        ArrayPush(items, t"Items.Recipe_SuicideLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SUICIDE	TIER 4
        ArrayPush(items, t"Items.Recipe_SuicideLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SUICIDE	TIER 5
        ArrayPush(items, t"Items.Recipe_SuicideLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SUICIDE (ICONIC)	TIER 5
        ArrayPush(items, t"Items.LegendaryVisorRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	SUN SPARK THERMOSET INFOVISOR	TIER 5
        ArrayPush(items, t"Items.UncommonCasualShoesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FEET	SUNNY AMMO SYNT HIGH-HOPS	TIER 2
        ArrayPush(items, t"Items.TechMod3_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	SUPERCHARGER	TIER 2
        ArrayPush(items, t"Items.TechMod3_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	SUPERCHARGER	TIER 3
        ArrayPush(items, t"Items.TechMod3_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	SUPERCHARGER	TIER 4
        ArrayPush(items, t"Items.TechMod3_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	SUPERCHARGER	TIER 5
        ArrayPush(items, t"Items.PowerMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	SWISS CHEESE	TIER 3
        ArrayPush(items, t"Items.PowerMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	SWISS CHEESE	TIER 4
        ArrayPush(items, t"Items.PowerMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	POWER WEAPON	SWISS CHEESE	TIER 5
        ArrayPush(items, t"Items.Recipe_BrainMeltLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SYNAPSE BURNOUT	TIER 3
        ArrayPush(items, t"Items.Recipe_BrainMeltLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SYNAPSE BURNOUT	TIER 4
        ArrayPush(items, t"Items.Recipe_BrainMeltLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SYNAPSE BURNOUT	TIER 5
        ArrayPush(items, t"Items.Recipe_BrainMeltLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SYNAPSE BURNOUT (ICONIC)	TIER 5
        ArrayPush(items, t"Items.LegendaryGlassesRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	SYN-LEATHER PLASTIC GOGGLES	TIER 5
        ArrayPush(items, t"Items.Recipe_SystemCollapseLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SYSTEM COLLAPSE (ICONIC)	TIER 5
        ArrayPush(items, t"Items.Recipe_SystemCollapseLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SYSTEM RESET	TIER 4
        ArrayPush(items, t"Items.Recipe_SystemCollapseLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	SYSTEM RESET	TIER 5
        ArrayPush(items, t"Items.CommonTantoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TANTO	TIER 1
        ArrayPush(items, t"Items.UncommonTantoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TANTO	TIER 2
        ArrayPush(items, t"Items.RareTantoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TANTO	TIER 3
        ArrayPush(items, t"Items.EpicTantoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TANTO	TIER 4
        ArrayPush(items, t"Items.LegendaryTantoRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TANTO	TIER 5
        ArrayPush(items, t"Items.Recipe_KiroshiOpticsFragment1"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	TARGET ANALYSIS	TIER 3
        ArrayPush(items, t"Items.Recipe_KiroshiOpticsFragment3"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	TARGET ANALYSIS	TIER 3
        ArrayPush(items, t"Items.RareScarfRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	TEN70 BADA55 POLYCARBONATE BANDANA	TIER 3
        ArrayPush(items, t"Items.Recipe_Common_Tactician_Headsman"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	THE HEADSMAN	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Tactician_Headsman"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	THE HEADSMAN	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Tactician_Headsman"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	THE HEADSMAN	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Tactician_Headsman"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	THE HEADSMAN	TIER 4
        ArrayPush(items, t"Items.Recipe_Epic_Tactician_Headsman"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	THE HEADSMAN	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Tactician_Headsman_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	THE HEADSMAN	TIER 5
        ArrayPush(items, t"Items.Recipe_Legendary_Tactician_Headsman"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	THE HEADSMAN	TIER 5
        ArrayPush(items, t"Items.CommonTireIronRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	THE IRON	TIER 1
        ArrayPush(items, t"Items.UncommonTireIronRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	THE IRON	TIER 2
        ArrayPush(items, t"Items.RareTireIronRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	THE IRON	TIER 3
        ArrayPush(items, t"Items.EpicPipeWrenchRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	THE IRON	TIER 4
        ArrayPush(items, t"Items.EpicTireIronRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	THE IRON	TIER 4
        ArrayPush(items, t"Items.LegendaryTireIronRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLUNT	THE IRON	TIER 5
        ArrayPush(items, t"Items.Recipe_ThermalDamageRound"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	THERMAL ROUND	TIER 3
        ArrayPush(items, t"Items.Recipe_KiroshiOpticsFragment4"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	THREAT DETECTOR	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Baton_Tinker_Bell_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	TINKER BELL	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Baton_Tinker_Bell_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	TINKER BELL	TIER 5
        ArrayPush(items, t"Items.Recipe_TitaniumPlating"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	TITANIUM PLATING	TIER 3
        ArrayPush(items, t"Items.RareMaskRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	TITANIUM-REINFORCED GAS MASK	TIER 3
        ArrayPush(items, t"Items.CommonShingenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	TKI-20 SHINGEN	TIER 1
        ArrayPush(items, t"Items.UncommonShingenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	TKI-20 SHINGEN	TIER 2
        ArrayPush(items, t"Items.RareShingenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	TKI-20 SHINGEN	TIER 3
        ArrayPush(items, t"Items.EpicShingenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	TKI-20 SHINGEN	TIER 4
        ArrayPush(items, t"Items.LegendaryShingenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	TKI-20 SHINGEN	TIER 5
        ArrayPush(items, t"Items.CommonTomahawkRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TOMAHAWK	TIER 1
        ArrayPush(items, t"Items.UncommonTomahawkRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TOMAHAWK	TIER 2
        ArrayPush(items, t"Items.RareTomahawkRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TOMAHAWK	TIER 3
        ArrayPush(items, t"Items.EpicTomahawkRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TOMAHAWK	TIER 4
        ArrayPush(items, t"Items.LegendaryTomahawkRecipe"); ArrayPush(counts, 1); // 	WEAPONS	BLADE	TOMAHAWK	TIER 5
        ArrayPush(items, t"Items.Recipe_KiroshiOpticsFragment5"); ArrayPush(counts, 1); // 	MOD	CYBERWARE	TRAJECTORY ANALYSIS	TIER 5
        ArrayPush(items, t"Items.RareTechRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	TRILAYER STEEL OCUSET	TIER 3
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Hiromi_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	TSUMETOGI	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Katana_Hiromi_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	TSUMETOGI	TIER 5
        ArrayPush(items, t"Items.EpicTShirtRecipe"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	ULTRALIGHT TESTED ON ANIMALS POLYAMIDE TANK TOP	TIER 4
        ArrayPush(items, t"Items.CommonUnityRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	UNITY	TIER 1
        ArrayPush(items, t"Items.UncommonUnityRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	UNITY	TIER 2
        ArrayPush(items, t"Items.RareUnityRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	UNITY	TIER 3
        ArrayPush(items, t"Items.EpicUnityRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	UNITY	TIER 4
        ArrayPush(items, t"Items.LegendaryUnityRecipe"); ArrayPush(counts, 1); // 	WEAPONS	PISTOL	UNITY	TIER 5
        ArrayPush(items, t"Items.LegendaryFormalPantsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	UNIWARE BRASS OFFICE PANTS WITH MEMBRANE SUPPORT	TIER 5
        ArrayPush(items, t"Items.RareHatRecipe"); ArrayPush(counts, 1); // 	CLOTHES	HEAD	UPGRADED FARMER HAT WITH GAUGE	TIER 3
        ArrayPush(items, t"Items.RarePantsRecipe"); ArrayPush(counts, 1); // 	CLOTHES	LEGS	VENOM DYE DUOLAYER RIDING PANTS	TIER 3
        ArrayPush(items, t"Items.ShotgunMod1_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	SHOTGUN	VIVISECTOR	TIER 2
        ArrayPush(items, t"Items.ShotgunMod1_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	SHOTGUN	VIVISECTOR	TIER 3
        ArrayPush(items, t"Items.ShotgunMod1_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	SHOTGUN	VIVISECTOR	TIER 4
        ArrayPush(items, t"Items.ShotgunMod1_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	SHOTGUN	VIVISECTOR	TIER 5
        ArrayPush(items, t"Items.CommonPozharRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	VST-37 POZHAR	TIER 1
        ArrayPush(items, t"Items.UncommonPozharRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	VST-37 POZHAR	TIER 2
        ArrayPush(items, t"Items.RarePozharRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	VST-37 POZHAR	TIER 3
        ArrayPush(items, t"Items.EpicPozharRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	VST-37 POZHAR	TIER 4
        ArrayPush(items, t"Items.LegendaryPozharRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SHOTGUN	VST-37 POZHAR	TIER 5
        ArrayPush(items, t"Items.ChimeraTechMod_Recipe"); ArrayPush(counts, 1); // 	MOD	TECH WEAPON	WALLPUNCHER	TIER 5
        ArrayPush(items, t"Items.CommonWardenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	WARDEN	TIER 1
        ArrayPush(items, t"Items.UncommonWardenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	WARDEN	TIER 2
        ArrayPush(items, t"Items.RareWardenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	WARDEN	TIER 3
        ArrayPush(items, t"Items.EpicWardenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	WARDEN	TIER 4
        ArrayPush(items, t"Items.LegendaryWardenRecipe"); ArrayPush(counts, 1); // 	WEAPONS	SMG	WARDEN	TIER 5
        ArrayPush(items, t"Items.Recipe_WeaponMalfunctionProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	WEAPON GLITCH	TIER 2
        ArrayPush(items, t"Items.Recipe_WeaponMalfunctionLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	WEAPON GLITCH	TIER 3
        ArrayPush(items, t"Items.Recipe_WeaponMalfunctionLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	WEAPON GLITCH	TIER 4
        ArrayPush(items, t"Items.Recipe_WeaponMalfunctionLvl4Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	WEAPON GLITCH	TIER 5
        ArrayPush(items, t"Items.Recipe_WeaponMalfunctionLvl4PlusPlusProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	WEAPON GLITCH (ICONIC)	TIER 5
        ArrayPush(items, t"Items.Recipe_WhistleProgram"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	WHISTLE	TIER 2
        ArrayPush(items, t"Items.Recipe_WhistleLvl2Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	WHISTLE	TIER 3
        ArrayPush(items, t"Items.Recipe_WhistleLvl3Program"); ArrayPush(counts, 1); // 	CYBERWARE	QUICKHACK	WHISTLE	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Achilles_Nash_Epic"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	WIDOW MAKER	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Achilles_Nash_Legendary"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	WIDOW MAKER	TIER 5
        ArrayPush(items, t"Items.Recipe_GOG_DLC_Jacket"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	WOLF SCHOOL JACKET	TIER 3
        ArrayPush(items, t"Items.Recipe_GOG_DLC_Jacket_Epic"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	WOLF SCHOOL JACKET	TIER 4
        ArrayPush(items, t"Items.Recipe_GOG_DLC_Jacket_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	OUTER TORSO	WOLF SCHOOL JACKET	TIER 5
        ArrayPush(items, t"Items.Recipe_GOG_DLC_TShirt_Epic"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	WOLF SCHOOL SHIRT	TIER 4
        ArrayPush(items, t"Items.Recipe_GOG_DLC_TShirt_Legendary"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	WOLF SCHOOL SHIRT	TIER 5
        ArrayPush(items, t"Items.Recipe_GOG_DLC_TShirt"); ArrayPush(counts, 1); // 	CLOTHES	INNER TORSO	WOLF SCHOOL T-SHIRT	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeFlashHoming"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	X-22 FLASHBANG [HOMING]	TIER 3
        ArrayPush(items, t"Items.RecipeGrenadeFlashRegular"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	X-22 FLASHBANG [REGULAR]	TIER 1
        ArrayPush(items, t"Items.RecipeGrenadeFlashUncommon"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	X-22 FLASHBANG GRENADE	TIER 2
        ArrayPush(items, t"Items.RecipeGrenadeFlashEpic"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	X-22 FLASHBANG GRENADE	TIER 4
        ArrayPush(items, t"Items.RecipeGrenadeFlashLegendary"); ArrayPush(counts, 1); // 	WEAPONS	GRENADE	X-22 FLASHBANG GRENADE	TIER 5
        ArrayPush(items, t"Items.EpicVisorRecipe"); ArrayPush(counts, 1); // 	CLOTHES	FACE	YAMORI TUNGSTEN-STEEL BIKER TECHGOGS	TIER 4
        ArrayPush(items, t"Items.Recipe_Common_Dian_Yinglong"); ArrayPush(counts, 1); // 	WEAPONS	SMG	YINGLONG	TIER 1
        ArrayPush(items, t"Items.Recipe_Uncommon_Dian_Yinglong"); ArrayPush(counts, 1); // 	WEAPONS	SMG	YINGLONG	TIER 2
        ArrayPush(items, t"Items.Recipe_Rare_Dian_Yinglong"); ArrayPush(counts, 1); // 	WEAPONS	SMG	YINGLONG	TIER 3
        ArrayPush(items, t"Items.Recipe_Epic_Dian_Yinglong"); ArrayPush(counts, 1); // 	WEAPONS	SMG	YINGLONG	TIER 4
        ArrayPush(items, t"Items.Recipe_Preset_Dian_Yinglong"); ArrayPush(counts, 1); // 	WEAPONS	ICONIC	YINGLONG	TIER 5
        ArrayPush(items, t"Items.Recipe_Legendary_Dian_Yinglong"); ArrayPush(counts, 1); // 	WEAPONS	SMG	YINGLONG	TIER 5
        ArrayPush(items, t"Items.HGMod2_Uncommon_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	ZENITH	TIER 2
        ArrayPush(items, t"Items.HGMod2_Rare_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	ZENITH	TIER 3
        ArrayPush(items, t"Items.HGMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	ZENITH	TIER 4
        ArrayPush(items, t"Items.HGMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	PISTOL / REVOLVER	ZENITH	TIER 5
        ArrayPush(items, t"Items.ThrowMod2_Epic_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	ZERO-G	TIER 4
        ArrayPush(items, t"Items.ThrowMod2_Legendary_Recipe"); ArrayPush(counts, 1); // 	MOD	THROWABLE	ZERO-G	TIER 5
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
