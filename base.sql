create database restaurant;
create table produit(
	id varchar(20) primary key,
	nom varchar(100),
	prix double precision/*par g*/
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
create table gestionPrix(
	id varchar(20) primary key,
	date1 date,
	date2 date,
	creation date,
	montantMinimum double precision,
	montantMaximum double precision,
	margeMin double precision,
	margeMax double precision
);
create table gestionDetails(
	id varchar(20) primary key,
	idGestionPrix varchar(20),
	montant1 double precision,
	montant2 double precision,
	marge double precision
);
create sequence produitseq  start with 1 increment by 1;
create sequence categorieseq  start with 1 increment by 1;
create sequence photoseq  start with 1 increment by 1;
create sequence platseq start with 1 increment by 1;
create sequence categoriePlatseq  start with 1 increment by 1;
create sequence platProduitseq  start with 1 increment by 1;

	create sequence gestionPrixseq  start with 1 increment by 1;
	create sequence gestionDetailsseq  start with 1 increment by 1;

alter table plat ADD CONSTRAINT fk_plat_photo foreign key (idPhoto) references photo(id);

alter table categorieplat ADD CONSTRAINT fk_categorieplat_plat foreign key (idPlat) references plat(id);
alter table categorieplat ADD CONSTRAINT fk_categorieplat_categorie foreign key (idCategorie) references categorie(id);

alter table platProduit ADD CONSTRAINT fk_platproduit_plat foreign key (idPlat) references plat(id);
alter table platProduit ADD CONSTRAINT fk_platproduit_produit foreign key (idProduit) references produit(id);

	alter table gestionDetails ADD CONSTRAINT fk_gestionDetails_gestionPrix foreign key (idGestionPrix) references gestionPrix(id);


create view categorieDetails as 
	select categorie.nom,categoriePlat.* from categoriePlat inner join categorie on categoriePlat.idCategorie = categorie.id

select * from plat where id in(select idPlat from categorieplat where idcategorie='Categorie3')
/*CATEGORIE*/
insert into categorie values(CONCAT('Categorie',nextVal('categorieseq')),'Entree');
insert into categorie values(CONCAT('Categorie',nextVal('categorieseq')),'Plat');
insert into categorie values(CONCAT('Categorie',nextVal('categorieseq')),'Dessert');
/*PHOTO*/
insert into photo values(CONCAT('Photo',nextVal('photoseq')),'cesar.jpg');
insert into photo values(CONCAT('Photo',nextVal('photoseq')),'nicoise.jpg');
insert into photo values(CONCAT('Photo',nextVal('photoseq')),'spaghetti.jpg');
insert into photo values(CONCAT('Photo',nextVal('photoseq')),'huitre.jpg');
insert into photo values(CONCAT('Photo',nextVal('photoseq')),'macaron.jpg');
insert into photo values(CONCAT('Photo',nextVal('photoseq')),'gateau.jpg');
/*PLAT*/
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Salade cesar','Photo1',2000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Salade nicoise','Photo2',2500);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Pate avec boulette','Photo3',3000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Assiette huitre','Photo4',3500);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Macaron','Photo5',4000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Gateux aux fraises','Photo6',4500);
/*CATEGORIEPLAT*/
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat1','Categorie1');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat2','Categorie1');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat3','Categorie2');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat4','Categorie2');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat5','Categorie3');
insert into categoriePlat values(CONCAT('categPlat',nextVal('categoriePlatseq')),'Plat6','Categorie3');
/*PLATPRODUIT*/
insert into platProduit values('Plat1','produit1',100);
insert into platProduit values('Plat2','produit1',120);
insert into platProduit values('Plat3','produit4',150);
insert into platProduit values('Plat4','produit5',900);
insert into platProduit values('Plat5','produit6',900);
insert into platProduit values('Plat6','produit6',500);
/*Produit*/
insert into produit values(CONCAT('produit',nextVal('produitseq')),'oignon',1);
insert into produit values(CONCAT('produit',nextVal('produitseq')),'tomate',2);
insert into produit values(CONCAT('produit',nextVal('produitseq')),'salade',3);
insert into produit values(CONCAT('produit',nextVal('produitseq')),'pate',5);
insert into produit values(CONCAT('produit',nextVal('produitseq')),'huitre',6);
insert into produit values(CONCAT('produit',nextVal('produitseq')),'farine',7);
insert into produit values(CONCAT('produit',nextVal('produitseq')),'oeuf',8);
/*GESTIONPRIX*/
insert into gestionPrix values(CONCAT('gestPrix',nextVal('gestionPrixseq')),'2022-01-01',null,'2022-01-01',0,10000,1.5,1.2);
/*GESTIONDETAILS*/
insert into gestionDetails values(CONCAT('gestDet',nextVal('gestionDetailsseq')),'gestPrix2',0,5000,1.4);
insert into gestionDetails values(CONCAT('gestDet',nextVal('gestionDetailsseq')),'gestPrix2',5000,10000,1.3);

/*update photo set nom='cesar.jpg' where id='Photo1';
update photo set nom='nicoise.jpg' where id='Photo2';
update photo set nom='spaghetti.jpg' where id='Photo3';
update photo set nom='huitre.jpg' where id='Photo4';
update photo set nom='macaron.jpg' where id='Photo5';
update photo set nom='gateau.jpg' where id='Photo6';*/

/*update platProduit set qte=100 where idPlat='Plat1';
update platProduit set qte=120 where idPlat='Plat2';
update platProduit set qte=150 where idPlat='Plat3';
update platProduit set qte=900 where idPlat='Plat4';
update platProduit set qte=900 where idPlat='Plat5';
update platProduit set qte=500 where idPlat='Plat6';*/

create view ingredient as
	select produit.nom,produit.prix,platProduit.*,platProduit.qte*produit.prix as somme 
	from produit inner join platProduit on produit.id = platProduit.idProduit

create view prixRevient as
	select idPlat,sum(somme) as revient from ingredient group by idPlat

create view platPhoto as
	select plat.id as idPlat,plat.nom,plat.prix,photo.id as idPhoto,photo.nom as nomPhoto 
	from plat inner join photo on plat.idPhoto = photo.id

create view prixDeVente as
	select *,gestionDetails.marge*prixRevient.revient as prixVente from gestionDetails inner join prixRevient on prixRevient.revient between gestionDetails.montant1 and gestionDetails.montant2

create table serveur(
	id varchar(20) primary key,
	nom varchar(200)
);
create table commande(
	id varchar(20) primary key,
	numTable varchar(20),
	dateCommande date
);
create table detailsCommande(
	id varchar(50) primary key,
	idServeur varchar(20),
	idCommande varchar(20),
	idPlat varchar(20),
	prix double precision
);
create sequence serveurseq  start with 1 increment by 1;
create sequence commandeseq  start with 1 increment by 1;
create sequence detailsCommandeseq  start with 1 increment by 1;

alter table detailsCommande ADD CONSTRAINT fk_detailsCommande_commande foreign key (idCommande) references commande(id);
alter table detailsCommande ADD CONSTRAINT fk_detailsCommande_plat foreign key (idPlat) references plat(id);
alter table detailsCommande ADD CONSTRAINT fk_detailsCommande_serveur foreign key (idServeur) references serveur(id);
/*SERVEUR*/
insert into serveur values(CONCAT('serveur',nextVal('serveurseq')),'Serveur1');
insert into serveur values(CONCAT('serveur',nextVal('serveurseq')),'Serveur2');
/*COMMANDE*/
insert into commande values(CONCAT('commande',nextVal('commandeseq')),'Table1','2022-03-28');

insert into commande values(CONCAT('commande',nextVal('commandeseq')),'Table2','2022-03-29');
/*DETAILS COMMANDE*/
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande1','Plat1',2500);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande1','Plat1',2500);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande1','Plat3',1200);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande1','Plat3',1200);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande1','Plat5',1000);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande1','Plat5',1000);


	insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur2','commande1','Plat4',5000);
	insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur2','commande1','Plat6',1400);

insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande2','Plat1',2500);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande2','Plat2',2000);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande2','Plat3',1200);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande2','Plat4',5000);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande2','Plat5',1000);
insert into detailsCommande values(CONCAT('detailsCom',nextVal('detailsCommandeseq')),'serveur1','commande2','Plat6',1400);


create view addition as
	select idCommande,sum(prix) as total from detailsCommande group by idCommande

create view additionDetails as
	select commande.id,detailsCommande.idServeur,commande.numTable,commande.dateCommande,serveur.nom,detailsCommande.prix,detailsCommande.idPlat
		from addition join commande on commande.id = addition.idCommande join detailsCommande on detailsCommande.idCommande = commande.id join serveur on serveur.id = detailsCommande.idServeur

	select idServeur,nom,sum(prix)*0.02 as totalPourboire from additiondetails group by idServeur,nom

