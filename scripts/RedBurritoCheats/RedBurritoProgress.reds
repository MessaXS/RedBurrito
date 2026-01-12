// RedBurritoProgress Ver.2.0 – 12 Jan 2026 @MessaXS
// Inject custom items and level up through vending machines
module RedBurrito.Cheats.Progress

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
	    wrappedMethod(request);
	    this.GiveMeRedBurritoProgress();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoProgress() -> Void {
	    let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject();
	
	    let devSystem: ref<PlayerDevelopmentSystem> = PlayerDevelopmentSystem.GetInstance(player);
	    let devData: ref<PlayerDevelopmentData> = devSystem.GetDevelopmentData(player);
	
	    let profType: gamedataProficiencyType;
	    let expAmount: Int32;
	
        // ↓↓↓ COMMENT OUT ANY LINE TO DISABLE LEVEL UP ↓↓↓
        // Character Level +1
            profType = gamedataProficiencyType.Level;
            expAmount = devData.GetRemainingExpForLevelUp(profType);
            devData.AddExperience(expAmount, profType, telemetryLevelGainReason.Gameplay);
        // Street Cred +1
            profType = gamedataProficiencyType.StreetCred;
            expAmount = devData.GetRemainingExpForLevelUp(profType);
            devData.AddExperience(expAmount, profType, telemetryLevelGainReason.Gameplay);
        // Cool Skill +1
            profType = gamedataProficiencyType.CoolSkill;
            expAmount = devData.GetRemainingExpForLevelUp(profType);
            devData.AddExperience(expAmount, profType, telemetryLevelGainReason.Gameplay);
        // Intelligence Skill +1
            profType = gamedataProficiencyType.IntelligenceSkill;
            expAmount = devData.GetRemainingExpForLevelUp(profType);
            devData.AddExperience(expAmount, profType, telemetryLevelGainReason.Gameplay);
        // Reflexes Skill +1
            profType = gamedataProficiencyType.ReflexesSkill;
            expAmount = devData.GetRemainingExpForLevelUp(profType);
            devData.AddExperience(expAmount, profType, telemetryLevelGainReason.Gameplay);
        // Strength Skill +1
            profType = gamedataProficiencyType.StrengthSkill;
            expAmount = devData.GetRemainingExpForLevelUp(profType);
            devData.AddExperience(expAmount, profType, telemetryLevelGainReason.Gameplay);
        // Technical Ability Skill +1
            profType = gamedataProficiencyType.TechnicalAbilitySkill;
            expAmount = devData.GetRemainingExpForLevelUp(profType);
            devData.AddExperience(expAmount, profType, telemetryLevelGainReason.Gameplay);
        // ↑↑↑ COMMENT OUT ANY LINE TO DISABLE LEVEL UP ↑↑↑
	
	
    	let TS: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGame());

    	let items: array<TweakDBID>;
    	let counts: array<Int32>;
	
        // ↓↓↓ ADD ITEMS HERE ↓↓↓
        // Perk, attribute and relic point shards
        //    ArrayPush(items, t"Items.PerkPointSkillbook"); ArrayPush(counts, 1);	 // 	+ 1  PERK POINT SHARD
        //    ArrayPush(items, t"Items.AttributePointSkillbook"); ArrayPush(counts, 1);	 // 	+ 1  ATTRIBUTE POINT SHARD
        //    ArrayPush(items, t"Items.Espionage_Skillbook"); ArrayPush(counts, 1);	 // 	+ 1  RELIC POINT SHARD
        // Permanent rewards
        //    ArrayPush(items, t"Items.PermanentHealthFood"); ArrayPush(counts, 1);	 // 	+ 9  MAX HEALT Item Name: PROTOTYPE PSEUDOEMBRYONIC CELL BUILDER
        //    ArrayPush(items, t"Items.AirdropPermaReward"); ArrayPush(counts, 1);	 // 	+ 2  MAX CARRYING CAPACITY Item Name: CARRYING CAPACITY SHARD
        //    ArrayPush(items, t"Items.PermanentStaminaRegenFood"); ArrayPush(counts, 1);	 // 	+ 2.075  MAX STAMINA REGEN RATE Item Name: MILITARY-GRADE LACTIC ACID RECYCLERS	
        //    ArrayPush(items, t"Items.PermanentMemoryRegenFood"); ArrayPush(counts, 1);	 // 	+ 0.038  MAX RAM RECOVERY RATE IN COMBAT Item Name: DENDRITIC PROTOPLASMA SUPPLIER	
        //    ArrayPush(items, t"Items.CWCapacityPermaReward_Uncommon"); ArrayPush(counts, 1);	 // 	+ 2  MAX CYBERWARE CAPACITY Item Name: CYBERWARE CAPACITY SHARD	
        //    ArrayPush(items, t"Items.CWCapacityPermaReward_Rare"); ArrayPush(counts, 1);	 // 	+ 3  MAX CYBERWARE CAPACITY Item Name: CYBERWARE CAPACITY SHARD	
        //    ArrayPush(items, t"Items.CWCapacityPermaReward_Epic"); ArrayPush(counts, 1);	 // 	+ 4  MAX CYBERWARE CAPACITY Item Name: CYBERWARE CAPACITY SHARD	
        //    ArrayPush(items, t"Items.CWCapacityPermaReward_Legendary"); ArrayPush(counts, 1);	 // 	+ 6  MAX CYBERWARE CAPACITY Item Name: CYBERWARE CAPACITY SHARD	
        //    ArrayPush(items, t"Items.IKPerkPointSkillbook"); ArrayPush(counts, 1);	 // 	+ 1  PERK POINT SHARD Item Name: 72H EXTREME SENSORY DEPRIVATION	
        // Meds MAX LVL
            ArrayPush(items, t"Items.BonesMcCoy70V0"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.1	 INSTANTLY RESTORES 10 HEALTH | THEN 6 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.BonesMcCoy70VCommonPlus"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.1+	 INSTANTLY RESTORES 10 HEALTH | THEN 7 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.BonesMcCoy70VUncommon"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.2	 INSTANTLY RESTORES 10 HEALTH | THEN 8 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.FirstAidWhiffVEpic"); ArrayPush(counts, 1); // 	MAXDOC MK.4	 INSTANTLY RESTORES 100 HEALTH
            ArrayPush(items, t"Items.FirstAidWhiffVEpicPlus"); ArrayPush(counts, 1); // 	MAXDOC MK.4+	 INSTANTLY RESTORES 107 HEALTH
            ArrayPush(items, t"Items.FirstAidWhiffV2"); ArrayPush(counts, 1); // 	MAXDOC MK.5	 INSTANTLY RESTORES 116 HEALTH
            ArrayPush(items, t"Items.BonesMcCoy70V1"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.3	 INSTANTLY RESTORES 12 HEALTH | THEN 11 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.BonesMcCoy70VUncommonPlus"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.2+	 INSTANTLY RESTORES 12 HEALTH | THEN 9 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.FirstAidWhiffVLegendaryPlus"); ArrayPush(counts, 1); // 	MAXDOC MK.5+	 INSTANTLY RESTORES 126 HEALTH
            ArrayPush(items, t"Items.BonesMcCoy70VRarePlus"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.3+	 INSTANTLY RESTORES 18 HEALTH | THEN 12 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.BonesMcCoy70VEpic"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.4	 INSTANTLY RESTORES 20 HEALTH | THEN 13 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.BonesMcCoy70VEpicPlus"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.4+	 INSTANTLY RESTORES 22 HEALTH | THEN 14 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.BonesMcCoy70V2"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.5	 INSTANTLY RESTORES 25 HEALTH | THEN 15 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.BonesMcCoy70VLegendaryPlus"); ArrayPush(counts, 1); // 	BOUNCE BACK MK.5+	 INSTANTLY RESTORES 30 HEALTH | THEN 17 HEALTH PER SEC FOR 10SEC
            ArrayPush(items, t"Items.FirstAidWhiffV0"); ArrayPush(counts, 1); // 	MAXDOC MK.1	 INSTANTLY RESTORES 50 HEALTH
            ArrayPush(items, t"Items.FirstAidWhiffVCommonPlus"); ArrayPush(counts, 1); // 	MAXDOC MK.1+	 INSTANTLY RESTORES 58 HEALTH
            ArrayPush(items, t"Items.FirstAidWhiffVUncommon"); ArrayPush(counts, 1); // 	MAXDOC MK.2	 INSTANTLY RESTORES 65 HEALTH
            ArrayPush(items, t"Items.FirstAidWhiffVUncommonPlus"); ArrayPush(counts, 1); // 	MAXDOC MK.2+	 INSTANTLY RESTORES 72 HEALTH
            ArrayPush(items, t"Items.FirstAidWhiffV1"); ArrayPush(counts, 1); // 	MAXDOC MK.3	 INSTANTLY RESTORES 84 HEALTH
            ArrayPush(items, t"Items.FirstAidWhiffVRarePlus"); ArrayPush(counts, 1); // 	MAXDOC MK.3+	 INSTANTLY RESTORES 92 HEALTH
	    // Grenades MAX LVL
            ArrayPush(items, t"Items.Preset_Grenade_Incendiary_Default");
            ArrayPush(items, t"Items.GrenadeIncendiaryRegular");
            ArrayPush(items, t"Items.GrenadeIncendiaryUncommonPlus");
            ArrayPush(items, t"Items.GrenadeIncendiaryRare");
            ArrayPush(items, t"Items.GrenadeIncendiaryRarePlus");
            ArrayPush(items, t"Items.GrenadeIncendiarySticky");
            ArrayPush(items, t"Items.GrenadeIncendiaryEpicPlus");
            ArrayPush(items, t"Items.GrenadeIncendiaryLegendary");
            ArrayPush(items, t"Items.GrenadeIncendiaryLegendaryPlus");
            ArrayPush(items, t"Items.MaelstromGrenade1");
            ArrayPush(items, t"Items.MaelstromGrenade2");
            ArrayPush(items, t"Items.MaelstromGrenade3");
            ArrayPush(items, t"Items.GrenadeFragRegular");
            ArrayPush(items, t"Items.Preset_Grenade_Frag_Default");
            ArrayPush(items, t"Items.GrenadeFragCommonPlus");
            ArrayPush(items, t"Items.GrenadeFragUncommon");
            ArrayPush(items, t"Items.GrenadeFragUncommonPlus");
            ArrayPush(items, t"Items.GrenadeFragSticky");
            ArrayPush(items, t"Items.GrenadeFragRarePlus");
            ArrayPush(items, t"Items.GrenadeFragEpic");
            ArrayPush(items, t"Items.GrenadeFragEpicPlus");
            ArrayPush(items, t"Items.GrenadeFragLegendary");
            ArrayPush(items, t"Items.GrenadeFragLegendaryPlus");
            ArrayPush(items, t"Items.GrenadeCuttingRegular");
            ArrayPush(items, t"Items.CuttingGrenadeLegendaryPlus");
            ArrayPush(items, t"Items.Preset_Grenade_Biohazard_Default");
            ArrayPush(items, t"Items.GrenadeBiohazardRegular");
            ArrayPush(items, t"Items.GrenadeBiohazardRarePlus");
            ArrayPush(items, t"Items.GrenadeBiohazardHoming");
            ArrayPush(items, t"Items.GrenadeBiohazardEpicPlus");
            ArrayPush(items, t"Items.GrenadeBiohazardLegendary");
            ArrayPush(items, t"Items.GrenadeBiohazardLegendaryPlus");
            ArrayPush(items, t"Items.GrenadeOzobsNose");
            ArrayPush(items, t"Items.Preset_Grenade_Recon_Default");
            ArrayPush(items, t"Items.GrenadeReconRegular");
            ArrayPush(items, t"Items.GrenadeReconUncommonPlus");
            ArrayPush(items, t"Items.GrenadeReconRare");
            ArrayPush(items, t"Items.GrenadeReconRarePlus");
            ArrayPush(items, t"Items.GrenadeReconSticky");
            ArrayPush(items, t"Items.GrenadeReconEpicPlus");
            ArrayPush(items, t"Items.GrenadeReconLegendary");
            ArrayPush(items, t"Items.GrenadeReconLegendaryPlus");
            ArrayPush(items, t"Items.AldecadosGrenade");
            ArrayPush(items, t"Items.GrenadeSmokeOda");
            ArrayPush(items, t"Items.GrenadeSmokeOdaHarmless");
            ArrayPush(items, t"Items.GrenadeSmokeRegular");
            ArrayPush(items, t"Items.GrenadeSmokeUncommonPlus");
            ArrayPush(items, t"Items.GrenadeSmokeRare");
            ArrayPush(items, t"Items.GrenadeSmokeRarePlus");
            ArrayPush(items, t"Items.GrenadeSmokeEpic");
            ArrayPush(items, t"Items.GrenadeSmokeEpicPlus");
            ArrayPush(items, t"Items.GrenadeSmokeLegendary");
            ArrayPush(items, t"Items.GrenadeSmokeLegendaryPlus");
            ArrayPush(items, t"Items.SixthStreetGrenade1");
            ArrayPush(items, t"Items.SixthStreetGrenade2");
            ArrayPush(items, t"Items.Preset_Grenade_Flash_Default");
            ArrayPush(items, t"Items.GrenadeFlashCommonPlus");
            ArrayPush(items, t"Items.GrenadeFlashUncommon");
            ArrayPush(items, t"Items.GrenadeFlashUncommonPlus");
            ArrayPush(items, t"Items.GrenadeFlashHoming");
            ArrayPush(items, t"Items.GrenadeFlashRarePlus");
            ArrayPush(items, t"Items.GrenadeFlashEpic");
            ArrayPush(items, t"Items.GrenadeFlashEpicPlus");
            ArrayPush(items, t"Items.GrenadeFlashLegendary");
            ArrayPush(items, t"Items.GrenadeFlashLegendaryPlus");
            ArrayPush(items, t"Items.GrenadeEMPRegular");
            ArrayPush(items, t"Items.Preset_Grenade_EMP_Default");
            ArrayPush(items, t"Items.GrenadeEMPCommonPlus");
            ArrayPush(items, t"Items.GrenadeEMPUncommon");
            ArrayPush(items, t"Items.GrenadeEMPUncommonPlus");
            ArrayPush(items, t"Items.GrenadeEMPRare");
            ArrayPush(items, t"Items.GrenadeEMPRarePlus");
            ArrayPush(items, t"Items.GrenadeEMPSticky");
            ArrayPush(items, t"Items.GrenadeEMPEpicPlus");
            ArrayPush(items, t"Items.GrenadeEMPLegendary");
            ArrayPush(items, t"Items.GrenadeEMPLegendaryPlus");
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