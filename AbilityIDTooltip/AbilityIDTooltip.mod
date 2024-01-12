<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="AbilityIDTooltip" version="1.0" date="11/1/2024">
        <VersionSettings gameVersion="1.4.8" windowsVersion="1.0" savedVariablesVersion="1.0" /> 
        <Author name="Emissary" />
        <Description text="Displays the Ability ID in Ability Tooltips" />
        <Dependencies>
            <Dependency name="EASystem_Tooltips" />
        </Dependencies>
        <Files>
            <File name="AbilityIDTooltip.lua" />
            <<!--
			<File name="AbilityIDTooltip.xml" />
			-->
        </Files>
        
        <SavedVariables>
            <!-- Define any saved variables here, or remove this section if my addon doesn't use them -->
        </SavedVariables> 
        
        <OnInitialize>
            <CallFunction name="AbilityIDTooltip.Initialize" />
        </OnInitialize>
        <OnUpdate>
            <!-- If my addon requires constant updates, specify the update function here -->
        </OnUpdate>
        <OnShutdown>
            <!-- If my addon needs to perform cleanup on shutdown, specify the shutdown function here -->
        </OnShutdown>
    </UiMod>
</ModuleFile>
