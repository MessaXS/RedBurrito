// RedBurrito Cheats Ver.1.5 – 29 Dec 2025 @MessaXS
//
// CREDITS & SPECIAL THANKS:
// - Infinite Double Jump & Infinite Air Dash code based on mods by yakuzadeso:
//   * Better Dash - Air Dash - Redscript: https://www.nexusmods.com/cyberpunk2077/mods/15911
//   * Infinite Double Jump: https://www.nexusmods.com/cyberpunk2077/mods/15054
//   Original code may have been modified for integration with RedBurrito system
//
// - No Fall Damage implementation based on mod by Dravic1:
//   * Disable Fall Damage And Deadly Fall On-Screen Grey Effect Filter: https://www.nexusmods.com/cyberpunk2077/mods/16008
//   Original code may have been modified for integration with RedBurrito system
//
// If you find these features useful, please support the original mod authors!

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
        wrappedMethod(request);
        this.GiveMeRedBurritoMovement();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoMovement() -> Void {
        let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;
        let statsSystem = GameInstance.GetStatsSystem(player.GetGame());
        let ownerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
        
        // INFINITE STAMINA
        let staminaMod = RPGManager.CreateStatModifier(
            gamedataStatType.CanIgnoreStamina,
            gameStatModifierType.Additive,
            1.0
        );
        statsSystem.AddSavedModifier(ownerID, staminaMod);
        
        // INFINITE OXYGEN
        let oxygenMod = RPGManager.CreateStatModifier(
            gamedataStatType.CanBreatheUnderwater,
            gameStatModifierType.Additive,
            1.0
        );
        statsSystem.AddSavedModifier(ownerID, oxygenMod);

        // CARRY CAPACITY
        this.ApplyCarryCapacity(statsSystem, ownerID);

        // MAX SPEED
        this.ApplyMaxSpeed(statsSystem, ownerID);
}

// =============================================
// NO FALL DAMAGE
// =============================================

@replaceMethod(LocomotionAirEvents)
protected func OnUpdate(timeDelta: Float, stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
        let deathLandingFallingSpeed: Float;
        let hardLandingFallingSpeed: Float;
        let horizontalSpeed: Float;
        let isInSuperheroFall: Bool;
        let landingAnimFeature: ref<AnimFeature_Landing>;
        let landingType: LandingType;
        let maxAllowedDistanceToGround: Float;
        let playerVelocity: Vector4;
        let regularLandingFallingSpeed: Float;
        let safeLandingFallingSpeed: Float;
        let verticalSpeed: Float;
        let veryHardLandingFallingSpeed: Float;
        
        super.OnUpdate(timeDelta, stateContext, scriptInterface);
        
        if this.IsTouchingGround(scriptInterface) {
                this.m_resetFallingParametersOnExit = true;
                return;
        };
        
        this.m_resetFallingParametersOnExit = false;
        verticalSpeed = this.GetVerticalSpeed(scriptInterface);
        
        if this.m_updateInputToggles && verticalSpeed < this.GetFallingSpeedBasedOnHeight(scriptInterface, this.GetStaticFloatParameterDefault("minFallHeightToConsiderInputToggles", 0.00)) {
                this.UpdateInputToggles(stateContext, scriptInterface);
        };
        
        if scriptInterface.IsActionJustPressed(n"Jump") {
                stateContext.SetConditionBoolParameter(n"CrouchToggled", false, true);
                return;
        };
        
        if StatusEffectSystem.ObjectHasStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.BerserkPlayerBuff") && verticalSpeed < this.GetFallingSpeedBasedOnHeight(scriptInterface, this.GetStaticFloatParameterDefault("minFallHeightToEnterSuperheroFall", 0.00)) {
                stateContext.SetTemporaryBoolParameter(n"requestSuperheroLandActivation", true, true);
        };
        
        regularLandingFallingSpeed = stateContext.GetFloatParameter(n"RegularLandingFallingSpeed", true);
        safeLandingFallingSpeed = stateContext.GetFloatParameter(n"SafeLandingFallingSpeed", true);
        hardLandingFallingSpeed = stateContext.GetFloatParameter(n"HardLandingFallingSpeed", true);
        veryHardLandingFallingSpeed = stateContext.GetFloatParameter(n"VeryHardLandingFallingSpeed", true);
        deathLandingFallingSpeed = stateContext.GetFloatParameter(n"DeathLandingFallingSpeed", true);
        isInSuperheroFall = stateContext.IsStateActive(n"Locomotion", n"superheroFall");
        maxAllowedDistanceToGround = this.GetStaticFloatParameterDefault("maxDistToGroundFromSuperheroFall", 20.00);
        
        if isInSuperheroFall && !this.m_maxSuperheroFallHeight {
                this.StartEffect(scriptInterface, n"falling");
                this.PlaySound(n"lcm_falling_wind_loop", scriptInterface);
                if DefaultTransition.GetDistanceToGround(scriptInterface) >= maxAllowedDistanceToGround {
                this.m_maxSuperheroFallHeight = true;
                return;
                };
                landingType = LandingType.Superhero;
        } else {
                // ===== FLAG NO FALL DAMAGE =====
                let questSystem = scriptInterface.GetQuestsSystem();
                let isNoFallDamageEnabled: Bool = questSystem.GetFact(n"redburrito_no_fall_damage") > 0;
                
                if isNoFallDamageEnabled {
                landingType = LandingType.Regular;
                this.SetBlackboardIntVariable(scriptInterface, GetAllBlackboardDefs().PlayerStateMachine.Fall, EnumInt(gamePSMFallStates.SafeFall));
                } else {
                if verticalSpeed <= safeLandingFallingSpeed {
                        landingType = LandingType.Regular;
                        this.SetBlackboardIntVariable(scriptInterface, GetAllBlackboardDefs().PlayerStateMachine.Fall, EnumInt(gamePSMFallStates.RegularFall));
                        playerVelocity = DefaultTransition.GetLinearVelocity(scriptInterface);
                        horizontalSpeed = Vector4.Length2D(playerVelocity);
                        if horizontalSpeed <= this.GetStaticFloatParameterDefault("maxHorizontalSpeedToAerialTakedown", 0.00) {
                        this.SetBlackboardIntVariable(scriptInterface, GetAllBlackboardDefs().PlayerStateMachine.Fall, EnumInt(gamePSMFallStates.SafeFall));
                        };
                } else {
                        if verticalSpeed <= regularLandingFallingSpeed {
                        if this.GetLandingType(stateContext) != EnumInt(LandingType.Regular) {
                                this.PlaySound(n"lcm_falling_wind_loop", scriptInterface);
                        };
                        landingType = LandingType.Regular;
                        } else {
                        landingType = LandingType.Off;
                        };
                };
                }
        };
        
        stateContext.SetPermanentIntParameter(n"LandingType", EnumInt(landingType), true);
        stateContext.SetPermanentFloatParameter(n"ImpactSpeed", verticalSpeed, true);
        stateContext.SetPermanentFloatParameter(n"InAirDuration", this.GetInStateTime(), true);
        
        landingAnimFeature = new AnimFeature_Landing();
        landingAnimFeature.impactSpeed = verticalSpeed;
        landingAnimFeature.type = EnumInt(landingType);
        scriptInterface.SetAnimationParameterFeature(n"Landing", landingAnimFeature);
        
        this.SetAudioParameter(n"RTPC_Vertical_Velocity", verticalSpeed, scriptInterface);
        this.SetAudioParameter(n"RTPC_Landing_Type", Cast<Float>(EnumInt(landingType)), scriptInterface);
}

// =============================================
// CARRY CAPACITY
// =============================================

@addMethod(VendingMachine)
private func ApplyCarryCapacity(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let carryMod = RPGManager.CreateStatModifier(
                gamedataStatType.CarryCapacity,
                gameStatModifierType.Additive,
                20000.0
        );
        
        statsSystem.AddSavedModifier(ownerID, carryMod);
}

// =============================================
// MAX SPEED
// =============================================

@addMethod(VendingMachine)
private func ApplyMaxSpeed(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let speedMod = RPGManager.CreateStatModifier(
                gamedataStatType.MaxSpeed,
                gameStatModifierType.Multiplier,
                3.0
        );
        
        statsSystem.AddSavedModifier(ownerID, speedMod);
}

// =============================================
// NO FALL DAMAGE
// =============================================

@addMethod(VendingMachine)
private func ApplyNoFallDamage(statsSystem: ref<StatsSystem>, ownerID: StatsObjectID) -> Void {
        let fallDamageMod = RPGManager.CreateStatModifier(
                gamedataStatType.FallDamageReduction,
                gameStatModifierType.Additive,
                100.0  // 100% reduction
        );
        
        statsSystem.AddSavedModifier(ownerID, fallDamageMod);
}

// =============================================
// INFINITE DOUBLE JUMP
// =============================================

@replaceMethod(DoubleJumpEvents)
public func OnEnter(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
        // initialization
        super.OnEnter(stateContext, scriptInterface);
        this.ConsumeStaminaBasedOnLocomotionState(stateContext, scriptInterface);

        // jump logic
        stateContext.SetPermanentIntParameter(n"currentNumberOfJumps", 0, true); // Reset jump counter to 0 to enable infinite jumps
        
        // audio and haptic feedback
        this.PlaySound(n"lcm_player_double_jump", scriptInterface);
        DefaultTransition.PlayRumble(scriptInterface, this.GetStaticStringParameterDefault("rumbleOnEnter", "medium_fast"));
        
        // animation and state
        scriptInterface.PushAnimationEvent(n"DoubleJump");
        this.SetBlackboardIntVariable(scriptInterface, GetAllBlackboardDefs().PlayerStateMachine.Locomotion, 5);
        stateContext.SetConditionBoolParameter(n"JumpPressed", false, true);
        this.SetDetailedState(scriptInterface, gamePSMDetailedLocomotionStates.DoubleJump);
        
        // telemetry
        this.LogSpecialMovementToTelemetry(scriptInterface, telemetryMovementType.DoubleJump);
}

@replaceMethod(DoubleJumpDecisions)
protected const func EnterCondition(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
        // input check
        let isJumpButtonHeld: Bool = stateContext.GetConditionBool(n"JumpPressed");
        
        // disable condition if no jump input detected
        if !isJumpButtonHeld && !this.m_jumpPressed {
                this.EnableOnEnterCondition(false);
        };
        
        // ability checks
        if !scriptInterface.HasStatFlag(gamedataStatType.HasDoubleJump) {
                return false;
        };
        
        // status checks
        if StatusEffectSystem.ObjectHasStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.HealFood3") {
                return false;
        };
        
        // conflicting ability checks
        if scriptInterface.HasStatFlag(gamedataStatType.HasChargeJump) || scriptInterface.HasStatFlag(gamedataStatType.HasAirHover) {
                return false;
        };
        
        // env checks
        if scriptInterface.localBlackboard.GetBool(GetAllBlackboardDefs().PlayerStateMachine.IsPlayerInsideMovingElevator) {
                return false;
        };
        
        // decision
        if isJumpButtonHeld || scriptInterface.IsActionJustPressed(n"Jump") {
                return true;
        };
        
        return false;
}

// =============================================
// INFINITE AIR DASH SYSTEM
// Removes cooldown for dodge/dash abilities
// =============================================

@replaceMethod(DodgeEvents)
protected func OnEnter(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
        // === INITIALIZATION ===
        let ownerID: StatsObjectID = Cast<StatsObjectID>(scriptInterface.executionOwnerEntityID);
        let dodgeDirection: Float = stateContext.GetConditionFloat(n"DodgeDirection");
        let playerDevData: ref<PlayerDevelopmentData> = PlayerDevelopmentSystem.GetData(scriptInterface.executionOwner);
        let currentLocomotionState: CName = stateContext.GetStateMachineCurrentState(n"Locomotion");
        let isAirborne: Bool = !this.IsTouchingGround(scriptInterface);
        let isInsideElevator: Bool = GameInstance.GetBlackboardSystem(scriptInterface.GetGame()).GetLocalInstanced(scriptInterface.ownerEntityID, GetAllBlackboardDefs().PlayerStateMachine).GetBool(GetAllBlackboardDefs().PlayerStateMachine.IsPlayerInsideElevator);
        
        scriptInterface.localBlackboard.SetFloat(GetAllBlackboardDefs().PlayerStateMachine.DodgeTimeStamp, EngineTime.ToFloat(GameInstance.GetEngineTime(scriptInterface.GetGame())));
        this.m_currentNumberOfJumps = stateContext.GetIntParameter(n"currentNumberOfJumps", true);
        super.OnEnter(stateContext, scriptInterface);
        
        // === CHARGE JUMP HANDLING ===
        if Equals(currentLocomotionState, n"chargeJump") {
                stateContext.SetPermanentBoolParameter(n"isGravityAffectedByChargedJump", true, true);
        };
        
        // === INPUT SCHEME DETECTION ===
        let inputSchemesBlackboard = GameInstance.GetBlackboardSystem(scriptInterface.GetGame()).Get(GetAllBlackboardDefs().InputSchemes);
        let currentInputScheme: Uint32 = 0u;
        if IsDefined(inputSchemesBlackboard) {
                currentInputScheme = inputSchemesBlackboard.GetUint(GetAllBlackboardDefs().InputSchemes.Scheme);
        };
        
        // === CROUCH STATE DETECTION ===
        this.m_crouching = (Equals(currentLocomotionState, n"crouch") || Equals(currentLocomotionState, n"crouchSprint") || Equals(currentLocomotionState, n"slide")) && (currentInputScheme != 0u || !scriptInterface.IsActionJustTapped(n"ToggleCrouch"));
        
        // === CROUCH SETUP ===
        if this.m_crouching {
                let playerPuppet = scriptInterface.owner as ScriptedPuppet;
                if IsDefined(playerPuppet) {
                        playerPuppet.GetPuppetPS().SetCrouch(true);
                };
                scriptInterface.GetAudioSystem().NotifyGameTone(n"EnterCrouch");
                scriptInterface.GetSpatialQueriesSystem().GetPlayerObstacleSystem().OnEnterCrouch(scriptInterface.owner);
                this.SetBlackboardIntVariable(scriptInterface, GetAllBlackboardDefs().PlayerStateMachine.Locomotion, 13);
                scriptInterface.SetAnimationParameterFloat(n"crouch", 1.00);
        } else {
                if Equals(currentLocomotionState, n"crouch") || Equals(currentLocomotionState, n"crouchSprint") {
                        stateContext.SetConditionBoolParameter(n"CrouchToggled", false, true);
                };
                this.SetBlackboardIntVariable(scriptInterface, GetAllBlackboardDefs().PlayerStateMachine.Locomotion, 7);
        };
        
        stateContext.SetConditionBoolParameter(n"DodgeWhileCrouching", this.m_crouching, true);
        
        // === TARGET DETECTION FOR LEAP ===
        let crosshairData = GameInstance.GetBlackboardSystem(scriptInterface.GetGame()).Get(GetAllBlackboardDefs().UI_NPCNextToTheCrosshair);
        let targetedNPC = FromVariant<NPCNextToTheCrosshair>(crosshairData.GetVariant(GetAllBlackboardDefs().UI_NPCNextToTheCrosshair.NameplateData));
        let targetEntity = targetedNPC.npc as ScriptedPuppet;
        let canLeapToTarget: Bool = targetEntity.IsHostile();
        
        // === DASH/DODGE LOGIC ===
        if !isInsideElevator && playerDevData.IsNewPerkBought(gamedataNewPerkType.Reflexes_Central_Milestone_2) >= 0 {
                // Air dodge handling
                if isAirborne && playerDevData.IsNewPerkBought(gamedataNewPerkType.Reflexes_Central_Milestone_3) >= 0 {
                        this.Dodge(stateContext, scriptInterface, false);
                        if !stateContext.GetConditionBool(n"CrouchToggled") {
                                scriptInterface.PushAnimationEvent(n"Dodge");
                        };
                        this.PlayRumbleBasedOnDodgeDirection(stateContext, scriptInterface);
                };
                
                stateContext.SetPermanentBoolParameter(n"TemporarySpeedLimitIgnore", true, true);
                
                // Fierce dash perk check
                let hasFierceDashPerk: Bool = playerDevData.IsNewPerkBoughtAnyLevel(gamedataNewPerkType.Reflexes_Central_Perk_2_1);
                let leapMaxDistance: Float = hasFierceDashPerk ? 10.00 : 5.00;
                let farTarget = DefaultTransition.GetTargetObject(scriptInterface, leapMaxDistance, true);
                let closeTarget = DefaultTransition.GetTargetObject(scriptInterface, 1.00, true);
                
                // Leap to target or regular dash
                if canLeapToTarget && AbsF(dodgeDirection) < 60.00 && (IsDefined(closeTarget) || IsDefined(farTarget)) {
                        this.LeapToTarget(stateContext, scriptInterface, targetEntity);
                } else {
                        let shouldAirDash: Bool = isAirborne ? this.TreatDashAsAirDash(scriptInterface) : false;
                        this.Dash(stateContext, scriptInterface, false, shouldAirDash);
                };
                
                // Dash effects and feedback
                this.PlaySound(n"lcm_dash", scriptInterface);
                GameObjectEffectHelper.StartEffectEvent(scriptInterface.executionOwner, n"dash");
                StatusEffectHelper.ApplyStatusEffect(scriptInterface.owner, t"BaseStatusEffect.PlayerJustDashed", scriptInterface.owner.GetEntityID());
                scriptInterface.PushAnimationEvent(n"Dodge");
                this.PlayRumbleBasedOnDodgeDirection(stateContext, scriptInterface, false);
        } else {
                // Regular dodge
                this.Dodge(stateContext, scriptInterface, false);
                if !this.m_crouching {
                        scriptInterface.PushAnimationEvent(n"Dodge");
                };
                if StatusEffectHelper.HasStatusEffectWithTagConst(scriptInterface.executionOwner as PlayerPuppet, n"SecondChancePerkTimeDilation") {
                        this.PlaySound(n"lcm_dash", scriptInterface);
                };
                this.PlayRumbleBasedOnDodgeDirection(stateContext, scriptInterface);
        };
        
        // === QUEST TRACKING ===
        let questTracker = scriptInterface.GetQuestsSystem();
        questTracker.SetFact(n"gmpl_player_dodged", questTracker.GetFact(n"gmpl_player_dodged") + 1);
        
        // === STATUS EFFECTS APPLICATION ===
        this.m_blockStatFlag = RPGManager.CreateStatModifier(gamedataStatType.IsDodging, gameStatModifierType.Additive, 1.00);
        StatusEffectHelper.ApplyStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.DodgeBuff");
        StatusEffectHelper.ApplyStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.JustDodgedBuffer");
        StatusEffectHelper.ApplyStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.PlayerJustDodgedLocomotionBuffer");
        
        // === INVULNERABILITY FOR BACK/SIDE DODGES ===
        if dodgeDirection < -45.00 || dodgeDirection > 45.00 {
                StatusEffectHelper.ApplyStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.DodgeInvulnerability");
        };
        
        scriptInterface.GetStatsSystem().AddModifier(ownerID, this.m_blockStatFlag);
        this.SetDetailedState(scriptInterface, gamePSMDetailedLocomotionStates.Dodge);
        this.LogSpecialMovementToTelemetry(scriptInterface, telemetryMovementType.Dodge);
}

@replaceMethod(LocomotionTransition)
protected final const func WantsToDodge(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
        // === ABILITY CHECK ===
        if !scriptInterface.HasStatFlag(gamedataStatType.HasDodge) {
                return false;
        };
        
        // === STATUS EFFECT CHECK ===
        if StatusEffectSystem.ObjectHasStatusEffect(scriptInterface.executionOwner, t"BaseStatusEffect.HealFood3") {
                return false;
        };
        
        // === INFINITE DASH LOGIC ===
        // Cooldown check removed - allows unlimited dashing
        let hasAirDashPerk = PlayerDevelopmentSystem.GetInstance(scriptInterface.executionOwner).IsNewPerkBought(scriptInterface.executionOwner, gamedataNewPerkType.Reflexes_Central_Milestone_3) >= 0;
        let hasStamina = GameInstance.GetStatPoolsSystem(scriptInterface.executionOwner.GetGame()).GetStatPoolValue(Cast<StatsObjectID>(scriptInterface.executionOwner.GetEntityID()), gamedataStatPoolType.Stamina, true) > 0.00;
        
        // === AIR DASH CHECK ===
        if !this.IsTouchingGround(scriptInterface) && !hasAirDashPerk {
                return false;
        };
        
        // === FALL SPEED CHECK ===
        if this.IsCurrentFallSpeedTooFastToEnter(stateContext, scriptInterface) {
                return false;
        };
        
        // === INPUT HANDLING ===
        if scriptInterface.IsActionJustTapped(n"Dodge") {
                if scriptInterface.IsMoveInputConsiderable() {
                        stateContext.SetConditionFloatParameter(n"DodgeDirection", scriptInterface.GetInputHeading(), true);
                        return true;
                };
                if this.GetStaticBoolParameterDefault("dodgeWithNoMovementInput", false) {
                        stateContext.SetConditionFloatParameter(n"DodgeDirection", -180.00, true);
                        return true;
                };
        };
        
        // === MOVEMENT INPUT DODGE ===
        if this.WantsToDodgeFromMovementInput(stateContext, scriptInterface) && GameplaySettingsSystem.GetMovementDodgeEnabled(scriptInterface.executionOwner) {
                return true;
        };
        
        return false;
}