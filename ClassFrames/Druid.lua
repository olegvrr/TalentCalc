TCalc_DruidFrame = nil;

TCalc_DruidColor = {}
TCalc_DruidColor.red=1.00
TCalc_DruidColor.green=0.49
TCalc_DruidColor.blue=0.04

function TCalc_InitDruidFrame()
    if (TCalc_DruidFrame ~= nil) then
	    return TCalc_DruidFrame;
	end
    
    --Frame itself
	TCalc_DruidFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_DruidFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_DruidFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_DruidFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_DruidFrame:SetPoint("TOPLEFT",0,0);
    TCalc_DruidFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_DruidFrame:Hide();
  
    TCalc_DruidFrame.texture = TCalc_DruidFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_DruidFrame.texture:SetTexture(TCalc_DruidColor.red,TCalc_DruidColor.green,TCalc_DruidColor.blue, 0.7);
    TCalc_DruidFrame.texture:SetAllPoints(TCalc_DruidFrame);
    
    TCalc_InitTalentTabHolders(TCalc_DruidFrame);
    TCalc_DruidFrame.treeNames = {"Balance","Feral Combat","Restoration"};
    
    --Selector button
    local druidSelector = CreateFrame("Button",nil,TalentCalculator);
    druidSelector:SetFrameStrata(TCalc_frameStrata);
    druidSelector:SetWidth(90);
    druidSelector:SetHeight(20);
    druidSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),0);
    druidSelector:SetFrameLevel(TCalc_classFrameLevel);
    druidSelector:SetText("Druid");
    druidSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    druidSelector:SetScript("OnClick", TCalc_DruidFrameActivated);
    druidSelector:Show();
  
    druidSelector.texture = druidSelector:CreateTexture(nil,TCalc_frameStrata);
    druidSelector.texture:SetTexture(TCalc_DruidColor.red,TCalc_DruidColor.green,TCalc_DruidColor.blue, 0.7);
    druidSelector.texture:SetAllPoints(druidSelector);
    
    TCalc_InitDruidTalentButtons();
    
    return TCalc_DruidFrame;
end

function TCalc_DruidFrameActivated()
    TCalc_SwitchFrame(TCalc_DruidFrame);
end

function TCalc_InitDruidTalentButtons()
    
end