/*Afficher les d�tails de tous les utilisateur.*/

SELECT * FROM Utilisateur;

/*Afficher les �v�nement avenir.*/

SELECT * FROM EVENEMENT WHERE DATE_DEBUT > CURDATE();

/*Modifier la date de l'�v�nement publi� par le membre du nom �Thompson�.*/

UPDATE EVENEMENT  SET DATE_DEBUT='2020-11-01', DATE_FIN = DATE_ADD("2020-11-01", INTERVAL 30 DAY)
WHERE EVENEMENT.DATE_DEBUT = (SELECT EVENEMENT.DATE_DEBUT
                              FROM MEMBRE, PUBLICATION, PUBLICATIONUSER, EVENEMENT
                              WHERE MEMBRE.IDUSER=PUBLICATIONUSER.IDUSER AND PUBLICATION.IDPUBLICATION = PUBLICATIONUSER.IDPUBLICATION
                              AND PUBLICATION.IDPUBLICATION = EVENEMENT.IDPUBLICATION AND MEMBRE.NOM = 'Thompson');

/*Supprimer la publication publi� par le membre �Smith�.*/

DELETE FROM PUBLICATIONUSER WHERE IDPUBLICATION =( SELECT PUBLICATION.IDPUBLICATION FROM PUBLICATION,MEMBRE,PUBLICATIONUSER 
                                                  WHERE(PUBLICATIONUSER.IDPUBLICATION = PUBLICATION.IDPUBLICATION
                                                  AND PUBLICATIONUSER.IDUSER = MEMBRE.IDUSER
                                                  AND MEMBRE.NOM='Smith') );

DELETE FROM PUBLICATION WHERE IDPUBLICATION =( SELECT PUBLICATION.IDPUBLICATION FROM PUBLICATION,MEMBRE,PUBLICATIONUSER 
                                              WHERE(PUBLICATIONUSER.IDPUBLICATION = PUBLICATION.IDPUBLICATION
                                              AND PUBLICATIONUSER.IDUSER = MEMBRE.IDUSER
                                              AND MEMBRE.NOM='Smith'));

/*Affiche la list des responsable d'�quipes avec leur �quipe encadrer.*/

SELECT MEMBRE.NOM,MEMBRE.PRENOME,MEMBRE.TELE,EQUIPESDERECHERCHE.NOMDESTRUCTURE Equipe_encadrer
FROM EQUIPESDERECHERCHE,MEMBRE
where EQUIPESDERECHERCHE.NUMRESPONSABLE = MEMBRE.IDUSER;

/*Changer le t�l�phone de l�utilisateur �Khadija� par �0612345678�.*/

UPDATE MEMBRE SET TELE='0612345678' WHERE NOM='Khadija';

/*Changer le responsable de l'�quipe �equipe Physique� par le membre �Stroman�. */

UPDATE EQUIPESDERECHERCHE SET NUMRESPONSABLE = (SELECT IDUSER FROM MEMBRE WHERE MEMBRE.NOM='Stroman')
WHERE EQUIPESDERECHERCHE.IDEQUIPE = (SELECT EQUIPESDERECHERCHE.IDEQUIPE
                                     FROM EQUIPESDERECHERCHE
                                     WHERE EQUIPESDERECHERCHE.NOMDESTRUCTURE = 'equipe Physique');

/*Donner les d��v�nement organiser au pays �japan�. */

SELECT * FROM EVENEMENT WHERE LIEU='japan';

/*Afficher tous les publication publi� par l�utilisateur �Bailey�. */

SELECT PUBLICATION.TITREDEPUBLICATION, PUBLICATION.DATEDEPUBLICATION, PUBLICATION.IDPUBLICATION
FROM PUBLICATION, MEMBRE, PUBLICATIONUSER
WHERE PUBLICATION.IDPUBLICATION = PUBLICATIONUSER.IDPUBLICATION
AND MEMBRE.IDUSER = PUBLICATIONUSER.IDUSER
AND MEMBRE.NOM = 'Bailey';

/*Afficher les utilisateurs qui n�ont pas publi� aucune publication.*/

SELECT * FROM UTILISATEUR 
WHERE IDUSER NOT IN (SELECT IDUSER FROM PUBLICATIONUSER);

/*Afficher tous les membre de l��quipe �equipe Math�matiques�. */

SELECT membre.NOM,membre.PRENOME,membre.CNE,membre.CNI,membre.TELE
FROM MEMBRE,EQUIPESDERECHERCHE
WHERE MEMBRE.IDEQUIPE=EQUIPESDERECHERCHE.IDEQUIPE AND EQUIPESDERECHERCHE.NOMDESTRUCTURE = 'equipe biologie';

/*Afficher le responsable de l��quipe �equipe Chimie�.*/

SELECT * FROM MEMBRE 
WHERE IDUSER = (SELECT NUMRESPONSABLE FROM EQUIPESDERECHERCHE 
                WHERE NOMDESTRUCTURE = 'equipe Chimie');
                
/*Groupe tous les membres par des �quipe.*/

SELECT * FROM MEMBRE GROUP BY IDEQUIPE,NOM;

/*Afficher les laboratoires n�ont pas utilis�.*/

SELECT * FROM LABORATOIRE WHERE IDLABORATOIRE NOT IN (SELECT EquipesDeRecherche.IDLABORATOIRE
                                                      FROM EQUIPESDERECHERCHE,LABORATOIRE
                                                      WHERE EQUIPESDERECHERCHE.IDLABORATOIRE=LABORATOIRE.IDLABORATOIRE);

/*Afficher les conference internationale.*/

SELECT * FROM CONFERENCE WHERE TYPE='international';

/*Trier les evenement par leur date.*/

SELECT * FROM EVENEMENT ORDER BY DATE_DEBUT;




