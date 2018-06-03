*!*	Use Mibase &&Abro la Base
*!*	Afields(aTest) &&Lleno un arreglo con los campos de la BD
*!*	lCrea=.T. &&Variable para saber si creo el campo o no
*!*	For I=1 to Alen(aTEst,1) &&Ciclo para verificar el nombre del campo
*!*	If Upper(aTest[1,1])=="MICAMPO" &&Valido el nombre del campo
*!*	lCrea=.F. &&No crea el campo
*!*	Exit &&Sale del For
*!*	Endif
*!*	Endfor
*!*	if lCrea
*!*	Alter Table MyBase Column Add MiCampo(L) &&Agrego el Campo
*!*	endif 

*!*	http://msdn.microsoft.com/es-es/library/ms190273.aspx
*!*	http://msdn.microsoft.com/es-es/library/cc466447%28v=vs.71%29.aspx
*!*	http://msdn.microsoft.com/es-es/library/cc466402%28v=vs.71%29.aspx
*!*	http://msdn.microsoft.com/es-es/library/ms190273.aspx

*!*	*-- Saber si existe la vista "MiVista"
*!*	IF INDBC("MiVista", "VIEW")
*!*	  MESSAGEBOX("Si existe la vista")
*!*	ELSE
*!*	  MESSAGEBOX("No existe la vista")
*!*	ENDIF
