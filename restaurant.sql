--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2022-04-25 19:01:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 59398)
-- Name: detailscommande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detailscommande (
    id character varying(50) NOT NULL,
    idserveur character varying(20),
    idcommande character varying(20),
    idplat character varying(20),
    prix double precision,
    etape integer,
    datecommande date
);


ALTER TABLE public.detailscommande OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 59422)
-- Name: addition; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.addition AS
 SELECT detailscommande.idcommande,
    sum(detailscommande.prix) AS total
   FROM public.detailscommande
  GROUP BY detailscommande.idcommande;


ALTER TABLE public.addition OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 59393)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    id character varying(20) NOT NULL,
    numtable character varying(20)
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 59328)
-- Name: serveur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serveur (
    id character varying(20) NOT NULL,
    nom character varying(200)
);


ALTER TABLE public.serveur OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 59516)
-- Name: additiondetails; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.additiondetails AS
 SELECT commande.id,
    detailscommande.idserveur,
    commande.numtable,
    detailscommande.datecommande,
    serveur.nom,
    detailscommande.prix,
    detailscommande.idplat
   FROM (((public.addition
     JOIN public.commande ON (((commande.id)::text = (addition.idcommande)::text)))
     JOIN public.detailscommande ON (((detailscommande.idcommande)::text = (commande.id)::text)))
     JOIN public.serveur ON (((serveur.id)::text = (detailscommande.idserveur)::text)));


ALTER TABLE public.additiondetails OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 59474)
-- Name: livraison; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livraison (
    id character varying(20) NOT NULL,
    iddetailscommande character varying(20)
);


ALTER TABLE public.livraison OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 59490)
-- Name: additionpartable; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.additionpartable AS
 SELECT detailscommande.idcommande,
    commande.numtable,
    sum(detailscommande.prix) AS total
   FROM (public.detailscommande
     JOIN public.commande ON (((commande.id)::text = (detailscommande.idcommande)::text)))
  WHERE ((detailscommande.id)::text IN ( SELECT livraison.iddetailscommande
           FROM public.livraison))
  GROUP BY detailscommande.idcommande, commande.numtable;


ALTER TABLE public.additionpartable OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 59520)
-- Name: mouvementstock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mouvementstock (
    idproduit character varying(20),
    daty date,
    mouvement character varying(10),
    qte double precision
);


ALTER TABLE public.mouvementstock OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 59528)
-- Name: ajoutstock; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ajoutstock AS
 SELECT mouvementstock.idproduit,
    sum(mouvementstock.qte) AS qteajout
   FROM public.mouvementstock
  WHERE ((mouvementstock.mouvement)::text = 'ajout'::text)
  GROUP BY mouvementstock.idproduit;


ALTER TABLE public.ajoutstock OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 59225)
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    id character varying(20) NOT NULL,
    nom character varying(100)
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 59240)
-- Name: categorieplat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorieplat (
    id character varying(20) NOT NULL,
    idplat character varying(20),
    idcategorie character varying(20)
);


ALTER TABLE public.categorieplat OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 59285)
-- Name: categoriedetails; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.categoriedetails AS
 SELECT categorie.nom,
    categorieplat.id,
    categorieplat.idplat,
    categorieplat.idcategorie
   FROM (public.categorieplat
     JOIN public.categorie ON (((categorieplat.idcategorie)::text = (categorie.id)::text)));


ALTER TABLE public.categoriedetails OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 59256)
-- Name: categorieplatseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorieplatseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorieplatseq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 59250)
-- Name: categorieseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorieseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorieseq OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 59403)
-- Name: commandeseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commandeseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commandeseq OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 59499)
-- Name: detailscommandelivre; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.detailscommandelivre AS
 SELECT detailscommande.id,
    detailscommande.idserveur,
    detailscommande.idcommande,
    detailscommande.idplat,
    detailscommande.prix,
    detailscommande.etape
   FROM public.detailscommande
  WHERE ((detailscommande.id)::text IN ( SELECT livraison.iddetailscommande
           FROM public.livraison));


ALTER TABLE public.detailscommandelivre OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 59495)
-- Name: detailscommandenonlivre; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.detailscommandenonlivre AS
 SELECT detailscommande.id,
    detailscommande.idserveur,
    detailscommande.idcommande,
    detailscommande.idplat,
    detailscommande.prix,
    detailscommande.etape
   FROM public.detailscommande
  WHERE (NOT ((detailscommande.id)::text IN ( SELECT livraison.iddetailscommande
           FROM public.livraison)));


ALTER TABLE public.detailscommandenonlivre OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 59511)
-- Name: detailscommandepret; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.detailscommandepret AS
 SELECT detailscommande.id,
    detailscommande.idserveur,
    detailscommande.idcommande,
    detailscommande.idplat,
    detailscommande.prix,
    detailscommande.etape,
    commande.numtable AS idtables
   FROM (public.detailscommande
     JOIN public.commande ON (((commande.id)::text = (detailscommande.idcommande)::text)))
  WHERE ((NOT ((detailscommande.id)::text IN ( SELECT livraison.iddetailscommande
           FROM public.livraison))) AND (detailscommande.etape = 2));


ALTER TABLE public.detailscommandepret OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 59405)
-- Name: detailscommandeseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detailscommandeseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detailscommandeseq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 59310)
-- Name: gestiondetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gestiondetails (
    id character varying(20) NOT NULL,
    idgestionprix character varying(20),
    montant1 double precision,
    montant2 double precision,
    marge double precision
);


ALTER TABLE public.gestiondetails OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 59317)
-- Name: gestiondetailsseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gestiondetailsseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gestiondetailsseq OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 59305)
-- Name: gestionprix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gestionprix (
    id character varying(20) NOT NULL,
    date1 date,
    date2 date,
    creation date,
    montantminimum double precision,
    montantmaximum double precision,
    margemin double precision,
    margemax double precision
);


ALTER TABLE public.gestionprix OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 59315)
-- Name: gestionprixseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gestionprixseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gestionprixseq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 59245)
-- Name: platproduit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platproduit (
    idplat character varying(20),
    idproduit character varying(20),
    qte double precision
);


ALTER TABLE public.platproduit OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 59220)
-- Name: produit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produit (
    id character varying(20) NOT NULL,
    nom character varying(100),
    prix double precision
);


ALTER TABLE public.produit OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 59289)
-- Name: ingredient; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ingredient AS
 SELECT produit.nom,
    produit.prix,
    platproduit.idplat,
    platproduit.idproduit,
    platproduit.qte,
    (platproduit.qte * produit.prix) AS somme
   FROM (public.produit
     JOIN public.platproduit ON (((produit.id)::text = (platproduit.idproduit)::text)));


ALTER TABLE public.ingredient OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 59479)
-- Name: livraisonseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livraisonseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.livraisonseq OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 67662)
-- Name: payement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payement (
    id character varying(20) NOT NULL,
    idclient character varying(20),
    idtypepayement character varying(20),
    idcommande character varying(20),
    datepayement date,
    montant double precision
);


ALTER TABLE public.payement OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 67638)
-- Name: typepayement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typepayement (
    id character varying(20) NOT NULL,
    nom character varying(100)
);


ALTER TABLE public.typepayement OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 67687)
-- Name: payementcommande; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.payementcommande AS
 SELECT payement.idcommande,
    payement.idclient,
    payement.idtypepayement,
    typepayement.nom AS nomtype,
    payement.datepayement,
    payement.montant,
    commande.numtable
   FROM ((public.payement
     JOIN public.commande ON (((payement.idcommande)::text = (commande.id)::text)))
     JOIN public.typepayement ON (((typepayement.id)::text = (payement.idtypepayement)::text)));


ALTER TABLE public.payementcommande OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 67667)
-- Name: payementseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payementseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payementseq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 59230)
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo (
    id character varying(20) NOT NULL,
    nom character varying(255)
);


ALTER TABLE public.photo OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 59252)
-- Name: photoseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photoseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photoseq OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 59235)
-- Name: plat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plat (
    id character varying(20) NOT NULL,
    nom character varying(255),
    idphoto character varying(20),
    prix double precision
);


ALTER TABLE public.plat OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 59301)
-- Name: platphoto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.platphoto AS
 SELECT plat.id AS idplat,
    plat.nom,
    plat.prix,
    photo.id AS idphoto,
    photo.nom AS nomphoto
   FROM (public.plat
     JOIN public.photo ON (((plat.idphoto)::text = (photo.id)::text)));


ALTER TABLE public.platphoto OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 59258)
-- Name: platproduitseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.platproduitseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platproduitseq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 59254)
-- Name: platseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.platseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platseq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 59293)
-- Name: prixrevient; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.prixrevient AS
 SELECT ingredient.idplat,
    sum(ingredient.somme) AS revient
   FROM public.ingredient
  GROUP BY ingredient.idplat;


ALTER TABLE public.prixrevient OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 59324)
-- Name: prixdevente; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.prixdevente AS
 SELECT gestiondetails.id,
    gestiondetails.idgestionprix,
    gestiondetails.montant1,
    gestiondetails.montant2,
    gestiondetails.marge,
    prixrevient.idplat,
    prixrevient.revient,
    (gestiondetails.marge * prixrevient.revient) AS prixvente
   FROM (public.gestiondetails
     JOIN public.prixrevient ON (((prixrevient.revient >= gestiondetails.montant1) AND (prixrevient.revient <= gestiondetails.montant2))));


ALTER TABLE public.prixdevente OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 59248)
-- Name: produitseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produitseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produitseq OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 59462)
-- Name: profil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profil (
    id character varying(20) NOT NULL,
    nom character varying(100)
);


ALTER TABLE public.profil OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 59467)
-- Name: profilseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profilseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profilseq OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 59532)
-- Name: retraitstock; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.retraitstock AS
 SELECT mouvementstock.idproduit,
    sum(mouvementstock.qte) AS qteretrait
   FROM public.mouvementstock
  WHERE ((mouvementstock.mouvement)::text = 'retrait'::text)
  GROUP BY mouvementstock.idproduit;


ALTER TABLE public.retraitstock OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 59341)
-- Name: serveurseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serveurseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.serveurseq OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 59536)
-- Name: stockactuel; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.stockactuel AS
 SELECT ajoutstock.idproduit,
    (ajoutstock.qteajout - retraitstock.qteretrait) AS quantite
   FROM (public.ajoutstock
     JOIN public.retraitstock ON (((ajoutstock.idproduit)::text = (retraitstock.idproduit)::text)));


ALTER TABLE public.stockactuel OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 59430)
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    id character varying(20) NOT NULL,
    nom character varying(100)
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 59435)
-- Name: tablesseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tablesseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tablesseq OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 67648)
-- Name: typepayementseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.typepayementseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typepayementseq OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 59453)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id character varying(20) NOT NULL,
    idprofil character varying(20),
    login character varying(100),
    mdp character varying(255)
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 59460)
-- Name: utilisateurseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateurseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateurseq OWNER TO postgres;

--
-- TOC entry 3202 (class 0 OID 59225)
-- Dependencies: 201
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorie VALUES ('Categorie1', 'Entree');
INSERT INTO public.categorie VALUES ('Categorie2', 'Plat');
INSERT INTO public.categorie VALUES ('Categorie3', 'Dessert');


--
-- TOC entry 3205 (class 0 OID 59240)
-- Dependencies: 204
-- Data for Name: categorieplat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorieplat VALUES ('categPlat1', 'Plat1', 'Categorie1');
INSERT INTO public.categorieplat VALUES ('categPlat2', 'Plat2', 'Categorie1');
INSERT INTO public.categorieplat VALUES ('categPlat3', 'Plat3', 'Categorie2');
INSERT INTO public.categorieplat VALUES ('categPlat4', 'Plat4', 'Categorie2');
INSERT INTO public.categorieplat VALUES ('categPlat5', 'Plat5', 'Categorie3');
INSERT INTO public.categorieplat VALUES ('categPlat6', 'Plat6', 'Categorie3');


--
-- TOC entry 3219 (class 0 OID 59393)
-- Dependencies: 223
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.commande VALUES ('commande1', 'Table1');
INSERT INTO public.commande VALUES ('commande2', 'Table2');
INSERT INTO public.commande VALUES ('CMD7', 'Table1');
INSERT INTO public.commande VALUES ('CMD8', 'Table2');
INSERT INTO public.commande VALUES ('CMD9', 'Table2');
INSERT INTO public.commande VALUES ('CMD17', 'Table1');
INSERT INTO public.commande VALUES ('CMD18', 'Table1');
INSERT INTO public.commande VALUES ('CMD19', 'Table1');
INSERT INTO public.commande VALUES ('CMD20', 'Table1');
INSERT INTO public.commande VALUES ('CMD21', 'Table1');
INSERT INTO public.commande VALUES ('CMD22', 'Table1');
INSERT INTO public.commande VALUES ('CMD23', 'Table1');


--
-- TOC entry 3220 (class 0 OID 59398)
-- Dependencies: 224
-- Data for Name: detailscommande; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detailscommande VALUES ('detailsCom1', 'serveur1', 'commande1', 'Plat1', 2500, 1, '2022-04-04');
INSERT INTO public.detailscommande VALUES ('detailsCom2', 'serveur1', 'commande1', 'Plat1', 2500, 1, '2022-04-04');
INSERT INTO public.detailscommande VALUES ('detailsCom3', 'serveur1', 'commande1', 'Plat3', 1200, 1, '2022-04-04');
INSERT INTO public.detailscommande VALUES ('detailsCom4', 'serveur1', 'commande1', 'Plat3', 1200, 2, '2022-04-04');
INSERT INTO public.detailscommande VALUES ('detailsCom5', 'serveur1', 'commande1', 'Plat5', 1000, 2, '2022-04-04');
INSERT INTO public.detailscommande VALUES ('detailsCom6', 'serveur1', 'commande1', 'Plat5', 1000, 2, '2022-04-04');
INSERT INTO public.detailscommande VALUES ('detailsCom13', 'serveur2', 'commande1', 'Plat4', 5000, 1, '2022-04-04');
INSERT INTO public.detailscommande VALUES ('detailsCom14', 'serveur2', 'commande1', 'Plat6', 1400, 0, '2022-04-04');
INSERT INTO public.detailscommande VALUES ('detailsCom7', 'serveur1', 'commande2', 'Plat1', 2500, 1, '2022-04-10');
INSERT INTO public.detailscommande VALUES ('detailsCom8', 'serveur1', 'commande2', 'Plat2', 2000, 1, '2022-04-10');
INSERT INTO public.detailscommande VALUES ('detailsCom9', 'serveur1', 'commande2', 'Plat3', 1200, 1, '2022-04-10');
INSERT INTO public.detailscommande VALUES ('detailsCom10', 'serveur1', 'commande2', 'Plat4', 5000, 3, '2022-04-10');
INSERT INTO public.detailscommande VALUES ('detailsCom11', 'serveur1', 'commande2', 'Plat5', 1000, 2, '2022-04-10');
INSERT INTO public.detailscommande VALUES ('detailsCom12', 'serveur1', 'commande2', 'Plat6', 1400, 2, '2022-04-10');
INSERT INTO public.detailscommande VALUES ('DetailsCommande-15', 'serveur1', 'CMD21', 'Plat2', 2500, 0, '2022-04-08');
INSERT INTO public.detailscommande VALUES ('DetailsCommande-16', 'serveur1', 'CMD21', 'Plat4', 3500, 0, '2022-04-08');


--
-- TOC entry 3214 (class 0 OID 59310)
-- Dependencies: 217
-- Data for Name: gestiondetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gestiondetails VALUES ('gestDet1', 'gestPrix2', 0, 5000, 1.4);
INSERT INTO public.gestiondetails VALUES ('gestDet2', 'gestPrix2', 5000, 10000, 1.3);


--
-- TOC entry 3213 (class 0 OID 59305)
-- Dependencies: 216
-- Data for Name: gestionprix; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gestionprix VALUES ('gestPrix2', '2022-01-01', NULL, '2022-01-01', 0, 10000, 1.5, 1.2);


--
-- TOC entry 3229 (class 0 OID 59474)
-- Dependencies: 234
-- Data for Name: livraison; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.livraison VALUES ('livraison1', 'detailsCom1');
INSERT INTO public.livraison VALUES ('livraison2', 'detailsCom2');
INSERT INTO public.livraison VALUES ('livraison3', 'detailsCom3');
INSERT INTO public.livraison VALUES ('livraison4', 'detailsCom7');
INSERT INTO public.livraison VALUES ('livraison5', 'detailsCom8');
INSERT INTO public.livraison VALUES ('livraison6', 'detailsCom9');


--
-- TOC entry 3231 (class 0 OID 59520)
-- Dependencies: 241
-- Data for Name: mouvementstock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mouvementstock VALUES ('produit1', '2022-04-04', 'ajout', 1000);
INSERT INTO public.mouvementstock VALUES ('produit1', '2022-04-06', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit1', '2022-04-08', 'ajout', 3000);
INSERT INTO public.mouvementstock VALUES ('produit1', '2022-04-10', 'ajout', 4000);
INSERT INTO public.mouvementstock VALUES ('produit2', '2022-04-04', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit2', '2022-04-06', 'ajout', 4000);
INSERT INTO public.mouvementstock VALUES ('produit2', '2022-04-08', 'ajout', 5000);
INSERT INTO public.mouvementstock VALUES ('produit2', '2022-04-10', 'ajout', 3000);
INSERT INTO public.mouvementstock VALUES ('produit3', '2022-04-04', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit3', '2022-04-06', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit3', '2022-04-08', 'ajout', 1000);
INSERT INTO public.mouvementstock VALUES ('produit3', '2022-04-10', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit4', '2022-04-04', 'ajout', 3000);
INSERT INTO public.mouvementstock VALUES ('produit4', '2022-04-06', 'ajout', 1000);
INSERT INTO public.mouvementstock VALUES ('produit4', '2022-04-08', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit4', '2022-04-10', 'ajout', 4000);
INSERT INTO public.mouvementstock VALUES ('produit5', '2022-04-04', 'ajout', 3000);
INSERT INTO public.mouvementstock VALUES ('produit5', '2022-04-06', 'ajout', 1000);
INSERT INTO public.mouvementstock VALUES ('produit5', '2022-04-08', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit5', '2022-04-10', 'ajout', 4000);
INSERT INTO public.mouvementstock VALUES ('produit6', '2022-04-04', 'ajout', 3000);
INSERT INTO public.mouvementstock VALUES ('produit6', '2022-04-06', 'ajout', 1000);
INSERT INTO public.mouvementstock VALUES ('produit6', '2022-04-08', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit6', '2022-04-10', 'ajout', 4000);
INSERT INTO public.mouvementstock VALUES ('produit7', '2022-04-04', 'ajout', 3000);
INSERT INTO public.mouvementstock VALUES ('produit7', '2022-04-06', 'ajout', 1000);
INSERT INTO public.mouvementstock VALUES ('produit7', '2022-04-08', 'ajout', 2000);
INSERT INTO public.mouvementstock VALUES ('produit7', '2022-04-10', 'ajout', 4000);
INSERT INTO public.mouvementstock VALUES ('produit6', '2022-04-05', 'retrait', -1);
INSERT INTO public.mouvementstock VALUES ('produit7', '2022-04-05', 'retrait', -1);
INSERT INTO public.mouvementstock VALUES ('produit6', '2022-04-05', 'retrait', -500);
INSERT INTO public.mouvementstock VALUES ('produit6', '2022-04-05', 'retrait', -500);
INSERT INTO public.mouvementstock VALUES ('produit7', '2022-04-05', 'retrait', -500);


--
-- TOC entry 3234 (class 0 OID 67662)
-- Dependencies: 247
-- Data for Name: payement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payement VALUES ('payement8', 'Client1', 'typePayement1', 'commande1', '2022-04-04', 3000);
INSERT INTO public.payement VALUES ('payement9', 'Client1', 'typePayement1', 'commande1', '2022-04-04', 4000);
INSERT INTO public.payement VALUES ('payement10', 'Client1', 'typePayement1', 'commande1', '2022-04-04', 8800);
INSERT INTO public.payement VALUES ('payement11', 'Client1', 'typePayement2', 'commande2', '2022-04-10', 8000);
INSERT INTO public.payement VALUES ('payement12', 'Client1', 'typePayement2', 'commande2', '2022-04-10', 1000);
INSERT INTO public.payement VALUES ('payement13', 'Client1', 'typePayement2', 'commande2', '2022-04-10', 4100);
INSERT INTO public.payement VALUES ('payement14', 'Client1', 'typePayement3', 'CMD21', '2022-04-08', 6000);


--
-- TOC entry 3203 (class 0 OID 59230)
-- Dependencies: 202
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.photo VALUES ('Photo1', 'cesar.jpg');
INSERT INTO public.photo VALUES ('Photo2', 'nicoise.jpg');
INSERT INTO public.photo VALUES ('Photo3', 'spaghetti.jpg');
INSERT INTO public.photo VALUES ('Photo4', 'huitre.jpg');
INSERT INTO public.photo VALUES ('Photo5', 'macaron.jpg');
INSERT INTO public.photo VALUES ('Photo6', 'gateau.jpg');


--
-- TOC entry 3204 (class 0 OID 59235)
-- Dependencies: 203
-- Data for Name: plat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.plat VALUES ('Plat1', 'Salade cesar', 'Photo1', 2000);
INSERT INTO public.plat VALUES ('Plat2', 'Salade nicoise', 'Photo2', 2500);
INSERT INTO public.plat VALUES ('Plat3', 'Pate avec boulette', 'Photo3', 3000);
INSERT INTO public.plat VALUES ('Plat4', 'Assiette huitre', 'Photo4', 3500);
INSERT INTO public.plat VALUES ('Plat5', 'Macaron', 'Photo5', 4000);
INSERT INTO public.plat VALUES ('Plat6', 'Gateux aux fraises', 'Photo6', 4500);


--
-- TOC entry 3206 (class 0 OID 59245)
-- Dependencies: 205
-- Data for Name: platproduit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.platproduit VALUES ('Plat1', 'produit1', 100);
INSERT INTO public.platproduit VALUES ('Plat2', 'produit1', 120);
INSERT INTO public.platproduit VALUES ('Plat3', 'produit4', 150);
INSERT INTO public.platproduit VALUES ('Plat4', 'produit5', 900);
INSERT INTO public.platproduit VALUES ('Plat5', 'produit6', 900);
INSERT INTO public.platproduit VALUES ('Plat6', 'produit6', 500);
INSERT INTO public.platproduit VALUES ('Plat1', 'produit2', 100);
INSERT INTO public.platproduit VALUES ('Plat2', 'produit2', 120);
INSERT INTO public.platproduit VALUES ('Plat3', 'produit1', 150);
INSERT INTO public.platproduit VALUES ('Plat3', 'produit2', 150);
INSERT INTO public.platproduit VALUES ('Plat4', 'produit3', 900);
INSERT INTO public.platproduit VALUES ('Plat5', 'produit7', 900);
INSERT INTO public.platproduit VALUES ('Plat6', 'produit6', 500);
INSERT INTO public.platproduit VALUES ('Plat6', 'produit7', 500);


--
-- TOC entry 3201 (class 0 OID 59220)
-- Dependencies: 200
-- Data for Name: produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produit VALUES ('produit1', 'oignon', 1);
INSERT INTO public.produit VALUES ('produit2', 'tomate', 2);
INSERT INTO public.produit VALUES ('produit3', 'salade', 3);
INSERT INTO public.produit VALUES ('produit4', 'pate', 5);
INSERT INTO public.produit VALUES ('produit5', 'huitre', 6);
INSERT INTO public.produit VALUES ('produit6', 'farine', 7);
INSERT INTO public.produit VALUES ('produit7', 'oeuf', 8);


--
-- TOC entry 3227 (class 0 OID 59462)
-- Dependencies: 232
-- Data for Name: profil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profil VALUES ('profil1', 'Cuisinier');
INSERT INTO public.profil VALUES ('profil2', 'Serveur');
INSERT INTO public.profil VALUES ('profil3', 'Livreur');
INSERT INTO public.profil VALUES ('profil4', 'Caissier');


--
-- TOC entry 3217 (class 0 OID 59328)
-- Dependencies: 221
-- Data for Name: serveur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.serveur VALUES ('serveur1', 'Serveur1');
INSERT INTO public.serveur VALUES ('serveur2', 'Serveur2');
INSERT INTO public.serveur VALUES ('serv1', 'serv');


--
-- TOC entry 3223 (class 0 OID 59430)
-- Dependencies: 228
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tables VALUES ('Table1', 'exterieur');
INSERT INTO public.tables VALUES ('Table2', 'exterieur');
INSERT INTO public.tables VALUES ('Table3', 'exterieur');
INSERT INTO public.tables VALUES ('Table4', 'exterieur');


--
-- TOC entry 3232 (class 0 OID 67638)
-- Dependencies: 245
-- Data for Name: typepayement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.typepayement VALUES ('typePayement1', 'Carte');
INSERT INTO public.typepayement VALUES ('typePayement2', 'Espece');
INSERT INTO public.typepayement VALUES ('typePayement3', 'Mobile money');


--
-- TOC entry 3225 (class 0 OID 59453)
-- Dependencies: 230
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 210
-- Name: categorieplatseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorieplatseq', 6, true);


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 207
-- Name: categorieseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorieseq', 3, true);


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 225
-- Name: commandeseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commandeseq', 23, true);


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 226
-- Name: detailscommandeseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detailscommandeseq', 16, true);


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 219
-- Name: gestiondetailsseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gestiondetailsseq', 2, true);


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 218
-- Name: gestionprixseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gestionprixseq', 2, true);


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 235
-- Name: livraisonseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livraisonseq', 9, true);


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 248
-- Name: payementseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payementseq', 14, true);


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 208
-- Name: photoseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photoseq', 6, true);


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 211
-- Name: platproduitseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.platproduitseq', 1, false);


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 209
-- Name: platseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.platseq', 6, true);


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 206
-- Name: produitseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produitseq', 7, true);


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 233
-- Name: profilseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profilseq', 4, true);


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 222
-- Name: serveurseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serveurseq', 2, true);


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 229
-- Name: tablesseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tablesseq', 4, true);


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 246
-- Name: typepayementseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.typepayementseq', 3, true);


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 231
-- Name: utilisateurseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateurseq', 1, false);


--
-- TOC entry 3013 (class 2606 OID 59229)
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 59244)
-- Name: categorieplat categorieplat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieplat
    ADD CONSTRAINT categorieplat_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 59397)
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id);


--
-- TOC entry 3029 (class 2606 OID 59402)
-- Name: detailscommande detailscommande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detailscommande
    ADD CONSTRAINT detailscommande_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 59314)
-- Name: gestiondetails gestiondetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestiondetails
    ADD CONSTRAINT gestiondetails_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 59309)
-- Name: gestionprix gestionprix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestionprix
    ADD CONSTRAINT gestionprix_pkey PRIMARY KEY (id);


--
-- TOC entry 3037 (class 2606 OID 59478)
-- Name: livraison livraison_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_pkey PRIMARY KEY (id);


--
-- TOC entry 3041 (class 2606 OID 67666)
-- Name: payement payement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payement
    ADD CONSTRAINT payement_pkey PRIMARY KEY (id);


--
-- TOC entry 3015 (class 2606 OID 59234)
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- TOC entry 3017 (class 2606 OID 59239)
-- Name: plat plat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plat
    ADD CONSTRAINT plat_pkey PRIMARY KEY (id);


--
-- TOC entry 3011 (class 2606 OID 59224)
-- Name: produit produit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pkey PRIMARY KEY (id);


--
-- TOC entry 3035 (class 2606 OID 59466)
-- Name: profil profil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profil
    ADD CONSTRAINT profil_pkey PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 59332)
-- Name: serveur serveur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serveur
    ADD CONSTRAINT serveur_pkey PRIMARY KEY (id);


--
-- TOC entry 3031 (class 2606 OID 59434)
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- TOC entry 3039 (class 2606 OID 67642)
-- Name: typepayement typepayement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typepayement
    ADD CONSTRAINT typepayement_pkey PRIMARY KEY (id);


--
-- TOC entry 3033 (class 2606 OID 59457)
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- TOC entry 3044 (class 2606 OID 59270)
-- Name: categorieplat fk_categorieplat_categorie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieplat
    ADD CONSTRAINT fk_categorieplat_categorie FOREIGN KEY (idcategorie) REFERENCES public.categorie(id);


--
-- TOC entry 3043 (class 2606 OID 59265)
-- Name: categorieplat fk_categorieplat_plat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieplat
    ADD CONSTRAINT fk_categorieplat_plat FOREIGN KEY (idplat) REFERENCES public.plat(id);


--
-- TOC entry 3048 (class 2606 OID 59437)
-- Name: commande fk_commande_tables; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT fk_commande_tables FOREIGN KEY (numtable) REFERENCES public.tables(id);


--
-- TOC entry 3049 (class 2606 OID 59407)
-- Name: detailscommande fk_detailscommande_commande; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detailscommande
    ADD CONSTRAINT fk_detailscommande_commande FOREIGN KEY (idcommande) REFERENCES public.commande(id);


--
-- TOC entry 3050 (class 2606 OID 59412)
-- Name: detailscommande fk_detailscommande_plat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detailscommande
    ADD CONSTRAINT fk_detailscommande_plat FOREIGN KEY (idplat) REFERENCES public.plat(id);


--
-- TOC entry 3051 (class 2606 OID 59417)
-- Name: detailscommande fk_detailscommande_serveur; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detailscommande
    ADD CONSTRAINT fk_detailscommande_serveur FOREIGN KEY (idserveur) REFERENCES public.serveur(id);


--
-- TOC entry 3047 (class 2606 OID 59319)
-- Name: gestiondetails fk_gestiondetails_gestionprix; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestiondetails
    ADD CONSTRAINT fk_gestiondetails_gestionprix FOREIGN KEY (idgestionprix) REFERENCES public.gestionprix(id);


--
-- TOC entry 3053 (class 2606 OID 59523)
-- Name: mouvementstock fk_mouvementstock_produit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementstock
    ADD CONSTRAINT fk_mouvementstock_produit FOREIGN KEY (idproduit) REFERENCES public.produit(id);


--
-- TOC entry 3055 (class 2606 OID 67674)
-- Name: payement fk_payement_commande; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payement
    ADD CONSTRAINT fk_payement_commande FOREIGN KEY (idcommande) REFERENCES public.commande(id);


--
-- TOC entry 3054 (class 2606 OID 67669)
-- Name: payement fk_payement_typepayement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payement
    ADD CONSTRAINT fk_payement_typepayement FOREIGN KEY (idtypepayement) REFERENCES public.typepayement(id);


--
-- TOC entry 3042 (class 2606 OID 59260)
-- Name: plat fk_plat_photo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plat
    ADD CONSTRAINT fk_plat_photo FOREIGN KEY (idphoto) REFERENCES public.photo(id);


--
-- TOC entry 3045 (class 2606 OID 59275)
-- Name: platproduit fk_platproduit_plat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platproduit
    ADD CONSTRAINT fk_platproduit_plat FOREIGN KEY (idplat) REFERENCES public.plat(id);


--
-- TOC entry 3046 (class 2606 OID 59280)
-- Name: platproduit fk_platproduit_produit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platproduit
    ADD CONSTRAINT fk_platproduit_produit FOREIGN KEY (idproduit) REFERENCES public.produit(id);


--
-- TOC entry 3052 (class 2606 OID 59469)
-- Name: utilisateur fk_utilisateur_profil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT fk_utilisateur_profil FOREIGN KEY (idprofil) REFERENCES public.profil(id);


-- Completed on 2022-04-25 19:01:33

--
-- PostgreSQL database dump complete
--

