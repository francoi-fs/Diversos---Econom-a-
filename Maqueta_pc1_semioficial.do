/*=====================================================================================================
* Título:			Trabajo - Economía Internacional
* Profesora:		Silvia Pérez
* Grupo:			8
* Alumnos:			Franco
					13
                    tu partner 
					Kujo Jolyne
					Walter White
*======================================================================================================
*******************************************************************************
	Note: Este Do fue creado para generar gráficos termporales a partir de bla
		  bla bla bla
*******************************************************************************

* Previamente instalar: " net install cleanplots, from("https://tdmize.github.io/data/cleanplots") "

* Luego configurar: "set scheme cleanplots, perm ""

********************************************************************************
*** PART 1: Preparando el espacio de trabajo
*******************************************************************************/

*** 1.1 Definir directorio
	cd "C:\Users\JAIR\Desktop\CICLO 2021-2(ACTUAL)\Economía Internacional"
	
	cd "C:\Users\Franco Fernandez\Desktop\UNALM\Ciclo 8\Economía Internacional\Práctica Grupal 1"

*** 1.2 Limpirando ram e importando data
	clear all
	import excel "data_internacional.xlsx" , sheet("Hoja1") cellrange("A1:M253") firstrow

********************************************************************************
*** PART 2: Rápido tratamiento de datos
********************************************************************************

*** 2.1 Encodificando varaibles
	encode pais, gen(pais_id)
	drop pais 
	rename pais_id pais
	order pais, after(year)

*** 2.2 Variables de miles a millones y agregando etiquetas
	local vari `" "cc"  "bc"  "bs"  "rf"  "tc"  "cf"  "id"  "ic"  "df"  "ar"  "oi" "'
	local name `" "Balanza en Cuenta Corriente" "Balanza Comercial" "Balanza de Servicios" "Renta de Factores" "Transferencias Corrientes" "Cuenta Financiera" "Inversión Directa" "Inversión en Cartera" "Derivados Financieros" "Activos de Reserva" "Otras Inversiones" "'

	forval n=1/11{
			local a: word `n' of `vari'
			local b: word `n' of `name'

			gen `a'1=`a'/1000
			drop `a'
			rename `a'1 `a'

			label variable `a' "`b'"
		}

	label variable year "Año"
	label variable pais "País"

*** 2.3 Definir la variable temporal
	xtset pais year, yearly

********************************************************************************
*** PART 3: Gráfico temporal
********************************************************************************

*** 3.1 Raalizar gráfico lineal - Principal

  **Balanza en Cuenta Corriente
  
  *** Juntos
 	graph twoway 				(connected cc year if pais==1, lc(khaki) mc(brown)) 							/// 
								(connected cc year if pais==2, lc(maroon) mc(cranberry)) 						///
								(connected cc year if pais==3, lc(forest_green) mc(dkgreen)) 					///
								(connected cc year if pais==4, lc(dkorange) mc(brown)) 							///
								(connected cc year if pais==5, lc(teal) mc(edkblue)) 							/// 
								(connected cc year if pais==6, lc(cranberry) mc(red)) 							///
								(connected cc year if pais==7, lc(lavender) mc(gs8)) 							/// 
								(connected cc year if pais==8, lc(navy) mc(emerald)) 							///
								(connected cc year if pais==9, lc(sienna) mc(olive)) 							///
								(connected cc year if pais==10, lc(emidblue) mc(edkblue)), 						/// 
								ysize(4) xsize(8) ytitle(BCC) xtick(2000(1)2020)								///
								xlabel(2000(2)2020) title("Balanza en Cuenta Corriente, 2000-2020") 			/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "Canadá") label(2 "Chile") label(3 "China")		 				///
								label(4 "Colombia") label(5 "Corea del Sur") label(6 "EE. UU.")					///
								label(7 "Japón") label(8 "México") label(9 "Panamá") label(10 "Perú")			///
								position(4) bplacement(seast))       											
  
  
  *** Grupo 1 - EEUU 
	graph twoway 				(connected cc year if pais==6, lc(none) mc(none))	 							/// 
								(connected cc year if pais==6, lc(cranberry) mc(red)),	 						///
								ysize(4) xsize(8) ytitle(BCC) xtick(2000(1)2020)								///
								xlabel(2000(2)2020) title("Balanza en Cuenta Corriente, 2000-2020") 			/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "") label(2 "EE.UU.")position(4) bplacement(seast)) 		     
  
  *** Grupo 2 - Asiáticos  
  
	graph twoway 				(connected cc year if pais==3, lc(forest_green) mc(dkgreen)) 					///
								(connected cc year if pais==5, lc(teal) mc(edkblue)) 							/// 
								(connected cc year if pais==7, lc(lavender) mc(gs8)), 							/// 
								ysize(4) xsize(8) ytitle(BCC) xtick(2000(1)2020)								///
								xlabel(2000(2)2020) title("Balanza en Cuenta Corriente, 2000-2020") 			/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "China") label(2 "Corea del Sur") label(3 "Japón") 				///
								position(4) bplacement(seast))       											///
								yline(0)
								
  
  **** Grupo 3 - México y Canadá 

	graph twoway 				(connected cc year if pais==8, lc(navy) mc(emerald)) 							///
								(connected cc year if pais==1, lc(khaki) mc(brown)), 							/// 
								ysize(4) xsize(8) ytitle(BCC) xtick(2000(1)2020)								///
								xlabel(2000(2)2020) title("Balanza en Cuenta Corriente, 2000-2020") 			/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "México") label(2 "Canadá") position(4) bplacement(seast))       ///
								yline(0)
								
	**** Grupo 4 - Pequeños							
	graph twoway 				(connected cc year if pais==2, lc(maroon) mc(cranberry)) 						///
								(connected cc year if pais==4, lc(dkorange) mc(brown)) 							/// 
								(connected cc year if pais==9, lc(sienna) mc(olive)) 							///
								(connected cc year if pais==10, lc(emidblue) mc(edkblue)), 						/// 
								ysize(4) xsize(8) ytitle(BCC) xtick(2000(1)2020)								///
								xlabel(2000(2)2020) title("Balanza en Cuenta Corriente, 2000-2020") 			/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(lab(1 "Chile") lab(2 "Colombia") lab(3 "Panamá") lab(4 "Perú") 			///
								position(4) bplacement(seast))       											///
								yline(0)

**B Cuenta Financiera
  
  *** Juntos
 	graph twoway 				(connected cf year if pais==1, lc(khaki) mc(brown)) 							/// 
								(connected cf year if pais==2, lc(maroon) mc(cranberry)) 						///
								(connected cf year if pais==3, lc(forest_green) mc(dkgreen)) 					///
								(connected cf year if pais==4, lc(dkorange) mc(brown)) 							///
								(connected cf year if pais==5, lc(teal) mc(edkblue)) 							/// 
								(connected cf year if pais==6, lc(cranberry) mc(red)) 							///
								(connected cf year if pais==7, lc(lavender) mc(gs8)) 							/// 
								(connected cf year if pais==8, lc(navy) mc(emerald)) 							///
								(connected cf year if pais==9, lc(sienna) mc(olive)) 							///
								(connected cf year if pais==10, lc(emidblue) mc(edkblue)), 						/// 
								ysize(4) xsize(8) ytitle(CF) xtick(2000(1)2020)									///
								xlabel(2000(2)2020) title("Cuenta Financiera, 2000-2020")			 			/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "Canadá") label(2 "Chile") label(3 "China")		 				///
								label(4 "Colombia") label(5 "Corea del Sur") label(6 "EE. UU.")					///
								label(7 "Japón") label(8 "México") label(9 "Panamá") label(10 "Perú")			///
								position(4) bplacement(seast))       											
  
  
  *** Grupo 1 - EEUU 
	graph twoway 				(connected cf year if pais==6, lc(none) mc(none))	 							/// 
								(connected cf year if pais==6, lc(cranberry) mc(red)),	 						///
								ysize(4) xsize(8) ytitle(CF) xtick(2000(1)2020)									///
								xlabel(2000(2)2020) title("Cuenta Financiera, 2000-2020") 						/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "") label(2 "EE.UU.")position(4) bplacement(seast)) 		     
  
  *** Grupo 2 - Asiáticos
	graph twoway 				(connected cf year if pais==3, lc(forest_green) mc(dkgreen)) 					///
								(connected cf year if pais==5, lc(teal) mc(edkblue)) 							/// 
								(connected cf year if pais==7, lc(lavender) mc(gs8)), 							/// 
								ysize(4) xsize(8) ytitle(CF) xtick(2000(1)2020)									///
								xlabel(2000(2)2020) title("Cuenta Financiera, 2000-2020") 						/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "China") label(2 "Corea del Sur") label(3 "Japón") 				///
								position(4) bplacement(seast))       											///
								yline(0)
								
  
  **** Grupo 3 - México y Canadá 

	graph twoway 				(connected cf year if pais==8, lc(navy) mc(emerald)) 							///
								(connected cf year if pais==1, lc(khaki) mc(brown)), 							/// 
								ysize(4) xsize(8) ytitle(CF) xtick(2000(1)2020)									///
								xlabel(2000(2)2020) title("Cuenta Financiera, 2000-2020") 						/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "México") label(2 "Canadá") position(4) bplacement(seast))       ///
								yline(0)
								
	**** Grupo 4 - Pequeños							
	graph twoway 				(connected cf year if pais==2, lc(maroon) mc(cranberry)) 						///
								(connected cf year if pais==4, lc(dkorange) mc(brown)) 							/// 
								(connected cf year if pais==9, lc(sienna) mc(olive)) 							///
								(connected cf year if pais==10, lc(emidblue) mc(edkblue)), 						/// 
								ysize(4) xsize(8) ytitle(CF) xtick(2000(1)2020)									///
								xlabel(2000(2)2020) title("Cuenta Financiera, 2000-2020") 						/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(lab(1 "Chile") lab(2 "Colombia") lab(3 "Panamá") lab(4 "Perú") 			///
								position(4) bplacement(seast))       											///
								yline(0)


*** 3.1 Raalizar gráfico lineal - Anexos


  **BCC por País - Componentes								
	
	* Grupo 1. EE.UU.
	graph twoway 				(connected cc year if pais==6, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==6, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==6, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==6, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==6, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente")		/// 
								subtitle("Estados Unidos (2000-2020)")  ///
								t2title("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)
								
	* Grupo 2. China 
	graph twoway 				(connected cc year if pais==3, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==3, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==3, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==3, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==3, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente - China, 2000-2020")		/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)							
								
								
	* Grupo 2. Corea del Sur 
	graph twoway 				(connected cc year if pais==5, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==5, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==5, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==5, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==5, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020) xlabel(2000(2)2020) ///
								ti("Balanza en Cuenta Corriente - Corea del Sur, 2000-2020")					/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)									
								
	* Grupo 2. Japón 
	graph twoway 				(connected cc year if pais==7, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==7, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==7, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==7, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==7, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente - Japón, 2000-2020")		/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)
								
	* Grupo 3. Corea - Japón 
	graph twoway 				(connected cc year if pais==12, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==12, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==12, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==12, lc(dkorange) mc(brown)) 						///
								(connected tc year if pais==12, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente")		/// 
								subtitle("Corea del Sur - Japón (2000-2020) ")									///
								t2title("Miles de Millones de Dólares") ///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)	
	
	
								
	* Grupo 3. Canadá  
	graph twoway 				(connected cc year if pais==1, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==1, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==1, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==1, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==1, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente - Canadá, 2000-2020")		/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)									
								
	* Grupo 3. México 
	graph twoway 				(connected cc year if pais==8, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==8, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==8, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==8, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==8, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente - México, 2000-2020")		/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)									

	* Grupo 4. Chile 
	graph twoway 				(connected cc year if pais==2, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==2, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==2, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==2, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==2, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente - Chile, 2000-2020")		/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)									
								
	* Grupo 4. Colombia 
	graph twoway 				(connected cc year if pais==4, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==4, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==4, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==4, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==4, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente - Colombia, 2000-2020")		/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)									
								
	* Grupo 4. Panamá 
	graph twoway 				(connected cc year if pais==9, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==9, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==9, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==9, lc(dkorange) mc(brown)) 							///
								(connected tc year if pais==9, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente - Panamá, 2000-2020")		/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)								
							
	* Grupo 4. Perú 
	graph twoway 				(connected cc year if pais==10, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==10, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==10, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==10, lc(dkorange) mc(brown)) 						///
								(connected tc year if pais==10, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente - Perú, 2000-2020")			/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)								
	
	* Grupo conjunto: Chile - Colombia - México - Perú
	graph twoway 				(connected cc year if pais==11, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected bc year if pais==11, lc(maroon) mc(cranberry)) 						///
								(connected bs year if pais==11, lc(forest_green) mc(dkgreen)) 					///
								(connected rf year if pais==11, lc(dkorange) mc(brown)) 						///
								(connected tc year if pais==11, lc(teal) mc(edkblue)), 							/// 
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Balanza en Cuenta Corriente")							/// 
								subtitle("Chile - Colombia - México - Perú (2000-2020)") 						///
								t2title("Miles de Millones de Dólares")											///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "BCC") label(2 "BC") label(3 "BS")		 						///
								label(4 "RF") label(5 "TC") 													///
								position(4) bplacement(seast))       											///
								yline(0)		
	
	
	
	
	
***********************************************************************************************************		
							
  **CF por País - Componentes								
	
	* Grupo 1. EE.UU.
	graph twoway 				(connected cf year if pais==6, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==6, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==6, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==6, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==6, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==6, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera")					/// 
								subtitle("Estados Unidos (2000-2020)")  ///
								t2title("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)
								
	* Grupo 2. China 
	graph twoway 				(connected cf year if pais==3, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==3, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==3, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==3, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==3, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==3, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera - China, 2000-2020")					/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)							
								
								
	* Grupo 2. Corea del Sur 
	graph twoway 				(connected cf year if pais==5, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==5, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==5, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==5, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==5, lc(teal) mc(edkblue)) 							/// 
								(connected oi year if pais==5, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020) xlabel(2000(2)2020) 		///
								ti("Cuenta Financiera - Corea del Sur, 2000-2020")								/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)									
								
	* Grupo 2. Japón 
	graph twoway 				(connected cf year if pais==7, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==7, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==7, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==7, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==7, lc(teal) mc(edkblue)) 							/// 
								(connected oi year if pais==7, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera - Japón, 2000-2020")					/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)									
	
	* Corea - Japón 
	graph twoway 				(connected cf year if pais==12, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==12, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==12, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==12, lc(dkorange) mc(brown)) 						///
								(connected ar year if pais==12, lc(teal) mc(edkblue)) 							/// 
								(connected oi year if pais==12, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera")					/// 
								subtitle("Corea del Sur - Japón (2000-2020)")    /// 
								t2title("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)			
	
	
	
	
	* Grupo 3. Canadá  
	graph twoway 				(connected cf year if pais==1, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==1, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==1, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==1, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==1, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==1, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera - Canadá, 2000-2020")					/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)									
								
	* Grupo 3. México 
	graph twoway 				(connected cf year if pais==8, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==8, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==8, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==8, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==8, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==8, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera - México, 2000-2020")					/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)									

	* Grupo 4. Chile 
	graph twoway 				(connected cf year if pais==2, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==2, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==2, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==2, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==2, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==2, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera - Chile, 2000-2020")					/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)									
								
	* Grupo 4. Colombia 
	graph twoway 				(connected cf year if pais==4, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==4, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==4, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==4, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==4, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==4, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera - Colombia, 2000-2020")				/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)									
								
	* Grupo 4. Panamá 
	graph twoway 				(connected cf year if pais==9, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==9, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==9, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==9, lc(dkorange) mc(brown)) 							///
								(connected ar year if pais==9, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==9, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera - Panamá, 2000-2020")					/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)								
							
	* Grupo 4. Perú 
	graph twoway 				(connected cf year if pais==10, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==10, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==10, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==10, lc(dkorange) mc(brown)) 						///
								(connected ar year if pais==10, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==10, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera - Perú, 2000-2020")					/// 
								subtitle("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)							
							
							
	* Chile - Colombia - México - Perú
	graph twoway 				(connected cf year if pais==11, lc(navy)  mc(emerald) lw(thick)mlw(thick))		///
								(connected id year if pais==11, lc(maroon) mc(cranberry)) 						///
								(connected ic year if pais==11, lc(forest_green) mc(dkgreen)) 					///
								(connected df year if pais==11, lc(dkorange) mc(brown)) 						///
								(connected ar year if pais==11, lc(teal) mc(edkblue)) 							///
								(connected oi year if pais==11, lc(lavender) mc(gs8)), 							///
								ysize(4) xsize(8) ytitle("MM USD") xtick(2000(1)2020)							///
								xlabel(2000(2)2020) ti("Cuenta Financiera")					/// 
								subtitle("Chile - Colombia - México - Perú (2000-2020)") ///
								t2title("Miles de Millones de Dólares")										///
								caption("Fuente: {it:FMI}, 2021", pos(5))										///
								legend(label(1 "CF") label(2 "ID") label(3 "IC")		 						///
								label(4 "DF") label(5 "AR") label(6 "OI")										///
								position(4) bplacement(seast))       											///
								yline(0)
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
