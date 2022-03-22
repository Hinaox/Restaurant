create database restaurant;
create table categorie(
	id varchar(20) primary key,
	nom varchar(100)
);
create table plat(
	id varchar(20) primary key,
	nom varchar(255),
	prix double precision
);
create table categoriePlat(
	id varchar(20) primary key,
	idPlat varchar(20),
	idCategorie varchar(20)
);
create sequence platseq start with 1 increment by 1;
create sequence categorieseq  start with 1 increment by 1;
create sequence categoriePlatseq  start with 1 increment by 1;

alter table ADD CONSTRAINT fk_categorieplat_plat foreign key (idPlat) references plat(id);
alter table ADD CONSTRAINT fk_categorieplat_categorie foreign key (idCategorie) references categorie(id);

create view categorieDetails as 
	select categorie.nom,categoriePlat.* from categoriePlat inner join categorie on categoriePlat.idCategorie = categorie.id

select * from plat where id in(select idPlat from categorieplat where idcategorie='Categorie3')

insert into plat values(CONCAT('Plat',nextVal('platseq')),'Soupe chinoise',2000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Salade cesar',2500);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Salade nicoise',3000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Riz cantonnais',3500);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Mine-sao poulet',4000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Mine-sao tsa-tsiou',4500);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Banane flambe',5000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Crepe susane',6000);


insert into categorie values(CONCAT('Categorie',nextVal('categorieseq')),'Entree');
insert into categorie values(CONCAT('Categorie',nextVal('categorieseq')),'Plat');
insert into categorie values(CONCAT('Categorie',nextVal('categorieseq')),'Dessert');

insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat17','Categorie3');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat18','Categorie3');

insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat15','Categorie1');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat16','Categorie1');

insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat12','Categorie1');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat13','Categorie1');


	
	

