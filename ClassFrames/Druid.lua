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
    TCalc_DruidFrame.color = TCalc_DruidColor;
    
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
    
	--Tab 0
	--Tier 0

	local improvedWrath = TCalc_CreateTalentButton(TCalc_druidImprovedWrath, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedWrath, 0, 0, 0, TCalc_DruidFrame);

	local naturesGrasp = TCalc_CreateTalentButton(TCalc_druidNaturesGrasp, TCalc_DruidFrame);
	TCalc_AddTalentButton(naturesGrasp, 0, 0, 1, TCalc_DruidFrame);

	local improvedNaturesGrasp = TCalc_CreateTalentButton(TCalc_druidImprovedNaturesGrasp, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedNaturesGrasp, 0, 0, 2, TCalc_DruidFrame);

	--Tier 1

	local improvedEntanglingRoots = TCalc_CreateTalentButton(TCalc_druidImprovedEntanglingRoots, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedEntanglingRoots, 0, 1, 0, TCalc_DruidFrame);

	local improvedMoonfire = TCalc_CreateTalentButton(TCalc_druidImprovedMoonfire, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedMoonfire, 0, 1, 1, TCalc_DruidFrame);

	local naturalWeapons = TCalc_CreateTalentButton(TCalc_druidNaturalWeapons, TCalc_DruidFrame);
	TCalc_AddTalentButton(naturalWeapons, 0, 1, 2, TCalc_DruidFrame);

	local naturalShapeshifter = TCalc_CreateTalentButton(TCalc_druidNaturalShapeshifter, TCalc_DruidFrame);
	TCalc_AddTalentButton(naturalShapeshifter, 0, 1, 3, TCalc_DruidFrame);

	--Tier 2

	local improvedThorns = TCalc_CreateTalentButton(TCalc_druidImprovedThorns, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedThorns, 0, 2, 0, TCalc_DruidFrame);

	local omenOfClarity = TCalc_CreateTalentButton(TCalc_druidOmenOfClarity, TCalc_DruidFrame);
	TCalc_AddTalentButton(omenOfClarity, 0, 2, 2, TCalc_DruidFrame);

	local naturesReach = TCalc_CreateTalentButton(TCalc_druidNaturesReach, TCalc_DruidFrame);
	TCalc_AddTalentButton(naturesReach, 0, 2, 3, TCalc_DruidFrame);

	--Tier 3

	local vengeance = TCalc_CreateTalentButton(TCalc_druidVengeance, TCalc_DruidFrame);
	TCalc_AddTalentButton(vengeance, 0, 3, 1, TCalc_DruidFrame);

	local improvedStarfire = TCalc_CreateTalentButton(TCalc_druidImprovedStarfire, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedStarfire, 0, 3, 2, TCalc_DruidFrame);

	--Tier 4

	local naturesGrace = TCalc_CreateTalentButton(TCalc_druidNaturesGrace, TCalc_DruidFrame);
	TCalc_AddTalentButton(naturesGrace, 0, 4, 1, TCalc_DruidFrame);

	local moonglow = TCalc_CreateTalentButton(TCalc_druidMoonglow, TCalc_DruidFrame);
	TCalc_AddTalentButton(moonglow, 0, 4, 2, TCalc_DruidFrame);

	--Tier 5
	
	local moonfury = TCalc_CreateTalentButton(TCalc_druidMoonfury, TCalc_DruidFrame);
	TCalc_AddTalentButton(moonfury, 0, 5, 1, TCalc_DruidFrame);

	--Tier 6

	local moonkinForm = TCalc_CreateTalentButton(TCalc_druidMoonkinForm, TCalc_DruidFrame);
	TCalc_AddTalentButton(moonkinForm, 0, 6, 1, TCalc_DruidFrame);

	--Tab 1
	--Tier 0

	local ferocity = TCalc_CreateTalentButton(TCalc_druidFerocity, TCalc_DruidFrame);
	TCalc_AddTalentButton(ferocity, 1, 0, 1, TCalc_DruidFrame);

	local feralAggression = TCalc_CreateTalentButton(TCalc_druidFeralAggression, TCalc_DruidFrame);
	TCalc_AddTalentButton(feralAggression, 1, 0, 2, TCalc_DruidFrame);

	--Tier 1

	local feralInstinct = TCalc_CreateTalentButton(TCalc_druidFeralInstinct, TCalc_DruidFrame);
	TCalc_AddTalentButton(feralInstinct, 1, 1, 0, TCalc_DruidFrame);

	local brutalImpact = TCalc_CreateTalentButton(TCalc_druidBrutalImpact, TCalc_DruidFrame);
	TCalc_AddTalentButton(brutalImpact, 1, 1, 1, TCalc_DruidFrame);

	local thickHide = TCalc_CreateTalentButton(TCalc_druidThickHide, TCalc_DruidFrame);
	TCalc_AddTalentButton(thickHide, 1, 1, 2, TCalc_DruidFrame);

	--Tier 2

	local felineSwiftness = TCalc_CreateTalentButton(TCalc_druidFelineSwiftness, TCalc_DruidFrame);
	TCalc_AddTalentButton(felineSwiftness, 1, 2, 0, TCalc_DruidFrame);

	local feralCharge = TCalc_CreateTalentButton(TCalc_druidFeralCharge, TCalc_DruidFrame);
	TCalc_AddTalentButton(feralCharge, 1, 2, 1, TCalc_DruidFrame);

	local sharpenedClaws = TCalc_CreateTalentButton(TCalc_druidSharpenedClaws, TCalc_DruidFrame);
	TCalc_AddTalentButton(sharpenedClaws, 1, 2, 2, TCalc_DruidFrame);

	--Tier 3

	local improvedShred = TCalc_CreateTalentButton(TCalc_druidImprovedShred, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedShred, 1, 3, 0, TCalc_DruidFrame);

	local predatoryStrikes = TCalc_CreateTalentButton(TCalc_druidPredatoryStrikes, TCalc_DruidFrame);
	TCalc_AddTalentButton(predatoryStrikes, 1, 3, 1, TCalc_DruidFrame);

	local bloodFrenzy = TCalc_CreateTalentButton(TCalc_druidBloodFrenzy, TCalc_DruidFrame);
	TCalc_AddTalentButton(bloodFrenzy, 1, 3, 2, TCalc_DruidFrame);

	local primalFury = TCalc_CreateTalentButton(TCalc_druidPrimalFury, TCalc_DruidFrame);
	TCalc_AddTalentButton(primalFury, 1, 3, 3, TCalc_DruidFrame);

	--Tier 4

	local savageFury = TCalc_CreateTalentButton(TCalc_druidSavageFury, TCalc_DruidFrame);
	TCalc_AddTalentButton(savageFury, 1, 4, 0, TCalc_DruidFrame);

	local faerieFireFeral = TCalc_CreateTalentButton(TCalc_druidFaerieFireFeral, TCalc_DruidFrame);
	TCalc_AddTalentButton(faerieFireFeral, 1, 4, 2, TCalc_DruidFrame);

	--Tier 5

	local heartOfTheWild = TCalc_CreateTalentButton(TCalc_druidHeartOfTheWild, TCalc_DruidFrame);
	TCalc_AddTalentButton(heartOfTheWild, 1, 5, 1, TCalc_DruidFrame);

	--Tier 6

	local leaderOfThePack = TCalc_CreateTalentButton(TCalc_druidLeaderOfThePack, TCalc_DruidFrame);
	TCalc_AddTalentButton(leaderOfThePack, 1, 6, 1, TCalc_DruidFrame);

	--Tab 2
	--Tier 0

	local improvedMarkOfTheWild = TCalc_CreateTalentButton(TCalc_druidImprovedMarkOfTheWild, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedMarkOfTheWild, 2, 0, 1, TCalc_DruidFrame);

	local furor = TCalc_CreateTalentButton(TCalc_druidFuror, TCalc_DruidFrame);
	TCalc_AddTalentButton(furor, 2, 0, 2, TCalc_DruidFrame);

	--Tier 1

	local improvedHealingTouch = TCalc_CreateTalentButton(TCalc_druidImprovedHealingTouch, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedHealingTouch, 2, 1, 0, TCalc_DruidFrame);

	local naturesFocus = TCalc_CreateTalentButton(TCalc_druidNaturesFocus, TCalc_DruidFrame);
	TCalc_AddTalentButton(naturesFocus, 2, 1, 1, TCalc_DruidFrame);

	local improvedEnrage = TCalc_CreateTalentButton(TCalc_druidImprovedEnrage, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedEnrage, 2, 1, 2, TCalc_DruidFrame);

	--Tier 2

	local reflection = TCalc_CreateTalentButton(TCalc_druidReflection, TCalc_DruidFrame);
	TCalc_AddTalentButton(reflection, 2, 2, 1, TCalc_DruidFrame);

	local insectSwarm = TCalc_CreateTalentButton(TCalc_druidInsectSwarm, TCalc_DruidFrame);
	TCalc_AddTalentButton(insectSwarm, 2, 2, 2, TCalc_DruidFrame);

	local subtlety = TCalc_CreateTalentButton(TCalc_druidSubtlety, TCalc_DruidFrame);
	TCalc_AddTalentButton(subtlety, 2, 2, 3, TCalc_DruidFrame);

	--Tier 3

	local tranquilSpirit = TCalc_CreateTalentButton(TCalc_druidTranquilSpirit, TCalc_DruidFrame);
	TCalc_AddTalentButton(tranquilSpirit, 2, 3, 1, TCalc_DruidFrame);

	local improvedRejuvenation = TCalc_CreateTalentButton(TCalc_druidImprovedRejuvenation, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedRejuvenation, 2, 3, 3, TCalc_DruidFrame);

	--Tier 4

	local naturesSwiftness = TCalc_CreateTalentButton(TCalc_druidNaturesSwiftness, TCalc_DruidFrame);
	TCalc_AddTalentButton(naturesSwiftness, 2, 4, 0, TCalc_DruidFrame);

	local giftOfNature = TCalc_CreateTalentButton(TCalc_druidGiftOfNature, TCalc_DruidFrame);
	TCalc_AddTalentButton(giftOfNature, 2, 4, 2, TCalc_DruidFrame);

	local improvedTranquility = TCalc_CreateTalentButton(TCalc_druidImprovedTranquility, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedTranquility, 2, 4, 3, TCalc_DruidFrame);

	--Tier 5

	local improvedRegrowth = TCalc_CreateTalentButton(TCalc_druidImprovedRegrowth, TCalc_DruidFrame);
	TCalc_AddTalentButton(improvedRegrowth, 2, 5, 2, TCalc_DruidFrame);

	--Tier 6

	local swiftmend = TCalc_CreateTalentButton(TCalc_druidSwiftmend, TCalc_DruidFrame);
	TCalc_AddTalentButton(swiftmend, 2, 6, 1, TCalc_DruidFrame);

end