// RedBurritoVehicles Ver.2.0 – 12 Jan 2026 @MessaXS
// Vehicle unlock cheats
module RedBurrito.Cheats.Vehicles

@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
		wrappedMethod(request);
		this.GiveMeRedBurritoVehicles();
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoVehicles() -> Void {
		let VS: ref<VehicleSystem> = GameInstance.GetVehicleSystem(this.GetGame());
	
		// ↓↓↓ ADD VEHICLES HERE ↓↓↓
		VS.EnablePlayerVehicle("Vehicle.v_sportbike3_brennan_apollo_nomad_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike3_brennan_apollo_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike3_brennan_apollo_player_02", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_mahir_supron_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_makigai_maimai_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_thorton_galena_gt_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_thorton_galena_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_mahir_supron_gt_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_archer_quartz_base_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike2_arch_jackie_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike2_arch_linas_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike2_arch_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike2_arch_player_02", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike2_arch_player_03", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike2_arch_tyger_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_thorton_colby_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_kusanagi_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_kusanagi_player_02", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_kusanagi_player_03", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_kusanagi_tyger_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike2_arch_jackie_tuned_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_naked", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_naked_as", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_naked_as_nr", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_naked_as_ns", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_naked_as_ns_nr", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_naked_nr", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_naked_ns", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_naked_ns_nr", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_regular", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_regular_as", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_regular_as_nr", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_regular_as_ns", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_regular_as_ns_nr", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_regular_nr", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_regular_ns", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sportbike1_yaiba_muramasa_regular_ns_nr", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_villefort_columbus_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_archer_quartz_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_archer_hella_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard3_makigai_tanishi_player_mr_hands", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_thorton_colby_pickup_02_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_thorton_colby_pickup_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_thorton_colby_gt_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_mizutani_hozuki_gt_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard3_makigai_tanishi_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_thorton_colby_pickup_kurtz_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_thorton_galena_bobas_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_porsche_911turbo_cabrio_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_porsche_911turbo_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_mizutani_shion_base_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_villefort_cortes_delamain_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_villefort_cortes_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard3_mahir_supron_kurtz_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_mizutani_hozuki_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_archer_bandit_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_thorton_galena_nomad_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_thorton_galena_nomad_player_missiles", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_thorton_colby_nomad_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_thorton_colby_nomad_player_missiles", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_chevalier_thrax_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_villefort_deleon_sport_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_villefort_alvarado_hearse_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_villefort_alvarado_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_villefort_alvarado_valentinos_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard3_thorton_mackinaw_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_villefort_deleon_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_mizutani_shion_nomad_02_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_mizutani_shion_nomad_player_missiles", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_quadra_sport_r7_netrunner", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_quadra_turbo_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_mizutani_shion_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_mizutani_shion_targa_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_archer_quartz_nomad_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard2_archer_quartz_nomad_player_02", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard3_chevalier_emperor_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_quadra_sport_r7_mrhands", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_02_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_base_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard3_thorton_mackinaw_02_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard3_thorton_mackinaw_ncu_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_mizutani_shion_nomad_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_gt_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard25_thorton_merrimac_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_nomad_ncu_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_quadra_sport_r7_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_quadra_sport_r7_player_02", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_quadra_turbo_r_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_herrera_outlaw_heist_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_herrera_outlaw_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_avenger_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_herrera_riptide_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_standard3_militech_hellhound_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_nomad_tribute", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_rayfield_aerondight_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_nomad_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport2_quadra_type66_nomad_player_03", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_utility4_chevalier_legatus_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_utility4_thorton_mackinaw_bmf_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_rayfield_caliburn_02_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_rayfield_caliburn_mordred_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_rayfield_caliburn_player", true, false);
		VS.EnablePlayerVehicle("Vehicle.v_sport1_yaiba_semimaru_player", true, false);
		// ↑↑↑ ADD VEHICLES HERE ↑↑↑
}