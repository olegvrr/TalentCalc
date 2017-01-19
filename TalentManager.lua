TManager_currentTab = nil;

TManager_sharedTalentButtons = {};
TManager_currentSharedIndex = 0;
TManager_maxSharedIndex = 10;

function TManager_OnLoad()
    TManager_InitFrames();
end

function TManager_DisplayTab(tabToDisplay)
    if (TManager_currentTab ~= nil) then
        TManager_currentTab:Hide();
    end

    TManager_currentTab = tabToDisplay;
    TManager_currentTab:Show();
end

function TManager_AcceptSharedTalents(classIndex, talentSummary, talentString, sender)
    local sharedTalentButton = TManager_sharedTalentButtons[TManager_currentSharedIndex];
    sharedTalentButton.classIndex = classIndex;
    sharedTalentButton.talentSummary = talentSummary;
    sharedTalentButton.talentString = talentString;
    sharedTalentButton.sender = sender;
    sharedTalentButton.time = time();
    sharedTalentButton.timeString = TManager_GetCurrentTimeString();
    
    local buttonText = sender .. " " ..  talentSummary;
    sharedTalentButton:SetText(buttonText);

    local classFrameColor = TCalc_frames[classIndex].color;
    sharedTalentButton.texture:SetTexture(classFrameColor.red,classFrameColor.green,classFrameColor.blue,1);

    sharedTalentButton:Show();
    sharedTalentButton.viewButton:Show();
    sharedTalentButton.saveButton:Show();
    TManager_currentSharedIndex = TManager_currentSharedIndex + 1;

    if (TManager_currentSharedIndex > TManager_maxSharedIndex) then
        TManager_currentSharedIndex = 0;
    end
end

function TManager_SharedTalentViewButtonPressed(sharedTalentButton)
    TCalc_DisplayClassFrameFromIndex(sharedTalentButton.classIndex);
    TCalc_DisplayTalentsFromString(sharedTalentButton.talentString);
    TCalc_activeFrame.talentNameLabel:SetText("Shared from " .. sharedTalentButton.sender);
end

function TManager_SharedTalentSaveButtonPressed(sharedTalentButton)

end

function TManager_GetCurrentTimeString()
    local currentDate = date("*t");
    local month = TCalc_GetTwoDigitNumber(currentDate.month);
    local day = TCalc_GetTwoDigitNumber(currentDate.day);
    local hour = TCalc_GetTwoDigitNumber(currentDate.hour);
    local minute = TCalc_GetTwoDigitNumber(currentDate.min);

    return currentDate.year .. "/" .. month .. "/" .. day .. " " .. hour .. ":" .. minute;
end

function TManager_InitFrames()
    for i = 0, 10 do
        TManager_sharedTalentButtons[i] = TManager_InitSharedTalentButton(i);
    end
end

function TManager_InitSharedTalentButton(buttonIndex)
    local buttonY = buttonIndex * 40 + 50;

    local sharedTalentButton = CreateFrame("Button",nil,TalentManagerSharedTab);
    sharedTalentButton:SetFrameStrata(TCalc_frameStrata);
    sharedTalentButton:SetWidth(200);
    sharedTalentButton:SetHeight(30);
    sharedTalentButton:SetFrameLevel(TCalc_talentButtonLevel);
    sharedTalentButton:SetText("Test " .. buttonIndex);
    sharedTalentButton:SetFont("Fonts\\MORPHEUS.TTF", 15, "OUTLINE, MONOCHROME");
    sharedTalentButton:Disable();
    sharedTalentButton:Hide();

    sharedTalentButton:SetPoint("TOPLEFT", 0, -buttonY);

    sharedTalentButton.texture = sharedTalentButton:CreateTexture(nil,TCalc_frameStrata);
    sharedTalentButton.texture:SetTexture(0.2,0.2,0.2,1);
    sharedTalentButton.texture:SetAllPoints(sharedTalentButton);
    
    local viewSharedTalentButton = CreateFrame("Button",nil,TalentManagerSharedTab);
    viewSharedTalentButton:SetFrameStrata(TCalc_frameStrata);
    viewSharedTalentButton:SetWidth(50);
    viewSharedTalentButton:SetHeight(30);
    viewSharedTalentButton:SetFrameLevel(TCalc_talentButtonLevel);
    viewSharedTalentButton:SetText("View");
    viewSharedTalentButton:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    viewSharedTalentButton:SetScript("OnClick", function () TManager_SharedTalentViewButtonPressed(sharedTalentButton); end);
    viewSharedTalentButton:Enable();
    viewSharedTalentButton:Hide();

    viewSharedTalentButton:SetPoint("TOPLEFT", 200, -buttonY);

    viewSharedTalentButton.texture = viewSharedTalentButton:CreateTexture(nil,TCalc_frameStrata);
    viewSharedTalentButton.texture:SetTexture(0.4,0.2,0.4,1);
    viewSharedTalentButton.texture:SetAllPoints(viewSharedTalentButton);
    
    local saveSharedTalentButton = CreateFrame("Button",nil,TalentManagerSharedTab);
    saveSharedTalentButton:SetFrameStrata(TCalc_frameStrata);
    saveSharedTalentButton:SetWidth(50);
    saveSharedTalentButton:SetHeight(30);
    saveSharedTalentButton:SetFrameLevel(TCalc_talentButtonLevel);
    saveSharedTalentButton:SetText("Save");
    saveSharedTalentButton:SetFont("Fonts\\MORPHEUS.TTF", 18, "OUTLINE, MONOCHROME");
    saveSharedTalentButton:SetScript("OnClick", function () TManager_SharedTalentSaveButtonPressed(sharedTalentButton); end);
    saveSharedTalentButton:Enable();
    saveSharedTalentButton:Hide();

    saveSharedTalentButton:SetPoint("TOPLEFT", 250, -buttonY);

    saveSharedTalentButton.texture = saveSharedTalentButton:CreateTexture(nil,TCalc_frameStrata);
    saveSharedTalentButton.texture:SetTexture(0.1,0.4,0.1,1);
    saveSharedTalentButton.texture:SetAllPoints(saveSharedTalentButton);

    sharedTalentButton.viewButton = viewSharedTalentButton;
    sharedTalentButton.saveButton = saveSharedTalentButton;

    return sharedTalentButton;
end