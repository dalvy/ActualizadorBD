CLOSE DATABASES ALL

**SET DEFA TO C:\GESTOR\ACTIVO\DATA
SET DEFA TO C:\GESTOR\Activos\DATA

IF NOT DBUSE("bdactivos")
  OPEN DATABASE bdactivos
ENDIF


*-- Saber si existe la tabla "snttabla07"
IF INDBC("snttabla07", "TABLE")
  	**MESSAGEBOX("Si existe la tabla")
	***************************************************************************************     	  	
  	DROP TABLE snttabla07
	***************************************************************************************     	
	CREATE TABLE snttabla07;
	  (id_tipointang C(2) NOT NULL,;
	  dsc_tipointang C(50) 	  NULL,;
	  abr_tipointang C(10) 	  NULL,;
	  estado L, ;
	  PRIMARY KEY id_tipointang TAG pk_tipoint)

	INSERT INTO snttabla07 VALUES('01','INTANGIBLE ADQUIRIDO'                  ,'ADQ.',.T.)
	INSERT INTO snttabla07 VALUES('02','INTANGIBLE EN ETAPA DE INVESTIGACIÓN'  ,'INV.',.T.)
	INSERT INTO snttabla07 VALUES('03','INTANGIBLE EN ETAPA DE DESARROLLO'     ,'DES.',.T.)  	
	***************************************************************************************     	
ELSE
  	**MESSAGEBOX("No existe la tabla")
	***************************************************************************************
	CREATE TABLE snttabla07;
	  (id_tipointang C(2) NOT NULL,;
	  dsc_tipointang C(50) 	  NULL,;
	  abr_tipointang C(10) 	  NULL,;
	  estado L,;
	  PRIMARY KEY id_tipointang TAG pk_tipoint)

	INSERT INTO snttabla07 VALUES('01','INTANGIBLE ADQUIRIDO'                  ,'ADQ.',.T.)
	INSERT INTO snttabla07 VALUES('02','INTANGIBLE EN ETAPA DE INVESTIGACIÓN'  ,'INV.',.T.)
	INSERT INTO snttabla07 VALUES('03','INTANGIBLE EN ETAPA DE DESARROLLO'     ,'DES.',.T.)  	
	***************************************************************************************    
ENDIF


***************************************************************************************
*-- Saber si existe el campo en "cpaf0050"
IF INDBC("cpaf0050", "TABLE")
	USE cpaf0050 EXCL
	SELECT cpaf0050  
	AFIELDS(aCampos)
	lCrea=.T. 								    && Variable para saber si creo el campo o no
	FOR I=1 TO ALEN(aCampos,1) 				    && Ciclo para verificar el nombre del campo
		IF UPPER(aCampos[I,1])=="ID_TIPOINTANG" && Valido el nombre del campo
			ALTER TABLE cpaf0050 DROP COLUMN id_tipointang
			ALTER TABLE cpaf0050 ADD  COLUMN id_tipointang C(2) DEFAULT '01'
			lCrea=.F. 						    && No crea el campo
			EXIT 							    && Sale del For
		ENDIF
	Endfor
	IF lCrea
		ALTER TABLE cpaf0050 ADD COLUMN id_tipointang C(2) DEFAULT '01'
	ENDIF 
ELSE
	MESSAGEBOX("No existe la tabla cpaf0050",48,"Aviso")
ENDIF
***************************************************************************************

***************************************************************************************
*-- Saber si existe el campo en "cpaf0030"
IF INDBC("cpaf0030", "TABLE")
	USE cpaf0030 EXCL
	SELECT cpaf0030
	AFIELDS(aCampos)
	lCrea=.T. 								   && Variable para saber si creo el campo o no
	FOR I=1 TO ALEN(aCampos,1) 				   && Ciclo para verificar el nombre del campo
		IF UPPER(aCampos[I,1])=="F_CONSIDERAR" && Valido el nombre del campo
			ALTER TABLE cpaf0030 DROP COLUMN f_considerar
			ALTER TABLE cpaf0030 ADD  COLUMN f_considerar I DEFAULT 1
			lCrea=.F. 						   && No crea el campo
			EXIT 							   && Sale del For
		ENDIF
	Endfor
	IF lCrea
		ALTER TABLE cpaf0030 ADD COLUMN f_considerar I DEFAULT 1
	ENDIF 
ELSE
	MESSAGEBOX("No existe la tabla cpaf0030",48,"Aviso")
	RETURN .F.
ENDIF
***************************************************************************************
MESSAGEBOX("Cambios realizados satisfactoriamente",64,"Aviso")
***************************************************************************************

clos all
*!*	Set defa to F:\PROYECTOGESTOR\GestorVFox\Migradores\Activos