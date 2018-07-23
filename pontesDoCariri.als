module pontesCariri

-- Cidade que possui todas as regioes
sig City {
	regions : set Region
}

-- Regiao generica
abstract sig Region {}

-- Regioes especificas da cidade
one sig RegionN extends  Region {}
one sig RegionW extends  Region {}
one sig RegionS extends  Region {}
one sig RegionE extends  Region {}

sig Direction {}

-- Definicao de ponte
abstract sig Bridge {}

-- Pontes especificas do problema
one sig BridgeA extends Bridge {}  
one sig BridgeB extends Bridge {}
one sig BridgeC extends Bridge {}
one sig BridgeD extends Bridge {}
one sig BridgeE extends Bridge {}
one sig BridgeF extends Bridge {}
one sig BridgeG extends Bridge {}

fact cityRegions {
	Region = RegionN + RegionW + RegionS + RegionE	
}

fact cityAll { City = Region }

-- Fato representando a quantidade de pontes existentes na cidade, que interliga as regioes
fact numberBridges {
	#Bridge = 7
}

pred show[]{}
run show 
 
