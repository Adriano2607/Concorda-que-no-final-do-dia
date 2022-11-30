create database adriano;
use adriano;

 CREATE TABLE chassi (
  idChassi int NOT NULL AUTO_INCREMENT primary key,
  Numero_do_chassi CHAR(100) NOT NULL
);

CREATE TABLE placa (
  idPlaca int NOT NULL AUTO_INCREMENT primary key,
  Placa CHAR(20) NOT NULL,
  Número_de_Série CHAR(25) NOT NULL,
  Estampador CHAR(20) NOT NULL
);

CREATE TABLE proprietario (
  idProprietario int NOT NULL AUTO_INCREMENT primary key,
  Nome CHAR(45) NOT NULL,
  Cpf CHAR(45) NOT NULL,
  RG CHAR(50) NOT NULL,
  Estado CHAR(3) NOT NULL
);

    
CREATE TABLE opcionais (
  idOpcionais int NOT NULL AUTO_INCREMENT primary key,
  Ar_condicionado CHAR(10),
  Direção_hidráulica CHAR(10),
  Pintura CHAR(20)
) ;


CREATE TABLE carro (
  idcarro int NOT NULL AUTO_INCREMENT primary key,
  Ano CHAR(5) NOT NULL,
  Categoria varchar(25),
  Motor varchar(20) ,
  Proprietario_idProprietario int NOT NULL,
  Opcionais_idOpcionais int NOT NULL,
  Placa_idPlaca int NOT NULL,
  Chassi_idChassi int NOT NULL,
  CONSTRAINT fk_Carro_Chassi1 FOREIGN KEY (Chassi_idChassi) REFERENCES chassi (idChassi) ON DELETE CASCADE,
  CONSTRAINT fk_Carro_Opcionais1 FOREIGN KEY (Opcionais_idOpcionais) REFERENCES opcionais (idOpcionais)ON DELETE CASCADE,
  CONSTRAINT fk_Carro_Placa1 FOREIGN KEY (Placa_idPlaca) REFERENCES placa (idPlaca)ON DELETE CASCADE,
  CONSTRAINT fk_Carro_Proprietrario1 FOREIGN KEY (Proprietario_idProprietario) REFERENCES proprietario (idProprietario)ON DELETE CASCADE
  );
  
  CREATE TABLE modelo (
  idModelo int NOT NULL AUTO_INCREMENT primary key,
  Descrição varchar(45),
  Caracteristicas varchar(45),
  Carro_idcarro int NOT NULL,
  CONSTRAINT fk_Modelo_Carro1 FOREIGN KEY (Carro_idcarro) REFERENCES carro (idcarro) ON DELETE CASCADE
);


CREATE TABLE Custo (
  idCusto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Valor_de_custo CHAR(20) NOT NULL,
  Valor_de_Venda CHAR(20) NOT NULL 
  );


CREATE TABLE Fabricante (
  idFabricante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CNPJ CHAR(30) NOT NULL,
  Nome_do_Fabricante VARCHAR(45) NULL,
  Modelo_idModelo INT NOT NULL,
  Custo_idCusto INT NOT NULL,
  CONSTRAINT fk_Fabricante_Modelo1 FOREIGN KEY (Modelo_idModelo) REFERENCES Modelo (idModelo) ON DELETE CASCADE,
  CONSTRAINT fk_Fabricante_Custo1 FOREIGN KEY (Custo_idCusto) REFERENCES Custo (idCusto) ON DELETE CASCADE
    );
    
	select * from chassi; -- ready
	select * from placa; -- ready
	select * from proprietario; -- ready
     select * from opcionais; -- ready
	select * from carro; -- ready
	select * from modelo;-- ready
    select * from Custo;-- ready
	select * from fabricante;-- ready
