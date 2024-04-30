create database StructureDeRecherche;
use StructureDeRecherche;

create table Laboratoire(
  idLaboratoire int AUTO_INCREMENT,
  NomDeLaboratiore varchar(50),
  BrevePresentation text,
  Directeur varchar(50),
  DateDeAccreditation date,
  UnePhoto blob,
  CONSTRAINT PK_Laboratoire PRIMARY KEY (idLaboratoire)
);

create table EquipesDeRecherche(
  idEquipe int AUTO_INCREMENT,
  NomDeStructure varchar(50),
  BrevePresentation text,
  DateDeAccreditation date,
  UnePhoto blob,
  NumResponsable int,
  idLaboratoire int,
  CONSTRAINT PK_Equipes PRIMARY KEY (idEquipe),
  CONSTRAINT FK_Equipes_Laboratoire FOREIGN KEY (idLaboratoire) REFERENCES Laboratoire(idLaboratoire)
);

create table Utilisateur(
  idUser int AUTO_INCREMENT,
  idEquipe int,
  Email varchar(50),
  UserName varchar(20),
  Password varchar(50),
  CONSTRAINT PK_Utilisateur PRIMARY KEY (idUser),
  CONSTRAINT FK_Utilisateur_Equipes FOREIGN KEY (idEquipe) REFERENCES EquipesDeRecherche(idEquipe)
);

create table membre(
  idUser int,
  Nom varchar(20),
  Prenome varchar(20),
  CNE varchar(20),
  CNI varchar(20),
  Tele varchar(20),
  idEquipe int,
  CONSTRAINT PK_membre PRIMARY KEY (idUser),
  CONSTRAINT FK_user_membre FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser),
  CONSTRAINT FK_user_equipe FOREIGN KEY (idEquipe) REFERENCES EquipesDeRecherche(idEquipe)
);

create table Administrateur(
  nom varchar(20),
  prenom varchar(20),
  idUser int,
  CONSTRAINT PK_admin PRIMARY KEY (idUser),
  CONSTRAINT FK_User_Admin FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser)
);

create table Publication(
  TitreDePublication varchar(100),
  DateDePublication date,
  idPublication int AUTO_INCREMENT,
  CONSTRAINT PK_Publication PRIMARY KEY (idPublication)
);

create table AdminModified(
  date_modifie date,
  idUser int,
  idEquipe int,
  CONSTRAINT PK_modifie PRIMARY KEY (idUser,idEquipe),
  CONSTRAINT FK_modifie_Admin FOREIGN KEY (idUser) REFERENCES Administrateur(idUser),
  CONSTRAINT FK_modifie_equipe FOREIGN KEY (idEquipe) REFERENCES EquipesDeRecherche(idEquipe)
);

create table VoirOuTelecharger(
  idUser int,
  idPublication int,
  dateVoir date,
  CONSTRAINT PK_Voir1 PRIMARY KEY (idUser,idPublication),
  CONSTRAINT FK_voir_user FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser),
  CONSTRAINT FK_Voir_Publication FOREIGN KEY (idPublication) REFERENCES Publication(idPublication)
);

create table PublicationUser (
  idUser int,
  idPublication int,
  dateModifie date,
  CONSTRAINT PK_Ajout PRIMARY KEY (idUser,idPublication),
  CONSTRAINT FK_Ajout_user FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser),
  CONSTRAINT FK_Ajout_Publication FOREIGN KEY (idPublication) REFERENCES Publication(idPublication)
);


create table AnnoncesNouvellesScientifiques(
  Champs varchar(50),
  Date_de_parution date,
  Source varchar(50),
  description text,
  idPublication int,
  CONSTRAINT PK_Announce PRIMARY KEY (idPublication),
  CONSTRAINT FK_publication_Annonce FOREIGN KEY (idPublication) REFERENCES publication(idPublication)
  );

  create table Evenement(
  Date_debut date,
  Date_fin date,
  lieu varchar(50),
  description text,
  Organisateurs text,
  idPublication int,
  CONSTRAINT PK_Evenement PRIMARY KEY (idPublication),
  CONSTRAINT FK_publication_Evenement FOREIGN KEY (idPublication) REFERENCES publication(idPublication)
  );

  create table journal(
  ListeAuteurs text,
  Journal varchar(50),
  ISSN_journal varchar(20),
  Volume int,
  Issue int,
  pages int,
  DOI_de_article varchar(30),
  Document blob,
  idPublication int,
  CONSTRAINT PK_journale PRIMARY KEY (idPublication),
  CONSTRAINT FK_publication_journal FOREIGN KEY (idPublication) REFERENCES publication(idPublication)
);


create table Chapitre(
  ListeAuteurs text,
  Titre_du_livre varchar(50),
  ISSN_livre varchar(20),
  Volume int,
  pages int,
  DOI_de_article varchar(30),
  Document blob,
  idPublication int,
  CONSTRAINT PK_Chapitre PRIMARY KEY (idPublication),
  CONSTRAINT FK_publication_Chapitre FOREIGN KEY (idPublication) REFERENCES publication(idPublication)
);


create table Conference(
  type enum('international','national'),
  ListeAuteurs text,
  Conference varchar(50),
  pays varchar(50),
  Ville varchar(50),
  pages int,
  DOI_de_article varchar(20),
  Document blob,
  idPublication int,
  CONSTRAINT PK_conference PRIMARY KEY (idPublication),
  CONSTRAINT FK_publication_Conference FOREIGN KEY (idPublication) REFERENCES publication(idPublication)
);

insert into Laboratoire (NomDeLaboratiore, BrevePresentation, Directeur, DateDeAccreditation, UnePhoto) values ('laboratoire biologie','le 1 er laboratoire construie','Farrell Jovanny','2010-01-01',NULL); 
insert into Laboratoire (NomDeLaboratiore, BrevePresentation, Directeur, DateDeAccreditation, UnePhoto) values ('laboratoire Chimie','le 2 eme laboratoire construie','Dooley Darrick','2011-03-01',NULL);
insert into Laboratoire (NomDeLaboratiore, BrevePresentation, Directeur, DateDeAccreditation, UnePhoto) values ('laboratoire Physique','le 3 eme laboratoire construie','Wolf Margie','2012-05-01',NULL);
insert into Laboratoire (NomDeLaboratiore, BrevePresentation, Directeur, DateDeAccreditation, UnePhoto) values ('laboratoire Sciences information','le 4 eme laboratoire construie','Bogan Stan','2013-07-01',NULL);
insert into Laboratoire (NomDeLaboratiore, BrevePresentation, Directeur, DateDeAccreditation, UnePhoto) values ('laboratoire Ingénierie et systèmes','le 5 eme laboratoire construie','Nolan Armando','2013-09-01',NULL);
insert into Laboratoire (NomDeLaboratiore, BrevePresentation, Directeur, DateDeAccreditation, UnePhoto) values ('laboratoire Mathématiques','le 6 eme laboratoire construie','Pollich Bennie','2014-11-01',NULL);

insert into EquipesDeRecherche ( NomDeStructure, BrevePresentation, DateDeAccreditation, NumResponsable, idLaboratoire, UnePhoto) values ('equipe biologie','le 1 er equipe construie','2010-01-01',3,1,NULL);
insert into EquipesDeRecherche ( NomDeStructure, BrevePresentation, DateDeAccreditation, NumResponsable, idLaboratoire, UnePhoto) values ('equipe Chimie','le 2 eme equipe construie','2011-01-01',7,2,NULL);
insert into EquipesDeRecherche ( NomDeStructure, BrevePresentation, DateDeAccreditation, NumResponsable, idLaboratoire, UnePhoto) values ('equipe Physique','le 3 eme equipe construie','2011-06-01',12,3,NULL);
insert into EquipesDeRecherche ( NomDeStructure, BrevePresentation, DateDeAccreditation, NumResponsable, idLaboratoire, UnePhoto) values ('equipe Sciences information','le 4 eme equipe construie','2012-03-01',17,4,NULL);
insert into EquipesDeRecherche ( NomDeStructure, BrevePresentation, DateDeAccreditation, NumResponsable, idLaboratoire, UnePhoto) values ('equipe Mathématiques','le 5 eme equipe construie','2013-04-01',22,6,NULL);

insert into Utilisateur ( idEquipe, Email, UserName, Password) values (1, 'Ariane@gmail.com', 'Ariane123', 'Ariane12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (2, 'Albert@gmail,com', 'Albert123', 'Albert12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (3, 'Tahar@gmail.com', 'Tahar123', 'Tahar12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (4, 'Marty@gmail.com', 'Marty123', ' Marty12345'); 
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (5, 'Zachery@gmail.com', 'Zachery123', ' Zachery12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (1, 'Braeden@gmail.com', 'Braeden123', ' Braeden12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (2, 'Jean@gmail.com', 'Jean123', ' Jean12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (3, 'Linnea@gmail.com', 'Linnea123', 'Linnea12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (4, 'Gunner@gmail.com', 'Gunner123', ' Gunner12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (5, 'Ashlynn@gmail.com', 'Ashlynn123', ' Ashlynn12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (1, 'Josue@gmail.com', 'Josue123', ' Josue12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (2, 'Marietta@gmail.com', 'Marietta123', ' Marietta12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (3, 'Allie@gmail.com', 'Allie123', 'Allie12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (4, 'Christophe@gmail.com', 'Christophe123', ' Christophe12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (5, 'Sasha@gmail.com', 'Sasha123', 'Sasha12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (1, 'Clement@gmail.com', 'Clement123', 'Clement12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (2, 'Brent@gmail.com', 'Brent123', 'Brent12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (3, 'Barry@gmail.com', 'Barry123', 'Barry12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (4, 'Dominic@gmail.com', 'Dominic123', 'Dominic12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (5, 'Zackery@gmail.com', 'Zackery123', 'Zackery12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (1, 'Ali@gmail.com', 'Ali123', 'Ali12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (2, 'Dija@gmail.com', 'Dija123', 'Dija12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (3, 'Hassan@gmail.com', 'Hassan123', 'Hassan12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (4, 'Noble@gmail.com', 'Noble123', 'Noble12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (5, 'Erwin@gmail.com', 'Erwin123', 'Erwin12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (1, 'Tito@gmail.com', 'Tito123', 'Tito12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (2, 'Marilie@gmail.com', 'Marilie123', 'Marilie12345');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (3, 'user1@gmail.com', 'user1', 'user123');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (4, 'user2@gmail.com', 'user2', 'user123');
insert into Utilisateur ( idEquipe, Email, UserName, Password) values (5, 'user3@gmail.com', 'user3', 'user123');


insert into Administrateur (nom, prenom, idUser) values ('Fritsch', 'Ariane',1);
insert into Administrateur (nom, prenom, idUser) values ('Camus', 'Albert',2);


insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (3, 'Benjeloun', 'Tahar','A123456', 'AB12345','0611223344',1);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (4, 'Blanda', 'Marty','B123456','BC12345','0612233445',2);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (5, 'Little', 'Zachery','C123456','CD12345','0644332211',3);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (6, 'Nabil Maalouf', 'Braeden','D123456','DE12345','0645342312',4);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (7, 'Schuppe', 'Jean','E123456','BA12345','0654433221',5);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (8, 'Thompson', 'Linnea','F123456','CB12345','0655667788',1);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (9, 'Schinner', 'Gunner','J123456','DC12345','0656677889',2);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (10, 'Pacocha', 'Ashlynn','H123456','ED12345','0688776655',3);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (11, 'Stroman', 'Josue','I123456','FG12345','0698877665',4);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (12, 'Smitham', 'Marietta','G123456','JC12345','0679684736',5);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (13, 'Mayert', 'Allie','A654321','AB56789','0614253647',1);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (14, 'Schmeler', 'Christophe','B654321','BC56789','0610293847',2);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (15, 'Reichert', 'Sasha','C654321','CD56789','0635182637',3);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (16, 'Baumbach', 'Clement','D654321','DE56789','0690875346',4);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (17, 'Mertz', 'Brent','E654321','BA56789','0612342865',5);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (18, 'Bailey', 'Barry','F654321','CB56789','0698537456',1);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (19, 'Wolff', 'Dominic','J654321','DC56789','0642352678',2);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (20, 'Smith', 'Zackery','H654321','ED56789','0678857664',3);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (21, 'Ahmed', 'Ali','I654321','FG56789','0661768909',4);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (22, 'Khadija', 'Dija','G654321','JC56789','0656374859',5);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (23, 'Ali', 'Hassan','D112233','ABC1234','0675683904',1);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (24, 'Beier', 'Noble','B112233','EFG1234','0678490342',2);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (25, 'Kunde', 'Erwin','C112233','FG54321','0654738290',3);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (26, 'Littel', 'Tito','D112321','H54321','0612903456',4);
insert into membre ( idUser, Nom, Prenome, CNE, CNI, Tele, idEquipe) values (27, 'Schaefer', 'Marilie','D123321','JC54321','0698765432',5);

insert into Publication(TitreDePublication,DateDePublication) values('Astronomers have announced a haul of planets found beyond our Solar System','2009-10-19');
insert into Publication(TitreDePublication,DateDePublication) values('Une société fête ses 40 ans','2010-09-29');
insert into Publication(TitreDePublication,DateDePublication) values('Touraine','2015-07-13');
insert into Publication(TitreDePublication,DateDePublication) values('Concert ded Opéra Lyrique','2017-02-02');
insert into Publication(TitreDePublication,DateDePublication) values('Course de endurance de Karting','2013-05-23');
insert into Publication(TitreDePublication,DateDePublication) values('Why Teach Financial Literacy?','2018-10-30');
insert into Publication(TitreDePublication,DateDePublication) values('Physicochemical properties of some honeys ','2008-12-19');
insert into Publication(TitreDePublication,DateDePublication) values('2014 AASRI Conference on Circuit and Signal Processing (CSP 2014)','2014-07-22');
insert into Publication(TitreDePublication,DateDePublication) values('Basic science knowledge of dental students on conventional','2008-07-07');
insert into Publication(TitreDePublication,DateDePublication) values('Evaluation and determination of subsurface drainage spacing in two steady ','2020-05-09');
insert into Publication(TitreDePublication,DateDePublication) values('devcom developer conference','2020-05-15');
insert into Publication(TitreDePublication,DateDePublication) values('Conference on Medical & Health Science','2020-05-13');


insert into Chapitre(ListeAuteurs,Titre_du_livre,Volume,pages,idPublication) values('Jonathan Amos ','Scientists announce planet bounty',200,5,1);
insert into Chapitre(ListeAuteurs,Titre_du_livre,Volume,pages,idPublication) values('Robert T. Kiyosaki','Rich Dad Poor Dad',3233,114,2);

insert into Evenement(Date_debut,Date_fin,lieu,description,Organisateurs,idPublication) values('2019-11-30','2019-11-30','morrocco','Une société fête ses 40 ans avec un plateau de artistes','PMO EVENTS',3);
insert into Evenement(Date_debut,Date_fin,lieu,description,Organisateurs,idPublication) values('2019-07-16','2019-07-26','france','Soirée à Thème en Touraine','PMO EVENTS',4);
insert into Evenement(Date_debut,Date_fin,lieu,description,Organisateurs,idPublication) values('2020-07-16','2020-07-17','morrocco','Concert ded Opéra Lyrique accessible à tout public dans une église','oufrad',5);
insert into Evenement(Date_debut,Date_fin,lieu,description,Organisateurs,idPublication) values('2020-06-11','2020-06-20','japan','Course de endurance de Karting pour le CE de une entreprise de la région Centre. Le événement a été organisé pour les famille chacun ayant trouvé son rytme et son plaisir de un moment de partage.','abdsamad',6);


insert into Journal(ListeAuteurs,Journal,Volume,Issue,pages,idPublication) values('Author links open overlay panelAminaChakirabAbderrahmaneRomaneaGian LuigiMarcazzanbPaolaFerrazzic','SienceDirect',2000,'chemestry',70,7);
insert into Journal(ListeAuteurs,Journal,Volume,Issue,pages,idPublication) values('Wei Deng','SienceDirect',5300,'Computer Science',110,8);


insert into AnnoncesNouvellesScientifiques(Champs,Date_de_parution,Source,description,idPublication) values('coronavirus','2008-07-07','Wiley Online Library','Basic science knowledge of dental students on conventional and problem?based learning (PBL) courses at Liverpool',9);
insert into AnnoncesNouvellesScientifiques(Champs,Date_de_parution,Source,description,idPublication) values('AGRICULTURE','2020-05-09','Wiley Online Library','Evaluation and determination of subsurface drainage spacing in two steady and unsteady flow conditions with closure of the impermeable layer to the ground surface. case study: Markazi province, Iran',10);


insert into Conference(type,ListeAuteurs,Conference,pays,Ville,pages,idPublication) values('international','Laurentian Technomedia','devcom developer conference','Germany','Cologne',200,11);
insert into Conference(type,ListeAuteurs,Conference,pays,Ville,pages,idPublication) values('national','ICMHS','Conference on Medical & Health Science','morrocco','Rabat',300,12);


insert into VoirOuTelecharger values(28,6,'2020-03-29');
insert into VoirOuTelecharger values(28,3,'2020-03-29');
insert into VoirOuTelecharger values(29,12,'2020-03-29');
insert into VoirOuTelecharger values(30,8,'2020-03-29');
insert into VoirOuTelecharger values(28,10,'2020-03-29');


insert into PublicationUser (idUser, idPublication, dateModifie) values (2, 1, '2009-12-12');
insert into PublicationUser (idUser, idPublication, dateModifie) values (4, 2, '2010-10-15');
insert into PublicationUser (idUser, idPublication, dateModifie) values (6, 3, '2019-10-30');
insert into PublicationUser (idUser, idPublication, dateModifie) values (8, 4, '2019-06-16');
insert into PublicationUser (idUser, idPublication, dateModifie) values (10, 5, '2020-06-10');
insert into PublicationUser (idUser, idPublication, dateModifie) values (12, 6, '2020-05-10');
insert into PublicationUser (idUser, idPublication, dateModifie) values (14, 7, '2009-01-12');
insert into PublicationUser (idUser, idPublication, dateModifie) values (16, 8, '2014-08-15');
insert into PublicationUser (idUser, idPublication, dateModifie) values (18, 9, '2008-07-06');
insert into PublicationUser (idUser, idPublication, dateModifie) values (20, 10,'2020-05-08');
insert into PublicationUser (idUser, idPublication, dateModifie) values (5, 11, '2020-06-05');
insert into PublicationUser (idUser, idPublication, dateModifie) values (7, 12, '2020-06-12');

