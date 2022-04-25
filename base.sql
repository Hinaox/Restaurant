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
insert into platProduit values('Plat1','produit2',100);
insert into platProduit values('Plat2','produit1',120);
insert into platProduit values('Plat2','produit2',120);
insert into platProduit values('Plat3','produit4',150);
insert into platProduit values('Plat3','produit1',150);
insert into platProduit values('Plat3','produit2',150);
insert into platProduit values('Plat4','produit5',900);
insert into platProduit values('Plat4','produit3',900);
insert into platProduit values('Plat5','produit6',900);
insert into platProduit values('Plat5','produit7',900);
insert into platProduit values('Plat6','produit6',500);
insert into platProduit values('Plat6','produit6',500);
insert into platProduit values('Plat6','produit7',500);
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
	numTable varchar(20)
);
create table detailsCommande(
	id varchar(50) primary key,
	idServeur varchar(20),
	idCommande varchar(20),
	idPlat varchar(20),
	prix double precision,
	etape int,
	dateCommande date
);
create table tables(
	id varchar(20) primary key,
	nom varchar(100)
);
create table profil(
	id varchar(20) primary key,
	nom varchar(100)
);
create table utilisateur(
	id varchar(20) primary key,
	idProfil varchar(20),
	login varchar(100),
	mdp varchar(255)
);
create table livraison(
	id varchar(20) primary key,
	idDetailsCommande varchar(20)
);
create sequence livraisonseq start with 1 increment by 1;
create sequence profilseq  start with 1 increment by 1;
create sequence utilisateurseq  start with 1 increment by 1;

insert into profil values(CONCAT('profil',nextVal('profilseq')),'Cuisinier');
insert into profil values(CONCAT('profil',nextVal('profilseq')),'Serveur');
insert into profil values(CONCAT('profil',nextVal('profilseq')),'Livreur');
insert into profil values(CONCAT('profil',nextVal('profilseq')),'Caissier');


alter table utilisateur ADD CONSTRAINT fk_utilisateur_profil foreign key (idProfil) references profil(id);


insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom1');
insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom2');
insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom3');
insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom7');
insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom8');
insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom9');


insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom10');
insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom11');
insert into livraison values(CONCAT('livraison',nextVal('livraisonseq')),'detailsCom12');


create view detailsCommandeNonLivre as
	select * from detailsCommande where id not in (select idDetailsCommande from livraison) 

create view detailsCommandeLivre as
	select * from detailsCommande where id in (select idDetailsCommande from livraison) 

create view detailsCommandePret as
	select detailsCommande.id,detailsCommande.idServeur,detailsCommande.idCommande,detailsCommande.idPlat,detailsCommande.prix,detailsCommande.etape,commande.numTable as idTables from detailsCommande join commande on commande.id = detailsCommande.idCommande
	where detailsCommande.id not in (select idDetailsCommande from livraison)  and detailsCommande.etape= 2

alter table detailsCommande add column etape int

create sequence serveurseq  start with 1 increment by 1;
create sequence tablesseq  start with 1 increment by 1;
create sequence commandeseq  start with 1 increment by 1;
create sequence detailsCommandeseq  start with 1 increment by 1;

alter table detailsCommande ADD CONSTRAINT fk_detailsCommande_commande foreign key (idCommande) references commande(id);
alter table detailsCommande ADD CONSTRAINT fk_detailsCommande_plat foreign key (idPlat) references plat(id);
alter table detailsCommande ADD CONSTRAINT fk_detailsCommande_serveur foreign key (idServeur) references serveur(id);

alter table commande ADD CONSTRAINT fk_commande_tables foreign key (numTable) references tables(id);
/*TABLES*/
insert into tables values(CONCAT('Table',nextVal('tablesseq')),'Special');
insert into tables values(CONCAT('Table',nextVal('tablesseq')),'Table1');
insert into tables values(CONCAT('Table',nextVal('tablesseq')),'Table2');
insert into tables values(CONCAT('Table',nextVal('tablesseq')),'Table3');
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
	select commande.id,detailsCommande.idServeur,commande.numTable,detailsCommande.dateCommande,serveur.nom,detailsCommande.prix,detailsCommande.idPlat
		from addition join commande on commande.id = addition.idCommande join detailsCommande on detailsCommande.idCommande = commande.id join serveur on serveur.id = detailsCommande.idServeur

	select idServeur,nom,sum(prix)*0.02 as totalPourboire from additiondetails group by idServeur,nom


/*ADDITION PAR TABLE*/
create view additionParTable as 
	select detailsCommande.idCommande,commande.numTable,sum(detailsCommande.prix) as total from detailsCommande inner join 
commande on commande.id = detailsCommande.idCommande where detailsCommande.id in (select idDetailsCommande from livraison) group by detailsCommande.idCommande,commande.numTable


/*INGREDIENT PLAT IRAY*/
select * from ingredient where idPlat = 'Plat1'

/*MODIFICATION DU 04-04-2022*/
/*detailsCommande*/
update detailsCommande set etape=0 where idCommande='CMD21';
update detailsCommande set etape = 1 where idCommande='commande2';

update detailsCommande set etape = 1 where id='detailsCom1';
update detailsCommande set etape = 1 where id='detailsCom2';
update detailsCommande set etape = 1 where id='detailsCom3';

update detailsCommande set etape = 2 where id='detailsCom4';
update detailsCommande set etape = 2 where id='detailsCom5';
update detailsCommande set etape = 2 where id='detailsCom6';

update detailsCommande set etape = 0 where id='detailsCom13';
update detailsCommande set etape = 0 where id='detailsCom14';

/*
etape 0 tss nandray
etape 1 ns nandray 
etape 2 prepare
*/


update detailsCommande set dateCommande='2022-04-04' where id='detailsCom1';
update detailsCommande set dateCommande='2022-04-04' where id='detailsCom2';
update detailsCommande set dateCommande='2022-04-04' where id='detailsCom3';
update detailsCommande set dateCommande='2022-04-04' where id='detailsCom4';

update detailsCommande set dateCommande='2022-04-06' where id='detailsCom5';
update detailsCommande set dateCommande='2022-04-06' where id='detailsCom6';
update detailsCommande set dateCommande='2022-04-06' where id='detailsCom7';
update detailsCommande set dateCommande='2022-04-06' where id='detailsCom8';

update detailsCommande set dateCommande='2022-04-08' where id='detailsCom9';
update detailsCommande set dateCommande='2022-04-08' where id='detailsCom10';
update detailsCommande set dateCommande='2022-04-08' where id='detailsCom11';
update detailsCommande set dateCommande='2022-04-08' where id='detailsCom12';

update detailsCommande set dateCommande='2022-04-10' where id='detailsCom13';
update detailsCommande set dateCommande='2022-04-10' where id='detailsCom14';
update detailsCommande set dateCommande='2022-04-10' where id='DetailsCommande-15';
update detailsCommande set dateCommande='2022-04-10' where id='DetailsCommande-16';

/*payement*/
update detailsCommande set dateCommande='2022-04-04' where idCommande='commande1';
update detailsCommande set dateCommande='2022-04-10' where idCommande='commande2';
update detailsCommande set dateCommande='2022-04-08' where idCommande='CMD21';
select ingredient.idProduit,sum(ingredient.qte) as quantite 
	from ingredient join detailsCommande on ingredient.idPlat=detailsCommande.idPlat 
	where detailsCommande.dateCommande between '2022-04-03' and '2022-04-10'
	group by ingredient.idProduit
create table mouvementStock(
	idProduit varchar(20),
	daty date,
	mouvement varchar(10),
	qte double precision
);
alter table mouvementStock ADD CONSTRAINT fk_mouvementStock_produit foreign key (idProduit) references produit(id);
/*ajout*/

create view ajoutStock as
	select  idProduit,sum(qte) as qteAjout from mouvementStock where mouvement='ajout' group by idProduit

create view retraitStock as
	select idProduit,sum(qte) as qteRetrait from mouvementStock where mouvement='retrait' group by idProduit

create view stockActuel as 
	select ajoutStock.idProduit,ajoutStock.qteAjout-retraitStock.qteRetrait as quantite 
	from ajoutStock join retraitStock on ajoutStock.idProduit = retraitStock.idProduit

create table typePayement(
	id varchar(20) primary key,
	nom varchar(100)
);
create table payement(
	id varchar(20) primary key,
	idClient varchar(20),
	idTypePayement varchar(20),
	idCommande varchar(20),
	datePayement date,
	montant double precision
);
create sequence typePayementseq start with 1 increment by 1;
create sequence payementseq start with 1 increment by 1;

alter table payement ADD CONSTRAINT fk_payement_typePayement foreign key (idTypePayement) references typePayement(id);
alter table payement ADD CONSTRAINT fk_payement_commande foreign key (idCommande) references commande(id);

insert into typePayement values(CONCAT('typePayement',nextVal('typePayementseq')),'Carte');
insert into typePayement values(CONCAT('typePayement',nextVal('typePayementseq')),'Espece');
insert into typePayement values(CONCAT('typePayement',nextVal('typePayementseq')),'Mobile money');

CMD1 15 800
CMD2 13 100
CMD21 6000
/*CMD1*/
insert into payement values(CONCAT('payement',nextVal('payementseq')),'Client1','typePayement1','commande1','2022-04-04',3000);
insert into payement values(CONCAT('payement',nextVal('payementseq')),'Client1','typePayement1','commande1','2022-04-04',4000);
insert into payement values(CONCAT('payement',nextVal('payementseq')),'Client1','typePayement1','commande1','2022-04-04',8800);
/*CMD2*/
insert into payement values(CONCAT('payement',nextVal('payementseq')),'Client1','typePayement2','commande2','2022-04-10',8000);
insert into payement values(CONCAT('payement',nextVal('payementseq')),'Client1','typePayement2','commande2','2022-04-10',1000);
insert into payement values(CONCAT('payement',nextVal('payementseq')),'Client1','typePayement2','commande2','2022-04-10',4100);
/*CMD21*/
insert into payement values(CONCAT('payement',nextVal('payementseq')),'Client1','typePayement3','CMD21','2022-04-08',6000);



/*alter table payement ADD CONSTRAINT fk_payement_client foreign key (idClient) references client(id);*/


create view payementCommande as  
	select 
	payement.idCommande,payement.idClient,payement.idTypePayement,typePayement.nom as nomType,payement.datePayement,payement.montant,commande.numTable
	from payement join commande on payement.idCommande = commande.id join typePayement on typePayement.id = payement.idTypePayement


