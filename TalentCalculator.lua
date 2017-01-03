TCalc_frameStrata = "DIALOG";
TCalc_mainFrameLevel = 0;
TCalc_classFrameLevel = 0;
TCalc_talentButtonLevel = 1;

TCalc_talentsTopOffset = 80;
TCalc_talentsLeftOffset = 30;
TCalc_tierReqOffset = 30;

TCalc_maxTalents = 51;
TCalc_resetActiveTalentsButton = nil;

TCalc_classIndexToName = {
[0] = "Druid",
[1] = "Hunter",
[2] = "Mage",
[3] = "Paladin",
[4] = "Priest",
[5] = "Rogue",
[6] = "Shaman",
[7] = "Warlock",
[8] = "Warrior",
}

TCalc_classNameToIndex = {
["Druid"] = 0,
["Hunter"] = 1,
["Mage"] = 2,
["Paladin"] = 3,
["Priest"] = 4,
["Rogue"] = 5,
["Shaman"] = 6,
["Warlock"] = 7,
["Warrior"] = 8,
}

TCalc_frames = {}
TCalc_activeFrame = nil;

TCalc_commsIndex = "TalentCalculator";

TCalc_nameWaiting = nil;

TCalc_inspectRequestCode = "ireq";
TCalc_inspectResponseCode = "ires";

function TCalc_OnLoad()
    this:RegisterEvent("ADDON_LOADED");
    this:RegisterEvent("CHAT_MSG_ADDON");
    this:RegisterEvent("PLAYER_TARGET_CHANGED");
end

function TCalc_OnEvent(event)
    if(event == "CHAT_MSG_ADDON" and arg1 == TCalc_commsIndex) then
        TCalc_ProcessMessage(arg2,arg4,arg3);
        return;
    end
    if(event == "ADDON_LOADED" and arg1 == TCalc_commsIndex) then
        TCalc_InitFrames();
        return;
    end
    if (event == "PLAYER_TARGET_CHANGED") then
        TCalc_TargetChanged();
  end
end

function TCalc_ProcessMessage(targetMessage, sender, channel)
    --ChatFrame1:AddMessage(targetMessage .. ' ' .. sender);
    --Minimal code length is 4
    local messageLength = string.len(targetMessage);
    if(messageLength < 4) then
        --Do not event try to process it if string is not long enough
        return;
    end

    local code = string.sub(targetMessage, 1, 4);
    
    if (code == TCalc_inspectRequestCode) then
        local requestTarget = string.sub(targetMessage, 5, messageLength);
        --If I am not the target of request => do nothing
        if (requestTarget ~= UnitName('player')) then
            return;
        end
        TCalc_AnswerTalentRequest(channel);
        return;
    end

    if (code == TCalc_inspectResponseCode and sender == TCalc_nameWaiting) then
        local classNumber = string.sub(targetMessage, 5, 5);
        local targetFrame = TCalc_frames[classNumber];
        TCalc_SwitchFrame(targetFrame);
        local talentString = string.sub(targetMessage, 6, messageLength);
        TCalc_DisplayTalentsFromString(talentString);
        TCalc_activeFrame.talentNameLabel:SetText(sender);
    end
end

function TCalc_DisplayTalentsFromString(talentString)
    TCalc_ResetCurrentTalents();
    local activeTabs = TCalc_activeFrame.tabs;
    local talentIndex = 1;
    for tab=0, 2 do
        local currentActiveTab = activeTabs[tab];
        for j=0, 6 do
            local currentActiveTier = currentActiveTab.tiers[j];
            for k = 0, 3 do
                if(currentActiveTier[k] ~= nil) then
                    local talentPoints = string.sub(talentString, talentIndex, talentIndex);
                    for point = 1, talentPoints do
                        TCalc_LearnTalent(currentActiveTier[k]);
                    end
                    talentIndex = talentIndex + 1;
                end
            end
        end
    end
    TCalc_UpdateTalentDisplay();
    TCalc_MouseLeaveTalent();
end

function TCalc_AnswerTalentRequest(channel)
    local resultMessage = TCalc_inspectResponseCode .. TCalc_classNameToIndex[UnitClass('target')];
    
    for tabIndex = 1, 3 do
        local numLatents = GetNumTalents(tabIndex);
        for talentIndex = 1, numLatents do
            _, _, _, _, points = GetTalentInfo(tabIndex, talentIndex);
            resultMessage = resultMessage .. points;
        end
    end
    TCalc_SendMessage(TCalc_commsIndex, resultMessage, channel);
end

function TCalc_TargetChanged()
    if (TCalc_GetGroupChannelForTarget() ~= nil) then
        TalentCalculatorInspectButton:Enable();
        TalentCalculatorInspectButton.texture:SetTexture(0.3,0.7,0.3,0.8);
    else
        TalentCalculatorInspectButton:Disable();
        TalentCalculatorInspectButton.texture:SetTexture(0.2,0.2,0.2,0.8);
    end
end

function TCalc_InspectTarget()
    if (TCalc_GetGroupChannelForTarget() == nil) then
        return;
    end

    local commsChannel = TCalc_GetGroupChannelForTarget();
    local targetName = UnitName("target");
    
    local targetFrame = TCalc_frames[TCalc_classNameToIndex[UnitClass("target")]];
    TCalc_SwitchFrame(targetFrame);
    targetFrame.talentNameLabel:SetText("Requesting "..targetName);
    TCalc_nameWaiting = targetName;
    
    TCalc_SendMessage(TCalc_commsIndex, TCalc_inspectRequestCode .. targetName, commsChannel);
end

function TCalc_SendMessage(prefix, message, channel)
    if (channel == "SELF") then
        TCalc_ProcessMessage(message, UnitName("target"), channel);
    else
        SendAddonMessage(prefix, message, channel);
    end
end

function TCalc_GetGroupChannelForTarget()
    if (UnitName("target") == UnitName("player")) then
        return "SELF";
    end

    if (UnitInParty("target")) then
        return "PARTY";
    end
    
    if (UnitInRaid("target")) then
        return "RAID";
    end
    
    if (GetGuildInfo("target") == GetGuildInfo("player")) then
        return "GUILD";
    end
    
    return nil;
end

function TCalc_SwitchFrame(activatedFrame)
    if(TCalc_activeFrame ~= nil) then
        TCalc_activeFrame:Hide();
    end
    TCalc_activeFrame = activatedFrame;
    activatedFrame:Show();
    TCalc_UpdateTalentDisplay();
    
    if(not TCalc_resetActiveTalentsButton:IsShown())then
        TCalc_resetActiveTalentsButton:Show();
    end
    TCalc_nameWaiting = nil;
end

function TCalc_InitFrames()
    TalentCalculator:SetFrameLevel(TCalc_mainFrameLevel);

    TCalc_frames[0] = TCalc_InitDruidFrame();
    TCalc_frames[1] = TCalc_InitHunterFrame();
    TCalc_frames[2] = TCalc_InitMageFrame();
    TCalc_frames[3] = TCalc_InitPaladinFrame();
    TCalc_frames[4] = TCalc_InitPriestFrame();
    TCalc_frames[5] = TCalc_InitRogueFrame();
    TCalc_frames[6] = TCalc_InitShamanFrame();
    TCalc_frames[7] = TCalc_InitWarlockFrame();
    TCalc_frames[8] = TCalc_InitWarriorFrame();
    
    for i =0, 8 do
        local currentFrame = TCalc_frames[i];
        currentFrame.tabNumberLabels={};
       
        for tabIndex= 0, 2 do
            --Labels for number of talents invested in each tab1
            local tabNumberLabel = CreateFrame("Button",nil,currentFrame);
            tabNumberLabel:SetFrameStrata(TCalc_frameStrata);
            tabNumberLabel:SetWidth(40);
            tabNumberLabel:SetHeight(40);
            tabNumberLabel:SetFrameLevel(TCalc_talentButtonLevel);
            tabNumberLabel:Disable();
            --tabNumberLabel:SetText("treeName: 0");
            tabNumberLabel:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
            tabNumberLabel:Show();
            
            local tabNumberLabelX = TCalc_talentsLeftOffset*3.5 + tabIndex * 250;
            local tabNumberLabelY = TCalc_talentsTopOffset/2;
            tabNumberLabel:SetPoint("TOPLEFT", tabNumberLabelX, -tabNumberLabelY);
            currentFrame.tabNumberLabels[tabIndex] = tabNumberLabel;
            
            --Tier requirement labels
            for rowNumber = 0, 6 do
                local tierLabel = CreateFrame("Button",nil,currentFrame);
                tierLabel:SetFrameStrata(TCalc_frameStrata);
                tierLabel:SetWidth(40);
                tierLabel:SetHeight(40);
                tierLabel:SetFrameLevel(TCalc_talentButtonLevel);
                tierLabel:Disable();
                tierLabel:SetText("|cFFAAAA55"..(rowNumber * 5));
                tierLabel:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
                tierLabel:Show();
                
                local tierLabelX = -10 + tabIndex * 250;
                local tierLabelY = TCalc_talentsTopOffset + rowNumber * 55;
                tierLabel:SetPoint("TOPLEFT", tierLabelX, -tierLabelY);
            end
        end
        
        --Total points invested label
        local totalPointsLabel = CreateFrame("Button",nil,currentFrame);
        totalPointsLabel:SetFrameStrata(TCalc_frameStrata);
        totalPointsLabel:SetWidth(40);
        totalPointsLabel:SetHeight(40);
        totalPointsLabel:SetFrameLevel(TCalc_talentButtonLevel);
        totalPointsLabel:Disable();
        --totalPointsLabel:SetText("Total: 0");
        totalPointsLabel:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
        totalPointsLabel:Show();
        
        local totalPointsLabelX = TalentCalculator:GetWidth()/2-20;
        local totalPointsLabelY = 0;
        totalPointsLabel:SetPoint("TOPLEFT", totalPointsLabelX, -totalPointsLabelY);
        
        currentFrame.totalPointsLabel = totalPointsLabel;
        
        --Talent Name label
        local talentNameLabel = CreateFrame("Button",nil,currentFrame);
        talentNameLabel:SetFrameStrata(TCalc_frameStrata);
        talentNameLabel:SetWidth(80);
        talentNameLabel:SetHeight(40);
        talentNameLabel:SetFrameLevel(TCalc_talentButtonLevel);
        talentNameLabel:Disable();
        talentNameLabel:SetText("Local");
        talentNameLabel:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
        talentNameLabel:Show();
        
        local talentNameLabelX = TalentCalculator:GetWidth()/2-200;
        local talentNameLabelY = 0;
        talentNameLabel:SetPoint("TOPLEFT", talentNameLabelX, -talentNameLabelY);
        
        currentFrame.talentNameLabel = talentNameLabel;
    end
    
    --Reset all talents in current active tab button
    TCalc_resetActiveTalentsButton = CreateFrame("Button",nil,TalentCalculator);
    TCalc_resetActiveTalentsButton:SetFrameStrata(TCalc_frameStrata);
    TCalc_resetActiveTalentsButton:SetWidth(50);
    TCalc_resetActiveTalentsButton:SetHeight(30);
    TCalc_resetActiveTalentsButton:SetFrameLevel(TCalc_talentButtonLevel);
    TCalc_resetActiveTalentsButton:SetText("Reset");
    TCalc_resetActiveTalentsButton:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    TCalc_resetActiveTalentsButton:SetScript("OnClick", TCalc_ResetCurrentTalents);
    TCalc_resetActiveTalentsButton:Hide();
    
    local resetActiveTalentsButtonX = 0;
    local resetActiveTalentsButtonY = 0;
    TCalc_resetActiveTalentsButton:SetPoint("TOPLEFT", resetActiveTalentsButtonX, -resetActiveTalentsButtonY);
    
    TCalc_resetActiveTalentsButton.texture = TCalc_resetActiveTalentsButton:CreateTexture(nil,TCalc_frameStrata);
    TCalc_resetActiveTalentsButton.texture:SetTexture(0,0,0,0.8);
    TCalc_resetActiveTalentsButton.texture:SetAllPoints(TCalc_resetActiveTalentsButton);
    
    --Inspect button
    TalentCalculatorInspectButton = CreateFrame("Button",nil,TalentCalculator);
    TalentCalculatorInspectButton:SetFrameStrata(TCalc_frameStrata);
    TalentCalculatorInspectButton:SetWidth(90);
    TalentCalculatorInspectButton:SetHeight(20);
    TalentCalculatorInspectButton:SetFrameLevel(TCalc_talentButtonLevel);
    TalentCalculatorInspectButton:SetText("Inspect");
    TalentCalculatorInspectButton:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    TalentCalculatorInspectButton:SetScript("OnClick", TCalc_InspectTarget);

    TalentCalculatorInspectButton:SetPoint("TOPLEFT", -90, 0);

    TalentCalculatorInspectButton.texture = TalentCalculatorInspectButton:CreateTexture(nil,TCalc_frameStrata);
    TalentCalculatorInspectButton.texture:SetTexture(0.2,0.2,0.2,0.8);
    TalentCalculatorInspectButton.texture:SetAllPoints(TalentCalculatorInspectButton);
end

function TCalc_AddTalentButton(talentButton, tabNumber, rowNumber, columnNumber, parentFrame)
	local newButtonX = TCalc_talentsLeftOffset + columnNumber * 50 + tabNumber * 250;
	local newButtonY = TCalc_talentsTopOffset + rowNumber * 55;
    talentButton:SetPoint("TOPLEFT", newButtonX, -newButtonY);
    
    talentButton.columnNumber = columnNumber;
    talentButton.tierNumber = rowNumber;
    talentButton.tabNumber = tabNumber;
    talentButton.parentFrame = parentFrame;
    
    local targetTab = parentFrame.tabs[tabNumber];
    local targetTier = targetTab.tiers[rowNumber];
    
    targetTier[columnNumber] = talentButton;
    
    if(talentButton.parentTalent ~= nil and talentButton.parentTalent.button.childTalent ~= nil) then
        local childTalentButton = talentButton.parentTalent.button.childTalent;
        if (childTalentButton.dependencyLockUI == nil) then
            childTalentButton.dependencyLockUI, childTalentButton.dependencyLockUI2 = TCalc_CreateDependencyUI(childTalentButton.parentTalent.button, childTalentButton, childTalentButton.parentTab);
        end
        --talentButton.parentTalent.button.childTalent.dependencyLockUI = childTalentButton.dependencyLockUI;
    end
    
    if(talentButton.parentTalent ~= nil and talentButton.parentTalent.button.childTalent2 ~= nil) then
        local childTalent2Button = talentButton.parentTalent.button.childTalent2;
        if (childTalent2Button.dependencyLockUI == nil) then
            childTalent2Button.dependencyLockUI, childTalent2Button.dependencyLockUI2 = TCalc_CreateDependencyUI(childTalent2Button.parentTalent.button, childTalent2Button, childTalent2Button.parentTab);
        end
      --  talentButton.parentTalent.button.childTalent2.dependencyLockUI = childTalent2Button.dependencyLockUI;
    end
end

function TCalc_CreateTalentButton(resourceItem, parentTab)
    local newButton = CreateFrame("Button",nil,parentTab);
    newButton:SetFrameStrata(TCalc_frameStrata);
    newButton:SetWidth(40);
    newButton:SetHeight(40);
    newButton:SetFrameLevel(TCalc_talentButtonLevel);
    newButton:RegisterForClicks("LeftButtonUp","RightButtonUp");
    newButton:SetScript("OnClick", function () TCalc_TalentButtonClicked(newButton); end);
    newButton:SetScript("OnEnter", function () TCalc_MouseEnterTalent(newButton); end);
    newButton:SetScript("OnLeave", function () TCalc_MouseLeaveTalent(); end);
    newButton:Show();
  
    newButton.texture = newButton:CreateTexture(nil,TCalc_frameStrata);
    newButton.texture:SetTexture(resourceItem.iconPath);
    newButton.texture:SetAlpha(1);
    newButton.texture:SetAllPoints(newButton);
    
    local buttonOverlay = CreateFrame("Button",nil,newButton);
    buttonOverlay:SetFrameStrata(TCalc_frameStrata);
    buttonOverlay:SetWidth(40);
    buttonOverlay:SetHeight(40);
    buttonOverlay:RegisterForClicks("LeftButtonUp","RightButtonUp");
    buttonOverlay:SetScript("OnClick", function () TCalc_TalentButtonClicked(newButton); end);
    buttonOverlay:SetScript("OnEnter", function () TCalc_MouseEnterTalent(newButton); end);
    buttonOverlay:SetScript("OnLeave", function () TCalc_MouseLeaveTalent(); end);
    buttonOverlay:SetFrameLevel(TCalc_talentButtonLevel+1);
    buttonOverlay:SetPoint("TOPLEFT", 0, 0);
    buttonOverlay:Show();
    
    buttonOverlay.texture = buttonOverlay:CreateTexture(nil,TCalc_frameStrata);
    buttonOverlay.texture:SetTexture(0.3,0.3,0.3,0.7);
    buttonOverlay.texture:SetAllPoints(buttonOverlay);
    newButton.overlay = buttonOverlay;
    
    resourceItem.button = newButton;
    newButton.parentTab = parentTab;
    newButton.parentTalent = resourceItem.parentTalent;
    newButton.maxPoints = resourceItem.maxPoints;
    newButton.currentPoints = 0;
    newButton.talentName = resourceItem.talentName;
    newButton.talentDescriptions = resourceItem.talentDescriptions;
    
    if(newButton.parentTalent ~= nil) then
        if (newButton.parentTalent.button.childTalent == nil) then
            newButton.parentTalent.button.childTalent = newButton;
        else
            newButton.parentTalent.button.childTalent2 = newButton;
        end
    end
    
    if(resourceItem.resourceCost ~= nil)then
        resourceItem.resourceCost = TCalc_AddSpacesIntoTooltip(resourceItem.resourceCost,31);
        newButton.tooltipStringPart = resourceItem.resourceCost;
    end
    if(resourceItem.castCooldown ~= nil)then
        resourceItem.castCooldown = TCalc_AddSpacesIntoTooltip(resourceItem.castCooldown,31);
        if(newButton.tooltipStringPart == nil)then
            newButton.tooltipStringPart = resourceItem.castCooldown;
        else
            newButton.tooltipStringPart = newButton.tooltipStringPart .. '\n'.. resourceItem.castCooldown;
        end
    end
    if(resourceItem.requirements ~= nil)then
        if(newButton.tooltipStringPart == nil)then
            newButton.tooltipStringPart = resourceItem.requirements;
        else
            newButton.tooltipStringPart = newButton.tooltipStringPart .. '\n'.. resourceItem.requirements;
        end
    end
    TCalc_UpdateTooltipString(newButton);
    
    local talentNumberLabel = CreateFrame("Button",nil,newButton);
    talentNumberLabel:SetFrameStrata(TCalc_frameStrata);
    talentNumberLabel:SetWidth(10);
    talentNumberLabel:SetHeight(10);
    talentNumberLabel:SetFrameLevel(TCalc_talentButtonLevel+2);
    talentNumberLabel:SetText("0");
    talentNumberLabel:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    talentNumberLabel:Disable();
    talentNumberLabel:Show();
    talentNumberLabel:SetPoint("TOPLEFT", 30,-30);
    newButton.label = talentNumberLabel;
    
    return newButton;
end

function TCalc_AddSpacesIntoTooltip(stringToModify, maxLength)
    local slashTabStart, slashTabEnd = string.find(stringToModify, "\t");
    if(slashTabStart ~= nil and slashTabEnd ~= nil)then
        local castCoolDownLenght = string.len(stringToModify)-2;
        local spacesToAdd = maxLength-castCoolDownLenght;
        local leftPart = string.sub(stringToModify,1,slashTabStart-1);
        local rightPart = string.sub(stringToModify,slashTabEnd+1,castCoolDownLenght+2);
        while(spacesToAdd > 0)do
            leftPart = leftPart .. " ";
            spacesToAdd = spacesToAdd - 1;
        end
        
        return leftPart .. rightPart;
    end
    return stringToModify;
end

function TCalc_UpdateTooltipString(buttonToUpdate)
    local currentPoints = buttonToUpdate.currentPoints;
    local maxPoints = buttonToUpdate.maxPoints;
    
    local tooltipString = buttonToUpdate.talentName;
    tooltipString = tooltipString .. '\n' .. currentPoints .. '/' .. maxPoints;
    if(buttonToUpdate.tooltipStringPart ~= nil) then
        tooltipString = tooltipString .. '\n' .. buttonToUpdate.tooltipStringPart;
    end
    
    if(currentPoints ~= 0)then
        tooltipString = tooltipString .. '\n' .. buttonToUpdate.talentDescriptions[currentPoints-1];
    end
    if(currentPoints < maxPoints) then
        tooltipString = tooltipString .. '\nNext Rank: \n' .. buttonToUpdate.talentDescriptions[currentPoints];
    end
    
    buttonToUpdate.tooltipString = tooltipString;
end

function TCalc_TalentButtonClicked(talentButtonClicked)
    if(arg1 == "RightButton") then
        TCalc_UnlearnTalent(talentButtonClicked);
    elseif(arg1 == "LeftButton") then
        TCalc_LearnTalent(talentButtonClicked);
    end
    TCalc_UpdateTalentDisplay();
end

function TCalc_UnlearnTalent(talentButton)
    if(talentButton.currentPoints > 0 and TCalc_CheckTierRestrictionUnlearn(talentButton))then
        if(talentButton.childTalent ~= nil and talentButton.childTalent.currentPoints > 0)then
            return;
        end
        if(talentButton.childTalent2 ~= nil and talentButton.childTalent2.currentPoints > 0)then
            return;
        end
        talentButton.currentPoints = talentButton.currentPoints - 1;
        talentButton.parentFrame.tabTalentCounter[talentButton.tabNumber] = talentButton.parentFrame.tabTalentCounter[talentButton.tabNumber] - 1;
        talentButton.parentFrame.tabTalentCounter[3] = talentButton.parentFrame.tabTalentCounter[3] - 1;
        TCalc_UpdateTooltipString(talentButton);
        TCalc_UpdateDependecyUI(talentButton);
        TCalc_RepopTooltip(talentButton);
        TCalc_activeFrame.talentNameLabel:SetText("Local");
    end
end

function TCalc_LearnTalent(talentButton)
    if(talentButton.parentFrame.tabTalentCounter[3] < TCalc_maxTalents and TCalc_CheckTierRestrictionLearn(talentButton)) then
        if(talentButton.currentPoints < talentButton.maxPoints and TCalc_CheckDependency(talentButton))then
            talentButton.currentPoints = talentButton.currentPoints + 1;
            talentButton.parentFrame.tabTalentCounter[talentButton.tabNumber] = talentButton.parentFrame.tabTalentCounter[talentButton.tabNumber] + 1;
            talentButton.parentFrame.tabTalentCounter[3] = talentButton.parentFrame.tabTalentCounter[3] + 1;
            TCalc_UpdateTooltipString(talentButton);
            TCalc_UpdateDependecyUI(talentButton);
            TCalc_RepopTooltip(talentButton);
            TCalc_activeFrame.talentNameLabel:SetText("Local");
        end
    end
end

function TCalc_UpdateTalentDisplay()
    local activeTabs = TCalc_activeFrame.tabs;
    for i=0, 2 do
        local currentActiveTab = activeTabs[i];
        for j=0, 6 do
            local currentActiveTier = currentActiveTab.tiers[j];
            for k = 0, 3 do
                if(currentActiveTier[k] ~= nil)then
                    local talentButton = currentActiveTier[k];
                    talentButton.label:Show();
                    talentButton.overlay:SetFrameLevel(TCalc_talentButtonLevel-1);
                    if(TCalc_CheckTierRestrictionLearn(talentButton) and TCalc_CheckDependency(talentButton)) then
                        talentButton.label.colorString = "|cFF00FF00";
                    else
                        talentButton.overlay:SetFrameLevel(TCalc_talentButtonLevel+1);
                        talentButton.label.colorString = "|cFFFFFF00";
                        talentButton.label:Hide();
                    end
                    
                    if(talentButton.currentPoints == talentButton.maxPoints)then
                        talentButton.label.colorString = "|cFFFFFF00";
                    elseif(talentButton.parentFrame.tabTalentCounter[3] == TCalc_maxTalents)then
                        if(talentButton.currentPoints > 0 and talentButton.currentPoints < talentButton.maxPoints) then
                            talentButton.label.colorString = "|cFF00FF00";
                        else
                            talentButton.overlay:SetFrameLevel(TCalc_talentButtonLevel+1);
                            talentButton.label:Hide();
                        end
                    end
                    talentButton.label:SetText(talentButton.label.colorString..talentButton.currentPoints);
                end
            end
        end
        --Update number of talents invested in current tab
        TCalc_activeFrame.tabNumberLabels[i]:SetText(TCalc_activeFrame.treeNames[i+1] .. ": " ..  TCalc_activeFrame.tabTalentCounter[i]);
    end
    --Update number of talents invested in current class
    TCalc_activeFrame.totalPointsLabel:SetText("Total: " .. TCalc_activeFrame.tabTalentCounter[3]);
end

function TCalc_ResetCurrentTalents()
    if(TCalc_activeFrame == nil) then
        return;
    end
    
    local activeTabs = TCalc_activeFrame.tabs;
    
    for i=0, 2 do
        local currentActiveTab = activeTabs[i];
        for j=0, 6 do
            local currentActiveTier = currentActiveTab.tiers[j];
            for k = 0, 3 do
                if(currentActiveTier[k] ~= nil)then
                    currentActiveTier[k].currentPoints = 0;
                    TCalc_UpdateDependecyUI(currentActiveTier[k]);
                end
            end
        end
    end
    
    for i=0,3 do
        TCalc_activeFrame.tabTalentCounter[i]=0;
    end
    TCalc_activeFrame.talentNameLabel:SetText("Local");
    TCalc_UpdateTalentDisplay();
end

function TCalc_CheckTierRestrictionLearn(talentButton)
    local tierRequirement = talentButton.tierNumber * 5;
    local tierTalents = talentButton.parentFrame.tabTalentCounter[talentButton.tabNumber];
    
    if(tierTalents >= tierRequirement) then
        return true;
    end
        
    return false;
end

function TCalc_CheckTierRestrictionUnlearn(talentButton)
    
    --Check if other tiers invested
    if(talentButton.tierNumber < 6) then
        local currentActiveTab = TCalc_activeFrame.tabs[talentButton.tabNumber];
        local currentTier = 0;
        local tiersSum = 0;
        
        while (tiersSum < talentButton.parentFrame.tabTalentCounter[talentButton.tabNumber]-1) do
            if (tiersSum < currentTier*5) then
                return false;
            end
            
            local currentActiveTier = currentActiveTab.tiers[currentTier];
            for k = 0, 3 do
                if(currentActiveTier[k] ~= nil and currentActiveTier[k].currentPoints > 0)then
                    tiersSum = tiersSum + currentActiveTier[k].currentPoints;
                end
            end
            
            if (talentButton.tierNumber == currentTier) then
                tiersSum = tiersSum -1;
            end;
            
            currentTier = currentTier + 1;
        end
    end
        
    return true;
end

function TCalc_CheckDependency(talentButton)
    if(talentButton.parentTalent == nil) then
        return true;
    end

    if(talentButton.parentTalent.button.currentPoints == talentButton.parentTalent.button.maxPoints) then
        return true;
    end
    
    return false;
end

function TCalc_UpdateDependecyUI(talentButton)
    if(talentButton.childTalent ~= nil) then
        if(talentButton.currentPoints == talentButton.maxPoints)then
            talentButton.childTalent.dependencyLockUI.texture:SetTexture(0.1,0.5,0.1, 0.7);
            if (talentButton.childTalent.dependencyLockUI2 ~= nil) then
                talentButton.childTalent.dependencyLockUI2.texture:SetTexture(0.1,0.5,0.1, 0.7);
            end
        else
            talentButton.childTalent.dependencyLockUI.texture:SetTexture(0.5,0.1,0.1, 0.7);
            if (talentButton.childTalent.dependencyLockUI2 ~= nil) then
                talentButton.childTalent.dependencyLockUI2.texture:SetTexture(0.5,0.1,0.1, 0.7);
            end
        end
    end
    
    if(talentButton.childTalent2 ~= nil) then
        if(talentButton.currentPoints == talentButton.maxPoints)then
            talentButton.childTalent2.dependencyLockUI.texture:SetTexture(0.1,0.5,0.1, 0.7);
            if (talentButton.childTalent2.dependencyLockUI2 ~= nil) then
                talentButton.childTalent2.dependencyLockUI2.texture:SetTexture(0.1,0.5,0.1, 0.7);
            end
        else
            talentButton.childTalent2.dependencyLockUI.texture:SetTexture(0.5,0.1,0.1, 0.7);
            if (talentButton.childTalent2.dependencyLockUI2 ~= nil) then
                talentButton.childTalent2.dependencyLockUI2.texture:SetTexture(0.5,0.1,0.1, 0.7);
            end
        end
    end
end

function TCalc_CreateDependencyUI(fromButton, toButton, parentTab)
    local dependencyUI2;
    local dependencyUIX = TCalc_talentsLeftOffset + fromButton.columnNumber * 50 + fromButton.tabNumber * 250 + fromButton:GetWidth()/3;
    local dependencyUIY = TCalc_talentsTopOffset + fromButton.tierNumber * 55;
    
    local toButtonY = TCalc_talentsTopOffset + toButton.tierNumber * 55;
    
    local width = 0;
    local height = 0;
    if(dependencyUIY == toButtonY)then
        height = fromButton:GetWidth()/3;
        width =  TCalc_talentsLeftOffset + toButton.columnNumber * 50 + toButton.tabNumber * 250 - dependencyUIX - fromButton:GetWidth() * 2 / 3;
        dependencyUIY = dependencyUIY + fromButton:GetWidth()/3;
        dependencyUIX = dependencyUIX + fromButton:GetWidth() * 2 / 3;
    else
        local destinationX = TCalc_talentsLeftOffset + toButton.columnNumber * 50 + toButton.tabNumber * 250 + toButton:GetWidth()/3;
        if (destinationX ~= dependencyUIX) then
            local height2 = fromButton:GetWidth()/3;
            local width2 =  TCalc_talentsLeftOffset + toButton.columnNumber * 50 + toButton.tabNumber * 250 - dependencyUIX;
            local dependencyUIY2 = dependencyUIY + fromButton:GetWidth()/3;
            local dependencyUIX2 = dependencyUIX + fromButton:GetWidth() * 2 / 3;
            
            dependencyUI2 = TCalc_CreateLine(dependencyUIX2, -dependencyUIY2, width2, height2, parentTab);
            dependencyUI2.tooltipString = toButton.talentName ..' requires ' .. fromButton.maxPoints .. ' points in ' .. fromButton.talentName;
        
            dependencyUIX = TCalc_talentsLeftOffset + toButton.columnNumber * 50 + toButton.tabNumber * 250 + fromButton:GetWidth()/3;
            dependencyUIY = dependencyUIY + fromButton:GetWidth() * 2 / 3;
            height = toButtonY - dependencyUIY;
            width = fromButton:GetWidth()/3;
        else
            dependencyUIY = dependencyUIY + 40;
            height = toButtonY - dependencyUIY;
            width = fromButton:GetWidth()/3;
        end
    end
    --ChatFrame1:AddMessage(dependencyUIX .. ' ' .. -dependencyUIY .. ' ' .. width);
    local dependencyUI = TCalc_CreateLine(dependencyUIX, -dependencyUIY, width, height, parentTab);
    dependencyUI.tooltipString = toButton.talentName ..' requires ' .. fromButton.maxPoints .. ' points in ' .. fromButton.talentName;
    
    return dependencyUI, dependencyUI2;
end

function TCalc_CreateLine(xStart, yStart, width, height, parentTab)
    local result = CreateFrame("Button",nil,parentTab);
    result:SetPoint("TOPLEFT", xStart, yStart);
    result:SetFrameStrata(TCalc_frameStrata);
    result:SetWidth(width);
    result:SetHeight(height);
    result:SetFrameLevel(TCalc_classFrameLevel+1);
    result:Show();
  
    result.texture = result:CreateTexture(nil,TCalc_frameStrata);
    result.texture:SetTexture(0.5,0.1,0.1, 0.7);
    result.texture:SetAllPoints(result);
    
    result:SetScript("OnEnter", function () TCalc_MouseEnterTalent(result); end);
    result:SetScript("OnLeave", function () TCalc_MouseLeaveTalent(); end);
    
    return result;
end

function TCalc_RepopTooltip(talentButton)
    TCalc_MouseLeaveTalent();
    TCalc_MouseEnterTalent(talentButton);
end

function TCalc_MouseEnterTalent(talentButton)
    GameTooltip:SetOwner(talentButton, "ANCHOR_BOTTOMRIGHT", 0, 80);
    GameTooltip:SetText(talentButton.tooltipString, 1.0, 1.0, 1.0, 1, 1);
    GameTooltip:Show();
end

function TCalc_MouseLeaveTalent()
    GameTooltip:ClearLines();
    GameTooltip:Hide();
end

function TCalc_InitTalentTabHolders(targetFrame)
    local tab1 = {};
    TCalc_InitTalentTierHolders(tab1);
    local tab2 = {};
    TCalc_InitTalentTierHolders(tab2);
    local tab3 = {};
    TCalc_InitTalentTierHolders(tab3);
    targetFrame.tabs = {
        [0] = tab1;
        [1] = tab2;
        [2] = tab3;
    };
    --tab1 tab2 tab3 total
    local tabTalentCounter = {
    [0] = 0;
    [1] = 0;
    [2] = 0;
    [3] = 0;
    };
    targetFrame.tabTalentCounter = tabTalentCounter;
end

function TCalc_InitTalentTierHolders(targetTab)
    local tier1 = {};
    local tier2 = {};
    local tier3 = {};
    local tier4 = {};
    local tier5 = {};
    local tier6 = {};
    local tier7 = {};
    targetTab.tiers = {
        [0] = tier1,
        [1] = tier2,
        [2] = tier3,
        [3] = tier4,
        [4] = tier5,
        [5] = tier6,
        [6] = tier7,
    };
end