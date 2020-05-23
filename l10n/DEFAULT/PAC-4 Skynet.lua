do
--create an instance of the IADS
redPAC04 = SkynetIADS:create('PAC-04')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
--local iadsDebug = redPAC01:getDebugSettings()
--iadsDebug.IADSStatus = true
--iadsDebug.samWentDark = true
--iadsDebug.contacts = true
--iadsDebug.radarWentLive = true
--iadsDebug.noWorkingCommmandCenter = false
--iadsDebug.ewRadarNoConnection = false
--iadsDebug.samNoConnection = false
--iadsDebug.jammerProbability = true
--iadsDebug.addedEWRadar = false
--iadsDebug.hasNoPower = false
--iadsDebug.harmDefence = true
--iadsDebug.samSiteStatusEnvOutput = true
--iadsDebug.earlyWarningRadarStatusEnvOutput = true
---end remove debug ---

--add all units with unit name beginning with 'EW' to the IADS:
redPAC04:addEarlyWarningRadarsByPrefix('EWR4')

--add all groups begining with group name 'SAM' to the IADS:
redPAC04:addSAMSitesByPrefix('SAM4')

--add a command center:
commandCenter = StaticObject.getByName('Kerman HQ')
redPAC04:addCommandCenter(commandCenter)

--add a power source and a connection node for this EW radar:
--local powerSource = StaticObject.getByName('Power-Source-EW-Center3')
--local connectionNodeEW = StaticObject.getByName('Connection-Node-EW-Center3')
--redPAC04:getEarlyWarningRadarByUnitName('EW-Center3'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--all SA-10 sites shall act as EW sites, meaning their radars will be on all the time:
redPAC04:getSAMSitesByNatoName('SA-10'):setActAsEW(true)

--set the sa15 as point defence for the SA-10 site, we set it to always react to a HARM so we can demonstrate the point defence mechanism in Skynet
local sa15 = redPAC04:getSAMSiteByGroupName('SA-10 Kerman PD')
redPAC04:getSAMSiteByGroupName('SAM4 - SA-10 Kerman'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

--set this SA-11 site to go live 70% of max range of its missiles (default value: 100%)
redPAC04:getSAMSiteByGroupName('SAM4 - Weapons Factory SA-11'):setGoLiveRangeInPercent(70)

--activate the radio menu to toggle IADS Status output
--redPAC04:addRadioMenu()

-- activate the IADS
redPAC04:activate()

end