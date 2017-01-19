TCalc_WarlockFrame = nil;

TCalc_WarlockColor = {}
TCalc_WarlockColor.red=0.58
TCalc_WarlockColor.green=0.51
TCalc_WarlockColor.blue=0.79

function TCalc_InitWarlockFrame()
    if (TCalc_WarlockFrame ~= nil) then
	    return TCalc_WarlockFrame;
	end
    
    --Frame itself
	TCalc_WarlockFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_WarlockFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_WarlockFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_WarlockFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_WarlockFrame:SetPoint("TOPLEFT",0,0);
    TCalc_WarlockFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_WarlockFrame:Hide();
  
    TCalc_WarlockFrame.texture = TCalc_WarlockFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_WarlockFrame.texture:SetTexture(TCalc_WarlockColor.red,TCalc_WarlockColor.green,TCalc_WarlockColor.blue, 0.7);
    TCalc_WarlockFrame.texture:SetAllPoints(TCalc_WarlockFrame);
    
    TCalc_InitTalentTabHolders(TCalc_WarlockFrame);
    TCalc_WarlockFrame.treeNames =  {"Affliction","Demonology","Destruction"};
    TCalc_WarlockFrame.color = TCalc_WarlockColor;
    
    --Selector button
    local warlockSelector = CreateFrame("Button",nil,TalentCalculator);
    warlockSelector:SetFrameStrata(TCalc_frameStrata);
    warlockSelector:SetWidth(90);
    warlockSelector:SetHeight(20);
    warlockSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),-140);
    warlockSelector:SetFrameLevel(TCalc_classFrameLevel);
    warlockSelector:SetText("Warlock");
    warlockSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    warlockSelector:SetScript("OnClick", TCalc_WarlockFrameActivated);
    warlockSelector:Show();
  
    warlockSelector.texture = warlockSelector:CreateTexture(nil,TCalc_frameStrata);
    warlockSelector.texture:SetTexture(TCalc_WarlockColor.red,TCalc_WarlockColor.green,TCalc_WarlockColor.blue, 0.7);
    warlockSelector.texture:SetAllPoints(warlockSelector);
    
    TCalc_InitWarlockTalentButtons();
    
    return TCalc_WarlockFrame;
end

function TCalc_WarlockFrameActivated()
    TCalc_SwitchFrame(TCalc_WarlockFrame);
end

function TCalc_InitWarlockTalentButtons()
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockSuppression, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 0, 1, TCalc_WarlockFrame);
    
    local improvedCorruptionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedCorruption, TCalc_WarlockFrame);
    TCalc_AddTalentButton(improvedCorruptionTalentButton, 0, 0, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedCurseofWeakness, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 1, 0, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedDrainSoul, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 1, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedLifeTap, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 1, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedDrainLife, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 1, 3, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedCurseofAgony, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 2, 0, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockFelConcentration, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 2, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockAmplifyCurse, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 2, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockGrimReach, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 3, 0, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockNightfall, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 3, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedDrainMana, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 3, 3, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockSiphonLife, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 4, 1, TCalc_WarlockFrame);
    
    local curseOfExhaustionTalentButton = TCalc_CreateTalentButton(TCalc_warlockCurseofExhaustion, TCalc_WarlockFrame);
    TCalc_AddTalentButton(curseOfExhaustionTalentButton, 0, 4, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedCurseofExhaustion, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 4, 3, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockShadowMastery, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 5, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockDarkPact, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 0, 6, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedHealthstone, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 0, 0, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedImp, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 0, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockDemonicEmbrace, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 0, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedHealthFunnel, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 1, 0, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedVoidwalker, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 1, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockFelIntellect, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 1, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedSuccubus, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 2, 0, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockFelDomination, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 2, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockFelStamina, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 2, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockMasterSummoner, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 3, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockUnholyPower, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 3, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedEnslaveDemon, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 4, 0, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockDemonicSacrifice, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 4, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedFirestone, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 4, 3, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockMasterDemonologist, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 5, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockSoulLink, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 6, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedSpellstone, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 1, 6, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedShadowBolt, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 0, 1, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockCataclysm, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 0, 2, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockBane, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 1, 1, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockAftermath, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 1, 2, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedFirebolt, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 2, 0, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedLashofPain, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 2, 1, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockDevastation, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 2, 2, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockShadowburn, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 2, 3, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockIntensity, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 3, 0, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockDestructiveReach, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 3, 1, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedSearingPain, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 3, 3, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockPyroclasm, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 4, 0, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockImprovedImmolate, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 4, 1, TCalc_WarlockFrame);
     
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockRuin, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 4, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockEmberstorm, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 5, 2, TCalc_WarlockFrame);
    
    local suppressionTalentButton = TCalc_CreateTalentButton(TCalc_warlockConflagrate, TCalc_WarlockFrame);
    TCalc_AddTalentButton(suppressionTalentButton, 2, 6, 1, TCalc_WarlockFrame);
    
    --ChatFrame1:AddMessage(curseOfExhaustionTalentButton.parentTalent.talentName);
end