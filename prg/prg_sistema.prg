Set sysmenu to
_screen.controlbox = .f.
_screen.caption = "SISTEMA DE CREACION Y EDICION DE TABLAS EN VISUAL FOX"
*!*	_screen.width = 413
*!*	_screen.MaxWidth = 413
*!*	_screen.height = 230
*!*	_screen.MaxHeight = 230
_screen.autocenter = .t.
_screen.borderstyle = 0
_screen.MaxButton = .f.

SET DATE BRITISH
*****
*set help on
*SET HELP TO SYS(5)+CURDIR()+"HELP/CONTAB"
****
SET STATUS BAR OFF
SET MULTILOCK ON
SET CLOCK STATUS
SET FULLPATH OFF
SET TALK OFF
SET ECHO OFF
SET BELL OFF
SET FIXED OFF
SET DECIMALS TO 2
SET CONFIRM OFF
SET EXACT OFF
SET NOTIFY OFF 
SET SYSMENU Off
SET VIEW  Off
SET SAFETY OFF
SET EXCLUSIVE OFF
SET CENTURY ON
SET STATUS OFF
SET DELETED  ON
SET CENTURY TO 19 ROLLOVER 50
SET COMPATIBLE OFF
CLOSE ALL
CLEAR ALL
CLEAR
CLEAR MEMORY

* Declaración de variables
public pdcan, pdpre, pdtot,pdcani, pdprei, pdtoti,pigv,ppiepag,pclDepurar
public pmembrete,plogo,pcEmpcod,pnlinimp
public pcUsuario,partistruc,pcrutadatos,pcontstruc
public pctavarios,pnLenCteVar,pnumeractacte,pnlencte,pestadomenu
public pcEmpConMesa,pcEmpConAnoc && Meses de Conatabilidad
public pcEmpFacMesa,pcEmpFacAnoc && Meses de Facturación
public pcEmpGefMesa,pcEmpGefAnoc && Meses de Gestión Financiera
public pcEmpCotMesa,pcEmpCotAnoc && Meses de otizaciones
public pcEmpInvMesa,pcEmpInvAnoc && Meses de Inventario
public pcEmpComMesa,pcEmpComAnoc && Meses de Compras
public pcSistema, psis, psufijo,pcCodEmpresaEnlace
*---PERIODO CERRADO ---*
public	pcPerContC,pcPerGefiC,pcPerFactC,pcPerInveC,pcPerCompC,pcPerCotiC 
*---PERIODO INSTALADO ---*
public 	pcPerContI,pcPerGefiI,pcPerFactI,pcPerInveI,pcPerCompI,pcPerCotiI
public pcEmpresa, pconsulta
public pcLongCodigo
public plotes

**** variables de enlaces x ruta a otras empresas
public pcRutaEnlaceAsicinv
Public gsAplicacion,gsVersion


pcRutaEnlaceAsicinv=""
plotes = ""
pcLongCodigo=0


psis = ""
pestadomenu = 1
pnlinimp	  =	10
pcsistema="asifact"
psufijo  ="13"  
*pdcan = 2
*pdpre = 4
*pdtot = 2
gsVersion="1.0"
gsAplicacion="ASIFACT"
pclDepurar=.F.

cdir=sys(5)+curdir()
cruta=cdir+","+cdir+"frm\,"+cdir+"prg\"
set path to &cruta

on error do errores with error(), message(),;
	message(1), program(), lineno()

**set procedure to libreria
do form "F_CREACION_EDICION_TABLAS.scx"
on error 
READ EVENTS
* PROCEDIMIENTO PARA EL TRATAMIENTO DE ERRORES

procedure errores
parameter merror, mess, mess1, mprog, mlineno
nopc=messagebox("ERROR FATAL! "+chr(13)+chr(13)+;
	            'CODIGO  : '+ltrim(str(merror))+chr(13)+;
	            'MENSAJE : '+mess +chr(13)+;
	            'LINEA   : '+mess1+chr(13)+;
	            'NUMERO  : '+ltrim(str(mlineno))+chr(13)+;
	            'PROGRAMA: '+mprog,2+48)
do case
	case nopc=3 && Anular
		cancel
	case nopc=4 && Reintentar
		retry
	case nopc=5 &&Ignorar
		return.t.
endcase
return