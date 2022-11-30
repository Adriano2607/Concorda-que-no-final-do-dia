use adriano;

-- ======================================================================================================================
-- inner join
-- selecionar nome do dono do categoria sedan
select idProprietario,nome as NomeCompleto from proprietario 
inner join carro on carro.proprietario_idProprietario = proprietario.idProprietario
where Categoria = 'Sedan';
    
-- tipos de motor de carros novos 
select ano,motor as Motor from carro 
inner join modelo on modelo.carro_idcarro = carro.idcarro
where Descrição = 'Novo';
    
-- selecionar caracteristica de carro do ano acima 2010
select ano,caracteristicas as Caracteristicas from modelo
inner join carro on carro.idcarro = modelo.carro_idCarro
where Ano > 2010 ;
    
-- seleciona fabricante de carros semi ou novo
select Descrição,Nome_do_Fabricante as Fabricante from fabricante
inner join modelo on modelo.idmodelo = fabricante.modelo_idmodelo
where Descrição like 'Semi' or Descrição like 'Novo';
    
-- select ano do carro de placa fxj-0618
select placa,ano as Ano from carro
inner join placa on placa.idplaca = carro.placa_idplaca
where placa like 'FXJ-0618';

-- ======================================================================================================================
-- order by
-- nomes que terminam com A
select nome,estado from proprietario where nome like '%a' order by estado ASC;

-- terminam com 6	   
select idchassi,numero_do_chassi from chassi where Numero_do_chassi like '%6' order by numero_do_chassi ASC;
	
-- categoria dos carros emtre 2005 e 2010
select idcarro,ano, categoria from carro where ano between '2005' and '2010 'order by idcarro DESC;
		
-- se tem ar os carros com a pintura azul ou preto sem repetir(distinct)
select distinct pintura,Ar_condicionado as 'Tem Ar?' from opcionais where pintura like 'Azul' or pintura like 'Preto' order by pintura ASC;
    
-- placas que comecam com I
select idplaca,placa as 'Placas RS' from placa where placa like 'I%' order by idplaca ASC;

-- ======================================================================================================================
-- group by
select estado  as 'Estado com mais pessoas', COUNT(estado) as 'Quantas vezes aparece' FROM proprietario GROUP BY estado HAVING COUNT(estado) > 2;

select nome_do_fabricante, COUNT(idFabricante) as 'Quantidade de Concessionarias'  from fabricante GROUP BY nome_do_fabricante;

select pintura  as 'Pintura que aparece mais de uma vez' , COUNT(pintura) as 'Quantas vezes aparece' from opcionais GROUP BY pintura having count(pintura) > 2;
	
select * from modelo GROUP BY idModelo having Descrição = 'Novo' ORDER BY idModelo ASC ;

select idCarro,ano,categoria from carro GROUP BY idCarro having ano > 2006 and (Categoria = 'Sedan' or categoria = 'Hatch' )  ORDER BY ano ASC ;

-- ======================================================================================================================
-- Trazer três consultas que combinem join e order by (sem repetir as anteriores).
select ano,Categoria from carro 
INNER JOIN opcionais ON opcionais.idOpcionais = carro.opcionais_idopcionais where ano >= 2005 
ORDER BY Ano;

select Descrição,caracteristicas from modelo
inner join carro on carro.idCarro = modelo.carro_idCarro where Descrição = 'Usado' or Descrição = 'Semi'
ORDER BY Descrição;

select * from placa
inner join carro on carro.placa_idPlaca = placa.idPlaca where Estampador like 'Mercosul' and ano like 2011
order by placa ASC;

-- numero do chassi comeca com 6 e motor turbo
select * from chassi
inner join carro on carro.Chassi_idChassi = chassi.idChassi where  Numero_do_chassi like '6%' and motor = 'Turbo'
order by idChassi ASC;

-- nomes que nao terminam com A
select idProprietario,nome from proprietario
inner join carro on carro.proprietario_idProprietario = proprietario.idProprietario where not nome like '%a'
order by nome DESC;

-- ======================================================================================================================
-- 10 - Trazer sete consultas que contemplem funções matemáticas (e.g. AVG, SUM...)
SELECT HEX(cpf) as 'representacao Hexadecimal ' from proprietario where idProprietario = 5;
SELECT AVG(Ano) AS 'Media Ano ' FROM carro;
SELECT MAX(Valor_de_custo) 'maximo valor de custo' FROM custo;
SELECT MIN(Valor_de_custo) 'minimo valor de custo' FROM custo;
SELECT COUNT(Valor_de_Venda) as 'numero de vendas' FROM custo;
SELECT (Valor_de_Venda - Valor_de_custo) as 'lucro' from custo; 
select SUM(Valor_de_Custo) as 'Custo Total ' from custo ; 

select * from proprietario;
select * from custo;
-- ======================================================================================================================
-- 11 - Criar cinco visões.
CREATE VIEW visao_chassi AS SELECT * FROM chassi where idChassi > 2;
CREATE VIEW visao_placa AS SELECT * FROM placa;
CREATE VIEW visao_opcionais AS SELECT * FROM opcionais;
CREATE VIEW visao_proprietario AS SELECT * FROM proprietario;
CREATE VIEW visao_carro AS SELECT * FROM carro;
SHOW TABLES;

-- ======================================================================================================================
-- 12 - Criar cinco savepoints.
start transaction;

savepoint atalho1;
CREATE TABLE chassi2 (
  idChassi int NOT NULL AUTO_INCREMENT primary key,
  Numero_do_chassi CHAR(25) NOT NULL
);


savepoint atalho2;
CREATE TABLE placa2 (
  idPlaca int NOT NULL AUTO_INCREMENT primary key,
  Placa NVARCHAR(20) NOT NULL,
  Número_de_Série CHAR(25) NOT NULL,
  Estampador CHAR(20) NOT NULL
);

savepoint atalho3;
CREATE TABLE opcionais3 (
  idOpcionais int NOT NULL AUTO_INCREMENT primary key,
  Ar_condicionado CHAR(10),
  Direção_hidráulica CHAR(10),
  Pintura CHAR(20)
) ;

savepoint atalho4;
CREATE TABLE fabricante4 (
  idFabricante int NOT NULL AUTO_INCREMENT primary key,
  CNPJ CHAR(25) ,
  Nome_do_Fabricante Nvarchar(45),
  Modelo_idModelo int NOT NULL,
  CONSTRAINT fk_Fabricante_Modelo1 FOREIGN KEY (Modelo_idModelo) REFERENCES modelo (idModelo) ON DELETE CASCADE
);

savepoint atalho5;
insert into placa values (16,'ERD-0145','00523042007-B','Mercosul');


ROLLBACK TO atalho1;
ROLLBACK TO atalho2;
ROLLBACK TO atalho3;
ROLLBACK TO atalho4;
ROLLBACK TO atalho5;

-- ======================================================================================================================
-- 13 - Criar três usuários distintos sendo que um deles só poderá ter acesso às views, 
-- um só poderá inserir dados sem ver e o outro apenas poderá ver sem nenhuma outra ação.
use mysql;
CREATE USER 'teste1'@'localhost' IDENTIFIED BY '123';
CREATE USER 'teste2'@'localhost' IDENTIFIED BY '123';
CREATE USER 'teste3'@'localhost' IDENTIFIED BY '123';

grant select on adriano.visao_chassi to 'teste1'@'localhost';
grant insert on adriano.carro to 'teste2'@'localhost';
grant select on adriano.placa to 'teste3'@'localhost';

SHOW GRANTS FOR teste1@localhost;
SHOW GRANTS FOR teste2@localhost;
SHOW GRANTS FOR teste3@localhost;
