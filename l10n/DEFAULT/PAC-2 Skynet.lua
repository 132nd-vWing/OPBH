do
--create an instance of the IADS
redPAC02 = SkynetIADS:create('PAC-02')

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
redPAC02:addEarlyWarningRadarsByPrefix('EWR2')

--add all groups begining with group name 'SAM' to the IADS:
redPAC02:addSAMSitesByPrefix('SAM2')

--add a command center:
commandCenter = StaticObject.getByName('Lar HQ')
redPAC02:addCommandCenter(commandCenter)

--add a power source and a connection node for this EW radar:
--local powerSource = StaticObject.getByName('Power-Source-EW-Center3')
--local connectionNodeEW = StaticObject.getByName('Connection-Node-EW-Center3')
--redPAC02:getEarlyWarningRadarByUnitName('EW-Center3'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--all SA-10 sites shall act as EW sites, meaning their radars will be on all the time:
redPAC02:getSAMSitesByNatoName('SA-10'):setActAsEW(true)

--set the sa15 as point defence for the SA-10 site, we set it to always react to a HARM so we can demonstrate the point defence mechanism in Skynet
--local sa15 = redPAC02:getSAMSiteByGroupName('SA-10 SCUD PD')
--redPAC02:getSAMSiteByGroupName('SAM1 - SA-10 SCUD'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

--set this SA-11 site to go live 70% of max range of its missiles (default value: 100%)
redPAC02:getSAMSiteByGroupName('SAM2 - Lar SA-11'):setGoLiveRangeInPercent(70)

--activate the radio menu to toggle IADS Status output
--redPAC02:addRadioMenu()

-- activate the IADS
redPAC02:activate()

end