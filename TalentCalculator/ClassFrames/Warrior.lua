TCalc_WarriorFrame = nil;

TCalc_WarriorColor = {}
TCalc_WarriorColor.red=0.78
TCalc_WarriorColor.green=0.61
TCalc_WarriorColor.blue=0.43

function TCalc_InitWarriorFrame()
    if (TCalc_WarriorFrame ~= nil) then
	    return TCalc_WarriorFrame;
	end
    
    --Frame itself
	TCalc_WarriorFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_WarriorFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_WarriorFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_WarriorFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_WarriorFrame:SetPoint("TOPLEFT",0,0);
    TCalc_WarriorFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_WarriorFrame:Hide();
  
    TCalc_WarriorFrame.texture = TCalc_WarriorFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_WarriorFrame.texture:SetTexture(TCalc_WarriorColor.red,TCalc_WarriorColor.green,TCalc_WarriorColor.blue, 0.7);
    TCalc_WarriorFrame.texture:SetAllPoints(TCalc_WarriorFrame);
    
    TCalc_InitTalentTabHolders(TCalc_WarriorFrame);
    TCalc_WarriorFrame.treeNames = {"Arms","Fury","Protection"};
    
    --Selector button
    local warriorSelector = CreateFrame("Button",nil,TalentCalculator);
    warriorSelector:SetFrameStrata(TCalc_frameStrata);
    warriorSelector:SetWidth(90);
    warriorSelector:SetHeight(20);
    warriorSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),-160);
    warriorSelector:SetFrameLevel(TCalc_classFrameLevel);
    warriorSelector:SetText("Warrior");
    warriorSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    warriorSelector:SetScript("OnClick", TCalc_WarriorFrameActivated);
    warriorSelector:Show();
  
    warriorSelector.texture = warriorSelector:CreateTexture(nil,TCalc_frameStrata);
    warriorSelector.texture:SetTexture(TCalc_WarriorColor.red,TCalc_WarriorColor.green,TCalc_WarriorColor.blue, 0.7);
    warriorSelector.texture:SetAllPoints(warriorSelector);
    
    TCalc_InitWarriorTalentButtons();
    
    return TCalc_WarriorFrame;
end

function TCalc_WarriorFrameActivated()
    TCalc_SwitchFrame(TCalc_WarriorFrame);
end

function TCalc_InitWarriorTalentButtons()
    --Tab 0
    --Tier 0
    local heroicStrikeTalentButton = TCalc_CreateTalentButton(TCalc_warriorImprovedHeroicStrike, TCalc_WarriorFrame);
    TCalc_AddTalentButton(heroicStrikeTalentButton, 0, 0, 0, TCalc_WarriorFrame);
    
    local heroicDeflection = TCalc_CreateTalentButton(TCalc_warriorDeflection, TCalc_WarriorFrame);
    TCalc_AddTalentButton(heroicDeflection, 0, 0, 1, TCalc_WarriorFrame);
    
    local improvedRend = TCalc_CreateTalentButton(TCalc_warriorImprovedRend, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedRend, 0, 0, 2, TCalc_WarriorFrame);
    
    --Tier 1
    local improvedCharge = TCalc_CreateTalentButton(TCalc_warriorImprovedCharge, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedCharge, 0, 1, 0, TCalc_WarriorFrame);
    
    local tacticalMastery = TCalc_CreateTalentButton(TCalc_warriorTacticalMastery, TCalc_WarriorFrame);
    TCalc_AddTalentButton(tacticalMastery, 0, 1, 1, TCalc_WarriorFrame);
    
    local thunderClap = TCalc_CreateTalentButton(TCalc_warriorImprovedThunderClap, TCalc_WarriorFrame);
    TCalc_AddTalentButton(thunderClap, 0, 1, 3, TCalc_WarriorFrame);
    
    --Tier 2
    local improvedOverpower = TCalc_CreateTalentButton(TCalc_warriorImprovedOverpower, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedOverpower, 0, 2, 0, TCalc_WarriorFrame);
    
    local angerManagement = TCalc_CreateTalentButton(TCalc_warriorAngerManagement, TCalc_WarriorFrame);
    TCalc_AddTalentButton(angerManagement, 0, 2, 1, TCalc_WarriorFrame);
    
    local deepWounds = TCalc_CreateTalentButton(TCalc_warriorDeepWounds, TCalc_WarriorFrame);
    TCalc_AddTalentButton(deepWounds, 0, 2, 2, TCalc_WarriorFrame);
    
    --Tier 3
    local twoHandedWeaponSpecialization = TCalc_CreateTalentButton(TCalc_warriorTwoHandedWeaponSpecialization, TCalc_WarriorFrame);
    TCalc_AddTalentButton(twoHandedWeaponSpecialization, 0, 3, 1, TCalc_WarriorFrame);
    
    local impale = TCalc_CreateTalentButton(TCalc_warriorImpale, TCalc_WarriorFrame);
    TCalc_AddTalentButton(impale, 0, 3, 2, TCalc_WarriorFrame);
    
    --Tier4
    local warriorAxeSpecialization = TCalc_CreateTalentButton(TCalc_warriorAxeSpecialization, TCalc_WarriorFrame);
    TCalc_AddTalentButton(warriorAxeSpecialization, 0, 4, 0, TCalc_WarriorFrame);
    
    local warriorSweepingStrikes = TCalc_CreateTalentButton(TCalc_warriorSweepingStrikes, TCalc_WarriorFrame);
    TCalc_AddTalentButton(warriorSweepingStrikes, 0, 4, 1, TCalc_WarriorFrame);
    
    local warriorMaceSpecialization = TCalc_CreateTalentButton(TCalc_warriorMaceSpecialization, TCalc_WarriorFrame);
    TCalc_AddTalentButton(warriorMaceSpecialization, 0, 4, 2, TCalc_WarriorFrame);
    
    local warriorSwordSpecialization = TCalc_CreateTalentButton(TCalc_warriorSwordSpecialization, TCalc_WarriorFrame);
    TCalc_AddTalentButton(warriorSwordSpecialization, 0, 4, 3, TCalc_WarriorFrame);
    
    --Tier5
    local warriorPolearmSpecialization = TCalc_CreateTalentButton(TCalc_warriorPolearmSpecialization, TCalc_WarriorFrame);
    TCalc_AddTalentButton(warriorPolearmSpecialization, 0, 5, 0, TCalc_WarriorFrame);
    
    local warriorImprovedHamstring = TCalc_CreateTalentButton(TCalc_warriorImprovedHamstring, TCalc_WarriorFrame);
    TCalc_AddTalentButton(warriorImprovedHamstring, 0, 5, 2, TCalc_WarriorFrame);
    
    --Tier6
    local warriorMortalStrike = TCalc_CreateTalentButton(TCalc_warriorMortalStrike, TCalc_WarriorFrame);
    TCalc_AddTalentButton(warriorMortalStrike, 0, 6, 1, TCalc_WarriorFrame);
    
    --Tab 1
    --Tier 0
    local boomingVoice = TCalc_CreateTalentButton(TCalc_warriorBoomingVoice, TCalc_WarriorFrame);
    TCalc_AddTalentButton(boomingVoice, 1, 0, 1, TCalc_WarriorFrame);
    
    local cruelty = TCalc_CreateTalentButton(TCalc_warriorCruelty, TCalc_WarriorFrame);
    TCalc_AddTalentButton(cruelty, 1, 0, 2, TCalc_WarriorFrame);
    
    --Tier 1
    local improvedDemoralizingShout = TCalc_CreateTalentButton(TCalc_warriorImprovedDemoralizingShout, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedDemoralizingShout, 1, 1, 1, TCalc_WarriorFrame);
    
    local unbridledWrath = TCalc_CreateTalentButton(TCalc_warriorUnbridledWrath, TCalc_WarriorFrame);
    TCalc_AddTalentButton(unbridledWrath, 1, 1, 2, TCalc_WarriorFrame);
    
    --Tier 2
    local improvedCleave = TCalc_CreateTalentButton(TCalc_warriorImprovedCleave, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedCleave, 1, 2, 0, TCalc_WarriorFrame);
    
    local piercingHowl = TCalc_CreateTalentButton(TCalc_warriorPiercingHowl, TCalc_WarriorFrame);
    TCalc_AddTalentButton(piercingHowl, 1, 2, 1, TCalc_WarriorFrame);
    
    local bloodCraze = TCalc_CreateTalentButton(TCalc_warriorBloodCraze, TCalc_WarriorFrame);
    TCalc_AddTalentButton(bloodCraze, 1, 2, 2, TCalc_WarriorFrame);
    
    local improvedBattleShout = TCalc_CreateTalentButton(TCalc_warriorImprovedBattleShout, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedBattleShout, 1, 2, 3, TCalc_WarriorFrame);
    
    --Tier 3
    local dualWieldSpecialization = TCalc_CreateTalentButton(TCalc_warriorDualWieldSpecialization, TCalc_WarriorFrame);
    TCalc_AddTalentButton(dualWieldSpecialization, 1, 3, 0, TCalc_WarriorFrame);
    
    local improvedExecute = TCalc_CreateTalentButton(TCalc_warriorImprovedExecute, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedExecute, 1, 3, 1, TCalc_WarriorFrame);
    
    local enrage = TCalc_CreateTalentButton(TCalc_warriorEnrage, TCalc_WarriorFrame);
    TCalc_AddTalentButton(enrage, 1, 3, 2, TCalc_WarriorFrame);
    
    --Tier 4
    local improvedSlam = TCalc_CreateTalentButton(TCalc_warriorImprovedSlam, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedSlam, 1, 4, 0, TCalc_WarriorFrame);
    
    local deathWish = TCalc_CreateTalentButton(TCalc_warriorDeathWish, TCalc_WarriorFrame);
    TCalc_AddTalentButton(deathWish, 1, 4, 1, TCalc_WarriorFrame);
    
    local improvedIntercept = TCalc_CreateTalentButton(TCalc_warriorImprovedIntercept, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedIntercept, 1, 4, 3, TCalc_WarriorFrame);
    
    --Tier 5
    local improvedBerserkerRage = TCalc_CreateTalentButton(TCalc_warriorImprovedBerserkerRage, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedBerserkerRage, 1, 5, 0, TCalc_WarriorFrame);
    
    local flurry = TCalc_CreateTalentButton(TCalc_warriorFlurry, TCalc_WarriorFrame);
    TCalc_AddTalentButton(flurry, 1, 5, 2, TCalc_WarriorFrame);
    
    --Tier 6
    local bloodthirst = TCalc_CreateTalentButton(TCalc_warriorBloodthirst, TCalc_WarriorFrame);
    TCalc_AddTalentButton(bloodthirst, 1, 6, 1, TCalc_WarriorFrame);
    
    --Tab 2
    --Tier 0
    local shieldSpecialization = TCalc_CreateTalentButton(TCalc_warriorShieldSpecialization, TCalc_WarriorFrame);
    TCalc_AddTalentButton(shieldSpecialization, 2, 0, 1, TCalc_WarriorFrame);
    
    local anticipation = TCalc_CreateTalentButton(TCalc_warriorAnticipation, TCalc_WarriorFrame);
    TCalc_AddTalentButton(anticipation, 2, 0, 2, TCalc_WarriorFrame);
    
    --Tier 1
    local improvedBloodrage = TCalc_CreateTalentButton(TCalc_warriorImprovedBloodrage, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedBloodrage, 2, 1, 0, TCalc_WarriorFrame);
    
    local toughness = TCalc_CreateTalentButton(TCalc_warriorToughness, TCalc_WarriorFrame);
    TCalc_AddTalentButton(toughness, 2, 1, 2, TCalc_WarriorFrame);
    
    local ironWill = TCalc_CreateTalentButton(TCalc_warriorIronWill, TCalc_WarriorFrame);
    TCalc_AddTalentButton(ironWill, 2, 1, 3, TCalc_WarriorFrame);
    
    --Tier 2
    local lastStand = TCalc_CreateTalentButton(TCalc_warriorLastStand, TCalc_WarriorFrame);
    TCalc_AddTalentButton(lastStand, 2, 2, 0, TCalc_WarriorFrame);
    
    local improvedShieldBlock = TCalc_CreateTalentButton(TCalc_warriorImprovedShieldBlock, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedShieldBlock, 2, 2, 1, TCalc_WarriorFrame);
    
    local improvedRevenge = TCalc_CreateTalentButton(TCalc_warriorImprovedRevenge, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedRevenge, 2, 2, 2, TCalc_WarriorFrame);
    
    local defiance = TCalc_CreateTalentButton(TCalc_warriorDefiance, TCalc_WarriorFrame);
    TCalc_AddTalentButton(defiance, 2, 2, 3, TCalc_WarriorFrame);
    
    --Tier 3
    local improvedSunderArmor = TCalc_CreateTalentButton(TCalc_warriorImprovedSunderArmor, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedSunderArmor, 2, 3, 0, TCalc_WarriorFrame);
    
    local improvedDisarm = TCalc_CreateTalentButton(TCalc_warriorImprovedDisarm, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedDisarm, 2, 3, 1, TCalc_WarriorFrame);
    
    local improvedTaunt = TCalc_CreateTalentButton(TCalc_warriorImprovedTaunt, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedTaunt, 2, 3, 2, TCalc_WarriorFrame);
    
    --Tier 4
    local improvedShieldWall = TCalc_CreateTalentButton(TCalc_warriorImprovedShieldWall, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedShieldWall, 2, 4, 0, TCalc_WarriorFrame);
    
    local concussionBlow = TCalc_CreateTalentButton(TCalc_warriorConcussionBlow, TCalc_WarriorFrame);
    TCalc_AddTalentButton(concussionBlow, 2, 4, 1, TCalc_WarriorFrame);
    
    local improvedShieldBash = TCalc_CreateTalentButton(TCalc_warriorImprovedShieldBash, TCalc_WarriorFrame);
    TCalc_AddTalentButton(improvedShieldBash, 2, 4, 2, TCalc_WarriorFrame);
    
    --Tier 5
    local oneHandedWeaponSpecialization = TCalc_CreateTalentButton(TCalc_warriorOneHandedWeaponSpecialization, TCalc_WarriorFrame);
    TCalc_AddTalentButton(oneHandedWeaponSpecialization, 2, 5, 2, TCalc_WarriorFrame);
    
    --Tier 6
    local shieldSlam = TCalc_CreateTalentButton(TCalc_warriorShieldSlam, TCalc_WarriorFrame);
    TCalc_AddTalentButton(shieldSlam, 2, 6, 1, TCalc_WarriorFrame);
end