// InsaneCyberdeck Ver.2.0 – 12 Jan 2026 @MessaXS
// Zero Trace Netrunner - Hold to activate & Interrupt Tracing
module CyberdeckBoost

public class CyberdeckBoostController {
	private let player: wref<PlayerPuppet>;
	private let gameInstance: GameInstance;
	private let isCyberdeckBoostActive: Bool;

	public func Setup(player: wref<PlayerPuppet>) -> Void {
		this.player = player;
		this.gameInstance = player.GetGame();
		this.isCyberdeckBoostActive = false;
		this.player.RegisterInputListener(this, n"CyberdeckBoost_Hold");
		this.player.RegisterInputListener(this, n"CyberdeckInterruptTrace_Hold");
	}

	protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
		let actionName: CName = ListenerAction.GetName(action);
		let actionType: gameinputActionType = ListenerAction.GetType(action);

		if Equals(actionName, n"CyberdeckBoost_Hold") && Equals(actionType, gameinputActionType.BUTTON_HOLD_COMPLETE) {
			this.ActivateBoost();
			return true;
		}

		if Equals(actionName, n"CyberdeckInterruptTrace_Hold") && Equals(actionType, gameinputActionType.BUTTON_HOLD_COMPLETE) {
			this.InterruptTracing();
			return true;
		}

		return false;
	}

	private func ActivateBoost() -> Void {
		if this.isCyberdeckBoostActive {
			this.player.SetWarningMessage("Zero Trace Netrunner\nALREADY ACTIVE!");
			return;
		}

		this.isCyberdeckBoostActive = true;

		let statsSystem = GameInstance.GetStatsSystem(this.gameInstance);
		let ownerID: StatsObjectID = Cast<StatsObjectID>(this.player.GetEntityID());

		statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
			gamedataStatType.DurationBonusQuickhack,
			gameStatModifierType.Additive,
			0.5
		));

		statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
			gamedataStatType.MemoryCostReduction,
			gameStatModifierType.Additive,
			2.0
		));

		statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
			gamedataStatType.MemoryRegenRate,
			gameStatModifierType.Multiplier,
			2.0
		));

		this.player.SetWarningMessage("Zero Trace Netrunner\nACTIVATED");
	}

	private func InterruptTracing() -> Void {
		if !this.isCyberdeckBoostActive {
			return;
		}

		let statusEffectSystem: ref<StatusEffectSystem> = GameInstance.GetStatusEffectSystem(this.gameInstance);
		let allEffects: array<ref<StatusEffect>>;
		let foundNetrunners: array<ref<ScriptedPuppet>>;
		let playerID: EntityID = this.player.GetEntityID();

		let hackingBB: ref<IBlackboard> = GameInstance.GetBlackboardSystem(this.gameInstance).Get(GetAllBlackboardDefs().HackingMinigame);
		if IsDefined(hackingBB) {
			hackingBB.SetVector4(GetAllBlackboardDefs().HackingMinigame.LastPlayerHackPosition, Vector4(0.0, 0.0, 0.0, 0.0));
		}

		statusEffectSystem.GetAppliedEffects(playerID, allEffects);

		let i: Int32 = 0;
		while i < ArraySize(allEffects) {
			let instigatorID: EntityID = allEffects[i].GetInstigatorEntityID();

			if EntityID.IsDefined(instigatorID) && instigatorID != playerID {
				let npc: ref<ScriptedPuppet> = GameInstance.FindEntityByID(this.gameInstance, instigatorID) as ScriptedPuppet;

				if IsDefined(npc) && !ArrayContains(foundNetrunners, npc) {
					ArrayPush(foundNetrunners, npc);
				}
			}
			i += 1;
		}

		let k: Int32 = 0;
		while k < ArraySize(foundNetrunners) {
			StatusEffectHelper.ApplyStatusEffect(foundNetrunners[k], t"BaseStatusEffect.CyberwareMalfunction", 0.01);
			k += 1;
		}

		this.player.SetWarningMessage("DRP Hack\nACTIVATED");
	}

	public func IsBoostActive() -> Bool {
		return this.isCyberdeckBoostActive;
	}
}

@addField(PlayerPuppet)
public let cyberdeckBoostController: ref<CyberdeckBoostController>;

@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
	wrappedMethod();

	if !IsDefined(this.cyberdeckBoostController) {
		this.cyberdeckBoostController = new CyberdeckBoostController();
		this.cyberdeckBoostController.Setup(this);
	}
}

// upload time reduction fix
@wrapMethod(BaseScriptableAction)
public func GetActivationTime() -> Float {
	let uploadTime: Float = wrappedMethod();
	let player: ref<PlayerPuppet> = this.GetExecutor() as PlayerPuppet;

	if IsDefined(player) && IsDefined(player.cyberdeckBoostController) && player.cyberdeckBoostController.IsBoostActive() {
		uploadTime *= 0.5;
	}

	return uploadTime;
}
