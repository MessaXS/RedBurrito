// RedBurrito Cheats Ver.1.5 – 29 Dec 2025 @MessaXS

module EnhancedMachines.VendingMachine.RedBurrito

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
		wrappedMethod(request);
		this.GiveMeRedBurritoMoney();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoMoney() -> Void {
		let TS: ref<TransactionSystem> = GameInstance.GetTransactionSystem(this.GetGame());
		let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject();

		let items: array<TweakDBID>;
		let counts: array<Int32>;

		// ↓↓↓ ADD ITEMS HERE ↓↓↓
		//	ArrayPush(items, t"Items.MoneyShardLegendary"); ArrayPush(counts, 1); // Money Shard Legendary
		//	ArrayPush(items, t"Items.MoneyShardUncommon"); ArrayPush(counts, 1); // Money Shard Uncommon
		ArrayPush(items, t"Items.money"); ArrayPush(counts, 999999); // Add 999 999 eddies
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
