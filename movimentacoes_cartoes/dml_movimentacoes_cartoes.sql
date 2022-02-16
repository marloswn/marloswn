use movimentacoes_cartoes;

----------------------------------------

-- carga tabela associado:

insert into associado (nome, sobrenome, idade, email)
values ('Marlos', 'Nascimento', 33, 'marlos.nascimento@sicooperative.com'),
('Ronaldo', 'Abreu', 22, 'ronaldo@abreu.com'),
('Maria', 'Madalena', 28, 'maria@madalena.com'),
('Antonio', 'Nunes', 50, 'antonio@nunes.com'),
('Eduarda', 'Aguiar', 19, 'eduarda@aguiar.com'),
('José', 'Silva', 48, 'jose@silva.com'),
('Abílio', 'Abreu', 62, 'abilio@abreu.com'),
('Pedro', 'Alves', 24, 'pedro@alves.com'),
('Marli', 'Ribeiro', 50, 'marli@ribeiro.com'),
('Bruna', 'Souza', 31, 'bruna@souza.com');

select * from associado;

----------------------------------------------

-- carga tabela conta

insert into conta (tipo_conta, data_criacao_conta, cod_associado)
values ('Conta corrente', '2015-05-03', 2),
('Conta poupança', '2010-09-15', 3),
('Conta investimento', '2013-10-01', 7),
('Conta corrente', '2014-12-07', 7),
('Conta corrente', '2012-01-17', 1),
('Conta corrente', '2011-04-15', 2),
('Conta investimento', '2007-07-07', 8),
('Conta poupança', '2020-08-23', 9),
('Conta corrente', '2022-01-07', 4),
('Conta investimento', '2022-02-01', 4);

select * from conta;
-------------------------------------------

-- carga tabela cartao

insert into cartao (num_cartao, nome_impresso, data_criacao_cartao, cod_associado, cod_conta)
values (1234, 'Marlos Nascimento', '2012-02-01', 1, 5),
(5678, 'Ronaldo Abreu', '2015-05-10', 2, 1),
(9012, 'Ronaldo Abreu', '2011-04-29', 2, 6),
(3456, 'Antonio Nunes', '2022-02-10', 4, 9),
(7890, 'Antonio Nunes', '2022-02-10', 4, 10),
(1122, 'Maria Madalena', '2010-10-01', 3, 5),
(2233, 'Pedro Alves', '2007-08-01', 8, 7),
(3344, 'Abílio Abreu', '2013-10-05', 7, 3),
(4455, 'Abílio Abreu', '2014-12-10', 7, 4),
(5566, 'Marli Ribeiro', '2020-09-01', 9, 8);

select * from cartao;

------------------------------------------------

-- carga tabela movimento

insert into movimento (vlr_transacao, des_transacao, data_movimento, cod_cartao)
values (215.23, 'Lojas ABC', '2012-03-15', 1),
(100.00, 'Ingresso Online', '2015-06-20', 2),
(632.50, 'Faculdades XYZ', '2022-02-11', 4),
(112.99, 'Esporte Center', '2022-02-12', 5),
(50.00, 'Recarga Fácil', '2013-02-01', 1),
(22.15, 'Lanchonete da Esquina', '2012-04-20', 1),
(42.17, 'Quitanda do Vovô', '2020-11-01', 8),
(119.90, 'Academia 123', '2020-12-15', 8),
(1189.90, 'Lojas ABC', '2014-12-10', 9),
(315.74, 'Esporte Center', '2015-05-15', 2);

select * from movimento;

----------------------------------

-- carga no Data Mart

insert into dm_movimento_flat (nome_associado, sobrenome_associado, idade_associado, 
	vlr_transacao_movimento, des_transacao_movimento, data_movimento, numero_cartao, 
    nome_impresso_cartao, data_criacao_cartao, tipo_conta, data_criacao_conta)
	(select a.nome, 
			a.sobrenome, 
			a.idade,
			m.vlr_transacao,
			m.des_transacao,
			m.data_movimento,
			c.num_cartao,
			c.nome_impresso,
			c.data_criacao_cartao,
			con.tipo_conta,
			con.data_criacao_conta
		from movimento m
		inner join cartao c on m.cod_cartao = c.cod_cartao
		inner join associado a on c.cod_associado = a.cod_associado
		inner join conta con on c.cod_conta = con.cod_conta);
        
select * from dm_movimento_flat;







