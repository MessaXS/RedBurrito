// RedBurrito Ver.2.0 – 12 Jan 2026 @MessaXS
// Inject custom items through vending machines
module EnhancedMachines.VendingMachine.RedBurrito

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
	wrappedMethod(request);
	this.GiveMeRedBurrito();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurrito() -> Void {
	let TS: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGame());
	let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;
	let items: array<TweakDBID>;
	let counts: array<Int32>;
	let msg: String = "";

	// ↓↓↓ ADD ITEMS HERE ↓↓↓
	ArrayPush(items, t"Items.MediumQualityFood4"); ArrayPush(counts, 2); // Get 2 burrito to the inventory
	ArrayPush(items, t"Items.money"); ArrayPush(counts, 777); // Add 777 eddies
	// ↑↑↑ ADD ITEMS HERE ↑↑↑

	// All item IDs can be found in: Categorized All-In-One Command List
	// https://www.nexusmods.com/cyberpunk2077/mods/521

	let i = 0;
	while i < ArraySize(items) {
		let id: ItemID = ItemID.FromTDBID(items[i]);
		if TDBID.IsValid(ItemID.GetTDBID(id)) {
			TS.GiveItem(player, id, counts[i]);

			// Get item data from inventory after adding
			let itemData: wref<gameItemData> = TS.GetItemData(player, id);
			if IsDefined(itemData) {
				let itemName: String = UIItemsHelper.GetItemName(items[i], itemData);
				if counts[i] > 1 {
					msg = msg + s"\(counts[i])x " + itemName + " Added\n";
				} else {
					msg = msg + itemName + " Added\n";
				}
			}
		};
		i += 1;
	};

	// Display message to player
	if NotEquals(msg, "") {
		player.SetWarningMessage(msg);
	}
}