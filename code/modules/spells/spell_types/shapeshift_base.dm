// Witch and vampire shapeshift configuration system
// Handles witch and vampire shapeshifting using the shapeshift_holder system
// Note: Druids use wildshape system, werewolves use werewolf_transformation system

/datum/shapeshift_config
	var/name = "Base Transform"
	var/transformer_role = SHAPESHIFT_ROLE_NONE
	
	// Behavioral flags
	var/drop_clothes = TRUE
	var/has_do_after = FALSE
	var/do_after_time = 0
	var/minimum_cooldown = 0  // Enforced minimum cooldown beyond base recharge_time
	var/shout_on_transform = FALSE
	var/shout_on_revert = FALSE
	
	// Death handling
	var/knockout_on_revert = 0  // Deciseconds to knock out when reverting
	
	// Visual/sound effects
	var/show_real_name = FALSE
	var/do_gibs = TRUE

/datum/shapeshift_config/witch
	name = "Witch Transform"
	transformer_role = SHAPESHIFT_ROLE_WITCH
	drop_clothes = FALSE  // Witches keep their clothes
	has_do_after = TRUE
	do_after_time = 5 SECONDS  // Both transform and revert
	minimum_cooldown = 1 MINUTES  // 1 minute cooldown
	shout_on_transform = FALSE
	knockout_on_revert = 15 SECONDS  // Knocked out when forced out of form
	show_real_name = FALSE
	do_gibs = FALSE

/datum/shapeshift_config/vampire
	name = "Vampire Transform"
	transformer_role = SHAPESHIFT_ROLE_VAMPIRE
	drop_clothes = TRUE  // Vampires spawn gibs
	has_do_after = TRUE  // Vampires have generation-based do_after
	do_after_time = 0  // Calculated per vampire generation
	minimum_cooldown = 30 SECONDS  // 30 second minimum cooldown
	shout_on_transform = TRUE
	knockout_on_revert = 0
	show_real_name = TRUE  // Shows (Real Name)
	do_gibs = TRUE

// Note: The actual transformation spell implementations are in:
// - code/modules/spells/spell_types/shapeshift.dm (witch/vampire transformations)
// - code/modules/spells/spell_types/wildshape.dm (druid wildshape)
// - code/modules/mob/living/carbon/human/species_types/wildshape/wildshape_transformation.dm (druid procs)
// - code/modules/antagonists/roguetown/villain/werewolf/werewolf_transformation.dm (werewolf)
