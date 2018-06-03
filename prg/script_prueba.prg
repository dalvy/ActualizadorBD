FUNCTION ExisteCampo(lcCampo,lcTabla)
	AFIELDS(la,lcTabla)
	RETURN ASCAN(la,lcCampo,1,0,1,15) # 0
ENDFUNC

*!*	CLOSE DATABASES ALL
*!*	set step on
*!*	SET DEFA TO D:\GESTOR\ACTIVOS\DATA
*!*	IF NOT DBUSE("bdactivos")
*!*	  OPEN DATABASE bdactivos
*!*	ELSE
*!*		MESSAGEBOX("La Base de Datos bdcontable no existe",48,"Aviso")
*!*		RETURN .F.
*!*	ENDIF

*!*	SET STEP ON
*!*	*-- Saber si existe la vista "MiVista"
*!*	IF INDBC("snttabla07", "TABLE")
*!*	  **MESSAGEBOX("Si existe la vista")
*!*	ALTER TABLE snttabla07 ALTER COLUMN abr_tipointang C(10)

*!*	*!*			ALTER TABLE snttabla07;
*!*	*!*			  (id_tipointang C(2) NOT NULL,;
*!*	*!*			  dsc_tipointang C(50) 	  NULL,;
*!*	*!*			  abr_tipointang C(10) 	  NULL,;
*!*	*!*			  estado L, ;
*!*	*!*			  PRIMARY KEY id_tipointang TAG pk_tipoint)
*!*			    
*!*	ELSE
*!*	  **MESSAGEBOX("No existe la vista")
*!*	ENDIF

*!*	CREATE CURSOR tmpanadet (A C(10))
*!*	INSER INTO tmpanadet VALUES ("S")
*!*	INSER INTO tmpanadet VALUES ("S")
*!*	INSER INTO tmpanadet VALUES ("S")
*!*	Private archivo
*!*	archivo=putfile("Nombre de Archivo",'','XLS')
*!*	SET STEP ON
*!*	sele tmpanadet
*!*	go top
*!*	if eof()
*!*		messagebox("No existen datos",0+16,"Atención")
*!*	else
*!*		sele tmpanadet
*!*		GO TOP 
*!*		COPY TO (archivo) TYPE XL5
*!*	endif



*!*	Local i, j, lcNomCampo
*!*	Store 0 To j
*!*	SELECT snttabla07
*!*	For i = 1 To Fcount() - 1 && Contará los campos mencionados (ta1, ta2 y ta3)
*!*	   SELECT snttabla07
*!*	  lcNomCampo = Field(i)
*!*	  If VarType(lcNomCampo) = "N" 
*!*	  	SELECT snttabla07
*!*	    If Evaluate(lcNomCampo) > 0
*!*	      j = j + 1
*!*	    Endif
*!*	  Endif
*!*	Endfor 		



*!*				IF FSIZE(lcNombreCampo) = 0
*!*					
*!*				ELSE
*!*					
*!*				ENDIF
			
			
*!*			    && Ciclo para verificar el nombre del campo
*!*				lcNombreCampo = UPPER(aCampos[I,1])  && Variable para saber si creo el campo o no
*!*				IF FSIZE(lcNombreCampo) = 0
*!*					Thisform.existecampoactivo(0,lcNombreCampo) && No se Creo
*!*				ELSE
*!*					Thisform.existecampoactivo(1,lcNombreCampo) && Si se Creo
*!*				ENDIF
			
*!*				DO CASE 
*!*					CASE UPPER(aCampos[I,1])=="ID_TIPOINTANG"
*!*						lcNombreCampo= UPPER(aCampos[I,1])
*!*						IF FSIZE(lcNombreCampo) = 0
*!*							Thisform.existecampoactivo(0,lcNombreCampo) && No se Creo
*!*						ELSE
*!*							Thisform.existecampoactivo(1,lcNombreCampo) && Si se Creo
*!*						ENDIF				
*!*					CASE UPPER(aCampos[I,1])=="DSC_TIPOINTANG"
*!*						lcNombreCampo= UPPER(aCampos[I,1])
*!*						IF FSIZE(lcNombreCampo) = 0
*!*							Thisform.existecampoactivo(0,lcNombreCampo) && No se Creo
*!*						ELSE
*!*							Thisform.existecampoactivo(1,lcNombreCampo) && Si se Creo
*!*						ENDIF				
*!*					CASE UPPER(aCampos[I,1])=="ABR_TIPOINTANG"
*!*						lcNombreCampo= UPPER(aCampos[I,1])
*!*						IF FSIZE(lcNombreCampo) = 0
*!*							Thisform.existecampoactivo(0,lcNombreCampo) && No se Creo
*!*						ELSE
*!*							Thisform.existecampoactivo(1,lcNombreCampo) && Si se Creo
*!*						ENDIF				
*!*					CASE UPPER(aCampos[I,1])=="ESTADO"
*!*						lcNombreCampo= UPPER(aCampos[I,1])
*!*						IF FSIZE(lcNombreCampo) = 0
*!*							Thisform.existecampoactivo(0,lcNombreCampo) && No se Creo
*!*						ELSE
*!*							Thisform.existecampoactivo(1,lcNombreCampo) && Si se Creo
*!*						ENDIF				
*!*				ENDCASE 



*!*	*!*			DO CASE
*!*	*!*				CASE lcCampo='ID_TIPOINTANG'
*!*	*!*				CASE lcCampo='DSC_TIPOINTANG'
*!*	*!*				CASE lcCampo='ABR_TIPOINTANG'
*!*	*!*				CASE lcCampo='ESTADO'
*!*	*!*			ENDCASE