#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Compte
#------------------------------------------------------------

CREATE TABLE Compte(
        monnaie Int ,
        pseudo  Varchar (1) NOT NULL ,
        email   Varchar (1) ,
        mdp     Varchar (1) ,
        PRIMARY KEY (pseudo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Icone
#------------------------------------------------------------

CREATE TABLE Icone(
        id_icone    Int NOT NULL ,
        image_table Varchar (1) ,
        PRIMARY KEY (id_icone )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: partie
#------------------------------------------------------------

CREATE TABLE partie(
        id_partie     int (11) Auto_increment  NOT NULL ,
        score_perdant Int NOT NULL ,
        nom_table     Varchar (1) ,
        PRIMARY KEY (id_partie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Table
#------------------------------------------------------------

CREATE TABLE Table(
        nom_table   Varchar (1) NOT NULL ,
        mise        Int NOT NULL ,
        description Varchar (1) ,
        image_table Varchar (1) ,
        PRIMARY KEY (nom_table )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Possede_icone
#------------------------------------------------------------

CREATE TABLE Possede_icone(
        pseudo   Varchar (1) NOT NULL ,
        id_icone Int NOT NULL ,
        PRIMARY KEY (pseudo ,id_icone )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Participe
#------------------------------------------------------------

CREATE TABLE Participe(
        gagnant   Int NOT NULL ,
        pseudo    Varchar (1) NOT NULL ,
        id_partie Int NOT NULL ,
        PRIMARY KEY (pseudo ,id_partie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Liste_amis
#------------------------------------------------------------

CREATE TABLE Liste_amis(
        pseudo        Varchar (1) NOT NULL ,
        ami Varchar (1) NOT NULL ,
        PRIMARY KEY (pseudo ,pseudo_Compte )
)ENGINE=InnoDB;

ALTER TABLE partie ADD CONSTRAINT FK_partie_nom_table FOREIGN KEY (nom_table) REFERENCES Table(nom_table);
ALTER TABLE Possede_icone ADD CONSTRAINT FK_Possede_icone_pseudo FOREIGN KEY (pseudo) REFERENCES Compte(pseudo);
ALTER TABLE Possede_icone ADD CONSTRAINT FK_Possede_icone_id_icone FOREIGN KEY (id_icone) REFERENCES Icone(id_icone);
ALTER TABLE Participe ADD CONSTRAINT FK_Participe_pseudo FOREIGN KEY (pseudo) REFERENCES Compte(pseudo);
ALTER TABLE Participe ADD CONSTRAINT FK_Participe_id_partie FOREIGN KEY (id_partie) REFERENCES partie(id_partie);
ALTER TABLE Liste_amis ADD CONSTRAINT FK_Liste_amis_pseudo FOREIGN KEY (pseudo) REFERENCES Compte(pseudo);
ALTER TABLE Liste_amis ADD CONSTRAINT FK_Liste_amis_pseudo_Compte FOREIGN KEY (ami) REFERENCES Compte(pseudo);
