# Repositório desafio técnico SiCooperative LTDA

## Objetivo

Abrigar os arquivos e instruções referentes à modelagem de dados de movimentações de cartões da empresa fictícia SiCooperative LTDA.

## Requisitos

* Instalação local do MySql;
* Instalação local do Python3+.

## Arquivos e pastas

* modelo_movimentacoes_cartoes.jpg: modelo de dados criado para o cenário em questão;
* modelo_movimentacoes_cartoes.mwb: modelo de dados, criado no software MySQL Workbench, para o cenário em questão 
* etl.ipynb: código Python criado no Jupyter Noteebok, utilizado para geração do arquivo CSV final;
* ddl_movimentacoes_cartoes.sql: script de definição da estrutura do banco de dados;
* dml_movimentacoes_cartoes.sql: script para manipular e popular as tabelas do banco de dados;
* movimento_flat.csv: arquivo final, resultante do processamento.


## Instruções para replicação do ambiente

1. Execute o script 'ddl_movimentacoes_cartoes.sql' em seu MySQL local.
2. Execute o script 'dml_movimentacoes_cartoes.sql'.
3. Abra o Jupyter Notebook no local em que baixou estes arquivos. Note que, para a conexão com o MySQL, talvez seu usuário local seja diferente. Neste caso, é necessário atualizar.

## Como foi implementado

* Para criação do modelo, do schema e das tabelas, foi utilizado o software MySQL Workbench, que já agrega a funcionalidade de modelagem e SGBD em um mesmo local;
* Após a criação do modelo, com base no cenário proposto, foi gerado o schema e suas respectivas tabelas através da opção de Forward Engineer do MySQL Workbench;
* Foi inserida uma massa de dados fictícia das tabelas transacionais;
* Esta carga foi carregada para Data Mart (dm_movimento_flat) de acordo com o modelo proposto;
* Após tal carga, foi criando um arquivo Python, via Jupyter Notebook, para realizar a leitura deste Data Mart e, como resultado final, a geração de um arquivo CSV no mesmo diretório.

## Melhorias

* Na tabela 'cartao' foi criado o campo data_criacao_cartao, que não tinha no modelo relacional apresentado, porém havia no modelo do Data Mart;
* Os dados persistidos no arquivo flat possuem o mesmo tipo da origem; foi optado por esta modelagem, para garantia da integridade das informações no Data Mart, uma vez que no modelo 'movimento_flat' todos os campos eram string;
* Foi adicionado o campo cod_movimento na tabela movimento_flat para garantir a persistencia histórica dos dados, caso os dados transacionais sofram alteração, observando, desta maneira, o conceito de SCD (Slowly Changing Dimension);


## Sugestões e observações

* Armazenar o sexo do associado nos dados transacionais, para traçar o perfil de movimentações por gênero;
* Além dos dados transacionais, poderiam ser ingeridos dados de outras fontes, como planilhas, web, logs, etc, através da leitura dos mesmos em uma aplicação Python e posterior ingestão no Data Mart;
* Os dados inseridos no banco poderiam ter sido originados de planilhas ou arquivos CSV, os quais podem ser tratados diretamente na aplicação Python;
* Caso o modelo de negócios permita, adicionar cartões adicionais para dependentes, gerando mais receita e mais opções de análises.

## Pontos não abordados

* Diretório de escrita do arquivo parametrizado pelo usuário;
* Utilização de framework de processamento distribuído;
* Provisionamento do ambiente e execução inicial do processo de maneira automatizada utilizando Docker;
* Testes unitários.

## Contato 

* E-mail: marlos.wagner@hotmail.com
* Linkedin: https://www.linkedin.com/in/marlos-nascimento/