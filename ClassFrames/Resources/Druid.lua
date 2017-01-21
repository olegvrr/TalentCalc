--Tab 0
--Tier 0

TCalc_druidImprovedWrath = {}
TCalc_druidImprovedWrath.maxPoints = 5;
TCalc_druidImprovedWrath.talentName = "Improved Wrath";
TCalc_druidImprovedWrath.resourceCost = nil;
TCalc_druidImprovedWrath.castCooldown = nil;
TCalc_druidImprovedWrath.requirements = nil;
TCalc_druidImprovedWrath.talentDescriptions = {};
TCalc_druidImprovedWrath.talentDescriptions[0] = "Reduces the cast time of your Wrath spell by 0.1 sec.";
TCalc_druidImprovedWrath.talentDescriptions[1] = "Reduces the cast time of your Wrath spell by 0.2 sec.";
TCalc_druidImprovedWrath.talentDescriptions[2] = "Reduces the cast time of your Wrath spell by 0.3 sec.";
TCalc_druidImprovedWrath.talentDescriptions[3] = "Reduces the cast time of your Wrath spell by 0.4 sec.";
TCalc_druidImprovedWrath.talentDescriptions[4] = "Reduces the cast time of your Wrath spell by 0.5 sec.";
TCalc_druidImprovedWrath.parentTalent = nil;
TCalc_druidImprovedWrath.childTalent = nil;
TCalc_druidImprovedWrath.iconPath = "Interface\\Icons\\Spell_nature_abolishmagic";

TCalc_druidNaturesGrasp = {}
TCalc_druidNaturesGrasp.maxPoints = 1;
TCalc_druidNaturesGrasp.talentName = "Nature's Grasp";
TCalc_druidNaturesGrasp.resourceCost = "50 mana";
TCalc_druidNaturesGrasp.castCooldown = "Instant\t1 min cooldown";
TCalc_druidNaturesGrasp.requirements = nil;
TCalc_druidNaturesGrasp.talentDescriptions = {};
TCalc_druidNaturesGrasp.talentDescriptions[0] = "While active, any time an enemy strikes the caster they have a 35% chance to become afflicted by Entangling Roots (Rank 1). Only useable outdoors. 1 charge. Lasts 45 sec.";
TCalc_druidNaturesGrasp.parentTalent = nil;
TCalc_druidNaturesGrasp.childTalent = TCalc_druidImprovedNaturesGrasp;
TCalc_druidNaturesGrasp.iconPath = "Interface\\Icons\\Spell_nature_natureswrath";

TCalc_druidImprovedNaturesGrasp = {}
TCalc_druidImprovedNaturesGrasp.maxPoints = 4;
TCalc_druidImprovedNaturesGrasp.talentName = "Improved Nature's Grasp";
TCalc_druidImprovedNaturesGrasp.resourceCost = nil;
TCalc_druidImprovedNaturesGrasp.castCooldown = nil;
TCalc_druidImprovedNaturesGrasp.requirements = nil;
TCalc_druidImprovedNaturesGrasp.talentDescriptions = {};
TCalc_druidImprovedNaturesGrasp.talentDescriptions[0] = "Increases the chance for your Nature's Grasp to entangle an enemy by 15%.";
TCalc_druidImprovedNaturesGrasp.talentDescriptions[1] = "Increases the chance for your Nature's Grasp to entangle an enemy by 30%.";
TCalc_druidImprovedNaturesGrasp.talentDescriptions[2] = "Increases the chance for your Nature's Grasp to entangle an enemy by 45%.";
TCalc_druidImprovedNaturesGrasp.talentDescriptions[3] = "Increases the chance for your Nature's Grasp to entangle an enemy by 65%.";
TCalc_druidImprovedNaturesGrasp.parentTalent = TCalc_druidNaturesGrasp;
TCalc_druidImprovedNaturesGrasp.childTalent = nil;
TCalc_druidImprovedNaturesGrasp.iconPath = "Interface\\Icons\\Spell_nature_natureswrath";

--Tier 1

TCalc_druidImprovedEntanglingRoots = {}
TCalc_druidImprovedEntanglingRoots.maxPoints = 3;
TCalc_druidImprovedEntanglingRoots.talentName = "Improved Entangling Roots";
TCalc_druidImprovedEntanglingRoots.resourceCost = nil;
TCalc_druidImprovedEntanglingRoots.castCooldown = nil;
TCalc_druidImprovedEntanglingRoots.requirements = nil;
TCalc_druidImprovedEntanglingRoots.talentDescriptions = {};
TCalc_druidImprovedEntanglingRoots.talentDescriptions[0] = "Gives you a 40% chance to avoid interruption caused by damage while casting Entangling Roots.";
TCalc_druidImprovedEntanglingRoots.talentDescriptions[1] = "Gives you a 70% chance to avoid interruption caused by damage while casting Entangling Roots.";
TCalc_druidImprovedEntanglingRoots.talentDescriptions[2] = "Gives you a 100% chance to avoid interruption caused by damage while casting Entangling Roots.";
TCalc_druidImprovedEntanglingRoots.parentTalent = nil;
TCalc_druidImprovedEntanglingRoots.childTalent = nil;
TCalc_druidImprovedEntanglingRoots.iconPath = "Interface\\Icons\\Spell_nature_stranglevines";

TCalc_druidImprovedMoonfire = {}
TCalc_druidImprovedMoonfire.maxPoints = 5;
TCalc_druidImprovedMoonfire.talentName = "Improved Moonfire";
TCalc_druidImprovedMoonfire.resourceCost = nil;
TCalc_druidImprovedMoonfire.castCooldown = nil;
TCalc_druidImprovedMoonfire.requirements = nil;
TCalc_druidImprovedMoonfire.talentDescriptions = {};
TCalc_druidImprovedMoonfire.talentDescriptions[0] = "Increases the damage and critical strike chance of your Moonfire spell by 2%.";
TCalc_druidImprovedMoonfire.talentDescriptions[1] = "Increases the damage and critical strike chance of your Moonfire spell by 4%.";
TCalc_druidImprovedMoonfire.talentDescriptions[2] = "Increases the damage and critical strike chance of your Moonfire spell by 6%.";
TCalc_druidImprovedMoonfire.talentDescriptions[3] = "Increases the damage and critical strike chance of your Moonfire spell by 8%.";
TCalc_druidImprovedMoonfire.talentDescriptions[4] = "Increases the damage and critical strike chance of your Moonfire spell by 10%.";
TCalc_druidImprovedMoonfire.parentTalent = nil;
TCalc_druidImprovedMoonfire.childTalent = TCalc_druidVengeance;
TCalc_druidImprovedMoonfire.iconPath = "Interface\\Icons\\Spell_nature_starfall";

TCalc_druidNaturalWeapons = {}
TCalc_druidNaturalWeapons.maxPoints = 5;
TCalc_druidNaturalWeapons.talentName = "Natural Weapons";
TCalc_druidNaturalWeapons.resourceCost = nil;
TCalc_druidNaturalWeapons.castCooldown = nil;
TCalc_druidNaturalWeapons.requirements = nil;
TCalc_druidNaturalWeapons.talentDescriptions = {};
TCalc_druidNaturalWeapons.talentDescriptions[0] = "Increases the damage you deal with physical attacks in all forms by 2%.";
TCalc_druidNaturalWeapons.talentDescriptions[1] = "Increases the damage you deal with physical attacks in all forms by 4%.";
TCalc_druidNaturalWeapons.talentDescriptions[2] = "Increases the damage you deal with physical attacks in all forms by 6%.";
TCalc_druidNaturalWeapons.talentDescriptions[3] = "Increases the damage you deal with physical attacks in all forms by 8%.";
TCalc_druidNaturalWeapons.talentDescriptions[4] = "Increases the damage you deal with physical attacks in all forms by 10%.";
TCalc_druidNaturalWeapons.parentTalent = nil;
TCalc_druidNaturalWeapons.childTalent = TCalc_druidOmenOfClarity;
TCalc_druidNaturalWeapons.iconPath = "Interface\\Icons\\Inv_staff_01";

TCalc_druidNaturalShapeshifter = {}
TCalc_druidNaturalShapeshifter.maxPoints = 3;
TCalc_druidNaturalShapeshifter.talentName = "Natural Shapeshifter";
TCalc_druidNaturalShapeshifter.resourceCost = nil;
TCalc_druidNaturalShapeshifter.castCooldown = nil;
TCalc_druidNaturalShapeshifter.requirements = nil;
TCalc_druidNaturalShapeshifter.talentDescriptions = {};
TCalc_druidNaturalShapeshifter.talentDescriptions[0] = "Reduces the mana cost of all shapeshifting by 10%.";
TCalc_druidNaturalShapeshifter.talentDescriptions[1] = "Reduces the mana cost of all shapeshifting by 20%.";
TCalc_druidNaturalShapeshifter.talentDescriptions[2] = "Reduces the mana cost of all shapeshifting by 30%.";
TCalc_druidNaturalShapeshifter.parentTalent = nil;
TCalc_druidNaturalShapeshifter.childTalent = nil;
TCalc_druidNaturalShapeshifter.iconPath = "Interface\\Icons\\Spell_nature_wispsplode";

--Tier 2

TCalc_druidImprovedThorns = {}
TCalc_druidImprovedThorns.maxPoints = 3;
TCalc_druidImprovedThorns.talentName = "Improved Thorns";
TCalc_druidImprovedThorns.resourceCost = nil;
TCalc_druidImprovedThorns.castCooldown = nil;
TCalc_druidImprovedThorns.requirements = nil;
TCalc_druidImprovedThorns.talentDescriptions = {};
TCalc_druidImprovedThorns.talentDescriptions[0] = "Increases damage caused by your Thorns spell by 25%.";
TCalc_druidImprovedThorns.talentDescriptions[1] = "Increases damage caused by your Thorns spell by 50%.";
TCalc_druidImprovedThorns.talentDescriptions[2] = "Increases damage caused by your Thorns spell by 75%.";
TCalc_druidImprovedThorns.parentTalent = nil;
TCalc_druidImprovedThorns.childTalent = nil;
TCalc_druidImprovedThorns.iconPath = "Interface\\Icons\\Spell_nature_thorns";

TCalc_druidOmenOfClarity = {}
TCalc_druidOmenOfClarity.maxPoints = 1;
TCalc_druidOmenOfClarity.talentName = "Omen of Clarity";
TCalc_druidOmenOfClarity.resourceCost = "120 mana";
TCalc_druidOmenOfClarity.castCooldown = "Instant cast";
TCalc_druidOmenOfClarity.requirements = nil;
TCalc_druidOmenOfClarity.talentDescriptions = {};
TCalc_druidOmenOfClarity.talentDescriptions[0] = "Imbues the Druid with natural energy. Each of the Druid's melee attacks has a chance of causing the caster to enter a Clearcasting state. The Clearcasting state reduces the Mana, Rage or Energy cost of your next damage or healing spell or offensive ability by 100%. Lasts 10 min.";
TCalc_druidOmenOfClarity.parentTalent = TCalc_druidNaturalWeapons;
TCalc_druidOmenOfClarity.childTalent = nil;
TCalc_druidOmenOfClarity.iconPath = "Interface\\Icons\\Spell_nature_crystalball";

TCalc_druidNaturesReach = {}
TCalc_druidNaturesReach.maxPoints = 2;
TCalc_druidNaturesReach.talentName = "Nature's Reach";
TCalc_druidNaturesReach.resourceCost = nil;
TCalc_druidNaturesReach.castCooldown = nil;
TCalc_druidNaturesReach.requirements = nil;
TCalc_druidNaturesReach.talentDescriptions = {};
TCalc_druidNaturesReach.talentDescriptions[0] = "Increases the range of your Wrath, Entangling Roots, Faerie Fire, Moonfire, Starfire, and Hurricane spells by 10%.";
TCalc_druidNaturesReach.talentDescriptions[1] = "Increases the range of your Wrath, Entangling Roots, Faerie Fire, Moonfire, Starfire, and Hurricane spells by 20%.";
TCalc_druidNaturesReach.parentTalent = nil;
TCalc_druidNaturesReach.childTalent = nil;
TCalc_druidNaturesReach.iconPath = "Interface\\Icons\\Spell_nature_naturetouchgrow";

--Tier 3

TCalc_druidVengeance = {}
TCalc_druidVengeance.maxPoints = 5;
TCalc_druidVengeance.talentName = "Vengeance";
TCalc_druidVengeance.resourceCost = nil;
TCalc_druidVengeance.castCooldown = nil;
TCalc_druidVengeance.requirements = nil;
TCalc_druidVengeance.talentDescriptions = {};
TCalc_druidVengeance.talentDescriptions[0] = "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 20%.";
TCalc_druidVengeance.talentDescriptions[1] = "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 40%.";
TCalc_druidVengeance.talentDescriptions[2] = "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 60%.";
TCalc_druidVengeance.talentDescriptions[3] = "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 80%.";
TCalc_druidVengeance.talentDescriptions[4] = "Increases the critical strike damage bonus of your Starfire, Moonfire, and Wrath spells by 100%.";
TCalc_druidVengeance.parentTalent = TCalc_druidImprovedMoonfire;
TCalc_druidVengeance.childTalent = nil;
TCalc_druidVengeance.iconPath = "Interface\\Icons\\Spell_nature_purge";

TCalc_druidImprovedStarfire = {}
TCalc_druidImprovedStarfire.maxPoints = 5;
TCalc_druidImprovedStarfire.talentName = "Improved Starfire";
TCalc_druidImprovedStarfire.resourceCost = nil;
TCalc_druidImprovedStarfire.castCooldown = nil;
TCalc_druidImprovedStarfire.requirements = nil;
TCalc_druidImprovedStarfire.talentDescriptions = {};
TCalc_druidImprovedStarfire.talentDescriptions[0] = "Reduces the cast time of Starfire by 0.1 sec and has a 3% chance to stun the target for 3 sec.";
TCalc_druidImprovedStarfire.talentDescriptions[1] = "Reduces the cast time of Starfire by 0.2 sec and has a 6% chance to stun the target for 3 sec.";
TCalc_druidImprovedStarfire.talentDescriptions[2] = "Reduces the cast time of Starfire by 0.3 sec and has a 9% chance to stun the target for 3 sec.";
TCalc_druidImprovedStarfire.talentDescriptions[3] = "Reduces the cast time of Starfire by 0.4 sec and has a 12% chance to stun the target for 3 sec.";
TCalc_druidImprovedStarfire.talentDescriptions[4] = "Reduces the cast time of Starfire by 0.5 sec and has a 15% chance to stun the target for 3 sec.";
TCalc_druidImprovedStarfire.parentTalent = nil;
TCalc_druidImprovedStarfire.childTalent = nil;
TCalc_druidImprovedStarfire.iconPath = "Interface\\Icons\\Spell_arcane_starfire";

--Tier 4

TCalc_druidNaturesGrace = {}
TCalc_druidNaturesGrace.maxPoints = 1;
TCalc_druidNaturesGrace.talentName = "Nature's Grace";
TCalc_druidNaturesGrace.resourceCost = nil;
TCalc_druidNaturesGrace.castCooldown = nil;
TCalc_druidNaturesGrace.requirements = nil;
TCalc_druidNaturesGrace.talentDescriptions = {};
TCalc_druidNaturesGrace.talentDescriptions[0] = "All spell criticals grace you with a blessing of nature, reducing the casting time of your next spell by 0.5 sec.";
TCalc_druidNaturesGrace.parentTalent = nil;
TCalc_druidNaturesGrace.childTalent = TCalc_druidMoonfury;
TCalc_druidNaturesGrace.iconPath = "Interface\\Icons\\Spell_nature_naturesblessing";

TCalc_druidMoonglow = {}
TCalc_druidMoonglow.maxPoints = 3;
TCalc_druidMoonglow.talentName = "Moonglow";
TCalc_druidMoonglow.resourceCost = nil;
TCalc_druidMoonglow.castCooldown = nil;
TCalc_druidMoonglow.requirements = nil;
TCalc_druidMoonglow.talentDescriptions = {};
TCalc_druidMoonglow.talentDescriptions[0] = "Reduces the Mana cost of your Moonfire, Starfire, Wrath, Healing Touch, Regrowth and Rejuvenation spells by 3%.";
TCalc_druidMoonglow.talentDescriptions[1] = "Reduces the Mana cost of your Moonfire, Starfire, Wrath, Healing Touch, Regrowth and Rejuvenation spells by 6%.";
TCalc_druidMoonglow.talentDescriptions[2] = "Reduces the Mana cost of your Moonfire, Starfire, Wrath, Healing Touch, Regrowth and Rejuvenation spells by 9%.";
TCalc_druidMoonglow.parentTalent = nil;
TCalc_druidMoonglow.childTalent = nil;
TCalc_druidMoonglow.iconPath = "Interface\\Icons\\Spell_nature_sentinal";

--Tier 5

TCalc_druidMoonfury = {}
TCalc_druidMoonfury.maxPoints = 5;
TCalc_druidMoonfury.talentName = "Moonfury";
TCalc_druidMoonfury.resourceCost = nil;
TCalc_druidMoonfury.castCooldown = nil;
TCalc_druidMoonfury.requirements = nil;
TCalc_druidMoonfury.talentDescriptions = {};
TCalc_druidMoonfury.talentDescriptions[0] = "Increases the damage done by your Starfire, Moonfire and Wrath spells by 2%.";
TCalc_druidMoonfury.talentDescriptions[1] = "Increases the damage done by your Starfire, Moonfire and Wrath spells by 4%.";
TCalc_druidMoonfury.talentDescriptions[2] = "Increases the damage done by your Starfire, Moonfire and Wrath spells by 6%.";
TCalc_druidMoonfury.talentDescriptions[3] = "Increases the damage done by your Starfire, Moonfire and Wrath spells by 8%.";
TCalc_druidMoonfury.talentDescriptions[4] = "Increases the damage done by your Starfire, Moonfire and Wrath spells by 10%.";
TCalc_druidMoonfury.parentTalent = TCalc_druidNaturesGrace;
TCalc_druidMoonfury.childTalent = nil;
TCalc_druidMoonfury.iconPath = "Interface\\Icons\\Spell_nature_moonglow";

--Tier 6

TCalc_druidMoonkinForm = {}
TCalc_druidMoonkinForm.maxPoints = 1;
TCalc_druidMoonkinForm.talentName = "Moonkin Form";
TCalc_druidMoonkinForm.resourceCost = "35% of base mana";
TCalc_druidMoonkinForm.castCooldown = "Instant cast";
TCalc_druidMoonkinForm.requirements = nil;
TCalc_druidMoonkinForm.talentDescriptions = {};
TCalc_druidMoonkinForm.talentDescriptions[0] = "Transforms the Druid into Moonkin Form. While in this form the armor contribution from items is increased by 360% and all party members within 30 yards have their spell critical chance increased by 3%. The Moonkin can only cast Balance spells while shapeshifted. The act of shapeshifting frees the caster of Polymorph and Movement Impairing effects.";
TCalc_druidMoonkinForm.parentTalent = nil;
TCalc_druidMoonkinForm.childTalent = nil;
TCalc_druidMoonkinForm.iconPath = "Interface\\Icons\\Spell_nature_forceofnature";

--Tab 1
--Tier 0

TCalc_druidFerocity = {}
TCalc_druidFerocity.maxPoints = 5;
TCalc_druidFerocity.talentName = "Ferocity";
TCalc_druidFerocity.resourceCost = nil;
TCalc_druidFerocity.castCooldown = nil;
TCalc_druidFerocity.requirements = nil;
TCalc_druidFerocity.talentDescriptions = {};
TCalc_druidFerocity.talentDescriptions[0] = "Reduces the cost of your Maul, Swipe, Claw, and Rake abilities by 1 Rage or Energy.";
TCalc_druidFerocity.talentDescriptions[1] = "Reduces the cost of your Maul, Swipe, Claw, and Rake abilities by 2 Rage or Energy.";
TCalc_druidFerocity.talentDescriptions[2] = "Reduces the cost of your Maul, Swipe, Claw, and Rake abilities by 3 Rage or Energy.";
TCalc_druidFerocity.talentDescriptions[3] = "Reduces the cost of your Maul, Swipe, Claw, and Rake abilities by 4 Rage or Energy.";
TCalc_druidFerocity.talentDescriptions[4] = "Reduces the cost of your Maul, Swipe, Claw, and Rake abilities by 5 Rage or Energy.";
TCalc_druidFerocity.parentTalent = nil;
TCalc_druidFerocity.childTalent = nil;
TCalc_druidFerocity.iconPath = "Interface\\Icons\\Ability_hunter_pet_hyena";

TCalc_druidFeralAggression = {}
TCalc_druidFeralAggression.maxPoints = 5;
TCalc_druidFeralAggression.talentName = "Feral Aggression";
TCalc_druidFeralAggression.resourceCost = nil;
TCalc_druidFeralAggression.castCooldown = nil;
TCalc_druidFeralAggression.requirements = nil;
TCalc_druidFeralAggression.talentDescriptions = {};
TCalc_druidFeralAggression.talentDescriptions[0] = "Increases the Attack Power reduction of your Demoralizing Roar by 8% and the damage caused by your Ferocious Bite by 3%.";
TCalc_druidFeralAggression.talentDescriptions[1] = "Increases the Attack Power reduction of your Demoralizing Roar by 16% and the damage caused by your Ferocious Bite by 6%.";
TCalc_druidFeralAggression.talentDescriptions[2] = "Increases the Attack Power reduction of your Demoralizing Roar by 24% and the damage caused by your Ferocious Bite by 9%.";
TCalc_druidFeralAggression.talentDescriptions[3] = "Increases the Attack Power reduction of your Demoralizing Roar by 32% and the damage caused by your Ferocious Bite by 12%.";
TCalc_druidFeralAggression.talentDescriptions[4] = "Increases the Attack Power reduction of your Demoralizing Roar by 40% and the damage caused by your Ferocious Bite by 15%.";
TCalc_druidFeralAggression.parentTalent = nil;
TCalc_druidFeralAggression.childTalent = nil;
TCalc_druidFeralAggression.iconPath = "Interface\\Icons\\Ability_druid_demoralizingroar";

--Tier 1

TCalc_druidFeralInstinct = {}
TCalc_druidFeralInstinct.maxPoints = 5;
TCalc_druidFeralInstinct.talentName = "Feral Instinct";
TCalc_druidFeralInstinct.resourceCost = nil;
TCalc_druidFeralInstinct.castCooldown = nil;
TCalc_druidFeralInstinct.requirements = nil;
TCalc_druidFeralInstinct.talentDescriptions = {};
TCalc_druidFeralInstinct.talentDescriptions[0] = "Increases threat caused in Bear and Dire Bear Form by 3% and reduces the chance enemies have to detect you while Prowling.";
TCalc_druidFeralInstinct.talentDescriptions[1] = "Increases threat caused in Bear and Dire Bear Form by 6% and reduces the chance enemies have to detect you while Prowling.";
TCalc_druidFeralInstinct.talentDescriptions[2] = "Increases threat caused in Bear and Dire Bear Form by 9% and reduces the chance enemies have to detect you while Prowling.";
TCalc_druidFeralInstinct.talentDescriptions[3] = "Increases threat caused in Bear and Dire Bear Form by 12% and reduces the chance enemies have to detect you while Prowling.";
TCalc_druidFeralInstinct.talentDescriptions[4] = "Increases threat caused in Bear and Dire Bear Form by 15% and reduces the chance enemies have to detect you while Prowling.";
TCalc_druidFeralInstinct.parentTalent = nil;
TCalc_druidFeralInstinct.childTalent = nil;
TCalc_druidFeralInstinct.iconPath = "Interface\\Icons\\Ability_ambush";

TCalc_druidBrutalImpact = {}
TCalc_druidBrutalImpact.maxPoints = 2;
TCalc_druidBrutalImpact.talentName = "Brutal Impact";
TCalc_druidBrutalImpact.resourceCost = nil;
TCalc_druidBrutalImpact.castCooldown = nil;
TCalc_druidBrutalImpact.requirements = nil;
TCalc_druidBrutalImpact.talentDescriptions = {};
TCalc_druidBrutalImpact.talentDescriptions[0] = "Increases the stun duration of your Bash and Pounce abilities by 0.5 sec.";
TCalc_druidBrutalImpact.talentDescriptions[1] = "Increases the stun duration of your Bash and Pounce abilities by 1 sec.";
TCalc_druidBrutalImpact.parentTalent = nil;
TCalc_druidBrutalImpact.childTalent = nil;
TCalc_druidBrutalImpact.iconPath = "Interface\\Icons\\Ability_druid_bash";

TCalc_druidThickHide = {}
TCalc_druidThickHide.maxPoints = 5;
TCalc_druidThickHide.talentName = "Thick Hide";
TCalc_druidThickHide.resourceCost = nil;
TCalc_druidThickHide.castCooldown = nil;
TCalc_druidThickHide.requirements = nil;
TCalc_druidThickHide.talentDescriptions = {};
TCalc_druidThickHide.talentDescriptions[0] = "Increases your Armor contribution from items by 2%.";
TCalc_druidThickHide.talentDescriptions[1] = "Increases your Armor contribution from items by 4%.";
TCalc_druidThickHide.talentDescriptions[2] = "Increases your Armor contribution from items by 6%.";
TCalc_druidThickHide.talentDescriptions[3] = "Increases your Armor contribution from items by 8%.";
TCalc_druidThickHide.talentDescriptions[4] = "Increases your Armor contribution from items by 10%.";
TCalc_druidThickHide.parentTalent = nil;
TCalc_druidThickHide.childTalent = nil;
TCalc_druidThickHide.iconPath = "Interface\\Icons\\Inv_misc_pelt_bear_03";

--Tier 2

TCalc_druidFelineSwiftness = {}
TCalc_druidFelineSwiftness.maxPoints = 2;
TCalc_druidFelineSwiftness.talentName = "Feline Swiftness";
TCalc_druidFelineSwiftness.resourceCost = nil;
TCalc_druidFelineSwiftness.castCooldown = nil;
TCalc_druidFelineSwiftness.requirements = nil;
TCalc_druidFelineSwiftness.talentDescriptions = {};
TCalc_druidFelineSwiftness.talentDescriptions[0] = "Increases your movement speed by 15% while outdoors in Cat Form and increases your chance to dodge while in Cat Form by 2%.";
TCalc_druidFelineSwiftness.talentDescriptions[1] = "Increases your movement speed by 30% while outdoors in Cat Form and increases your chance to dodge while in Cat Form by 4%.";
TCalc_druidFelineSwiftness.parentTalent = nil;
TCalc_druidFelineSwiftness.childTalent = nil;
TCalc_druidFelineSwiftness.iconPath = "Interface\\Icons\\Spell_nature_spiritwolf";

TCalc_druidFeralCharge = {}
TCalc_druidFeralCharge.maxPoints = 1;
TCalc_druidFeralCharge.talentName = "Feral Charge";
TCalc_druidFeralCharge.resourceCost = "5 rage\t8-25 Yd range";
TCalc_druidFeralCharge.castCooldown = "Instant\t15 sec cooldown";
TCalc_druidFeralCharge.requirements = nil;
TCalc_druidFeralCharge.talentDescriptions = {};
TCalc_druidFeralCharge.talentDescriptions[0] = "Causes you to charge an enemy, immobilizing and interrupting any spell being cast for 4 sec.";
TCalc_druidFeralCharge.parentTalent = nil;
TCalc_druidFeralCharge.childTalent = nil;
TCalc_druidFeralCharge.iconPath = "Interface\\Icons\\Ability_hunter_pet_bear";

TCalc_druidSharpenedClaws = {}
TCalc_druidSharpenedClaws.maxPoints = 3;
TCalc_druidSharpenedClaws.talentName = "Sharpened Claws";
TCalc_druidSharpenedClaws.resourceCost = nil;
TCalc_druidSharpenedClaws.castCooldown = nil;
TCalc_druidSharpenedClaws.requirements = nil;
TCalc_druidSharpenedClaws.talentDescriptions = {};
TCalc_druidSharpenedClaws.talentDescriptions[0] = "Increases your critical strike chance while in Bear, Dire Bear or Cat Form by 2%.";
TCalc_druidSharpenedClaws.talentDescriptions[1] = "Increases your critical strike chance while in Bear, Dire Bear or Cat Form by 4%.";
TCalc_druidSharpenedClaws.talentDescriptions[2] = "Increases your critical strike chance while in Bear, Dire Bear or Cat Form by 6%.";
TCalc_druidSharpenedClaws.parentTalent = nil;
TCalc_druidSharpenedClaws.childTalent = TCalc_druidBloodFrenzy;
TCalc_druidSharpenedClaws.childTalent2 = TCalc_druidPrimalFury;
TCalc_druidSharpenedClaws.iconPath = "Interface\\Icons\\Ability_druid_maul";

--Tier 3

TCalc_druidImprovedShred = {}
TCalc_druidImprovedShred.maxPoints = 2;
TCalc_druidImprovedShred.talentName = "Improved Shred";
TCalc_druidImprovedShred.resourceCost = nil;
TCalc_druidImprovedShred.castCooldown = nil;
TCalc_druidImprovedShred.requirements = nil;
TCalc_druidImprovedShred.talentDescriptions = {};
TCalc_druidImprovedShred.talentDescriptions[0] = "Reduces the Energy cost of your Shred ability by 6.";
TCalc_druidImprovedShred.talentDescriptions[1] = "Reduces the Energy cost of your Shred ability by 12.";
TCalc_druidImprovedShred.parentTalent = nil;
TCalc_druidImprovedShred.childTalent = nil;
TCalc_druidImprovedShred.iconPath = "Interface\\Icons\\Inv_misc_monsterfang_01";

TCalc_druidPredatoryStrikes = {}
TCalc_druidPredatoryStrikes.maxPoints = 3;
TCalc_druidPredatoryStrikes.talentName = "Predatory Strikes";
TCalc_druidPredatoryStrikes.resourceCost = nil;
TCalc_druidPredatoryStrikes.castCooldown = nil;
TCalc_druidPredatoryStrikes.requirements = nil;
TCalc_druidPredatoryStrikes.talentDescriptions = {};
TCalc_druidPredatoryStrikes.talentDescriptions[0] = "Increases your melee attack power in Cat, Bear and Dire Bear Forms by 50% of your level.";
TCalc_druidPredatoryStrikes.talentDescriptions[1] = "Increases your melee attack power in Cat, Bear and Dire Bear Forms by 100% of your level.";
TCalc_druidPredatoryStrikes.talentDescriptions[2] = "Increases your melee attack power in Cat, Bear and Dire Bear Forms by 150% of your level.";
TCalc_druidPredatoryStrikes.parentTalent = nil;
TCalc_druidPredatoryStrikes.childTalent = TCalc_druidHeartOfTheWild;
TCalc_druidPredatoryStrikes.iconPath = "Interface\\Icons\\Ability_hunter_pet_cat";

TCalc_druidBloodFrenzy = {}
TCalc_druidBloodFrenzy.maxPoints = 2;
TCalc_druidBloodFrenzy.talentName = "Blood Frenzy";
TCalc_druidBloodFrenzy.resourceCost = nil;
TCalc_druidBloodFrenzy.castCooldown = nil;
TCalc_druidBloodFrenzy.requirements = nil;
TCalc_druidBloodFrenzy.talentDescriptions = {};
TCalc_druidBloodFrenzy.talentDescriptions[0] = "Your critical strikes from Cat Form abilities that add combo points have a 50% chance to add an additional combo point.";
TCalc_druidBloodFrenzy.talentDescriptions[1] = "Your critical strikes from Cat Form abilities that add combo points have a 100% chance to add an additional combo point.";
TCalc_druidBloodFrenzy.parentTalent = TCalc_druidSharpenedClaws;
TCalc_druidBloodFrenzy.childTalent = nil;
TCalc_druidBloodFrenzy.iconPath = "Interface\\Icons\\Ability_ghoulfrenzy";

TCalc_druidPrimalFury = {}
TCalc_druidPrimalFury.maxPoints = 2;
TCalc_druidPrimalFury.talentName = "Primal Fury";
TCalc_druidPrimalFury.resourceCost = nil;
TCalc_druidPrimalFury.castCooldown = nil;
TCalc_druidPrimalFury.requirements = nil;
TCalc_druidPrimalFury.talentDescriptions = {};
TCalc_druidPrimalFury.talentDescriptions[0] = "Gives you a 50% chance to gain an additional 5 Rage anytime you get a critical strike while in Bear and Dire Bear Form.";
TCalc_druidPrimalFury.talentDescriptions[1] = "Gives you a 100% chance to gain an additional 5 Rage anytime you get a critical strike while in Bear and Dire Bear Form.";
TCalc_druidPrimalFury.parentTalent = TCalc_druidSharpenedClaws;
TCalc_druidPrimalFury.childTalent = nil;
TCalc_druidPrimalFury.iconPath = "Interface\\Icons\\Ability_racial_cannibalize";

--Tier 4

TCalc_druidSavageFury = {}
TCalc_druidSavageFury.maxPoints = 2;
TCalc_druidSavageFury.talentName = "Savage Fury";
TCalc_druidSavageFury.resourceCost = nil;
TCalc_druidSavageFury.castCooldown = nil;
TCalc_druidSavageFury.requirements = nil;
TCalc_druidSavageFury.talentDescriptions = {};
TCalc_druidSavageFury.talentDescriptions[0] = "Increases the damage caused by your Claw, Rake, Maul and Swipe abilities by 10%.";
TCalc_druidSavageFury.talentDescriptions[1] = "Increases the damage caused by your Claw, Rake, Maul and Swipe abilities by 20%.";
TCalc_druidSavageFury.parentTalent = nil;
TCalc_druidSavageFury.childTalent = nil;
TCalc_druidSavageFury.iconPath = "Interface\\Icons\\Ability_druid_ravage";

TCalc_druidFaerieFireFeral = {}
TCalc_druidFaerieFireFeral.maxPoints = 1;
TCalc_druidFaerieFireFeral.talentName = "Faerie Fire (Feral)";
TCalc_druidFaerieFireFeral.resourceCost = "30 Yd range";
TCalc_druidFaerieFireFeral.castCooldown = "Instant\t6 sec cooldown";
TCalc_druidFaerieFireFeral.requirements = nil;
TCalc_druidFaerieFireFeral.talentDescriptions = {};
TCalc_druidFaerieFireFeral.talentDescriptions[0] = "Decrease the armor of the target by 175 for 40 sec. While affected, the target cannot stealth or turn invisible.";
TCalc_druidFaerieFireFeral.parentTalent = nil;
TCalc_druidFaerieFireFeral.childTalent = nil;
TCalc_druidFaerieFireFeral.iconPath = "Interface\\Icons\\Spell_nature_faeriefire";

--Tier 5

TCalc_druidHeartOfTheWild = {}
TCalc_druidHeartOfTheWild.maxPoints = 5;
TCalc_druidHeartOfTheWild.talentName = "Heart of the Wild";
TCalc_druidHeartOfTheWild.resourceCost = nil;
TCalc_druidHeartOfTheWild.castCooldown = nil;
TCalc_druidHeartOfTheWild.requirements = nil;
TCalc_druidHeartOfTheWild.talentDescriptions = {};
TCalc_druidHeartOfTheWild.talentDescriptions[0] = "Increases your Intellect by 4%. In addition, while in Bear or Dire Bear Form your Stamina is increased by 4% and while in Cat Form your Strength is increased by 4%.";
TCalc_druidHeartOfTheWild.talentDescriptions[1] = "Increases your Intellect by 8%. In addition, while in Bear or Dire Bear Form your Stamina is increased by 8% and while in Cat Form your Strength is increased by 8%.";
TCalc_druidHeartOfTheWild.talentDescriptions[2] = "Increases your Intellect by 12%. In addition, while in Bear or Dire Bear Form your Stamina is increased by 12% and while in Cat Form your Strength is increased by 12%.";
TCalc_druidHeartOfTheWild.talentDescriptions[3] = "Increases your Intellect by 16%. In addition, while in Bear or Dire Bear Form your Stamina is increased by 16% and while in Cat Form your Strength is increased by 16%.";
TCalc_druidHeartOfTheWild.talentDescriptions[4] = "Increases your Intellect by 20%. In addition, while in Bear or Dire Bear Form your Stamina is increased by 20% and while in Cat Form your Strength is increased by 20%.";
TCalc_druidHeartOfTheWild.parentTalent = TCalc_druidPredatoryStrikes;
TCalc_druidHeartOfTheWild.childTalent = nil;
TCalc_druidHeartOfTheWild.iconPath = "Interface\\Icons\\Spell_holy_blessingofagility";

--Tier 6

TCalc_druidLeaderOfThePack = {}
TCalc_druidLeaderOfThePack.maxPoints = 1;
TCalc_druidLeaderOfThePack.talentName = "Leader of the Pack";
TCalc_druidLeaderOfThePack.resourceCost = nil;
TCalc_druidLeaderOfThePack.castCooldown = nil;
TCalc_druidLeaderOfThePack.requirements = nil;
TCalc_druidLeaderOfThePack.talentDescriptions = {};
TCalc_druidLeaderOfThePack.talentDescriptions[0] = "While in Cat, Bear or Dire Bear Form, the Leader of the Pack increases ranged and melee critical chance of all party members within 45 yards by 3%.";
TCalc_druidLeaderOfThePack.parentTalent = nil;
TCalc_druidLeaderOfThePack.childTalent = nil;
TCalc_druidLeaderOfThePack.iconPath = "Interface\\Icons\\Spell_nature_unyeildingstamina";

--Tab 2
--Tier 0

TCalc_druidImprovedMarkOfTheWild = {}
TCalc_druidImprovedMarkOfTheWild.maxPoints = 5;
TCalc_druidImprovedMarkOfTheWild.talentName = "Improved Mark of the Wild";
TCalc_druidImprovedMarkOfTheWild.resourceCost = nil;
TCalc_druidImprovedMarkOfTheWild.castCooldown = nil;
TCalc_druidImprovedMarkOfTheWild.requirements = nil;
TCalc_druidImprovedMarkOfTheWild.talentDescriptions = {};
TCalc_druidImprovedMarkOfTheWild.talentDescriptions[0] = "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 7%.";
TCalc_druidImprovedMarkOfTheWild.talentDescriptions[1] = "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 14%.";
TCalc_druidImprovedMarkOfTheWild.talentDescriptions[2] = "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 21%.";
TCalc_druidImprovedMarkOfTheWild.talentDescriptions[3] = "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 28%.";
TCalc_druidImprovedMarkOfTheWild.talentDescriptions[4] = "Increases the effects of your Mark of the Wild and Gift of the Wild spells by 35%.";
TCalc_druidImprovedMarkOfTheWild.parentTalent = nil;
TCalc_druidImprovedMarkOfTheWild.childTalent = nil;
TCalc_druidImprovedMarkOfTheWild.iconPath = "Interface\\Icons\\Spell_nature_regeneration";

TCalc_druidFuror = {}
TCalc_druidFuror.maxPoints = 5;
TCalc_druidFuror.talentName = "Furor";
TCalc_druidFuror.resourceCost = nil;
TCalc_druidFuror.castCooldown = nil;
TCalc_druidFuror.requirements = nil;
TCalc_druidFuror.talentDescriptions = {};
TCalc_druidFuror.talentDescriptions[0] = "Gives you 20% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.";
TCalc_druidFuror.talentDescriptions[1] = "Gives you 40% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.";
TCalc_druidFuror.talentDescriptions[2] = "Gives you 60% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.";
TCalc_druidFuror.talentDescriptions[3] = "Gives you 80% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.";
TCalc_druidFuror.talentDescriptions[4] = "Gives you 100% chance to gain 10 Rage when you shapeshift into Bear and Dire Bear Form or 40 Energy when you shapeshift into Cat Form.";
TCalc_druidFuror.parentTalent = nil;
TCalc_druidFuror.childTalent = nil;
TCalc_druidFuror.iconPath = "Interface\\Icons\\Spell_holy_blessingofstamina";

--Tier 1

TCalc_druidImprovedHealingTouch = {}
TCalc_druidImprovedHealingTouch.maxPoints = 5;
TCalc_druidImprovedHealingTouch.talentName = "Improved Healing Touch";
TCalc_druidImprovedHealingTouch.resourceCost = nil;
TCalc_druidImprovedHealingTouch.castCooldown = nil;
TCalc_druidImprovedHealingTouch.requirements = nil;
TCalc_druidImprovedHealingTouch.talentDescriptions = {};
TCalc_druidImprovedHealingTouch.talentDescriptions[0] = "Reduces the cast time of your Healing Touch spell by 0.1 sec.";
TCalc_druidImprovedHealingTouch.talentDescriptions[1] = "Reduces the cast time of your Healing Touch spell by 0.2 sec.";
TCalc_druidImprovedHealingTouch.talentDescriptions[2] = "Reduces the cast time of your Healing Touch spell by 0.3 sec.";
TCalc_druidImprovedHealingTouch.talentDescriptions[3] = "Reduces the cast time of your Healing Touch spell by 0.4 sec.";
TCalc_druidImprovedHealingTouch.talentDescriptions[4] = "Reduces the cast time of your Healing Touch spell by 0.5 sec.";
TCalc_druidImprovedHealingTouch.parentTalent = nil;
TCalc_druidImprovedHealingTouch.childTalent = TCalc_druidNaturesSwiftness;
TCalc_druidImprovedHealingTouch.iconPath = "Interface\\Icons\\Spell_nature_healingtouch";

TCalc_druidNaturesFocus = {}
TCalc_druidNaturesFocus.maxPoints = 5;
TCalc_druidNaturesFocus.talentName = "Nature's Focus";
TCalc_druidNaturesFocus.resourceCost = nil;
TCalc_druidNaturesFocus.castCooldown = nil;
TCalc_druidNaturesFocus.requirements = nil;
TCalc_druidNaturesFocus.talentDescriptions = {};
TCalc_druidNaturesFocus.talentDescriptions[0] = "Gives you a 14% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.";
TCalc_druidNaturesFocus.talentDescriptions[1] = "Gives you a 28% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.";
TCalc_druidNaturesFocus.talentDescriptions[2] = "Gives you a 42% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.";
TCalc_druidNaturesFocus.talentDescriptions[3] = "Gives you a 56% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.";
TCalc_druidNaturesFocus.talentDescriptions[4] = "Gives you a 70% chance to avoid interruption caused by damage while casting the Healing Touch, Regrowth and Tranquility spells.";
TCalc_druidNaturesFocus.parentTalent = nil;
TCalc_druidNaturesFocus.childTalent = nil;
TCalc_druidNaturesFocus.iconPath = "Interface\\Icons\\Spell_nature_healingwavegreater";

TCalc_druidImprovedEnrage = {}
TCalc_druidImprovedEnrage.maxPoints = 2;
TCalc_druidImprovedEnrage.talentName = "Improved Enrage";
TCalc_druidImprovedEnrage.resourceCost = nil;
TCalc_druidImprovedEnrage.castCooldown = nil;
TCalc_druidImprovedEnrage.requirements = nil;
TCalc_druidImprovedEnrage.talentDescriptions = {};
TCalc_druidImprovedEnrage.talentDescriptions[0] = "The Enrage ability now instantly generates 5 Rage.";
TCalc_druidImprovedEnrage.talentDescriptions[1] = "The Enrage ability now instantly generates 10 Rage.";
TCalc_druidImprovedEnrage.parentTalent = nil;
TCalc_druidImprovedEnrage.childTalent = nil;
TCalc_druidImprovedEnrage.iconPath = "Interface\\Icons\\Ability_druid_enrage";

--Tier 2

TCalc_druidReflection = {}
TCalc_druidReflection.maxPoints = 3;
TCalc_druidReflection.talentName = "Reflection";
TCalc_druidReflection.resourceCost = nil;
TCalc_druidReflection.castCooldown = nil;
TCalc_druidReflection.requirements = nil;
TCalc_druidReflection.talentDescriptions = {};
TCalc_druidReflection.talentDescriptions[0] = "Allows 5% of your Mana regeneration to continue while casting.";
TCalc_druidReflection.talentDescriptions[1] = "Allows 10% of your Mana regeneration to continue while casting.";
TCalc_druidReflection.talentDescriptions[2] = "Allows 15% of your Mana regeneration to continue while casting.";
TCalc_druidReflection.parentTalent = nil;
TCalc_druidReflection.childTalent = nil;
TCalc_druidReflection.iconPath = "Interface\\Icons\\Spell_frost_windwalkon";

TCalc_druidInsectSwarm = {}
TCalc_druidInsectSwarm.maxPoints = 1;
TCalc_druidInsectSwarm.talentName = "Insect Swarm";
TCalc_druidInsectSwarm.resourceCost = "45 mana\t30 Yd range";
TCalc_druidInsectSwarm.castCooldown = "Instant cast";
TCalc_druidInsectSwarm.requirements = nil;
TCalc_druidInsectSwarm.talentDescriptions = {};
TCalc_druidInsectSwarm.talentDescriptions[0] = "The enemy target is swarmed by insects, decreasing their chance to hit by 2% and causing 66 Nature damage over 12 sec.";
TCalc_druidInsectSwarm.parentTalent = nil;
TCalc_druidInsectSwarm.childTalent = TCalc_druidGiftOfNature;
TCalc_druidInsectSwarm.iconPath = "Interface\\Icons\\Spell_nature_insectswarm";

TCalc_druidSubtlety = {}
TCalc_druidSubtlety.maxPoints = 5;
TCalc_druidSubtlety.talentName = "Subtlety";
TCalc_druidSubtlety.resourceCost = nil;
TCalc_druidSubtlety.castCooldown = nil;
TCalc_druidSubtlety.requirements = nil;
TCalc_druidSubtlety.talentDescriptions = {};
TCalc_druidSubtlety.talentDescriptions[0] = "Reduces the threat generated by your Healing spells by 4%.";
TCalc_druidSubtlety.talentDescriptions[1] = "Reduces the threat generated by your Healing spells by 8%.";
TCalc_druidSubtlety.talentDescriptions[2] = "Reduces the threat generated by your Healing spells by 12%.";
TCalc_druidSubtlety.talentDescriptions[3] = "Reduces the threat generated by your Healing spells by 16%.";
TCalc_druidSubtlety.talentDescriptions[4] = "Reduces the threat generated by your Healing spells by 20%.";
TCalc_druidSubtlety.parentTalent = nil;
TCalc_druidSubtlety.childTalent = nil;
TCalc_druidSubtlety.iconPath = "Interface\\Icons\\Ability_eyeoftheowl";

--Tier 3

TCalc_druidTranquilSpirit = {}
TCalc_druidTranquilSpirit.maxPoints = 5;
TCalc_druidTranquilSpirit.talentName = "Tranquil Spirit";
TCalc_druidTranquilSpirit.resourceCost = nil;
TCalc_druidTranquilSpirit.castCooldown = nil;
TCalc_druidTranquilSpirit.requirements = nil;
TCalc_druidTranquilSpirit.talentDescriptions = {};
TCalc_druidTranquilSpirit.talentDescriptions[0] = "Reduces the mana cost of your Healing Touch and Tranquility spells by 2%.";
TCalc_druidTranquilSpirit.talentDescriptions[1] = "Reduces the mana cost of your Healing Touch and Tranquility spells by 4%.";
TCalc_druidTranquilSpirit.talentDescriptions[2] = "Reduces the mana cost of your Healing Touch and Tranquility spells by 6%.";
TCalc_druidTranquilSpirit.talentDescriptions[3] = "Reduces the mana cost of your Healing Touch and Tranquility spells by 8%.";
TCalc_druidTranquilSpirit.talentDescriptions[4] = "Reduces the mana cost of your Healing Touch and Tranquility spells by 10%.";
TCalc_druidTranquilSpirit.parentTalent = nil;
TCalc_druidTranquilSpirit.childTalent = TCalc_druidSwiftmend;
TCalc_druidTranquilSpirit.iconPath = "Interface\\Icons\\Spell_holy_elunesgrace";

TCalc_druidImprovedRejuvenation = {}
TCalc_druidImprovedRejuvenation.maxPoints = 3;
TCalc_druidImprovedRejuvenation.talentName = "Improved Rejuvenation";
TCalc_druidImprovedRejuvenation.resourceCost = nil;
TCalc_druidImprovedRejuvenation.castCooldown = nil;
TCalc_druidImprovedRejuvenation.requirements = nil;
TCalc_druidImprovedRejuvenation.talentDescriptions = {};
TCalc_druidImprovedRejuvenation.talentDescriptions[0] = "Increases the effect of your Rejuvenation spell by 5%.";
TCalc_druidImprovedRejuvenation.talentDescriptions[1] = "Increases the effect of your Rejuvenation spell by 10%.";
TCalc_druidImprovedRejuvenation.talentDescriptions[2] = "Increases the effect of your Rejuvenation spell by 15%.";
TCalc_druidImprovedRejuvenation.parentTalent = nil;
TCalc_druidImprovedRejuvenation.childTalent = nil;
TCalc_druidImprovedRejuvenation.iconPath = "Interface\\Icons\\Spell_nature_rejuvenation";

--Tier 4

TCalc_druidNaturesSwiftness = {}
TCalc_druidNaturesSwiftness.maxPoints = 1;
TCalc_druidNaturesSwiftness.talentName = "Nature's Swiftness";
TCalc_druidNaturesSwiftness.resourceCost = nil;
TCalc_druidNaturesSwiftness.castCooldown = "Instant\t3 in cooldown";
TCalc_druidNaturesSwiftness.requirements = nil;
TCalc_druidNaturesSwiftness.talentDescriptions = {};
TCalc_druidNaturesSwiftness.talentDescriptions[0] = "When activated, your next Nature spell becomes an instant cast spell.";
TCalc_druidNaturesSwiftness.parentTalent = TCalc_druidImprovedHealingTouch;
TCalc_druidNaturesSwiftness.childTalent = nil;
TCalc_druidNaturesSwiftness.iconPath = "Interface\\Icons\\Spell_nature_ravenform";

TCalc_druidGiftOfNature = {}
TCalc_druidGiftOfNature.maxPoints = 5;
TCalc_druidGiftOfNature.talentName = "Gift of Nature";
TCalc_druidGiftOfNature.resourceCost = nil;
TCalc_druidGiftOfNature.castCooldown = nil;
TCalc_druidGiftOfNature.requirements = nil;
TCalc_druidGiftOfNature.talentDescriptions = {};
TCalc_druidGiftOfNature.talentDescriptions[0] = "Increases the effect of all healing spells by 2%.";
TCalc_druidGiftOfNature.talentDescriptions[1] = "Increases the effect of all healing spells by 4%.";
TCalc_druidGiftOfNature.talentDescriptions[2] = "Increases the effect of all healing spells by 6%.";
TCalc_druidGiftOfNature.talentDescriptions[3] = "Increases the effect of all healing spells by 8%.";
TCalc_druidGiftOfNature.talentDescriptions[4] = "Increases the effect of all healing spells by 10%.";
TCalc_druidGiftOfNature.parentTalent = TCalc_druidInsectSwarm;
TCalc_druidGiftOfNature.childTalent = nil;
TCalc_druidGiftOfNature.iconPath = "Interface\\Icons\\Spell_nature_protectionformnature";

TCalc_druidImprovedTranquility = {}
TCalc_druidImprovedTranquility.maxPoints = 2;
TCalc_druidImprovedTranquility.talentName = "Improved Tranquility";
TCalc_druidImprovedTranquility.resourceCost = nil;
TCalc_druidImprovedTranquility.castCooldown = nil;
TCalc_druidImprovedTranquility.requirements = nil;
TCalc_druidImprovedTranquility.talentDescriptions = {};
TCalc_druidImprovedTranquility.talentDescriptions[0] = "Reduces threat caused by Tranquility by 50%.";
TCalc_druidImprovedTranquility.talentDescriptions[1] = "Reduces threat caused by Tranquility by 100%.";
TCalc_druidImprovedTranquility.parentTalent = nil;
TCalc_druidImprovedTranquility.childTalent = nil;
TCalc_druidImprovedTranquility.iconPath = "Interface\\Icons\\Spell_nature_tranquility";

--Tier 5

TCalc_druidImprovedRegrowth = {}
TCalc_druidImprovedRegrowth.maxPoints = 5;
TCalc_druidImprovedRegrowth.talentName = "Improved Regrowth";
TCalc_druidImprovedRegrowth.resourceCost = nil;
TCalc_druidImprovedRegrowth.castCooldown = nil;
TCalc_druidImprovedRegrowth.requirements = nil;
TCalc_druidImprovedRegrowth.talentDescriptions = {};
TCalc_druidImprovedRegrowth.talentDescriptions[0] = "Increases the critical effect chance of your Regrowth spell by 10%.";
TCalc_druidImprovedRegrowth.talentDescriptions[1] = "Increases the critical effect chance of your Regrowth spell by 20%.";
TCalc_druidImprovedRegrowth.talentDescriptions[2] = "Increases the critical effect chance of your Regrowth spell by 30%.";
TCalc_druidImprovedRegrowth.talentDescriptions[3] = "Increases the critical effect chance of your Regrowth spell by 40%.";
TCalc_druidImprovedRegrowth.talentDescriptions[4] = "Increases the critical effect chance of your Regrowth spell by 50%.";
TCalc_druidImprovedRegrowth.parentTalent = nil;
TCalc_druidImprovedRegrowth.childTalent = nil;
TCalc_druidImprovedRegrowth.iconPath = "Interface\\Icons\\Spell_nature_resistnature";

--Tier 6

TCalc_druidSwiftmend = {}
TCalc_druidSwiftmend.maxPoints = 1;
TCalc_druidSwiftmend.talentName = "Swiftmend";
TCalc_druidSwiftmend.resourceCost = "20% of base mana\t40 Yd range";
TCalc_druidSwiftmend.castCooldown = "Instant cast\t15 sec cooldown";
TCalc_druidSwiftmend.requirements = nil;
TCalc_druidSwiftmend.talentDescriptions = {};
TCalc_druidSwiftmend.talentDescriptions[0] = "Consumes a Rejuvenation or Regrowth effect on a friendly target to instantly heal them an amount equal to 12 sec. of Rejuvenation or 18 sec. of Regrowth.";
TCalc_druidSwiftmend.parentTalent = TCalc_druidTranquilSpirit;
TCalc_druidSwiftmend.childTalent = nil;
TCalc_druidSwiftmend.iconPath = "Interface\\Icons\\Inv_relics_idolofrejuvenation";
