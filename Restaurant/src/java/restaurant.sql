/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  amboara
 * Created: 28 mai 2022
 */

create table report(
	id varchar(20) primary key,
	idProduit varchar(20),
	qte double precision,
	dateInventaire date
);
create sequence reportseq start with 1 increment by 1;
alter table report ADD CONSTRAINT fk_report_produit foreign key (idProduit) references produit(id);

insert into report values(CONCAT('report',nextVal('reportseq')),'produit1',100,'2022-05-25');

CREATE OR REPLACE VIEW max_report AS
    SELECT
    idProduit,
    MAX(dateInventaire) AS dateInventaire
    FROM report
    GROUP BY idProduit;

CREATE OR REPLACE VIEW dernier_report AS 
    SELECT
    r.*
    FROM report r 
    JOIN max_report rmax
    ON r.idProduit = rmax.idProduit AND r.dateInventaire = rmax.dateInventaire;

CREATE OR REPLACE VIEW produit_report AS 
    SELECT
    p.*,
    dr.dateInventaire,
    dr.


