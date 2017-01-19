TCalc_RogueFrame = nil;

TCalc_RogueColor = {}
TCalc_RogueColor.red=1.00
TCalc_RogueColor.green=0.96
TCalc_RogueColor.blue=0.41

function TCalc_InitRogueFrame()
    if (TCalc_RogueFrame ~= nil) then
	    return TCalc_RogueFrame;
	end
    
    --Frame itself
	TCalc_RogueFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_RogueFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_RogueFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_RogueFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_RogueFrame:SetPoint("TOPLEFT",0,0);
    TCalc_RogueFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_RogueFrame:Hide();
  
    TCalc_RogueFrame.texture = TCalc_RogueFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_RogueFrame.texture:SetTexture(TCalc_RogueColor.red,TCalc_RogueColor.green,TCalc_RogueColor.blue, 0.7);
    TCalc_RogueFrame.texture:SetAllPoints(TCalc_RogueFrame);
    
    TCalc_InitTalentTabHolders(TCalc_RogueFrame);
    TCalc_RogueFrame.treeNames = {"Assassination","Combat","Subtlety"};
    TCalc_RogueFrame.color = TCalc_RogueColor;
    
    --Selector button
    local rogueSelector = CreateFrame("Button",nil,TalentCalculator);
    rogueSelector:SetFrameStrata(TCalc_frameStrata);
    rogueSelector:SetWidth(90);
    rogueSelector:SetHeight(20);
    rogueSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),-100);
    rogueSelector:SetFrameLevel(TCalc_classFrameLevel);
    rogueSelector:SetText("Rogue");
    rogueSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    rogueSelector:SetScript("OnClick", TCalc_RogueFrameActivated);
    rogueSelector:Show();
  
    rogueSelector.texture = rogueSelector:CreateTexture(nil,TCalc_frameStrata);
    rogueSelector.texture:SetTexture(TCalc_RogueColor.red,TCalc_RogueColor.green,TCalc_RogueColor.blue, 0.7);
    rogueSelector.texture:SetAllPoints(rogueSelector);
    
    TCalc_InitRogueTalentButtons();
    
    return TCalc_RogueFrame;
end

function TCalc_RogueFrameActivated()
    TCalc_SwitchFrame(TCalc_RogueFrame);
end

function TCalc_InitRogueTalentButtons()
    
	
	--Tab 0
	--Tier 0
	
	local improvedEviscerate = TCalc_CreateTalentButton(TCalc_rogueImprovedEviscerate, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedEviscerate, 0, 0, 0, TCalc_RogueFrame);

	local remorselessAttacks = TCalc_CreateTalentButton(TCalc_rogueRemorselessAttacks, TCalc_RogueFrame);
	TCalc_AddTalentButton(remorselessAttacks, 0, 0, 1, TCalc_RogueFrame);

	local malice = TCalc_CreateTalentButton(TCalc_rogueMalice, TCalc_RogueFrame);
	TCalc_AddTalentButton(malice, 0, 0, 2, TCalc_RogueFrame);
	
	--Tier 1
	
	local ruthlessness = TCalc_CreateTalentButton(TCalc_rogueRuthlessness, TCalc_RogueFrame);
	TCalc_AddTalentButton(ruthlessness, 0, 1, 0, TCalc_RogueFrame);

	local murder = TCalc_CreateTalentButton(TCalc_rogueMurder, TCalc_RogueFrame);
	TCalc_AddTalentButton(murder, 0, 1, 1, TCalc_RogueFrame);

	local improvedSliceAndDice = TCalc_CreateTalentButton(TCalc_rogueImprovedSliceAndDice, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedSliceAndDice, 0, 1, 3, TCalc_RogueFrame);
	
	--Tier 2
	
	local relentlessStrikes = TCalc_CreateTalentButton(TCalc_rogueRelentlessStrikes, TCalc_RogueFrame);
	TCalc_AddTalentButton(relentlessStrikes, 0, 2, 0, TCalc_RogueFrame);

	local improvedExposeArmor = TCalc_CreateTalentButton(TCalc_rogueImprovedExposeArmor, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedExposeArmor, 0, 2, 1, TCalc_RogueFrame);

	local lethality = TCalc_CreateTalentButton(TCalc_rogueLethality, TCalc_RogueFrame);
	TCalc_AddTalentButton(lethality, 0, 2, 2, TCalc_RogueFrame);
	
	--Tier 3
	
	local vilePoisons = TCalc_CreateTalentButton(TCalc_rogueVilePoisons, TCalc_RogueFrame);
	TCalc_AddTalentButton(vilePoisons, 0, 3, 1, TCalc_RogueFrame);

	local improvedPoisons = TCalc_CreateTalentButton(TCalc_rogueImprovedPoisons, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedPoisons, 0, 3, 2, TCalc_RogueFrame);
	
	--Tier 4
	
	local coldBlood = TCalc_CreateTalentButton(TCalc_rogueColdBlood, TCalc_RogueFrame);
	TCalc_AddTalentButton(coldBlood, 0, 4, 1, TCalc_RogueFrame);

	local improvedKidneyShot = TCalc_CreateTalentButton(TCalc_rogueImprovedKidneyShot, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedKidneyShot, 0, 4, 2, TCalc_RogueFrame);
	
	--Tier 5
	
	local sealFate = TCalc_CreateTalentButton(TCalc_rogueSealFate, TCalc_RogueFrame);
	TCalc_AddTalentButton(sealFate, 0, 5, 1, TCalc_RogueFrame);
	
	--Tier 6
	
	local vigor = TCalc_CreateTalentButton(TCalc_rogueVigor, TCalc_RogueFrame);
	TCalc_AddTalentButton(vigor, 0, 6, 1, TCalc_RogueFrame);

	--Tab 1
	--Tier 0
	
	local improvedGouge = TCalc_CreateTalentButton(TCalc_rogueImprovedGouge, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedGouge, 1, 0, 0, TCalc_RogueFrame);
	
	local improvedSinisterStrike = TCalc_CreateTalentButton(TCalc_rogueImprovedSinisterStrike, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedSinisterStrike, 1, 0, 1, TCalc_RogueFrame);

	local lightningReflexes = TCalc_CreateTalentButton(TCalc_rogueLightningReflexes, TCalc_RogueFrame);
	TCalc_AddTalentButton(lightningReflexes, 1, 0, 2, TCalc_RogueFrame);

	--Tier 1

	local improvedBackstab = TCalc_CreateTalentButton(TCalc_rogueImprovedBackstab, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedBackstab, 1, 1, 0, TCalc_RogueFrame);

	local deflection = TCalc_CreateTalentButton(TCalc_rogueDeflection, TCalc_RogueFrame);
	TCalc_AddTalentButton(deflection, 1, 1, 1, TCalc_RogueFrame);

	local precision = TCalc_CreateTalentButton(TCalc_roguePrecision, TCalc_RogueFrame);
	TCalc_AddTalentButton(precision, 1, 1, 2, TCalc_RogueFrame);

	--Tier 2
	
	local endurance = TCalc_CreateTalentButton(TCalc_rogueEndurance, TCalc_RogueFrame);
	TCalc_AddTalentButton(endurance, 1, 2, 0, TCalc_RogueFrame);

	local riposte = TCalc_CreateTalentButton(TCalc_rogueRiposte, TCalc_RogueFrame);
	TCalc_AddTalentButton(riposte, 1, 2, 1, TCalc_RogueFrame);

	local improvedSprint = TCalc_CreateTalentButton(TCalc_rogueImprovedSprint, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedSprint, 1, 2, 3, TCalc_RogueFrame);

	--Tier 3

	local improvedKick = TCalc_CreateTalentButton(TCalc_rogueImprovedKick, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedKick, 1, 3, 0, TCalc_RogueFrame);

	local daggerSpecialization = TCalc_CreateTalentButton(TCalc_rogueDaggerSpecialization, TCalc_RogueFrame);
	TCalc_AddTalentButton(daggerSpecialization, 1, 3, 1, TCalc_RogueFrame);

	local dualWieldSpecialization = TCalc_CreateTalentButton(TCalc_rogueDualWieldSpecialization, TCalc_RogueFrame);
	TCalc_AddTalentButton(dualWieldSpecialization, 1, 3, 2, TCalc_RogueFrame);

	--Tier 4

	local maceSpecialization = TCalc_CreateTalentButton(TCalc_rogueMaceSpecialization, TCalc_RogueFrame);
	TCalc_AddTalentButton(maceSpecialization, 1, 4, 0, TCalc_RogueFrame);

	local bladeFlurry = TCalc_CreateTalentButton(TCalc_rogueBladeFlurry, TCalc_RogueFrame);
	TCalc_AddTalentButton(bladeFlurry, 1, 4, 1, TCalc_RogueFrame);

	local swordSpecialization = TCalc_CreateTalentButton(TCalc_rogueSwordSpecialization, TCalc_RogueFrame);
	TCalc_AddTalentButton(swordSpecialization, 1, 4, 2, TCalc_RogueFrame);

	local fistWeaponSpecialization = TCalc_CreateTalentButton(TCalc_rogueFistWeaponSpecialization, TCalc_RogueFrame);
	TCalc_AddTalentButton(fistWeaponSpecialization, 1, 4, 3, TCalc_RogueFrame);

	--Tier 5

	local weaponExpertise = TCalc_CreateTalentButton(TCalc_rogueWeaponExpertise, TCalc_RogueFrame);
	TCalc_AddTalentButton(weaponExpertise, 1, 5, 1, TCalc_RogueFrame);

	local aggression = TCalc_CreateTalentButton(TCalc_rogueAggression, TCalc_RogueFrame);
	TCalc_AddTalentButton(aggression, 1, 5, 2, TCalc_RogueFrame);

	--Tier 6

	local adrenalineRush = TCalc_CreateTalentButton(TCalc_rogueAdrenalineRush, TCalc_RogueFrame);
	TCalc_AddTalentButton(adrenalineRush, 1, 6, 1, TCalc_RogueFrame);

	--Tab 2
	--Tier 0
	
	local masterOfDeception = TCalc_CreateTalentButton(TCalc_rogueMasterOfDeception, TCalc_RogueFrame);
	TCalc_AddTalentButton(masterOfDeception, 2, 0, 1, TCalc_RogueFrame);
	
	local opportunity = TCalc_CreateTalentButton(TCalc_rogueOpportunity, TCalc_RogueFrame);
	TCalc_AddTalentButton(opportunity, 2, 0, 2, TCalc_RogueFrame);

	--Tier 1

	local sleightOfHand = TCalc_CreateTalentButton(TCalc_rogueSleightOfHand, TCalc_RogueFrame);
	TCalc_AddTalentButton(sleightOfHand, 2, 1, 0, TCalc_RogueFrame);

	local elusiveness = TCalc_CreateTalentButton(TCalc_rogueElusiveness, TCalc_RogueFrame);
	TCalc_AddTalentButton(elusiveness, 2, 1, 1, TCalc_RogueFrame);

	local camouflage = TCalc_CreateTalentButton(TCalc_rogueCamouflage, TCalc_RogueFrame);
	TCalc_AddTalentButton(camouflage, 2, 1, 2, TCalc_RogueFrame);

	--Tier 2

	local initiative = TCalc_CreateTalentButton(TCalc_rogueInitiative, TCalc_RogueFrame);
	TCalc_AddTalentButton(initiative, 2, 2, 0, TCalc_RogueFrame);

	local ghostlyStrike = TCalc_CreateTalentButton(TCalc_rogueGhostlyStrike, TCalc_RogueFrame);
	TCalc_AddTalentButton(ghostlyStrike, 2, 2, 1, TCalc_RogueFrame);

	local improvedAmbush = TCalc_CreateTalentButton(TCalc_rogueImprovedAmbush, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedAmbush, 2, 2, 2, TCalc_RogueFrame);

	--Tier 3

	local setup = TCalc_CreateTalentButton(TCalc_rogueSetup, TCalc_RogueFrame);
	TCalc_AddTalentButton(setup, 2, 3, 0, TCalc_RogueFrame);

	local improvedSap = TCalc_CreateTalentButton(TCalc_rogueImprovedSap, TCalc_RogueFrame);
	TCalc_AddTalentButton(improvedSap, 2, 3, 1, TCalc_RogueFrame);

	local serratedBlades = TCalc_CreateTalentButton(TCalc_rogueSerratedBlades, TCalc_RogueFrame);
	TCalc_AddTalentButton(serratedBlades, 2, 3, 2, TCalc_RogueFrame);

	--Tier 4

	local heightenedSenses = TCalc_CreateTalentButton(TCalc_rogueHeightenedSenses, TCalc_RogueFrame);
	TCalc_AddTalentButton(heightenedSenses, 2, 4, 0, TCalc_RogueFrame);

	local preparation = TCalc_CreateTalentButton(TCalc_roguePreparation, TCalc_RogueFrame);
	TCalc_AddTalentButton(preparation, 2, 4, 1, TCalc_RogueFrame);

	local dirtyDeeds = TCalc_CreateTalentButton(TCalc_rogueDirtyDeeds, TCalc_RogueFrame);
	TCalc_AddTalentButton(dirtyDeeds, 2, 4, 2, TCalc_RogueFrame);

	local hemorrhage = TCalc_CreateTalentButton(TCalc_rogueHemorrhage, TCalc_RogueFrame);
	TCalc_AddTalentButton(hemorrhage, 2, 4, 3, TCalc_RogueFrame);

	--Tier 5

	local deadliness = TCalc_CreateTalentButton(TCalc_rogueDeadliness, TCalc_RogueFrame);
	TCalc_AddTalentButton(deadliness, 2, 5, 2, TCalc_RogueFrame);

	--Tier 6

	local premeditation = TCalc_CreateTalentButton(TCalc_roguePremeditation, TCalc_RogueFrame);
	TCalc_AddTalentButton(premeditation, 2, 6, 1, TCalc_RogueFrame);
end