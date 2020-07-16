do
--create an instance of the IADS
redPAC01 = SkynetIADS:create('PAC-01')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
--local iadsDebug = redPAC01:getDebugSettings()
--iadsDebug.IADSStatus = true
--iadsDebug.samWentDark = true
--iadsDebug.contacts = true
--iadsDebug.radarWentLive = true
--iadsDebug.noWorkingCommmandCenter = true
--iadsDebug.ewRadarNoConnection = true
--iadsDebug.samNoConnection = true
--iadsDebug.jammerProbability = true
--iadsDebug.addedEWRadar = true
--iadsDebug.hasNoPower = true
--iadsDebug.harmDefence = true
--iadsDebug.samSiteStatusEnvOutput = true
--iadsDebug.earlyWarningRadarStatusEnvOutput = true
---end remove debug ---

--add all units with unit name beginning with 'EW' to the IADS:
redPAC01:addEarlyWarningRadarsByPrefix('EWR1')

--add all groups begining with group name 'SAM' to the IADS:
redPAC01:addSAMSitesByPrefix('SAM1')

--add a command center:
commandCenter = StaticObject.getByName('IRAN SCUD CC')
redPAC01:addCommandCenter(commandCenter)

--add a power source and a connection node for this EW radar:
--local powerSource = StaticObject.getByName('Power-Source-EW-Center3')
--local connectionNodeEW = StaticObject.getByName('Connection-Node-EW-Center3')
--redPAC01:getEarlyWarningRadarByUnitName('EW-Center3'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--all SA-10 sites shall act as EW sites, meaning their radars will be on all the time:
redPAC01:getSAMSitesByNatoName('SA-10'):setActAsEW(true)

--set the sa15 as point defence for the SA-10 site, we set it to always react to a HARM so we can demonstrate the point defence mechanism in Skynet
local sa15 = redPAC01:getSAMSiteByGroupName('SA-10 SCUD PD')
redPAC01:getSAMSiteByGroupName('SAM1 - SA-10 SCUD'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

--set this SA-11 site to go live 70% of max range of its missiles (default value: 100%)
--redPAC01:getSAMSiteByGroupName('SAM1 - SA-11 Bandar A'):setGoLiveRangeInPercent(70)

--activate the radio menu to toggle IADS Status output
--redPAC01:addRadioMenu()

redPAC01:setupSAMSitesAndThenActivate()

-- activate the IADS
redPAC01:activate()

end