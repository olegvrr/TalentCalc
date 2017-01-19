TCalc_MageFrame = nil;

TCalc_MageColor = {}
TCalc_MageColor.red=0.41
TCalc_MageColor.green=0.80
TCalc_MageColor.blue=0.94

function TCalc_InitMageFrame()
    if (TCalc_MageFrame ~= nil) then
	    return TCalc_MageFrame;
	end
    
    --Frame itself
	TCalc_MageFrame = CreateFrame("Frame",nil,TalentCalculator);
    TCalc_MageFrame:SetFrameStrata(TCalc_frameStrata);
    TCalc_MageFrame:SetWidth(TalentCalculator:GetWidth());
    TCalc_MageFrame:SetHeight(TalentCalculator:GetHeight());
    TCalc_MageFrame:SetPoint("TOPLEFT",0,0);
    TCalc_MageFrame:SetFrameLevel(TCalc_classFrameLevel);
    TCalc_MageFrame:Hide();
  
    TCalc_MageFrame.texture = TCalc_MageFrame:CreateTexture(nil,TCalc_frameStrata);
    TCalc_MageFrame.texture:SetTexture(TCalc_MageColor.red,TCalc_MageColor.green,TCalc_MageColor.blue, 0.7);
    TCalc_MageFrame.texture:SetAllPoints(TCalc_MageFrame);
    
    TCalc_InitTalentTabHolders(TCalc_MageFrame);
    TCalc_MageFrame.treeNames = {"Arcane","Fire","Frost"};
    TCalc_MageFrame.color = TCalc_MageColor;
    
    --Selector button
    local mageSelector = CreateFrame("Button",nil,TalentCalculator);
    mageSelector:SetFrameStrata(TCalc_frameStrata);
    mageSelector:SetWidth(90);
    mageSelector:SetHeight(20);
    mageSelector:SetPoint("TOPLEFT",TalentCalculator:GetWidth(),-40);
    mageSelector:SetFrameLevel(TCalc_classFrameLevel);
    mageSelector:SetText("Mage");
    mageSelector:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    mageSelector:SetScript("OnClick", TCalc_MageFrameActivated);
    mageSelector:Show();
  
    mageSelector.texture = mageSelector:CreateTexture(nil,TCalc_frameStrata);
    mageSelector.texture:SetTexture(TCalc_MageColor.red,TCalc_MageColor.green,TCalc_MageColor.blue, 0.7);
    mageSelector.texture:SetAllPoints(mageSelector);
    
    
    
    TCalc_InitMageTalentButtons();
    
    return TCalc_MageFrame;
end

function TCalc_MageFrameActivated()
    TCalc_SwitchFrame(TCalc_MageFrame);
end

function TCalc_InitMageTalentButtons()
    
	--Tab 0
	--Tier 0
	
	local arcaneSubtlety = TCalc_CreateTalentButton(TCalc_mageArcaneSubtlety, TCalc_MageFrame);
    TCalc_AddTalentButton(arcaneSubtlety, 0, 0, 0, TCalc_MageFrame);
	
	local arcaneFocus = TCalc_CreateTalentButton(TCalc_mageArcaneFocus, TCalc_MageFrame);
    TCalc_AddTalentButton(arcaneFocus, 0, 0, 1, TCalc_MageFrame);
	
	local improvedArcaneMissiles = TCalc_CreateTalentButton(TCalc_mageImprovedArcaneMissiles, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedArcaneMissiles, 0, 0, 2, TCalc_MageFrame);
	
	--Tier 1
	
	local wandSpecialization = TCalc_CreateTalentButton(TCalc_mageWandSpecialization, TCalc_MageFrame);
    TCalc_AddTalentButton(wandSpecialization, 0, 1, 0, TCalc_MageFrame);
	
	local magicAbsorption = TCalc_CreateTalentButton(TCalc_mageMagicAbsorption, TCalc_MageFrame);
    TCalc_AddTalentButton(magicAbsorption, 0, 1, 1, TCalc_MageFrame);
	
	local arcaneConcentration = TCalc_CreateTalentButton(TCalc_mageArcaneConcentration, TCalc_MageFrame);
    TCalc_AddTalentButton(arcaneConcentration, 0, 1, 2, TCalc_MageFrame);
	
	--Tier 2
	
	local magicAttunement = TCalc_CreateTalentButton(TCalc_mageMagicAttunement, TCalc_MageFrame);
    TCalc_AddTalentButton(magicAttunement, 0, 2, 0, TCalc_MageFrame);
	
	local improvedArcaneExplosion = TCalc_CreateTalentButton(TCalc_mageImprovedArcaneExplosion, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedArcaneExplosion, 0, 2, 1, TCalc_MageFrame);
	
	local arcaneResilience = TCalc_CreateTalentButton(TCalc_mageArcaneResilience, TCalc_MageFrame);
    TCalc_AddTalentButton(arcaneResilience, 0, 2, 2, TCalc_MageFrame);
	
	--Tier 3
	
	local improvedManaShield = TCalc_CreateTalentButton(TCalc_mageImprovedManaShield, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedManaShield, 0, 3, 0, TCalc_MageFrame);
	
	local improvedCounterspell = TCalc_CreateTalentButton(TCalc_mageImprovedCounterspell, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedCounterspell, 0, 3, 1, TCalc_MageFrame);
	
	local arcaneMeditation = TCalc_CreateTalentButton(TCalc_mageArcaneMeditation, TCalc_MageFrame);
    TCalc_AddTalentButton(arcaneMeditation, 0, 3, 3, TCalc_MageFrame);
	
	--Tier 4
	
	local presenceOfMind = TCalc_CreateTalentButton(TCalc_magePresenceOfMind, TCalc_MageFrame);
    TCalc_AddTalentButton(presenceOfMind, 0, 4, 1, TCalc_MageFrame);
	
	local arcaneMind = TCalc_CreateTalentButton(TCalc_mageArcaneMind, TCalc_MageFrame);
    TCalc_AddTalentButton(arcaneMind, 0, 4, 2, TCalc_MageFrame);
	
	--Tier 5
	
	local arcaneInstability = TCalc_CreateTalentButton(TCalc_mageArcaneInstability, TCalc_MageFrame);
    TCalc_AddTalentButton(arcaneInstability, 0, 5, 1, TCalc_MageFrame);
	
	--Tier 6
	
	local arcanePower = TCalc_CreateTalentButton(TCalc_mageArcanePower, TCalc_MageFrame);
    TCalc_AddTalentButton(arcanePower, 0, 6, 1, TCalc_MageFrame);
	
	--Tab 1
	--Tier0
	
	local improvedFireball = TCalc_CreateTalentButton(TCalc_mageImprovedFireball, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedFireball, 1, 0, 1, TCalc_MageFrame);

	local impact = TCalc_CreateTalentButton(TCalc_mageImpact, TCalc_MageFrame);
    TCalc_AddTalentButton(impact, 1, 0, 2, TCalc_MageFrame);

	--Tier 1
	
	local ignite = TCalc_CreateTalentButton(TCalc_mageIgnite, TCalc_MageFrame);
    TCalc_AddTalentButton(ignite, 1, 1, 0, TCalc_MageFrame);

	local flameThrowing = TCalc_CreateTalentButton(TCalc_mageFlameThrowing, TCalc_MageFrame);
    TCalc_AddTalentButton(flameThrowing, 1, 1, 1, TCalc_MageFrame);

	local improvedFireBlast = TCalc_CreateTalentButton(TCalc_mageImprovedFireBlast, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedFireBlast, 1, 1, 2, TCalc_MageFrame);

	--Tier 2
	
	local incinerate = TCalc_CreateTalentButton(TCalc_mageIncinerate, TCalc_MageFrame);
    TCalc_AddTalentButton(incinerate, 1, 2, 0, TCalc_MageFrame);

	local improvedFlamestrike = TCalc_CreateTalentButton(TCalc_mageImprovedFlamestrike, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedFlamestrike, 1, 2, 1, TCalc_MageFrame);

	local pyroblast = TCalc_CreateTalentButton(TCalc_magePyroblast, TCalc_MageFrame);
    TCalc_AddTalentButton(pyroblast, 1, 2, 2, TCalc_MageFrame);

	local burningSoul = TCalc_CreateTalentButton(TCalc_mageBurningSoul, TCalc_MageFrame);
    TCalc_AddTalentButton(burningSoul, 1, 2, 3, TCalc_MageFrame);

	--Tier 3
	
	local improvedScorch = TCalc_CreateTalentButton(TCalc_mageImprovedScorch, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedScorch, 1, 3, 0, TCalc_MageFrame);

	local improvedFireWard = TCalc_CreateTalentButton(TCalc_mageImprovedFireWard, TCalc_MageFrame);
    TCalc_AddTalentButton(improvedFireWard, 1, 3, 1, TCalc_MageFrame);

	local masterOfElements = TCalc_CreateTalentButton(TCalc_mageMasterOfElements, TCalc_MageFrame);
    TCalc_AddTalentButton(masterOfElements, 1, 3, 3, TCalc_MageFrame);

	--Tier 4
	
	local criticalMass = TCalc_CreateTalentButton(TCalc_mageCriticalMass, TCalc_MageFrame);
	TCalc_AddTalentButton(criticalMass, 1, 4, 1, TCalc_MageFrame);
	
	local blastWave = TCalc_CreateTalentButton(TCalc_mageBlastWave, TCalc_MageFrame);
	TCalc_AddTalentButton(blastWave, 1, 4, 2, TCalc_MageFrame);
	
	--Tier 5
	
	local firePower = TCalc_CreateTalentButton(TCalc_mageFirePower, TCalc_MageFrame);
	TCalc_AddTalentButton(firePower, 1, 5, 2, TCalc_MageFrame);
	
	--Tier 6
	
	local combustion = TCalc_CreateTalentButton(TCalc_mageCombustion, TCalc_MageFrame);
	TCalc_AddTalentButton(combustion, 1, 6, 1, TCalc_MageFrame);
	
	--Tab 2
	--Tier 0
	
	local frostWarding = TCalc_CreateTalentButton(TCalc_mageFrostWarding, TCalc_MageFrame);
	TCalc_AddTalentButton(frostWarding, 2, 0, 0, TCalc_MageFrame);

	local improvedFrostbolt = TCalc_CreateTalentButton(TCalc_mageImprovedFrostbolt, TCalc_MageFrame);
	TCalc_AddTalentButton(improvedFrostbolt, 2, 0, 1, TCalc_MageFrame);

	local elementalPrecision = TCalc_CreateTalentButton(TCalc_mageElementalPrecision, TCalc_MageFrame);
	TCalc_AddTalentButton(elementalPrecision, 2, 0, 2, TCalc_MageFrame);

	--Tier 1
	
	local iceShards = TCalc_CreateTalentButton(TCalc_mageIceShards, TCalc_MageFrame);
	TCalc_AddTalentButton(iceShards, 2, 1, 0, TCalc_MageFrame);

	local frostbite = TCalc_CreateTalentButton(TCalc_mageFrostbite, TCalc_MageFrame);
	TCalc_AddTalentButton(frostbite, 2, 1, 1, TCalc_MageFrame);
	
	local improvedFrostNova = TCalc_CreateTalentButton(TCalc_mageImprovedFrostNova, TCalc_MageFrame);
	TCalc_AddTalentButton(improvedFrostNova, 2, 1, 2, TCalc_MageFrame);
	
	local permafrost = TCalc_CreateTalentButton(TCalc_magePermafrost, TCalc_MageFrame);
	TCalc_AddTalentButton(permafrost, 2, 1, 3, TCalc_MageFrame);

	--Tier 2
	
	local piercingIce = TCalc_CreateTalentButton(TCalc_magePiercingIce, TCalc_MageFrame);
	TCalc_AddTalentButton(piercingIce, 2, 2, 0, TCalc_MageFrame);
	
	local coldSnap = TCalc_CreateTalentButton(TCalc_mageColdSnap, TCalc_MageFrame);
	TCalc_AddTalentButton(coldSnap, 2, 2, 1, TCalc_MageFrame);
	
	local improvedBlizzard = TCalc_CreateTalentButton(TCalc_mageImprovedBlizzard, TCalc_MageFrame);
	TCalc_AddTalentButton(improvedBlizzard, 2, 2, 3, TCalc_MageFrame);

	--Tier 3
	
	local arcticReach = TCalc_CreateTalentButton(TCalc_mageArcticReach, TCalc_MageFrame);
	TCalc_AddTalentButton(arcticReach, 2, 3, 0, TCalc_MageFrame);

	local frostChanneling = TCalc_CreateTalentButton(TCalc_mageFrostChanneling, TCalc_MageFrame);
	TCalc_AddTalentButton(frostChanneling, 2, 3, 1, TCalc_MageFrame);

	local shatter = TCalc_CreateTalentButton(TCalc_mageShatter, TCalc_MageFrame);
	TCalc_AddTalentButton(shatter, 2, 3, 2, TCalc_MageFrame);
	
	--Tier 4
	
	local iceBlock = TCalc_CreateTalentButton(TCalc_mageIceBlock, TCalc_MageFrame);
	TCalc_AddTalentButton(iceBlock, 2, 4, 1, TCalc_MageFrame);

	local improvedConeOfCold = TCalc_CreateTalentButton(TCalc_mageImprovedConeOfCold, TCalc_MageFrame);
	TCalc_AddTalentButton(improvedConeOfCold, 2, 4, 2, TCalc_MageFrame);

	--Tier 5
	
	local wintersChill = TCalc_CreateTalentButton(TCalc_mageWintersChill, TCalc_MageFrame);
	TCalc_AddTalentButton(wintersChill, 2, 5, 2, TCalc_MageFrame);

	--Tier 6
	
	local iceBarrier = TCalc_CreateTalentButton(TCalc_mageIceBarrier, TCalc_MageFrame);
	TCalc_AddTalentButton(iceBarrier, 2, 6, 1, TCalc_MageFrame);

end