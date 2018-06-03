CLOSE DATABASES ALL

**SET DEFA TO D:\GESTOR\CONTA\DATA
SET DEFA TO D:\GESTOR\Contable\DATA
****************************************************************
IF NOT DBUSE("bdcontable")
  OPEN DATABASE bdcontable
ELSE
	MESSAGEBOX("La Base de Datos bdcontable no existe",48,"Aviso")
	RETURN .F.
ENDIF
****************************************************************
*** TABLA QUE NO EXISTE EN LA BDCONTABLE
****************************************************************
*-- Saber si existe la tabla "snttabla11"
IF INDBC("snttabla11", "TABLE")
  	**MESSAGEBOX("Si existe la tabla")
	****************************************************************
  	DROP TABLE snttabla11
	****************************************************************
	CREATE TABLE snttabla11;
	  (id_aduana C(3)  NOT NULL,;
	  dsc_aduana C(50)     NULL,;
	  abr_aduana C(10)     NULL,;
	  estado L,;
	  PRIMARY KEY id_aduana TAG pk_aduana)

	INSERT INTO snttabla11 VALUES('019','TUMBES','',.T.)
	INSERT INTO snttabla11 VALUES('028','TALARA','',.T.)
	INSERT INTO snttabla11 VALUES('046','PAITA','',.T.)
	INSERT INTO snttabla11 VALUES('055','CHICLAYO','',.T.)
	INSERT INTO snttabla11 VALUES('082','SALAVERRY','',.T.)
	INSERT INTO snttabla11 VALUES('091','CHIMBOTE','',.T.)
	INSERT INTO snttabla11 VALUES('118','MARÍTIMA DEL CALLAO','',.T.)
	INSERT INTO snttabla11 VALUES('127','PISCO','',.T.)
	INSERT INTO snttabla11 VALUES('145','MOLLENDO MATARANI','',.T.)
	INSERT INTO snttabla11 VALUES('154','AREQUIPA','',.T.)
	INSERT INTO snttabla11 VALUES('163','ILO','',.T.)
	INSERT INTO snttabla11 VALUES('172','TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('181','PUNO','',.T.)
	INSERT INTO snttabla11 VALUES('190','CUZCO','',.T.)
	INSERT INTO snttabla11 VALUES('217','PUCALLPA','',.T.)
	INSERT INTO snttabla11 VALUES('226','IQUITOS','',.T.)
	INSERT INTO snttabla11 VALUES('235','AÉREA DEL CALLAO','',.T.)
	INSERT INTO snttabla11 VALUES('244','POSTAL DE LIMA','',.T.)
	INSERT INTO snttabla11 VALUES('262','DESAGUADERO','',.T.)
	INSERT INTO snttabla11 VALUES('271','TARAPOTO','',.T.)
	INSERT INTO snttabla11 VALUES('280','PUERTO MALDONADO','',.T.)
	INSERT INTO snttabla11 VALUES('299','LA TINA','',.T.)
	INSERT INTO snttabla11 VALUES('884','DEPENDENCIA FERROVIARIA TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('893','DEPENDENCIA POSTAL TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('910','DEPENDENCIA POSTAL AREQUIPA','',.T.)
	INSERT INTO snttabla11 VALUES('929','COMPLEJO FRONTERIZO STA ROSA TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('938','TERMINAL TERRESTRE TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('947','AEROPUERTO TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('956','CETICOS TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('965','DEPENDENCIA POSTAL DE SALAVERRY','',.T.)
	****************************************************************
ELSE
  	**MESSAGEBOX("No existe la tabla")
	***************************************************************************************
	CREATE TABLE snttabla11;
	  (id_aduana C(3)  NOT NULL,;
	  dsc_aduana C(50)     NULL,;
	  abr_aduana C(10)     NULL,;
	  estado L,;
	  PRIMARY KEY id_aduana TAG pk_aduana)

	INSERT INTO snttabla11 VALUES('019','TUMBES','',.T.)
	INSERT INTO snttabla11 VALUES('028','TALARA','',.T.)
	INSERT INTO snttabla11 VALUES('046','PAITA','',.T.)
	INSERT INTO snttabla11 VALUES('055','CHICLAYO','',.T.)
	INSERT INTO snttabla11 VALUES('082','SALAVERRY','',.T.)
	INSERT INTO snttabla11 VALUES('091','CHIMBOTE','',.T.)
	INSERT INTO snttabla11 VALUES('118','MARÍTIMA DEL CALLAO','',.T.)
	INSERT INTO snttabla11 VALUES('127','PISCO','',.T.)
	INSERT INTO snttabla11 VALUES('145','MOLLENDO MATARANI','',.T.)
	INSERT INTO snttabla11 VALUES('154','AREQUIPA','',.T.)
	INSERT INTO snttabla11 VALUES('163','ILO','',.T.)
	INSERT INTO snttabla11 VALUES('172','TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('181','PUNO','',.T.)
	INSERT INTO snttabla11 VALUES('190','CUZCO','',.T.)
	INSERT INTO snttabla11 VALUES('217','PUCALLPA','',.T.)
	INSERT INTO snttabla11 VALUES('226','IQUITOS','',.T.)
	INSERT INTO snttabla11 VALUES('235','AÉREA DEL CALLAO','',.T.)
	INSERT INTO snttabla11 VALUES('244','POSTAL DE LIMA','',.T.)
	INSERT INTO snttabla11 VALUES('262','DESAGUADERO','',.T.)
	INSERT INTO snttabla11 VALUES('271','TARAPOTO','',.T.)
	INSERT INTO snttabla11 VALUES('280','PUERTO MALDONADO','',.T.)
	INSERT INTO snttabla11 VALUES('299','LA TINA','',.T.)
	INSERT INTO snttabla11 VALUES('884','DEPENDENCIA FERROVIARIA TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('893','DEPENDENCIA POSTAL TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('910','DEPENDENCIA POSTAL AREQUIPA','',.T.)
	INSERT INTO snttabla11 VALUES('929','COMPLEJO FRONTERIZO STA ROSA TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('938','TERMINAL TERRESTRE TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('947','AEROPUERTO TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('956','CETICOS TACNA','',.T.)
	INSERT INTO snttabla11 VALUES('965','DEPENDENCIA POSTAL DE SALAVERRY','',.T.)
	****************************************************************
ENDIF 	
	
****************************************************************
*** SETEAMOS LAS VARIABLES
****************************************************************	
gcCodSucursal= "0101"
gcSucursal	 = "0101"
gcMonNac	 = "01"
gcCodUsuario = "001"	
****************************************************************

***************************************************************************************
*-- Saber si existe el campo en "fcon0030"
IF INDBC("fcon0030", "TABLE")
	USE fcon0030 EXCL
	SELECT fcon0030
	AFIELDS(aCampos)
	lCrea=.T. 								   && Variable para saber si creo el campo o no
	FOR I=1 TO ALEN(aCampos,1) 				   && Ciclo para verificar el nombre del campo
		DO CASE 
			CASE UPPER(aCampos[I,1])=="NROCOREC"
				ALTER TABLE fcon0030 DROP COLUMN nrocorec
				ALTER TABLE fcon0030 ADD  COLUMN nrocorec 	  C(10)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="FECVENCC"
				ALTER TABLE fcon0030 DROP COLUMN fecvencc
				ALTER TABLE fcon0030 ADD  COLUMN fecvencc 	  D(8)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="ID_CPDOC"
				ALTER TABLE fcon0030 DROP COLUMN id_cpdoc
				ALTER TABLE fcon0030 ADD  COLUMN id_cpdoc 	  C(2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="ID_ADUANA"
				ALTER TABLE fcon0030 DROP COLUMN id_aduana
				ALTER TABLE fcon0030 ADD  COLUMN id_aduana    C(2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="ANIODUAC"
				ALTER TABLE fcon0030 DROP COLUMN anioduac 
				ALTER TABLE fcon0030 ADD  COLUMN anioduac     C(2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="ID_TIPODOC"
				ALTER TABLE fcon0030 DROP COLUMN id_tipodoc
				ALTER TABLE fcon0030 ADD  COLUMN id_tipodoc   C(2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="BASEIMPGRA"
				ALTER TABLE fcon0030 DROP COLUMN baseimpgra
				ALTER TABLE fcon0030 ADD  COLUMN baseimpgra   N(16,2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="IGVGRA"
				ALTER TABLE fcon0030 DROP COLUMN igvgra
				ALTER TABLE fcon0030 ADD  COLUMN igvgra    	  N(16,2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="BASEIMPNOG"
				ALTER TABLE fcon0030 DROP COLUMN baseimpnog
				ALTER TABLE fcon0030 ADD  COLUMN baseimpnog   N(16,2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="IGVNOG"
				ALTER TABLE fcon0030 DROP COLUMN igvnog
				ALTER TABLE fcon0030 ADD  COLUMN igvnog 	  N(16,2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="BASEIMPDES"
				ALTER TABLE fcon0030 DROP COLUMN baseimpdes
				ALTER TABLE fcon0030 ADD  COLUMN baseimpdes   N(16,2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="IGVDES"
				ALTER TABLE fcon0030 DROP COLUMN igvdes
				ALTER TABLE fcon0030 ADD  COLUMN igvdes 	  N(16,2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="OTROSTRI"
				ALTER TABLE fcon0030 DROP COLUMN otrostri
				ALTER TABLE fcon0030 ADD  COLUMN otrostri     N(16,2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="IMPTOTAL"
				ALTER TABLE fcon0030 DROP COLUMN imptotal
				ALTER TABLE fcon0030 ADD  COLUMN imptotal     N(16,2)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="NROCOMPD"
				ALTER TABLE fcon0030 DROP COLUMN nrocompd
				ALTER TABLE fcon0030 ADD  COLUMN nrocompd     C(10)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="NUMERO"
				ALTER TABLE fcon0030 DROP COLUMN numero
				ALTER TABLE fcon0030 ADD  COLUMN numero       C(10)
				lCrea=.F.	&& No crea el campo
			CASE UPPER(aCampos[I,1])=="FECEMISION"
				ALTER TABLE fcon0030 DROP COLUMN fecemision
				ALTER TABLE fcon0030 ADD  COLUMN fecemision   D(8)
				lCrea=.F.	&& No crea el campo
		ENDCASE
	ENDFOR				   
	**EXIT
		
	IF lCrea=.T.
		ALTER TABLE fcon0030 ADD COLUMN nrocorec      C(10)
		ALTER TABLE fcon0030 ADD COLUMN fecvencc      D(8)
		ALTER TABLE fcon0030 ADD COLUMN id_cpdoc 	  C(2)
		ALTER TABLE fcon0030 ADD COLUMN id_aduana     C(2)
		ALTER TABLE fcon0030 ADD COLUMN anioduac      C(6)
		ALTER TABLE fcon0030 ADD COLUMN id_tipodoc    C(2)
		ALTER TABLE fcon0030 ADD COLUMN baseimpgra    N(16,2)
		ALTER TABLE fcon0030 ADD COLUMN igvgra     	  N(16,2)
		ALTER TABLE fcon0030 ADD COLUMN baseimpnog    N(16,2)
		ALTER TABLE fcon0030 ADD COLUMN igvnog 	      N(16,2)
		ALTER TABLE fcon0030 ADD COLUMN baseimpdes    N(16,2)
		ALTER TABLE fcon0030 ADD COLUMN igvdes 	      N(16,2)
		ALTER TABLE fcon0030 ADD COLUMN otrostri      N(16,2)
		ALTER TABLE fcon0030 ADD COLUMN imptotal      N(16,2)
		ALTER TABLE fcon0030 ADD COLUMN nrocompd      C(10)
		ALTER TABLE fcon0030 ADD COLUMN numero        C(10)
		ALTER TABLE fcon0030 ADD COLUMN fecemision    D(8)
	ENDIF 
ELSE
	MESSAGEBOX("No existe la tabla cpaf0030",48,"Aviso")
	RETURN .F.
ENDIF	


***************************************************************************************
MESSAGEBOX("Cambios realizados satisfactoriamente",64,"Aviso")
***************************************************************************************

CLOSE ALL


*** VISTAS
***************************************************************************************
*!*	IF INDBC("view_registro_compras", "VIEW")
   	
   	**MESSAGEBOX("Si existe la vista")
	
*!*		DBSETPROP('view_registro_compras', 'View', 'Tables', 'fcon0030')  
	&&	Configura las tablas para que se puedan actualizar.
	
*!*		DBSETPROP('view_registro_compras.iddocum'	, 'Field', 	 'KeyField', .T.)
*!*		DBSETPROP('view_registro_compras.docser' 	, 'Field',   'KeyField', .T.)
*!*		DBSETPROP('view_registro_compras.docnro' 	, 'Field',   'KeyField', .T.)
*!*		DBSETPROP('view_registro_compras.rucprov'	, 'Field',   'KeyField', .T.)
*!*		DBSETPROP('view_registro_compras.estado' 	, 'Field',   'KeyField', .T.)
	&&	Establece una clave única de dos campos para la tabla Customer.		
	 
*!*		DBSETPROP('view_registro_compras.nrocorec'  , 'Field',   'UpdateName', 'fcon0030.nrocorec')
*!*		DBSETPROP('view_registro_compras.fecvencc'  , 'Field',   'UpdateName', 'fcon0030.fecvencc')
*!*		DBSETPROP('view_registro_compras.id_cpdoc'  , 'Field',   'UpdateName', 'fcon0030.id_cpdoc')
*!*		DBSETPROP('view_registro_compras.id_aduana' , 'Field',   'UpdateName', 'fcon0030.id_aduana')
*!*		DBSETPROP('view_registro_compras.anioduac'  , 'Field',   'UpdateName', 'fcon0030.anioduac')
*!*		DBSETPROP('view_registro_compras.id_tipodoc', 'Field',   'UpdateName', 'fcon0030.id_tipodoc')
*!*		DBSETPROP('view_registro_compras.baseimpgra', 'Field',   'UpdateName', 'fcon0030.baseimpgra')
*!*		DBSETPROP('view_registro_compras.igvgra'    , 'Field',   'UpdateName', 'fcon0030.igvgra')
*!*		DBSETPROP('view_registro_compras.baseimpnog', 'Field',   'UpdateName', 'fcon0030.baseimpnog')
*!*		DBSETPROP('view_registro_compras.igvnog'    , 'Field',   'UpdateName', 'fcon0030.igvnog')
*!*		DBSETPROP('view_registro_compras.baseimpdes', 'Field',   'UpdateName', 'fcon0030.baseimpdes')
*!*		DBSETPROP('view_registro_compras.igvdes'    , 'Field',   'UpdateName', 'fcon0030.igvdes')
*!*		DBSETPROP('view_registro_compras.otrostri'  , 'Field',   'UpdateName', 'fcon0030.otrostri')
*!*		DBSETPROP('view_registro_compras.imptotal'  , 'Field',   'UpdateName', 'fcon0030.imptotal')
*!*		DBSETPROP('view_registro_compras.nrocompd'  , 'Field',   'UpdateName', 'fcon0030.nrocompd')
*!*		DBSETPROP('view_registro_compras.numero'    , 'Field',   'UpdateName', 'fcon0030.numero')
*!*		DBSETPROP('view_registro_compras.fecemision', 'Field',   'UpdateName', 'fcon0030.fecemision')
	&&	Configura los nombres de actualización.
	
*!*		DBSETPROP('view_registro_compras.nrocorec'  , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.fecvencc'  , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.id_cpdoc'  , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.id_aduana' , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.anioduac'  , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.id_tipodoc', 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.baseimpgra', 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.igvgra'    , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.baseimpnog', 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.igvnog'    , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.baseimpdes', 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.igvdes'    , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.otrostri'  , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.imptotal'  , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.nrocompd'  , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.numero'    , 'Field',   'Updateable', .T.)
*!*		DBSETPROP('view_registro_compras.fecemision', 'Field',   'Updateable', .T.)

*!*		DBSETPROP('view_registro_compras', 'View',  'SendUpdates', .T.)	

*!*		TABLEUPDATE()	
*!*	ELSE
*!*	   MESSAGEBOX("No existe la vista")
*!*	ENDIF
***************************************************************************************

*************************
*** TABLA QUE EXISTE EN LA BDCONTABLE
*************************
*!*	CREATE TABLE snttabla02;
*!*	  id_tipodoc  C(2)  NOT NULL,;
*!*	  dsc_tipodoc C(50) 	NULL,;
*!*	  abr_tipodoc C(10) 	NULL,;
*!*	  estado L,;
*!*	  PRIMARY KEY pk_tipodoc TAG id_tipodoc)

*!*	INSERT INTO snttabla02 VALUES('0','OTROS TIPOS DE DOCUMENTOS','',.T.)
*!*	INSERT INTO snttabla02 VALUES('1','DOCUMENTO NACIONAL DE IDENTIDAD (DNI)','',.T.)
*!*	INSERT INTO snttabla02 VALUES('4','CARNET DE EXTRANJERIA','',.T.)
*!*	INSERT INTO snttabla02 VALUES('6','REGISTRO ÚNICO DE CONTRIBUYENTES','',.T.)
*!*	INSERT INTO snttabla02 VALUES('7','PASAPORTE','',.T.)  

*************************
*** TABLA QUE EXISTE EN LA BDCONTABLE
*************************
*!*	CREATE TABLE snttabla10;
*!*	  id_cpdoc  C(2)   NOT NULL,;
*!*	  dsc_cpdoc C(250) 	   NULL,;
*!*	  abr_cpdoc C(10)  	   NULL,;
*!*	  estado L,;
*!*	  PRIMARY KEY pk_cpdoc TAG id_cpdoc)

*!*	INSERT INTO snttabla10 VALUES('00','OTROS (ESPECIFICAR)','',.T.)
*!*	INSERT INTO snttabla10 VALUES('01','FACTURA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('02','RECIBO POR HONORARIOS','',.T.)
*!*	INSERT INTO snttabla10 VALUES('03','BOLETA DE VENTA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('04','LIQUIDACIÓN DE COMPRA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('05','BOLETO DE COMPAÑÍA DE AVIACIÓN COMERCIAL POR EL SERVICIO DE TRANSPORTE AÉREO DE PASAJEROS
*!*	','',.T.)
*!*	INSERT INTO snttabla10 VALUES('06','CARTA DE PORTE AÉREO POR EL SERVICIO DE TRANSPORTE DE CARGA AÉREA
*!*	','',.T.)
*!*	INSERT INTO snttabla10 VALUES('07','NOTA DE CRÉDITO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('08','NOTA DE DÉBITO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('09','GUÍA DE REMISIÓN - REMITENTE','',.T.)
*!*	INSERT INTO snttabla10 VALUES('10','RECIBO POR ARRENDAMIENTO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('11','PÓLIZA EMITIDA POR LAS BOLSAS DE VALORES, BOLSAS DE PRODUCTOS O AGENTES DE INTERMEDIACIÓN POR OPERACIONES REALIZADAS EN LAS BOLSAS DE VALORES O PRODUCTOS O FUERA DE LAS MISMAS, AUTORIZADAS POR CONASEV','',.T.)
*!*	INSERT INTO snttabla10 VALUES('12','TICKET O CINTA EMITIDO POR MÁQUINA REGISTRADORA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('13','DOCUMENTO EMITIDO POR BANCOS, INSTITUCIONES FINANCIERAS, CREDITICIAS Y DE SEGUROS QUE SE ENCUENTREN BAJO EL CONTROL DE LA SUPERINTENDENCIA DE BANCA Y SEGUROS','',.T.)
*!*	INSERT INTO snttabla10 VALUES('14','RECIBO POR SERVICIOS PÚBLICOS DE SUMINISTRO DE ENERGÍA ELÉCTRICA, AGUA, TELÉFONO, TELEX Y TELEGRÁFICOS Y OTROS SERVICIOS COMPLEMENTARIOS QUE SE INCLUYAN EN EL RECIBO DE SERVICIO PÚBLICO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('15','BOLETO EMITIDO POR LAS EMPRESAS DE TRANSPORTE PÚBLICO URBANO DE PASAJEROS','',.T.)
*!*	INSERT INTO snttabla10 VALUES('16','BOLETO DE VIAJE EMITIDO POR LAS EMPRESAS DE TRANSPORTE PÚBLICO INTERPROVINCIAL DE PASAJEROS DENTRO DEL PAÍS','',.T.)
*!*	INSERT INTO snttabla10 VALUES('17','DOCUMENTO EMITIDO POR LA IGLESIA CATÓLICA POR EL ARRENDAMIENTO DE BIENES INMUEBLES','',.T.)
*!*	INSERT INTO snttabla10 VALUES('18','DOCUMENTO EMITIDO POR LAS ADMINISTRADORAS PRIVADAS DE FONDO DE PENSIONES QUE SE ENCUENTRAN BAJO LA SUPERVISIÓN DE LA SUPERINTENDENCIA DE ADMINISTRADORAS PRIVADAS DE FONDOS DE PENSIONES','',.T.)
*!*	INSERT INTO snttabla10 VALUES('19','BOLETO O ENTRADA POR ATRACCIONES Y ESPECTÁCULOS PÚBLICOS','',.T.)
*!*	INSERT INTO snttabla10 VALUES('20','COMPROBANTE DE RETENCIÓN','',.T.)
*!*	INSERT INTO snttabla10 VALUES('21','CONOCIMIENTO DE EMBARQUE POR EL SERVICIO DE TRANSPORTE DE CARGA MARÍTIMA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('22','COMPROBANTE POR OPERACIONES NO HABITUALES','',.T.)
*!*	INSERT INTO snttabla10 VALUES('23','PÓLIZAS DE ADJUDICACIÓN EMITIDAS CON OCASIÓN DEL REMATE O ADJUDICACIÓN DE BIENES POR VENTA FORZADA, POR LOS MARTILLEROS O LAS ENTIDADES QUE REMATEN O SUBASTEN BIENES POR CUENTA DE TERCEROS','',.T.)
*!*	INSERT INTO snttabla10 VALUES('24','CERTIFICADO DE PAGO DE REGALÍAS EMITIDAS POR PERUPETRO S.A','',.T.)
*!*	INSERT INTO snttabla10 VALUES('25','DOCUMENTO DE ATRIBUCIÓN (LEY DEL IMPUESTO GENERAL A LAS VENTAS E IMPUESTO SELECTIVO AL CONSUMO, ART. 19º, ÚLTIMO PÁRRAFO, R.S. N° 022-98-SUNAT).','',.T.)
*!*	INSERT INTO snttabla10 VALUES('26','RECIBO POR EL PAGO DE LA TARIFA POR USO DE AGUA SUPERFICIAL CON FINES AGRARIOS Y POR EL PAGO DE LA CUOTA PARA LA EJECUCIÓN DE UNA DETERMINADA OBRA O ACTIVIDAD ACORDADA POR LA ASAMBLEA GENERAL DE LA COMISIÓN DE REGANTES O RESOLUCIÓN EXPEDIDA POR EL JEFE DE LA UNIDAD DE AGUAS Y DE RIEGO (DECRETO SUPREMO N° 003-90-AG, ARTS. 28 Y 48)','',.T.)
*!*	INSERT INTO snttabla10 VALUES('27','SEGURO COMPLEMENTARIO DE TRABAJO DE RIESGO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('28','TARIFA UNIFICADA DE USO DE AEROPUERTO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('29','DOCUMENTOS EMITIDOS POR LA COFOPRI EN CALIDAD DE OFERTA DE VENTA DE TERRENOS, LOS CORRESPONDIENTES A LAS SUBASTAS PÚBLICAS Y A LA RETRIBUCIÓN DE LOS SERVICIOS QUE PRESTA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('30','DOCUMENTOS EMITIDOS POR LAS EMPRESAS QUE DESEMPEÑAN EL ROL ADQUIRENTE EN LOS SISTEMAS DE PAGO MEDIANTE TARJETAS DE CRÉDITO Y DÉBITO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('31','GUÍA DE REMISIÓN - TRANSPORTISTA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('32','DOCUMENTOS EMITIDOS POR LAS EMPRESAS RECAUDADORAS DE LA DENOMINADA GARANTÍA DE RED PRINCIPAL A LA QUE HACE REFERENCIA EL NUMERAL 7.6 DEL ARTÍCULO 7° DE LA LEY N° 27133 – LEY DE PROMOCIÓN DEL DESARROLLO DE LA INDUSTRIA DEL GAS NATURAL','',.T.)
*!*	INSERT INTO snttabla10 VALUES('34','DOCUMENTO DEL OPERADOR','',.T.)
*!*	INSERT INTO snttabla10 VALUES('35','DOCUMENTO DEL PARTÍCIPE','',.T.)
*!*	INSERT INTO snttabla10 VALUES('36','RECIBO DE DISTRIBUCIÓN DE GAS NATURAL','',.T.)
*!*	INSERT INTO snttabla10 VALUES('37','DOCUMENTOS QUE EMITAN LOS CONCESIONARIOS DEL SERVICIO DE REVISIONES TÉCNICAS VEHICULARES, POR LA PRESTACIÓN DE DICHO SERVICIO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('50','DECLARACIÓN ÚNICA DE ADUANAS - IMPORTACIÓN DEFINITIVA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('52','DESPACHO SIMPLIFICADO - IMPORTACIÓN SIMPLIFICADA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('53','DECLARACIÓN DE MENSAJERÍA O COURIER','',.T.)
*!*	INSERT INTO snttabla10 VALUES('54','LIQUIDACIÓN DE COBRANZA','',.T.)
*!*	INSERT INTO snttabla10 VALUES('87','NOTA DE CRÉDITO ESPECIAL','',.T.)
*!*	INSERT INTO snttabla10 VALUES('88','NOTA DE DÉBITO ESPECIAL','',.T.)
*!*	INSERT INTO snttabla10 VALUES('91','COMPROBANTE DE NO DOMICILIADO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('96','EXCESO DE CRÉDITO FISCAL POR RETIRO DE BIENES','',.T.)
*!*	INSERT INTO snttabla10 VALUES('97','NOTA DE CRÉDITO - NO DOMICILIADO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('98','NOTA DE DÉBITO - NO DOMICILIADO','',.T.)
*!*	INSERT INTO snttabla10 VALUES('99','OTROS -CONSOLIDADO DE BOLETAS DE VENTA','',.T.)  

