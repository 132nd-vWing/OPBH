
_SETTINGS:SetPlayerMenuOff()

local a380table = { 'Emirates', }

EK380DXBA = SPAWN:New( "RAT EK380 #IFF:6014UN" )
EK380DXBA:InitLimit( 4, 500 )
EK380DXBA:InitRepeatOnLanding()
EK380DXBA:SpawnScheduled( 600, 0 )

DHL757DXBA = SPAWN:New( "RAT DHL757 #IFF:6015UN" )
DHL757DXBA:InitLimit( 4, 500 )
DHL757DXBA:InitRepeatOnLanding()
DHL757DXBA:SpawnScheduled( 600, 0 )

EO320BNDA = SPAWN:New( "RAT EP320 #IFF:5011UN" )
EO320BNDA:InitLimit( 4, 500 )
EO320BNDA:InitRepeatOnLanding()
EO320BNDA:SpawnScheduled( 600, 0 )