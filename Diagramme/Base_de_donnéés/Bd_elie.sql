/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  18/12/2023 21:57:12                      */
/*==============================================================*/


if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='PRODUIT_PK'
     and t.table_name='Produit'
) then
   drop index Produit.PRODUIT_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='Produit'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table Produit
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='USER_PK'
     and t.table_name='User'
) then
   drop index "User".USER_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='User'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table "User"
end if;

/*==============================================================*/
/* Table : Produit                                              */
/*==============================================================*/
create table Produit 
(
   idDuProduit          integer                        not null,
   nomDuProduit         varchar(254)                   null,
   poidsDuProduit       float                          null,
   prixduproduit        varchar(254)                   null,
   quantiteDuProduit    varchar(254)                   null,
   constraint PK_PRODUIT primary key (idDuProduit)
);

/*==============================================================*/
/* Index : PRODUIT_PK                                           */
/*==============================================================*/
create unique index PRODUIT_PK on Produit (
idDuProduit ASC
);

/*==============================================================*/
/* Table : "User"                                               */
/*==============================================================*/
create table "User" 
(
   idUser               integer                        not null,
   votreNomComplet      varchar(254)                   null,
   nomDeLEntreprise     varchar(254)                   null,
   adressMail           varchar(254)                   null,
   telephone            integer                        null,
   motDePasse           varchar(254)                   null,
   constraint PK_USER primary key (idUser)
);

/*==============================================================*/
/* Index : USER_PK                                              */
/*==============================================================*/
create unique index USER_PK on "User" (
idUser ASC
);

