TCalc_PriestFrame = nil;

TCalc_PriestColor = {}
TCalc_PriestColor.red=1.00
TCalc_PriestColor.green=1.00
TCalc_PriestColor.blue=1.00

function TCalc_InitPriestFrame()
    if (TCalc_PriestFrame ~= nil) then
	    return TCalc_PriestFrame;
	end
    
    --Frame itself
	TCalc_PriestFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_PriestFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_PriestFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_PriestFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_PriestFrame:SetPoint("TOPLEFT",0,0);
    TCalc_PriestFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_PriestFrame:Hide();
  
    TCalc_PriestFrame.texture = TCalc_PriestFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_PriestFrame.texture:SetTexture(TCalc_PriestColor.red,TCalc_PriestColor.green,TCalc_PriestColor.blue, 0.7);
    TCalc_PriestFrame.texture:SetAllPoints(TCalc_PriestFrame);
    
    TCalc_InitTalentTabHolders(TCalc_PriestFrame);
    TCalc_PriestFrame.treeNames = {"Discipline","Holy","Shadow"};
    TCalc_PriestFrame.color = TCalc_PriestColor;
    
    --Selector button
    local priestSelector = CreateFrame("Button",nil,TalentCalculator);
    priestSelector:SetFrameStrata(TCalc_frameStrata);
    priestSelector:SetWidth(90);
    priestSelector:SetHeight(20);
    priestSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),-80);
    priestSelector:SetFrameLevel(TCalc_classFrameLevel);
    priestSelector:SetText("Priest");
    priestSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    priestSelector:SetScript("OnClick", TCalc_PriestFrameActivated);
    priestSelector:Show();
  
    priestSelector.texture = priestSelector:CreateTexture(nil,TCalc_frameStrata);
    priestSelector.texture:SetTexture(TCalc_PriestColor.red,TCalc_PriestColor.green,TCalc_PriestColor.blue, 0.7);
    priestSelector.texture:SetAllPoints(priestSelector);
    
    TCalc_InitPriestTalentButtons();
    
    return TCalc_PriestFrame;
end

function TCalc_PriestFrameActivated()
    TCalc_SwitchFrame(TCalc_PriestFrame);
end

function TCalc_InitPriestTalentButtons()
	--Tab 0
	--Tier 0
	
    local unbreakableWill = TCalc_CreateTalentButton(TCalc_priestUnbreakableWill, TCalc_PriestFrame);
    TCalc_AddTalentButton(unbreakableWill, 0, 0, 1, TCalc_PriestFrame);
    
	local wandSpecialization = TCalc_CreateTalentButton(TCalc_priestWandSpecialization, TCalc_PriestFrame);
    TCalc_AddTalentButton(wandSpecialization , 0, 0, 2, TCalc_PriestFrame);
	
	--Tier 1
	
	local silentResolve = TCalc_CreateTalentButton(TCalc_priestSilentResolve, TCalc_PriestFrame);
    TCalc_AddTalentButton(silentResolve , 0, 1, 0, TCalc_PriestFrame);
	
	local improvedPowerWordFortitude = TCalc_CreateTalentButton(TCalc_priestImprovedPowerWordFortitude, TCalc_PriestFrame);
    TCalc_AddTalentButton(improvedPowerWordFortitude , 0, 1, 1, TCalc_PriestFrame);
	
	local improvedPowerWordShield = TCalc_CreateTalentButton(TCalc_priestImprovedPowerWordShield, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedPowerWordShield, 0, 1, 2, TCalc_PriestFrame);
	
	local martyrdom = TCalc_CreateTalentButton(TCalc_priestMartyrdom, TCalc_PriestFrame);
    TCalc_AddTalentButton( martyrdom, 0, 1, 3, TCalc_PriestFrame);
	
	--Tier 2
	
	local innerFocus = TCalc_CreateTalentButton(TCalc_priestInnerFocus, TCalc_PriestFrame);
    TCalc_AddTalentButton( innerFocus, 0, 2, 1, TCalc_PriestFrame);
	
	local meditation = TCalc_CreateTalentButton(TCalc_priestMeditation, TCalc_PriestFrame);
    TCalc_AddTalentButton( meditation, 0, 2, 2, TCalc_PriestFrame);
	
	--Tier 3
	
	local improvedInnerFire = TCalc_CreateTalentButton(TCalc_priestImprovedInnerFire, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedInnerFire, 0, 3, 0, TCalc_PriestFrame);
	
	local mentalAgility = TCalc_CreateTalentButton(TCalc_priestMentalAgility, TCalc_PriestFrame);
    TCalc_AddTalentButton( mentalAgility, 0, 3, 1, TCalc_PriestFrame);
	
	local improvedManaBurn = TCalc_CreateTalentButton(TCalc_priestImprovedManaBurn, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedManaBurn, 0, 3, 3, TCalc_PriestFrame);
	
	--Tier 4
	
	local mentalStrength = TCalc_CreateTalentButton(TCalc_priestMentalStrength, TCalc_PriestFrame);
    TCalc_AddTalentButton( mentalStrength, 0, 4, 1, TCalc_PriestFrame);
	
	local divineSpirit = TCalc_CreateTalentButton(TCalc_priestDivineSpirit, TCalc_PriestFrame);
    TCalc_AddTalentButton( divineSpirit, 0, 4, 2, TCalc_PriestFrame);
	
	--Tier 5
	
	local forceOfWill = TCalc_CreateTalentButton(TCalc_priestForceOfWill, TCalc_PriestFrame);
    TCalc_AddTalentButton( forceOfWill, 0, 5, 2, TCalc_PriestFrame);
	
	--Tier 6
	
	local powerInfusion = TCalc_CreateTalentButton(TCalc_priestPowerInfusion, TCalc_PriestFrame);
    TCalc_AddTalentButton( powerInfusion, 0, 6, 1, TCalc_PriestFrame);
	
	--Tab 1
	--Tier 0
	
	local healingFocus = TCalc_CreateTalentButton(TCalc_priestHealingFocus, TCalc_PriestFrame);
    TCalc_AddTalentButton( healingFocus, 1, 0, 0, TCalc_PriestFrame);
	
	local improvedRenew = TCalc_CreateTalentButton(TCalc_priestImprovedRenew, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedRenew, 1, 0, 1, TCalc_PriestFrame);
	
	local holySpecialization = TCalc_CreateTalentButton(TCalc_priestHolySpecialization, TCalc_PriestFrame);
    TCalc_AddTalentButton( holySpecialization, 1, 0, 2, TCalc_PriestFrame);
	
	--Tier 1
	
	local spellWarding = TCalc_CreateTalentButton(TCalc_priestSpellWarding, TCalc_PriestFrame);
    TCalc_AddTalentButton( spellWarding, 1, 1, 1, TCalc_PriestFrame);
	
	local divineFury = TCalc_CreateTalentButton(TCalc_priestDivineFury, TCalc_PriestFrame);
    TCalc_AddTalentButton( divineFury, 1, 1, 2, TCalc_PriestFrame);
	
	--Tier 2
	
	local holyNova = TCalc_CreateTalentButton(TCalc_priestHolyNova, TCalc_PriestFrame);
    TCalc_AddTalentButton( holyNova, 1, 2, 0, TCalc_PriestFrame);
	
	local blessedRecovery = TCalc_CreateTalentButton(TCalc_priestBlessedRecovery, TCalc_PriestFrame);
    TCalc_AddTalentButton( blessedRecovery, 1, 2, 1, TCalc_PriestFrame);
	
	local inspiration  = TCalc_CreateTalentButton(TCalc_priestInspiration, TCalc_PriestFrame);
    TCalc_AddTalentButton( inspiration, 1, 2, 3, TCalc_PriestFrame);
	
	--Tier 3
	
	local holyReac = TCalc_CreateTalentButton(TCalc_priestHolyReach, TCalc_PriestFrame);
    TCalc_AddTalentButton( holyReac, 1, 3, 0, TCalc_PriestFrame);
	
	local improvedHealing = TCalc_CreateTalentButton(TCalc_priestImprovedHealing, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedHealing, 1, 3, 1, TCalc_PriestFrame);
	
	local searingLight = TCalc_CreateTalentButton(TCalc_priestSearingLight, TCalc_PriestFrame);
    TCalc_AddTalentButton( searingLight, 1, 3, 2, TCalc_PriestFrame);
	
	--Tier 4
	
	local improvedPrayerOfHealing = TCalc_CreateTalentButton(TCalc_priestImprovedPrayerOfHealing, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedPrayerOfHealing, 1, 4, 0, TCalc_PriestFrame);
	
	local spiritOfRedemption = TCalc_CreateTalentButton(TCalc_priestSpiritOfRedemption, TCalc_PriestFrame);
    TCalc_AddTalentButton( spiritOfRedemption, 1, 4, 1, TCalc_PriestFrame);
	
	local spiritualGuidance = TCalc_CreateTalentButton(TCalc_priestSpiritualGuidance, TCalc_PriestFrame);
    TCalc_AddTalentButton( spiritualGuidance, 1, 4, 2, TCalc_PriestFrame);
	
	--Tier 5
	
	local spiritualHealing = TCalc_CreateTalentButton(TCalc_priestSpiritualHealing, TCalc_PriestFrame);
    TCalc_AddTalentButton( spiritualHealing, 1, 5, 2, TCalc_PriestFrame);
	
	--Tier 6
	
	local lightwell = TCalc_CreateTalentButton(TCalc_priestLightwell, TCalc_PriestFrame);
    TCalc_AddTalentButton( lightwell, 1, 6, 1, TCalc_PriestFrame);
	
	--Tab 2
	--Tier 0
	
	local spiritTap = TCalc_CreateTalentButton(TCalc_priestSpiritTap, TCalc_PriestFrame);
    TCalc_AddTalentButton( spiritTap, 2, 0, 1, TCalc_PriestFrame);
	
	local blackout = TCalc_CreateTalentButton(TCalc_priestBlackout, TCalc_PriestFrame);
    TCalc_AddTalentButton( blackout, 2, 0, 2, TCalc_PriestFrame);
	
	--Tier 1
	
	local shadowAffinity = TCalc_CreateTalentButton(TCalc_priestShadowAffinity, TCalc_PriestFrame);
    TCalc_AddTalentButton(shadowAffinity, 2, 1, 0, TCalc_PriestFrame);
	
	local improvedShadowWordPain = TCalc_CreateTalentButton(TCalc_priestImprovedShadowWordPain, TCalc_PriestFrame);
    TCalc_AddTalentButton(improvedShadowWordPain , 2, 1, 1, TCalc_PriestFrame);
	
	local shadowFocus = TCalc_CreateTalentButton(TCalc_priestShadowFocus, TCalc_PriestFrame);
    TCalc_AddTalentButton( shadowFocus, 2, 1, 2, TCalc_PriestFrame);
	
	--Tier 2
	
	local improvedPsychicScream = TCalc_CreateTalentButton(TCalc_priestImprovedPsychicScream, TCalc_PriestFrame);
    TCalc_AddTalentButton(improvedPsychicScream , 2, 2, 0, TCalc_PriestFrame);
	
	local improvedMindBlast = TCalc_CreateTalentButton(TCalc_priestImprovedMindBlast, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedMindBlast, 2, 2, 1, TCalc_PriestFrame);
	
	local mindFlay = TCalc_CreateTalentButton(TCalc_priestMindFlay, TCalc_PriestFrame);
    TCalc_AddTalentButton( mindFlay, 2, 2, 2, TCalc_PriestFrame);
	
	--Tier 3
	
	local improvedFade = TCalc_CreateTalentButton(TCalc_priestImprovedFade, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedFade,2, 3, 1, TCalc_PriestFrame);
	
	local shadowReach = TCalc_CreateTalentButton(TCalc_priestShadowReach, TCalc_PriestFrame);
    TCalc_AddTalentButton( shadowReach, 2, 3, 2, TCalc_PriestFrame);
	
	local shadowWeaving = TCalc_CreateTalentButton(TCalc_priestShadowWeaving, TCalc_PriestFrame);
    TCalc_AddTalentButton( shadowWeaving, 2, 3, 3, TCalc_PriestFrame);
	
	--Tier 4
	
	local silence = TCalc_CreateTalentButton(TCalc_priestSilence, TCalc_PriestFrame);
    TCalc_AddTalentButton( silence, 2, 4, 0, TCalc_PriestFrame);
	
	local vampiricEmbrace = TCalc_CreateTalentButton(TCalc_priestVampiricEmbrace, TCalc_PriestFrame);
    TCalc_AddTalentButton( vampiricEmbrace, 2, 4, 1, TCalc_PriestFrame);
	
	local improvedVampiricEmbrace = TCalc_CreateTalentButton(TCalc_priestImprovedVampiricEmbrace, TCalc_PriestFrame);
    TCalc_AddTalentButton( improvedVampiricEmbrace, 2, 4, 2, TCalc_PriestFrame);
	
	--Tier 5
	
	local darkness = TCalc_CreateTalentButton(TCalc_priestDarkness, TCalc_PriestFrame);
    TCalc_AddTalentButton( darkness, 2, 5, 2, TCalc_PriestFrame);
	
	--Tier 6
	
	local shadowform = TCalc_CreateTalentButton(TCalc_priestShadowform, TCalc_PriestFrame);
    TCalc_AddTalentButton( shadowform, 2, 6, 1, TCalc_PriestFrame);
end