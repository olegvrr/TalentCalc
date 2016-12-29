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
    
end