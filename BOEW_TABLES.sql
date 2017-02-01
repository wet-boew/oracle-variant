
-----------
-- SEQ   --	Création des SÉQUENCES
-----------

CREATE SEQUENCE POC_S_IDE_BOEW_MENU NOCACHE MAXVALUE 999999999 ;

-----------
-- TABLE --	Création des TABLES
-----------

CREATE TABLE POC_BOEW_MENU
(	
	IDE_BOEW_MENU  			NUMBER(9), 
	NOM_CATGR 			VARCHAR2(255)	CONSTRAINT POC_BOEW_MENU__NOM_CATGR_NN NOT NULL,
	NOM_MENU_FRA   			VARCHAR2(255)	CONSTRAINT POC_BOEW_MENU__NOM_MENU_FRA_NN NOT NULL, 
	NOM_MENU_ENG   			VARCHAR2(255)	CONSTRAINT POC_BOEW_MENU__NOM_MENU_ENG_NN NOT NULL,
	NOM_LIEN_FRA       		VARCHAR2(255)	CONSTRAINT POC_BOEW_MENU__NOM_LIEN_FRA_NN NOT NULL,
	NOM_LIEN_ENG       		VARCHAR2(255)	CONSTRAINT POC_BOEW_MENU__NOM_LIEN_ENG_NN NOT NULL,	
	NOM_ID				VARCHAR2(255),
	SEQ_AFFCH			NUMBER(9)	CONSTRAINT POC_BOEW_MENU__SEQ_AFFCH_NN NOT NULL,

	DAH_CRETN      			DATE, 
	COD_UTILS_CRETN			VARCHAR2(255), 
	DAH_MODFC      			DATE, 
	COD_UTILS_MODFC			VARCHAR2(255),
	
	IDE_BOEW_MENU_PARNT		NUMBER(9),
	
	CONSTRAINT POC_BOEW_MENU_PK PRIMARY KEY (IDE_BOEW_MENU),
	CONSTRAINT POC_BOEW_MENU__MENU_PARNT_FK FOREIGN KEY (IDE_BOEW_MENU_PARNT) REFERENCES POC_BOEW_MENU (IDE_BOEW_MENU)
) ;

CREATE OR REPLACE TRIGGER POC_BOEW_MENU_BIU_TRG 
BEFORE INSERT OR UPDATE ON POC_BOEW_MENU
FOR EACH ROW
BEGIN
	IF (INSERTING) THEN
                :NEW.ide_boew_menu := poc_s_ide_boew_menu.NEXTVAL ;
		:NEW.dah_cretn := SYSDATE ;
		:NEW.cod_utils_cretn := NVL(v('APP_USER'), USER) ;
	END IF ;
	
	IF (UPDATING) THEN
		:NEW.dah_modfc := SYSDATE ;
		:NEW.cod_utils_modfc := NVL(v('APP_USER'), USER) ;
	END IF ;
		
END POC_BOEW_MENU_BIU_TRG ;