<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="AbilityIDTooltip" version="1.0" date="11/1/2024">
        <VersionSettings gameVersion="1.4.8" windowsVersion="1.0" savedVariablesVersion="1.0" /> 
        <Author name="YourName" />
        <Description text="Displays the Ability ID in Ability Tooltips" />
        <Dependencies>
            <!-- List any dependencies your addon might have, or remove this section if there are none -->
        </Dependencies>
        <Files>
            <File name="AbilityIDTooltip.lua" />
            <File name="AbilityIDTooltip.xml" />
        </Files>
        
        <SavedVariables>
            <!-- Define any saved variables here, or remove this section if your addon doesn't use them -->
        </SavedVariables> 
        
        <OnInitialize>
            <CallFunction name="AbilityIDTooltip.Initialize" />
        </OnInitialize>
        <OnUpdate>
            <!-- If your addon requires constant updates, specify the update function here -->
        </OnUpdate>
        <OnShutdown>
            <!-- If your addon needs to perform cleanup on shutdown, specify the shutdown function here -->
        </OnShutdown>
    </UiMod>
</ModuleFile>
