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
    
end