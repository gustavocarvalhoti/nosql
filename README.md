# Treinamento Alura - NoSQL
## Utilizei MySQL e Mongo para fazer os exemplos

## Sobre

````
Quando falamos de internet e redes sociais, 
estamos falando de uma coisa um pouco mais caótica, 
onde os modelos relacionais não conseguem gerenciar esse caos. 
E os bancos de dados NoSQL vieram para preencher essa lacuna.

Sistemas de armazenamento distribuidos
Dados Semi-Estruturados (Posso incluir novas props no JSON)
Alta disponibilidade
Replicação de Dados
Escalabilidade Horizontal - Quanto mais necessidade ele cria mais pods

Modelos de replicação: Mestre-Escravo e Mestre-Mestre

Não exige schema

Linguagem de consulta menos poderosa (SCRUD), cada um DB tem sua API

Podemos Versionar - O rotulo

Eu ganho desempenho quando o mesmo formulário precisa alterar muitas tabelas.

Grava em Json
Tem uma classe que transforma Json x Classe e vice-versa

Tipos:
BigTable - Google
DynamoDB - Amazon
Cassandra - Facebook

MongoDB e CouchDB - Documentos
Baseado em Grafos - Neo4j e Graphbase

Tipos NoSQL:
1 - Baseado em documento -> cria o _id automatico
2 - Chave Valor -> 
Chave: Funcionario_1111_CPF,  Valor: 111
Chave: Funcionario_1111_NOME, Valor: GUSTAVO
3 - Colunas -> Ele cresce uma coluna para cada registro
CPF********************************
111     222         333
PRIMEIRO_NOME**********************
111     222         333
GUSTAVO MICHELLE    DUDA
4 - Grafos ->
Temos o nó e a relação, exemplo facebook que um segue o outro
````

## Install

````
### MySQL
docker run --name database-mysql --network host -e MYSQL_ROOT_PASSWORD=root -d mysql:latest

### Mongo
docker run --name node-mongoose -p 27017:27017 -d mongo
````