create database resto;
create user resto;
create table plat(
	id varchar(20) primary key,
	nom varchar(255),
	prix double precision
);
create sequence platseq  start with 1 increment by 1;
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Soupe chinoise',2000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Salade cesar',2500);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Salade nicoise',3000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Riz cantonnais',3500);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Mine-sao poulet',4000);
insert into plat values(CONCAT('Plat',nextVal('platseq')),'Mine-sao tsa-tsiou',4500);
