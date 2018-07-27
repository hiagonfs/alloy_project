module pontesCariri

-- Criando uma cidade que contera todas as 4 regioes
one sig Cidade { regioes: set Regiao }

-- Criando uma regiao generica
abstract sig Regiao {}

-- Criando uma ponte generica
sig Ponte { status : one Status }

-- Criando uma regiao e associando pontes a ela
one sig RegionN extends Regiao {
	bridgeNW1: PonteNW1,
	bridgeNW2: PonteNW2,
	bridgeNE: PonteNE 
}

one sig RegionW extends Regiao {
	bridgeNW1: one PonteNW1,
	bridgeNW2: one PonteNW2,
	bridgeWS1: one PonteWS1,
	bridgeWS2: one PonteWS2,
	bridgeWE: one PonteWE
}

one sig RegionS extends Regiao {
	bridgeWS1: one PonteWS1,
	bridgeWS2: one PonteWS2,
	bridgeES: one PonteES
}

one sig RegionE extends Regiao {
	bridgeES: one PonteES,
	bridgeNE: one PonteNE,
	bridgeWE: one PonteWE
}

-- Criando uma status generico
abstract sig Status {}

-- Criando status especificos do problema para cobrir as pontes
sig Visitado extends Status {}
sig NaoVisitado extends Status {}

-- Criando pontes especificas do problema 
one sig PonteNW1 extends Ponte {}
one sig PonteNW2 extends Ponte {}
one sig PonteWS1 extends Ponte {}
one sig PonteWS2 extends Ponte {}
one sig PonteES extends Ponte {}
one sig PonteWE extends Ponte {}
one sig PonteNE extends Ponte {}

-- Fato que define a quantidade fixa de regioes
fact { all c:Cidade | #c.regioes = 4}

-- Para tornar o problema verdadeiro, existencialmente, existira uma ponte que nao sera visitada, pela logica do problema
fact { some p:Ponte | p.status = NaoVisitado }

-- Assert que verifica se a quantidade fixa definida foi atendida
assert maximoDePontes {all c:Cidade | #(c.regioes) = 4}

-- Verifica se Toda Ponte possui um status associado a ela
assert todaPonteTemStatus {all p:Ponte | some p.status}

check maximoDePontes 

pred show[]{}
run show
