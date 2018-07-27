module pontesCariri

-- Criando uma cidade que contera todas as 4 regioes
one sig Cidade {
	regioes: set Regiao
}

-- Criando uma regiao generica
abstract sig Regiao {}

-- Criando uma ponte generica
abstract sig Ponte {}

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
one sig PonteNW1 extends Ponte {a : one Status}
one sig PonteNW2 extends Ponte {b : one Status}
one sig PonteWS1 extends Ponte {c : one Status}
one sig PonteWS2 extends Ponte {d : one Status}
one sig PonteES extends Ponte {e : one Status}
one sig PonteWE extends Ponte {f : one Status}
one sig PonteNE extends Ponte {g : one Status}

-- Fato que define a quantidade maxima de regioes
fact qtdRegioes {
	all c:Cidade | #c.regioes = 4
}

-- Assert que verifica se a quantidade fixa definida foi atendida
assert maximoDePontes {
	all c:Cidade | #(c.regioes) = 4
}

pred show[]{}
run show
