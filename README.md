Intégrer le thème de la BOEW pour Apex de Oracle

----

Ce fichier explique comment migrer le thème apex WET BOEW.

Voici quelques choses que vous devez savoir:

	- Créer la tables SQL pour les menus de la page (Rouler le fichier BOEW_TABLES.sql)
	- Ajouter les deux packages : 
				- PKG_POC_BOEW.pks" ;
				- PKG_POC_BOEW.pkb" ;
	- S'assurer que les GRANT et SYNONYME sont tous présent.
	 	EX:	GRANT EXECUTE ON PKG_POC_BOEW TO "SCHEMA DE L'APPLICATION" ;
			GRANT EXECUTE ON PKG_POC_APEX TO "SCHEMA DE L'APPLICATION" ;

			CREATE OR REPLACE SYNONYM PKG_POC_APEX FOR POC.PKG_POC_APEX ;
			CREATE OR REPLACE SYNONYM PKG_POC_BOEW FOR POC.PKG_POC_BOEW ;

	- Importer l'application Master - Boew.sql
	

Pour toute autre information, consulter le dossier "Documentation"...
