TCalc_PaladinFrame = nil;

TCalc_PaladinColor = {}
TCalc_PaladinColor.red=0.96
TCalc_PaladinColor.green=0.55
TCalc_PaladinColor.blue=0.73

function TCalc_InitPaladinFrame()
    if (TCalc_PaladinFrame ~= nil) then
	    return TCalc_PaladinFrame;
	end
    
    --Frame itself
	TCalc_PaladinFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_PaladinFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_PaladinFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_PaladinFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_PaladinFrame:SetPoint("TOPLEFT",0,0);
    TCalc_PaladinFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_PaladinFrame:Hide();
  
    TCalc_PaladinFrame.texture = TCalc_PaladinFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_PaladinFrame.texture:SetTexture(TCalc_PaladinColor.red,TCalc_PaladinColor.green,TCalc_PaladinColor.blue, 0.7);
    TCalc_PaladinFrame.texture:SetAllPoints(TCalc_PaladinFrame);
    
    TCalc_InitTalentTabHolders(TCalc_PaladinFrame);
    TCalc_PaladinFrame.treeNames = {"Holy","Protection","Retribution"};
    
    --Selector button
    local paladinSelector = CreateFrame("Button",nil,TalentCalculator);
    paladinSelector:SetFrameStrata(TCalc_frameStrata);
    paladinSelector:SetWidth(90);
    paladinSelector:SetHeight(20);
    paladinSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),-60);
    paladinSelector:SetFrameLevel(TCalc_classFrameLevel);
    paladinSelector:SetText("Paladin");
    paladinSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    paladinSelector:SetScript("OnClick", TCalc_PaladinFrameActivated);
    paladinSelector:Show();
  
    paladinSelector.texture = paladinSelector:CreateTexture(nil,TCalc_frameStrata);
    paladinSelector.texture:SetTexture(TCalc_PaladinColor.red,TCalc_PaladinColor.green,TCalc_PaladinColor.blue, 0.7);
    paladinSelector.texture:SetAllPoints(paladinSelector);
    
    TCalc_InitPaladinTalentButtons();
    
    return TCalc_PaladinFrame;
end

function TCalc_PaladinFrameActivated()
    TCalc_SwitchFrame(TCalc_PaladinFrame);
end

function TCalc_InitPaladinTalentButtons()
    --Tab 1
    --Tier 0
    local divineStrength = TCalc_CreateTalentButton(TCalc_paladinDivineStrength, TCalc_PaladinFrame);
    TCalc_AddTalentButton(divineStrength, 0, 0, 1, TCalc_PaladinFrame);
    
    local divineIntellect = TCalc_CreateTalentButton(TCalc_paladinDivineIntellect, TCalc_PaladinFrame);
    TCalc_AddTalentButton(divineIntellect, 0, 0, 2, TCalc_PaladinFrame);

    --Tier 1
    local spirituaFocus = TCalc_CreateTalentButton(TCalc_paladinSpirituaFocus, TCalc_PaladinFrame);
    TCalc_AddTalentButton(spirituaFocus, 0, 1, 1, TCalc_PaladinFrame);
    
    local improvedSealOfRighteousness = TCalc_CreateTalentButton(TCalc_paladinImprovedSealOfRighteousness, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedSealOfRighteousness, 0, 1, 2, TCalc_PaladinFrame);

    --Tier 2
    local healingLight = TCalc_CreateTalentButton(TCalc_paladinHealingLight, TCalc_PaladinFrame);
    TCalc_AddTalentButton(healingLight, 0, 2, 0, TCalc_PaladinFrame);
    
    local consecration = TCalc_CreateTalentButton(TCalc_paladinConsecration, TCalc_PaladinFrame);
    TCalc_AddTalentButton(consecration, 0, 2, 1, TCalc_PaladinFrame);
    
    local improvedLayOnHands = TCalc_CreateTalentButton(TCalc_paladinImprovedLayOnHands, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedLayOnHands, 0, 2, 2, TCalc_PaladinFrame);
    
    local unyieldingFaith = TCalc_CreateTalentButton(TCalc_paladinUnyieldingFaith, TCalc_PaladinFrame);
    TCalc_AddTalentButton(unyieldingFaith, 0, 2, 3, TCalc_PaladinFrame);

    --Tier 3
    local illumination = TCalc_CreateTalentButton(TCalc_paladinIllumination, TCalc_PaladinFrame);
    TCalc_AddTalentButton(illumination, 0, 3, 1, TCalc_PaladinFrame);
    
    local improvedBlessingOfWisdom = TCalc_CreateTalentButton(TCalc_paladinImprovedBlessingOfWisdom, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedBlessingOfWisdom, 0, 3, 2, TCalc_PaladinFrame);

    --Tier 4
    local divineFavor = TCalc_CreateTalentButton(TCalc_paladinDivineFavor, TCalc_PaladinFrame);
    TCalc_AddTalentButton(divineFavor, 0, 4, 1, TCalc_PaladinFrame);
    
    local lastingJudgement = TCalc_CreateTalentButton(TCalc_paladinLastingJudgement, TCalc_PaladinFrame);
    TCalc_AddTalentButton(lastingJudgement, 0, 4, 2, TCalc_PaladinFrame);

    --Tier 5
    local holyPower = TCalc_CreateTalentButton(TCalc_paladinHolyPower, TCalc_PaladinFrame);
    TCalc_AddTalentButton(holyPower, 0, 5, 2, TCalc_PaladinFrame);

    --Tier 6
    local holyShock = TCalc_CreateTalentButton(TCalc_paladinHolyShock, TCalc_PaladinFrame);
    TCalc_AddTalentButton(holyShock, 0, 6, 1, TCalc_PaladinFrame);
    

    --Tab 1
    --Tier 0
    local improvedDevotionAura = TCalc_CreateTalentButton(TCalc_paladinImprovedDevotionAura, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedDevotionAura, 1, 0, 1, TCalc_PaladinFrame);
    
    local redoubt = TCalc_CreateTalentButton(TCalc_paladinRedoubt, TCalc_PaladinFrame);
    TCalc_AddTalentButton(redoubt, 1, 0, 2, TCalc_PaladinFrame);

    --Tier 1
    local precision = TCalc_CreateTalentButton(TCalc_paladinPrecision, TCalc_PaladinFrame);
    TCalc_AddTalentButton(precision, 1, 1, 0, TCalc_PaladinFrame);
    
    local guardiansFavor = TCalc_CreateTalentButton(TCalc_paladinGuardiansFavor, TCalc_PaladinFrame);
    TCalc_AddTalentButton(guardiansFavor, 1, 1, 1, TCalc_PaladinFrame);
    
    local toughness = TCalc_CreateTalentButton(TCalc_paladinToughness, TCalc_PaladinFrame);
    TCalc_AddTalentButton(toughness, 1, 1, 3, TCalc_PaladinFrame);

    --Tier 2
    local blessingOfKings = TCalc_CreateTalentButton(TCalc_paladinBlessingOfKings, TCalc_PaladinFrame);
    TCalc_AddTalentButton(blessingOfKings, 1, 2, 0, TCalc_PaladinFrame);
    
    local improvedRighteousFury = TCalc_CreateTalentButton(TCalc_paladinImprovedRighteousFury, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedRighteousFury, 1, 2, 1, TCalc_PaladinFrame);
    
    local shieldSpecialization = TCalc_CreateTalentButton(TCalc_paladinShieldSpecialization, TCalc_PaladinFrame);
    TCalc_AddTalentButton(shieldSpecialization, 1, 2, 2, TCalc_PaladinFrame);
    
    local anticipation = TCalc_CreateTalentButton(TCalc_paladinAnticipation, TCalc_PaladinFrame);
    TCalc_AddTalentButton(anticipation, 1, 2, 3, TCalc_PaladinFrame);

    --Tier 3
    local improvedHammerOfJustice = TCalc_CreateTalentButton(TCalc_paladinImprovedHammerOfJustice, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedHammerOfJustice, 1, 3, 1, TCalc_PaladinFrame);
    
    local improvedConcentrationAura = TCalc_CreateTalentButton(TCalc_paladinImprovedConcentrationAura, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedConcentrationAura, 1, 3, 2, TCalc_PaladinFrame);

    --Tier 4
    local blessingOfSanctuary = TCalc_CreateTalentButton(TCalc_paladinBlessingOfSanctuary, TCalc_PaladinFrame);
    TCalc_AddTalentButton(blessingOfSanctuary, 1, 4, 1, TCalc_PaladinFrame);
    
    local reckoning = TCalc_CreateTalentButton(TCalc_paladinReckoning, TCalc_PaladinFrame);
    TCalc_AddTalentButton(reckoning, 1, 4, 2, TCalc_PaladinFrame);

    --Tier 5
    local oneHandedWeaponSpecialization = TCalc_CreateTalentButton(TCalc_paladinOneHandedWeaponSpecialization, TCalc_PaladinFrame);
    TCalc_AddTalentButton(oneHandedWeaponSpecialization, 1, 5, 2, TCalc_PaladinFrame);

    --Tier 6
    local holyShield = TCalc_CreateTalentButton(TCalc_paladinHolyShield, TCalc_PaladinFrame);
    TCalc_AddTalentButton(holyShield, 1, 6, 1, TCalc_PaladinFrame);

    
    --Tab 2
    --Tier 0
    local improvedBlessingOfMight = TCalc_CreateTalentButton(TCalc_paladinImprovedBlessingOfMight, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedBlessingOfMight, 2, 0, 1, TCalc_PaladinFrame);
    
    local benediction = TCalc_CreateTalentButton(TCalc_paladinBenediction, TCalc_PaladinFrame);
    TCalc_AddTalentButton(benediction, 2, 0, 2, TCalc_PaladinFrame);

    --Tier 1
    local improvedJudgement = TCalc_CreateTalentButton(TCalc_paladinImprovedJudgement, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedJudgement, 2, 1, 0, TCalc_PaladinFrame);
    
    local improvedSealOfTheCrusader = TCalc_CreateTalentButton(TCalc_paladinImprovedSealOfTheCrusader, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedSealOfTheCrusader, 2, 1, 1, TCalc_PaladinFrame);
    
    local deflection = TCalc_CreateTalentButton(TCalc_paladinDeflection, TCalc_PaladinFrame);
    TCalc_AddTalentButton(deflection, 2, 1, 2, TCalc_PaladinFrame);

    --Tier 2
    local vindication = TCalc_CreateTalentButton(TCalc_paladinVindication, TCalc_PaladinFrame);
    TCalc_AddTalentButton(vindication, 2, 2, 0, TCalc_PaladinFrame);
    
    local conviction = TCalc_CreateTalentButton(TCalc_paladinConviction, TCalc_PaladinFrame);
    TCalc_AddTalentButton(conviction, 2, 2, 1, TCalc_PaladinFrame);
    
    local sealOfCommand = TCalc_CreateTalentButton(TCalc_paladinSealOfCommand, TCalc_PaladinFrame);
    TCalc_AddTalentButton(sealOfCommand, 2, 2, 2, TCalc_PaladinFrame);
    
    local pursuitOfJustice = TCalc_CreateTalentButton(TCalc_paladinPursuitOfJustice, TCalc_PaladinFrame);
    TCalc_AddTalentButton(pursuitOfJustice, 2, 2, 3, TCalc_PaladinFrame);
    
    --Tier 3
    local eyeForAnEye = TCalc_CreateTalentButton(TCalc_paladinEyeForAnEye, TCalc_PaladinFrame);
    TCalc_AddTalentButton(eyeForAnEye, 2, 3, 0, TCalc_PaladinFrame);
    
    local improvedRetributionAura = TCalc_CreateTalentButton(TCalc_paladinImprovedRetributionAura, TCalc_PaladinFrame);
    TCalc_AddTalentButton(improvedRetributionAura, 2, 3, 2, TCalc_PaladinFrame);

    --Tier 4
    local twoHandedWeaponSpecialization = TCalc_CreateTalentButton(TCalc_paladinTwoHandedWeaponSpecialization, TCalc_PaladinFrame);
    TCalc_AddTalentButton(twoHandedWeaponSpecialization, 2, 4, 0, TCalc_PaladinFrame);
    
    local sanctityAura = TCalc_CreateTalentButton(TCalc_paladinSanctityAura, TCalc_PaladinFrame);
    TCalc_AddTalentButton(sanctityAura, 2, 4, 2, TCalc_PaladinFrame);

    --Tier 5
    local vengeance = TCalc_CreateTalentButton(TCalc_paladinVengeance, TCalc_PaladinFrame);
    TCalc_AddTalentButton(vengeance, 2, 5, 1, TCalc_PaladinFrame);

    --Tier 6
    local repentance = TCalc_CreateTalentButton(TCalc_paladinRepentance, TCalc_PaladinFrame);
    TCalc_AddTalentButton(repentance, 2, 6, 1, TCalc_PaladinFrame);
end