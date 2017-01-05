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

    --Tier 1

    --Tier 2


    --Tier 3

    --Tier 4

    --Tier 5

    --Tier 6

    
    --Tab 2
    --Tier 0

    --Tier 1

    --Tier 2
    local sealOfCommandTalentButton = TCalc_CreateTalentButton(TCalc_paladinSealOfCommand, TCalc_PaladinFrame);
    TCalc_AddTalentButton(sealOfCommandTalentButton, 2, 2, 2, TCalc_PaladinFrame);
    
    --Tier 3

    --Tier 4

    --Tier 5

    --Tier 6
end