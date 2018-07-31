module pontesCariri

-- Criando uma cidade generica
abstract sig Cidade {}

-- Criando as regioes da cidade
one sig N extends Cidade {}
one sig E extends Cidade {}
one sig W extends Cidade {}
one sig S extends Cidade {}

-- Ponte generica para o problema, a ponte servira de conexao para as regioes da cidade.
abstract sig Ponte {
	conexoes : set Cidade 
} 

-- Pontes especificas do problema, utilizando uniao para representar as conexoes especificas entre as regioes do problema do problema.
one sig Ponte1 extends Ponte {} {conexoes = N + W}
one sig Ponte2 extends Ponte {} {conexoes= N + W}
one sig Ponte3 extends Ponte {} {conexoes = S + W}
one sig Ponte4 extends Ponte {} {conexoes = S + W}
one sig Ponte5 extends Ponte {} {conexoes = E + W}
one sig Ponte6 extends Ponte {} {conexoes = E + S}
one sig Ponte7 extends Ponte {} {conexoes = N + E}

-- Definicao de um caminho para cobertura das pontes, contendo um passo inicial. 
sig Caminho { 
	passoInicial : Passo 
}

-- Definicao do passo para caminhar pelas pontes, o passo começa de um lado da ponte e termina do outro lado da mesma.
sig Passo {
	de, para: Cidade,
	via: Ponte,
	proximoPasso : lone Passo } {via.conexoes = de + para}

-- Funcao para caminhar pelas pontes, o destino do passo atual é o começo do próximo.
fun passos (c:Caminho) : set Passo {
	c.passoInicial.*proximoPasso
}

-- Predicado que cobre todas as pontes, um caminho gerado que consegue a cobertura total, uma caminho que cubra todas as pontes.
pred caminho {
	some c:Caminho | passos[c].via = Ponte
}

-- Fato que gera o caminho para "atravessarmos" as pontes
fact {all p:Passo, proximo:p.proximoPasso | proximo.de = p.para}

-- Fato que define a quantiade de conexoes
fact {all p:Ponte | #p.conexoes = 2}

pred show[]{}
run show
