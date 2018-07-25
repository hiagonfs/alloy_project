module pontesCariri

one sig City {
	regions: set Region
}

abstract sig Region {}

one sig RegionN extends Region {
	bridgeNW1: BridgeNW1,
	bridgeNW2: BridgeNW2,
	bridgeNE: BridgeNE 
}

one sig RegionW extends Region {
	bridgeNW1: one BridgeNW1,
	bridgeNW2: one BridgeNW2,
	bridgeWS1: one BridgeWS1,
	bridgeWS2: one BridgeWS2,
	bridgeWE: one BridgeWE
}

one sig RegionS extends Region {
	bridgeWS1: one BridgeWS1,
	bridgeWS2: one BridgeWS2,
	bridgeES: one BridgeES
}

one sig RegionE extends Region {
	bridgeES: one BridgeES,
	bridgeNE: one BridgeNE,
	bridgeWE: one BridgeWE
}

abstract sig Bridge {}

one sig BridgeNW1 extends Bridge {}
one sig BridgeNW2 extends Bridge {}
one sig BridgeWS1 extends Bridge {}
one sig BridgeWS2 extends Bridge {}
one sig BridgeES extends Bridge {}
one sig BridgeWE extends Bridge {}
one sig BridgeNE extends Bridge {}


fact cityRegions {
	all c:City | #c.regions = 4
}

pred show[]{}
run show
