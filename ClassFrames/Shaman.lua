TCalc_ShamanFrame = nil;

TCalc_ShamanColor = {}
TCalc_ShamanColor.red=0.0
TCalc_ShamanColor.green=0.44
TCalc_ShamanColor.blue=0.87

function TCalc_InitShamanFrame()
    if (TCalc_ShamanFrame ~= nil) then
	    return TCalc_ShamanFrame;
	end
    
    --Frame itself
	TCalc_ShamanFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_ShamanFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_ShamanFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_ShamanFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_ShamanFrame:SetPoint("TOPLEFT",0,0);
    TCalc_ShamanFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_ShamanFrame:Hide();
  
    TCalc_ShamanFrame.texture = TCalc_ShamanFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_ShamanFrame.texture:SetTexture(TCalc_ShamanColor.red,TCalc_ShamanColor.green,TCalc_ShamanColor.blue, 0.7);
    TCalc_ShamanFrame.texture:SetAllPoints(TCalc_ShamanFrame);
    
    TCalc_InitTalentTabHolders(TCalc_ShamanFrame);
    TCalc_ShamanFrame.treeNames = {"Elemental","Enhancement","Restoration"};
    TCalc_ShamanFrame.color = TCalc_ShamanColor;
    
    --Selector button
    local shamanSelector = CreateFrame("Button",nil,TalentCalculator);
    shamanSelector:SetFrameStrata(TCalc_frameStrata);
    shamanSelector:SetWidth(90);
    shamanSelector:SetHeight(20);
    shamanSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),-120);
    shamanSelector:SetFrameLevel(TCalc_classFrameLevel);
    shamanSelector:SetText("Shaman");
    shamanSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    shamanSelector:SetScript("OnClick", TCalc_ShamanFrameActivated);
    shamanSelector:Show();
  
    shamanSelector.texture = shamanSelector:CreateTexture(nil,TCalc_frameStrata);
    shamanSelector.texture:SetTexture(TCalc_ShamanColor.red,TCalc_ShamanColor.green,TCalc_ShamanColor.blue, 0.7);
    shamanSelector.texture:SetAllPoints(shamanSelector);
    
    TCalc_InitShamanTalentButtons();
    
    return TCalc_ShamanFrame;
end

function TCalc_ShamanFrameActivated()
    TCalc_SwitchFrame(TCalc_ShamanFrame);
end

function TCalc_InitShamanTalentButtons()
    
	--Tab 0
	--Tier 0

	local convection = TCalc_CreateTalentButton(TCalc_shamanConvection, TCalc_ShamanFrame);
	TCalc_AddTalentButton(convection, 0, 0, 1, TCalc_ShamanFrame);

	local concussion = TCalc_CreateTalentButton(TCalc_shamanConcussion, TCalc_ShamanFrame);
	TCalc_AddTalentButton(concussion, 0, 0, 2, TCalc_ShamanFrame);
	
	--TIer 1
	
	local earthsGrasp = TCalc_CreateTalentButton(TCalc_shamanEarthsGrasp, TCalc_ShamanFrame);
	TCalc_AddTalentButton(earthsGrasp, 0, 1, 0, TCalc_ShamanFrame);
	
	local elementalWarding = TCalc_CreateTalentButton(TCalc_shamanElementalWarding, TCalc_ShamanFrame);
	TCalc_AddTalentButton(elementalWarding, 0, 1, 1, TCalc_ShamanFrame);
	
	local callOfFlame = TCalc_CreateTalentButton(TCalc_shamanCallOfFlame, TCalc_ShamanFrame);
	TCalc_AddTalentButton(callOfFlame, 0, 1, 2, TCalc_ShamanFrame);
	
	--Tier 2
	
	local elementalFocus = TCalc_CreateTalentButton(TCalc_shamanElementalFocus, TCalc_ShamanFrame);
	TCalc_AddTalentButton(elementalFocus, 0, 2, 0, TCalc_ShamanFrame);
	
	local reverberation = TCalc_CreateTalentButton(TCalc_shamanReverberation, TCalc_ShamanFrame);
	TCalc_AddTalentButton(reverberation, 0, 2, 1, TCalc_ShamanFrame);
	
	local callOfThunder = TCalc_CreateTalentButton(TCalc_shamanCallOfThunder, TCalc_ShamanFrame);
	TCalc_AddTalentButton(callOfThunder, 0, 2, 2, TCalc_ShamanFrame);
	
	--Tier 3
	
	local improvedFireTotems = TCalc_CreateTalentButton(TCalc_shamanImprovedFireTotems, TCalc_ShamanFrame);
	TCalc_AddTalentButton(improvedFireTotems, 0, 3, 0, TCalc_ShamanFrame);
	
	local eyeOfTheStorm = TCalc_CreateTalentButton(TCalc_shamanEyeOfTheStorm, TCalc_ShamanFrame);
	TCalc_AddTalentButton(eyeOfTheStorm, 0, 3, 1, TCalc_ShamanFrame);
	
	local elementalDevastation = TCalc_CreateTalentButton(TCalc_shamanElementalDevastation, TCalc_ShamanFrame);
	TCalc_AddTalentButton(elementalDevastation, 0, 3, 3, TCalc_ShamanFrame);
	
	--Tier 4

	local stormReach  = TCalc_CreateTalentButton(TCalc_shamanStormReach, TCalc_ShamanFrame);
	TCalc_AddTalentButton(stormReach, 0, 4, 0, TCalc_ShamanFrame);
	
	local elementalFury = TCalc_CreateTalentButton(TCalc_shamanElementalFury, TCalc_ShamanFrame);
	TCalc_AddTalentButton(elementalFury, 0, 4, 1, TCalc_ShamanFrame);
	
	--Tier 5

	local lightningMastery = TCalc_CreateTalentButton(TCalc_shamanLightningMastery, TCalc_ShamanFrame);
	TCalc_AddTalentButton(lightningMastery, 0, 5, 2, TCalc_ShamanFrame);
	
	--Tier 6

	local elementalMastery = TCalc_CreateTalentButton(TCalc_shamanElementalMastery, TCalc_ShamanFrame);
	TCalc_AddTalentButton(elementalMastery, 0, 6, 1, TCalc_ShamanFrame);
	
	--Tab 1
	--Tier 0

	local ancestralKnowledge = TCalc_CreateTalentButton(TCalc_shamanAncestralKnowledge, TCalc_ShamanFrame);
	TCalc_AddTalentButton(ancestralKnowledge, 1, 0, 1, TCalc_ShamanFrame);
	
	local shieldSpecialization = TCalc_CreateTalentButton(TCalc_shamanShieldSpecialization, TCalc_ShamanFrame);
	TCalc_AddTalentButton(shieldSpecialization, 1, 0, 2, TCalc_ShamanFrame);
	
	--Tier 1

	local guardianTotems = TCalc_CreateTalentButton(TCalc_shamanGuardianTotems, TCalc_ShamanFrame);
	TCalc_AddTalentButton(guardianTotems, 1, 1, 0, TCalc_ShamanFrame);
	
	local thunderingStrikes = TCalc_CreateTalentButton(TCalc_shamanThunderingStrikes, TCalc_ShamanFrame);
	TCalc_AddTalentButton(thunderingStrikes, 1, 1, 1, TCalc_ShamanFrame);
	
	local improvedGhostWolf = TCalc_CreateTalentButton(TCalc_shamanImprovedGhostWolf, TCalc_ShamanFrame);
	TCalc_AddTalentButton(improvedGhostWolf, 1, 1, 2, TCalc_ShamanFrame);
	
	local improvedLightningShield = TCalc_CreateTalentButton(TCalc_shamanImprovedLightningShield, TCalc_ShamanFrame);
	TCalc_AddTalentButton(improvedLightningShield, 1, 1, 3, TCalc_ShamanFrame);
	
	--Tier 2

	local enhancingTotems = TCalc_CreateTalentButton(TCalc_shamanEnhancingTotems, TCalc_ShamanFrame);
	TCalc_AddTalentButton(enhancingTotems, 1, 2, 0, TCalc_ShamanFrame);
	
	local twoHandedAxesAndMaces = TCalc_CreateTalentButton(TCalc_shamanTwoHandedAxesAndMaces, TCalc_ShamanFrame);
	TCalc_AddTalentButton(twoHandedAxesAndMaces, 1, 2, 2, TCalc_ShamanFrame);
	
	local anticipation = TCalc_CreateTalentButton(TCalc_shamanAnticipation, TCalc_ShamanFrame);
	TCalc_AddTalentButton(anticipation, 1, 2, 3, TCalc_ShamanFrame);
	
	--Tier 3

	local flurry = TCalc_CreateTalentButton(TCalc_shamanFlurry, TCalc_ShamanFrame);
	TCalc_AddTalentButton(flurry, 1, 3, 1, TCalc_ShamanFrame);
	
	local toughness = TCalc_CreateTalentButton(TCalc_shamanToughness, TCalc_ShamanFrame);
	TCalc_AddTalentButton(toughness, 1, 3, 2, TCalc_ShamanFrame);
	
	--Tier 4

	local improvedWeaponTotems = TCalc_CreateTalentButton(TCalc_shamanImprovedWeaponTotems, TCalc_ShamanFrame);
	TCalc_AddTalentButton(improvedWeaponTotems, 1, 4, 0, TCalc_ShamanFrame);
	
	local elementalWeapons = TCalc_CreateTalentButton(TCalc_shamanElementalWeapons, TCalc_ShamanFrame);
	TCalc_AddTalentButton(elementalWeapons, 1, 4, 1, TCalc_ShamanFrame);
	
	local parry = TCalc_CreateTalentButton(TCalc_shamanParry, TCalc_ShamanFrame);
	TCalc_AddTalentButton(parry, 1, 4, 2, TCalc_ShamanFrame);
	
	--Tier 5

	local weaponMastery = TCalc_CreateTalentButton(TCalc_shamanWeaponMastery, TCalc_ShamanFrame);
	TCalc_AddTalentButton(weaponMastery, 1, 5, 2, TCalc_ShamanFrame);
	
	--Tier 6

	local stormstrike = TCalc_CreateTalentButton(TCalc_shamanStormstrike, TCalc_ShamanFrame);
	TCalc_AddTalentButton(stormstrike, 1, 6, 1, TCalc_ShamanFrame);

	--Tab 2
	--Tier 0

	local improvedHealingWave = TCalc_CreateTalentButton(TCalc_shamanImprovedHealingWave, TCalc_ShamanFrame);
	TCalc_AddTalentButton(improvedHealingWave, 2, 0, 1, TCalc_ShamanFrame);
	
	local tidalFocus = TCalc_CreateTalentButton(TCalc_shamanTidalFocus, TCalc_ShamanFrame);
	TCalc_AddTalentButton(tidalFocus, 2, 0, 2, TCalc_ShamanFrame);
	
	--Tier 1
	
	local improvedReincarnation = TCalc_CreateTalentButton(TCalc_shamanImprovedReincarnation, TCalc_ShamanFrame);
	TCalc_AddTalentButton(improvedReincarnation, 2, 1, 0, TCalc_ShamanFrame);
	
	local ancestralHealing = TCalc_CreateTalentButton(TCalc_shamanAncestralHealing, TCalc_ShamanFrame);
	TCalc_AddTalentButton(ancestralHealing, 2, 1, 1, TCalc_ShamanFrame);
	
	local totemicFocus = TCalc_CreateTalentButton(TCalc_shamanTotemicFocus, TCalc_ShamanFrame);
	TCalc_AddTalentButton(totemicFocus, 2, 1, 2, TCalc_ShamanFrame);
	
	--Tier 2
	
	local naturesGuidance = TCalc_CreateTalentButton(TCalc_shamanNaturesGuidance, TCalc_ShamanFrame);
	TCalc_AddTalentButton(naturesGuidance, 2, 2, 0, TCalc_ShamanFrame);
	
	local healingFocus = TCalc_CreateTalentButton(TCalc_shamanHealingFocus, TCalc_ShamanFrame);
	TCalc_AddTalentButton(healingFocus, 2, 2, 1, TCalc_ShamanFrame);
	
	local totemicMastery = TCalc_CreateTalentButton(TCalc_shamanTotemicMastery, TCalc_ShamanFrame);
	TCalc_AddTalentButton(totemicMastery, 2, 2, 2, TCalc_ShamanFrame);
	
	local healingGrace = TCalc_CreateTalentButton(TCalc_shamanHealingGrace, TCalc_ShamanFrame);
	TCalc_AddTalentButton(healingGrace, 2, 2, 3, TCalc_ShamanFrame);
	
	--Tier 3
	
	local restorativeTotems = TCalc_CreateTalentButton(TCalc_shamanRestorativeTotems, TCalc_ShamanFrame);
	TCalc_AddTalentButton(restorativeTotems, 2, 3, 1, TCalc_ShamanFrame);
	
	local tidalMastery = TCalc_CreateTalentButton(TCalc_shamanTidalMastery, TCalc_ShamanFrame);
	TCalc_AddTalentButton(tidalMastery, 2, 3, 2, TCalc_ShamanFrame);
	
	--Tier 4
	
	local healingWay = TCalc_CreateTalentButton(TCalc_shamanHealingWay, TCalc_ShamanFrame);
	TCalc_AddTalentButton(healingWay, 2, 4, 0, TCalc_ShamanFrame);
	
	local naturesSwiftness = TCalc_CreateTalentButton(TCalc_shamanNaturesSwiftness, TCalc_ShamanFrame);
	TCalc_AddTalentButton(naturesSwiftness, 2, 4, 2, TCalc_ShamanFrame);
	
	--Tier 5
	
	local purification = TCalc_CreateTalentButton(TCalc_shamanPurification, TCalc_ShamanFrame);
	TCalc_AddTalentButton(purification, 2, 5, 2, TCalc_ShamanFrame);
	
	--Tier 6
	
	local manaTideTotem = TCalc_CreateTalentButton(TCalc_shamanManaTideTotem, TCalc_ShamanFrame);
	TCalc_AddTalentButton(manaTideTotem, 2, 6, 1, TCalc_ShamanFrame);
	
end
