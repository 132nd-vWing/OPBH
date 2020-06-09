
local a380table = { 'Emirates', 'Qantas Airways', 'Korean Air' }

EK380DXBA = SPAWN:New( "RAT EK380" )
EK380DXBA:InitLimit( 4, 500 )
EK380DXBA:InitRepeatOnLanding()
EK380DXBA:SpawnScheduled( 600, 0 )

EY320DXBD = SPAWN:New( "RAT EY320" )
EY320DXBD:InitLimit( 4, 500 )
EY320DXBD:InitRepeatOnLanding()
EY320DXBD:SpawnScheduled( 600, 0 )

YAK40DXBA = SPAWN:New( "RAT YAK40" )
YAK40DXBA:InitLimit( 4, 500 )
YAK40DXBA:InitRepeatOnLanding()
YAK40DXBA:SpawnScheduled( 600, 0 )

EO320BNDA = SPAWN:New( "RAT EP320" )
EO320BNDA:InitLimit( 4, 500 )
EO320BNDA:InitRepeatOnLanding()
EO320BNDA:SpawnScheduled( 600, 0 )