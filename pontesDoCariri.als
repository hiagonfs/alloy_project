module pontesCariri

-- Cidade que possui todas as regioes
one sig City {
	regions: set Region
}

-- Regiao generica
abstract sig Region {}

-- Regioes especificas da cidade
one sig RegionN extends Region {
	bridgesNW: set BridgeNW,
	bridgesNE: one BridgeNE 
}

one sig RegionW extends  Region {
	bridgesNW: set BridgeNW,
	bridgesWS: set BridgeWS,
	bridgesWE: one BridgeWE
}

one sig RegionS extends  Region {
	bridgesWS: set BridgeWS,
	bridgesES: one BridgeES
}

one sig RegionE extends  Region {
	bridgesES: one BridgeES,
	bridgesNE: one BridgeNE,
	bridgesWE: one BridgeWE
}

--fact bridgeNWRegions{	
	--all rn:RegionN | #rn.bridgesNW = 2
	--all rw:RegionW | #rw.bridgesNW = 2
--}

--fact bridgeWSRegions{
	--all rs:RegionS | #rs.bridgesWS = 2
	--all rw:RegionW | #rw.bridgesWS = 2
--}

--sig Direction {}

-- Definicao de ponte
abstract sig Bridge {}

-- Pontes especificas do problema
sig BridgeNW extends Bridge {}  
sig BridgeWS extends Bridge {}
one sig BridgeES extends Bridge {}
one sig BridgeWE extends Bridge {}
one sig BridgeNE extends Bridge {}

--fact cardinalidadeBridge{
	--nw:BridgeNW | #nw = 2
	--all ws:BridgeWS | #ws = 2
	--all es:BridgeES | #es = 1
	--all we:BridgeWE | #we = 1
	--all ne:BridgeNE | #ne = 1
--}

fact cityRegions {
	all c:City | #c.regions = 4
}

pred show[]{}
run show 
