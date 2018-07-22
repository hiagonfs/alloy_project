module cidade

-- Cidade única que possui um conjunto de regioes
one sig Cidade {
	regioes : set Regiao
}

-- Regiao Generica que possui o conjunto de todas as pontes da cidade
abstract sig Regiao {
	pontes : set Ponte
}

-- Regioes especificas da cidade
one sig RegiaoN extends Regiao {}
one sig RegiaoW extends Regiao {}
one sig RegiaoS extends Regiao {}
one sig RegiaoE extends Regiao {}

-- VIajante que ira atravessar as pontes 
one sig Viajante {
	caminhos : set Caminho
}

-- 

 
