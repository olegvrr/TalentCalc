TCalc_HunterFrame = nil;

TCalc_HunterColor = {}
TCalc_HunterColor.red=0.67
TCalc_HunterColor.green=0.83
TCalc_HunterColor.blue=0.45

function TCalc_InitHunterFrame()
    if (TCalc_HunterFrame ~= nil) then
	    return TCalc_HunterFrame;
	end
    
    --Frame itself
	TCalc_HunterFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_HunterFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_HunterFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_HunterFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_HunterFrame:SetPoint("TOPLEFT",0,0);
    TCalc_HunterFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_HunterFrame:Hide();
  
    TCalc_HunterFrame.texture = TCalc_HunterFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_HunterFrame.texture:SetTexture(TCalc_HunterColor.red,TCalc_HunterColor.green,TCalc_HunterColor.blue, 0.7);
    TCalc_HunterFrame.texture:SetAllPoints(TCalc_HunterFrame);
    
    TCalc_InitTalentTabHolders(TCalc_HunterFrame);
    TCalc_HunterFrame.treeNames = {"Beast Mastery","Marksmanship","Survival"};
    TCalc_HunterFrame.color = TCalc_HunterColor;
    
    --Selector button
    local hunterSelector = CreateFrame("Button",nil,TalentCalculator);
    hunterSelector:SetFrameStrata(TCalc_frameStrata);
    hunterSelector:SetWidth(90);
    hunterSelector:SetHeight(20);
    hunterSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),-20);
    hunterSelector:SetFrameLevel(TCalc_classFrameLevel);
    hunterSelector:SetText("Hunter");
    hunterSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    hunterSelector:SetScript("OnClick", TCalc_HunterFrameActivated);
    hunterSelector:Show();
    
    hunterSelector.texture = hunterSelector:CreateTexture(nil,TCalc_frameStrata);
    hunterSelector.texture:SetTexture(TCalc_HunterColor.red,TCalc_HunterColor.green,TCalc_HunterColor.blue, 0.7);
    hunterSelector.texture:SetAllPoints(hunterSelector);
    
    TCalc_InitHunterTalentButtons();
    
    return TCalc_HunterFrame;
end

function TCalc_HunterFrameActivated()
    TCalc_SwitchFrame(TCalc_HunterFrame);
end

function TCalc_InitHunterTalentButtons()
    --Tab 0
	--Tier 0

	local improvedAspectOfTheHawk = TCalc_CreateTalentButton(TCalc_hunterImprovedAspectOfTheHawk, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedAspectOfTheHawk, 0, 0, 1, TCalc_HunterFrame);

	local enduranceTraining= TCalc_CreateTalentButton(TCalc_hunterEnduranceTraining, TCalc_HunterFrame);
	TCalc_AddTalentButton(enduranceTraining, 0, 0, 2, TCalc_HunterFrame);

	--Tier 1

	local improvedEyesOfTheBeast = TCalc_CreateTalentButton(TCalc_hunterImprovedEyesOfTheBeast, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedEyesOfTheBeast, 0, 1, 0, TCalc_HunterFrame);

	local improvedAspectOfTheMonkey = TCalc_CreateTalentButton(TCalc_hunterImprovedAspectOfTheMonkey, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedAspectOfTheMonkey, 0, 1, 1, TCalc_HunterFrame);

	local thickHide = TCalc_CreateTalentButton(TCalc_hunterThickHide, TCalc_HunterFrame);
	TCalc_AddTalentButton(thickHide, 0, 1, 2, TCalc_HunterFrame);

	local improvedRevivePet = TCalc_CreateTalentButton(TCalc_hunterImprovedRevivePet, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedRevivePet, 0, 1, 3, TCalc_HunterFrame);

	--Tier 2

	local pathfinding = TCalc_CreateTalentButton(TCalc_hunterPathfinding, TCalc_HunterFrame);
	TCalc_AddTalentButton(pathfinding, 0, 2, 0, TCalc_HunterFrame);

	local bestialSwiftness = TCalc_CreateTalentButton(TCalc_hunterBestialSwiftness, TCalc_HunterFrame);
	TCalc_AddTalentButton(bestialSwiftness, 0, 2, 1, TCalc_HunterFrame);

	local unleashedFury = TCalc_CreateTalentButton(TCalc_hunterUnleashedFury, TCalc_HunterFrame);
	TCalc_AddTalentButton(unleashedFury, 0, 2, 2, TCalc_HunterFrame);

	--Tier 3

	local improvedMendPet = TCalc_CreateTalentButton(TCalc_hunterImprovedMendPet, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedMendPet, 0, 3, 1, TCalc_HunterFrame);

	local ferocity = TCalc_CreateTalentButton(TCalc_hunterFerocity, TCalc_HunterFrame);
	TCalc_AddTalentButton(ferocity, 0, 3, 2, TCalc_HunterFrame);

	--Tier 4

	local spiritBond = TCalc_CreateTalentButton(TCalc_hunterSpiritBond, TCalc_HunterFrame);
	TCalc_AddTalentButton(spiritBond, 0, 4, 0, TCalc_HunterFrame);

	local intimidation = TCalc_CreateTalentButton(TCalc_hunterIntimidation, TCalc_HunterFrame);
	TCalc_AddTalentButton(intimidation, 0, 4, 1, TCalc_HunterFrame);

	local bestialDiscipline = TCalc_CreateTalentButton(TCalc_hunterBestialDiscipline, TCalc_HunterFrame);
	TCalc_AddTalentButton(bestialDiscipline, 0, 4, 3, TCalc_HunterFrame);

	--Tier 5

	local frenzy = TCalc_CreateTalentButton(TCalc_hunterFrenzy, TCalc_HunterFrame);
	TCalc_AddTalentButton(frenzy, 0, 5, 2, TCalc_HunterFrame);
	
	--Tier 6

	local bestialWrath = TCalc_CreateTalentButton(TCalc_hunterBestialWrath, TCalc_HunterFrame);
	TCalc_AddTalentButton(bestialWrath, 0, 6, 1, TCalc_HunterFrame);

	--Tab 1
	--Tier 0
	
	local improvedConcussiveShot = TCalc_CreateTalentButton(TCalc_hunterImprovedConcussiveShot, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedConcussiveShot, 1, 0, 1, TCalc_HunterFrame);

	local efficiency = TCalc_CreateTalentButton(TCalc_hunterEfficiency, TCalc_HunterFrame);
	TCalc_AddTalentButton(efficiency, 1, 0, 2, TCalc_HunterFrame);

	--Tier 1

	local improvedHuntersMark = TCalc_CreateTalentButton(TCalc_hunterImprovedHuntersMark, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedHuntersMark, 1, 1, 1, TCalc_HunterFrame);

	local lethalShots = TCalc_CreateTalentButton(TCalc_hunterLethalShots, TCalc_HunterFrame);
	TCalc_AddTalentButton(lethalShots, 1, 1, 2, TCalc_HunterFrame);

	--Tier 2

	local aimedShot = TCalc_CreateTalentButton(TCalc_hunterAimedShot, TCalc_HunterFrame);
	TCalc_AddTalentButton(aimedShot, 1, 2, 0, TCalc_HunterFrame);

	local improvedArcaneShot = TCalc_CreateTalentButton(TCalc_hunterImprovedArcaneShot, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedArcaneShot, 1, 2, 1, TCalc_HunterFrame);

	local hawkEye = TCalc_CreateTalentButton(TCalc_hunterHawkEye, TCalc_HunterFrame);
	TCalc_AddTalentButton(hawkEye, 1, 2, 3, TCalc_HunterFrame);

	--Tier 3

	local improvedSerpentSting = TCalc_CreateTalentButton(TCalc_hunterImprovedSerpentSting, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedSerpentSting, 1, 3, 1, TCalc_HunterFrame);

	local mortalShots = TCalc_CreateTalentButton(TCalc_hunterMortalShots, TCalc_HunterFrame);
	TCalc_AddTalentButton(mortalShots, 1, 3, 2, TCalc_HunterFrame);

	--Tier 4

	local scatterShot = TCalc_CreateTalentButton(TCalc_hunterScatterShot, TCalc_HunterFrame);
	TCalc_AddTalentButton(scatterShot, 1, 4, 0, TCalc_HunterFrame);

	local barrage = TCalc_CreateTalentButton(TCalc_hunterBarrage, TCalc_HunterFrame);
	TCalc_AddTalentButton(barrage, 1, 4, 1, TCalc_HunterFrame);

	local improvedScorpidSting = TCalc_CreateTalentButton(TCalc_hunterImprovedScorpidSting, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedScorpidSting, 1, 4, 2, TCalc_HunterFrame);

	--Tier 5

	local rangedWeaponSpecialization = TCalc_CreateTalentButton(TCalc_hunterRangedWeaponSpecialization, TCalc_HunterFrame);
	TCalc_AddTalentButton(rangedWeaponSpecialization, 1, 5, 2, TCalc_HunterFrame);

	--Tier 6

	local trueshotAura = TCalc_CreateTalentButton(TCalc_hunterTrueshotAura, TCalc_HunterFrame);
	TCalc_AddTalentButton(trueshotAura, 1, 6, 1, TCalc_HunterFrame);

	--Tab 2
	--Tier 0

	local monsterSlaying = TCalc_CreateTalentButton(TCalc_hunterMonsterSlaying, TCalc_HunterFrame);
	TCalc_AddTalentButton(monsterSlaying, 2, 0, 0, TCalc_HunterFrame);

	local humanoidSlaying = TCalc_CreateTalentButton(TCalc_hunterHumanoidSlaying, TCalc_HunterFrame);
	TCalc_AddTalentButton(humanoidSlaying, 2, 0, 1, TCalc_HunterFrame);

	local deflection = TCalc_CreateTalentButton(TCalc_hunterDeflection, TCalc_HunterFrame);
	TCalc_AddTalentButton(deflection, 2, 0, 2, TCalc_HunterFrame);

	--Tier 1

	local entrapment = TCalc_CreateTalentButton(TCalc_hunterEntrapment, TCalc_HunterFrame);
	TCalc_AddTalentButton(entrapment, 2, 1, 0, TCalc_HunterFrame);

	local savageStrikes = TCalc_CreateTalentButton(TCalc_hunterSavageStrikes, TCalc_HunterFrame);
	TCalc_AddTalentButton(savageStrikes, 2, 1, 1, TCalc_HunterFrame);

	local improvedWingClip = TCalc_CreateTalentButton(TCalc_hunterImprovedWingClip, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedWingClip, 2, 1, 2, TCalc_HunterFrame);

	--Tier 2

	local cleverTraps = TCalc_CreateTalentButton(TCalc_hunterCleverTraps, TCalc_HunterFrame);
	TCalc_AddTalentButton(cleverTraps, 2, 2, 0, TCalc_HunterFrame);

	local survivalist = TCalc_CreateTalentButton(TCalc_hunterSurvivalist, TCalc_HunterFrame);
	TCalc_AddTalentButton(survivalist, 2, 2, 1, TCalc_HunterFrame);

	local deterrence = TCalc_CreateTalentButton(TCalc_hunterDeterrence, TCalc_HunterFrame);
	TCalc_AddTalentButton(deterrence, 2, 2, 2, TCalc_HunterFrame);

	--Tier 3

	local trapMastery = TCalc_CreateTalentButton(TCalc_hunterTrapMastery, TCalc_HunterFrame);
	TCalc_AddTalentButton(trapMastery, 2, 3, 0, TCalc_HunterFrame);

	local surefooted = TCalc_CreateTalentButton(TCalc_hunterSurefooted, TCalc_HunterFrame);
	TCalc_AddTalentButton(surefooted, 2, 3, 1, TCalc_HunterFrame);

	local improvedFeignDeath = TCalc_CreateTalentButton(TCalc_hunterImprovedFeignDeath, TCalc_HunterFrame);
	TCalc_AddTalentButton(improvedFeignDeath, 2, 3, 3, TCalc_HunterFrame);

	--Tier 4

	local killerInstinct = TCalc_CreateTalentButton(TCalc_hunterKillerInstinct, TCalc_HunterFrame);
	TCalc_AddTalentButton(killerInstinct, 2, 4, 1, TCalc_HunterFrame);

	local counterattack = TCalc_CreateTalentButton(TCalc_hunterCounterattack, TCalc_HunterFrame);
	TCalc_AddTalentButton(counterattack, 2, 4, 2, TCalc_HunterFrame);

	--Tier 5

	local lightningReflexes = TCalc_CreateTalentButton(TCalc_hunterLightningReflexes, TCalc_HunterFrame);
	TCalc_AddTalentButton(lightningReflexes, 2, 5, 2, TCalc_HunterFrame);

	--Tier 6

	local wyvernSting = TCalc_CreateTalentButton(TCalc_hunterWyvernSting, TCalc_HunterFrame);
	TCalc_AddTalentButton(wyvernSting, 2, 6, 1, TCalc_HunterFrame);
end
