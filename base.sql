create database restaurant;
create table produit(
	id varchar(20) primary key,
	nom varchar(100)
);
create table categorie(
	id varchar(20) primary key,
	nom varchar(100)
);
create table photo(
	id varchar(20) primary key,
	nom varchar(255)
);
create table plat(
	id varchar(20) primary key,
	nom varchar(255),
	idPhoto varchar(20),
	prix double precision
);
create table categoriePlat(
	id varchar(20) primary key,
	idPlat varchar(20),
	idCategorie varchar(20)
);
create table platProduit(
	idPlat varchar(20),
	idProduit varchar(20),
	qte double precision
);
create sequence produitseq  start with 1 increment by 1;
create sequence categorieseq  start with 1 increment by 1;
create sequence photoseq  start with 1 increment by 1;
create sequence platseq start with 1 increment by 1;
create sequence categoriePlatseq  start with 1 increment by 1;
create sequence platProduitseq  start with 1 increment by 1;

alter table categorieplat ADD CONSTRAINT fk_categorieplat_plat foreign key (idPlat) references plat(id);
alter table categorieplat ADD CONSTRAINT fk_categorieplat_categorie foreign key (idCategorie) references categorie(id);

alter table platProduit ADD CONSTRAINT fk_categorieplat_categorie foreign key (idPlat) references plat(id);
alter table platProduit ADD CONSTRAINT fk_categorieplat_categorie foreign key (idProduit) references produit(id);

alter table plat ADD CONSTRAINT fk_plat_photo foreign key (idPhoto) references photo(id);

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

insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat7','Categorie3');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat8','Categorie3');

insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat5','Categorie1');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat6','Categorie1');

insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat1','Categorie1');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat2','Categorie1');


	
	

