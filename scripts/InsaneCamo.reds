// Insane Camo x20 - Hold to activate
// VER.2.0 @MessaXS @annix91
module OpticalCamoBoost

public class OpticalCamoBoostController {
  private let player: wref<PlayerPuppet>;
  private let gameInstance: GameInstance;
  private let isOpticalCamoBoostActive: Bool;

  public func Setup(player: wref<PlayerPuppet>) -> Void {
    this.player = player;
    this.gameInstance = player.GetGame();
    this.isOpticalCamoBoostActive = false;
    this.player.RegisterInputListener(this, n"OpticalCamoBoost_Hold");
  }

  protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
    if Equals(ListenerAction.GetName(action), n"OpticalCamoBoost_Hold") &&
       Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
      this.ActivateBoost();
    }
  }

  private func ActivateBoost() -> Void {
    if this.isOpticalCamoBoostActive {
      this.player.SetWarningMessage("Optical Camo Boost\nALREADY ACTIVE!");
      return;
    }

    this.isOpticalCamoBoostActive = true;

    let statsSystem = GameInstance.GetStatsSystem(this.gameInstance);
    let ownerID: StatsObjectID = Cast<StatsObjectID>(this.player.GetEntityID());

    statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
      gamedataStatType.OpticalCamoDuration,
      gameStatModifierType.Multiplier,
      20.0
    ));

    statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
      gamedataStatType.OpticalCamoDurationMultiplier,
      gameStatModifierType.Multiplier,
      20.0
    ));

    statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
      gamedataStatType.OpticalCamoRechargeDuration,
      gameStatModifierType.Multiplier,
      0.01
    ));

    this.player.SetWarningMessage("Optical Camo Boost\nACTIVATED (x20 Duration, x100 Recharge)");
  }
}

@addField(PlayerPuppet)
private let opticalCamoBoostController: ref<OpticalCamoBoostController>;

@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
  wrappedMethod();

  if !IsDefined(this.opticalCamoBoostController) {
    this.opticalCamoBoostController = new OpticalCamoBoostController();
    this.opticalCamoBoostController.Setup(this);
  }
}