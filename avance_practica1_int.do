************************************
* Trabajo - Economía Internacional *
************************************

*Grupo 8*
*********

* Se establece el directorio:

cd "C:\Users\Franco Fernandez\Desktop\UNALM\Ciclo 8\Economía Internacional\Práctica Grupal 1"

import excel "data_internacional.xlsx" , sheet("Hoja1") firstrow

drop N O P Q

*Recodificar la variable "pais"

encode pais, gen(pais1)
drop pais 
rename pais1 pais
order pais, after(year)

*Transformar variable en miles de millones de dólares americanos
gen cc1=cc/1000
drop cc 
rename cc1 cc

gen bc1=bc/1000
drop bc 
rename bc1 bc

gen bs1=bs/1000
drop bs 
rename bs1 bs

gen rf1=rf/1000
drop rf
rename rf1 rf 

gen tc1=tc/1000
drop tc 
rename tc1 tc 

gen cf1=cf/1000
drop cf 
rename cf1 cf 

gen id1=id/1000
drop id
rename id1 id 

gen ic1=ic/1000
drop ic 
rename ic1 ic 

gen df1=df/1000
drop df 
rename df1 df 

gen ar1=ar/1000
drop ar 
rename ar1 ar 

gen oi1=oi/1000
drop oi 
rename oi1 oi

* Asignar etiquetas

label variable year "Año"
label variable pais "País"
label variable cc "Balanza en Cuenta Corriente"
label variable bc "Balanza Comercial"
label variable bs "Balanza de Servicios"
label variable rf "Renta de Factores"
label variable tc "Transferencias Corrientes"
label variable cf "Cuenta Financiera"
label variable id "Inversión Directa"
label variable ic "Inversión en Cartera"
label variable df "Derivados Financieros"
label variable ar "Activos de Reserva"
label variable oi "Otras Inversiones"


describe

codebook

summarize 

xtset pais year

*Trabajo de Internacional 

* 1. Cuenta Corriente Juntos

** Todos:

xtline cc, overlay ///
plot9(lp(solid)) plot10(lp(solid)) ///
plot1(lc(navy)) plot2(lc(maroon)) plot3(lc(forest_green)) plot4(lc(dkorange)) plot5(lc(teal)) ///
plot6(lc(cranberry)) plot7(lc(lavender )) plot8(lc(khaki)) plot9(lc(sienna)) plot10(lc(emidblue)) /// 
ysize(4) xsize(8) ytitle(BCC) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Balanza en Cuenta Corriente, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))

** Cuatro Grupos

*** EE.UU.

xtline cc if pais==6, overlay /// 
plot1(lc(cranberry) recast(con)) ///
ysize(4) xsize(8) ytitle(BCC) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Balanza en Cuenta Corriente - EE.UU., 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5)) 

*** Asiáticos: China, Japón y Corea   *** Verde oscuro / eq azul oscuro / gris escala 8   
xtline cc if pais==3 | pais==5 | pais==7, overlay ///
plot1(lc(forest_green) recast(con)) plot2(lc(teal) recast(con)) plot3(lc(lavender) recast(con)) ///
ysize(4) xsize(8) ytitle(BCC) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Balanza en Cuenta Corriente, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))

*** México y Canadá   ** esmeralda y marrón

xtline cc if pais==1 | pais==8, overlay ///
plot1(lc(navy) recast(con)) plot2(lc(khaki) recast(con)) ///
ysize(4) xsize(8) ytitle(BCC) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Balanza en Cuenta Corriente, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))

*** Chile, Colombia, Panamá y Perú  *** rojo carmesí / marrón / aceituna / azul oscuro

xtline cc if pais==2 | pais==4 | pais==9 | pais==10, overlay ///
plot1(lc(maroon) recast(con)) plot2(lc(dkorange) recast(con)) /// 
plot3(lc(sienna) recast(con)) plot4(lc(emidblue) recast(con)) ///
ysize(4) xsize(8) ytitle(BCC) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Balanza en Cuenta Corriente, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))


* 2. Cuenta Financiera Juntos

** Juntos: 

xtline cf, overlay ///
plot9(lp(solid)) plot10(lp(solid)) ///
plot1(lc(navy)) plot2(lc(maroon)) plot3(lc(forest_green)) plot4(lc(dkorange)) plot5(lc(teal)) ///
plot6(lc(cranberry)) plot7(lc(lavender )) plot8(lc(khaki)) plot9(lc(sienna)) plot10(lc(emidblue)) /// 
ysize(4) xsize(8) ytitle("CF") xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Cuenta Financiera, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))

** Cuatro Grupos

*** EE.UU.

xtline cf if pais==6, overlay /// 
plot1(lc(cranberry) recast(con)) ///
ysize(4) xsize(8) ytitle(CF) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Cuenta Financiera - EE.UU., 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5)) 

*** Asiáticos: China, Japón y Corea 
xtline cf if pais==3 | pais==5 | pais==7, overlay ///
plot1(lc(forest_green) recast(con)) plot2(lc(teal) recast(con)) plot3(lc(lavender) recast(con)) ///
ysize(4) xsize(8) ytitle(CF) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Cuenta Financiera, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))

*** México y Canadá

xtline cf if pais==1 | pais==8, overlay ///
plot1(lc(navy) recast(con)) plot2(lc(khaki) recast(con)) ///
ysize(4) xsize(8) ytitle(CF) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Cuenta Financiera, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))

*** Chile, Colombia, Panamá y Perú 

xtline cf if pais==2 | pais==4 | pais==9 | pais==10, overlay ///
plot1(lc(maroon) recast(con)) plot2(lc(dkorange) recast(con)) /// 
plot3(lc(sienna) recast(con)) plot4(lc(emidblue) recast(con)) ///
ysize(4) xsize(8) ytitle(CF) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Cuenta Financiera, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))













********************************************************************************************************************************

* 2. Cuenta Corriente por País y Componentes

xtline cc bc bs rf tc if pais== 1,  ///
title("Balanza en Cuenta Corriente de Canadá, 2000-2020") subtitle("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))

xtline cc bc bs rf tc if pais== 2, title("Balanza en Cuenta Corriente de Chile, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cc bc bs rf tc if pais== 3, title("Balanza en Cuenta Corriente de China, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cc bc bs rf tc if pais== 4, title("Balanza en Cuenta Corriente de Colombia, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cc bc bs rf tc if pais== 5, title("Balanza en Cuenta Corriente de Corea del Sur, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cc bc bs rf tc if pais== 6, title("Balanza en Cuenta Corriente de Estados Unidos, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cc bc bs rf tc if pais== 7, title("Balanza en Cuenta Corriente de Japón, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cc bc bs rf tc if pais== 8, title("Balanza en Cuenta Corriente de México, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cc bc bs rf tc if pais== 9, title("Balanza en Cuenta Corriente de Panamá, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cc bc bs rf tc if pais== 10, title("Balanza en Cuenta Corriente de Perú, 2000-2020") subtitle("Miles de Millones de Dólares")

* 3. Cuenta Financiera Juntos

xtline cf, overlay title("Cuenta Financiera, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cf if  pais==6, lcolor(cranberry) title("Cuenta Financiera, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cf if pais==3 | pais==5 | pais==7, overlay title("Cuenta Financiera, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cf if pais==1 | pais==8, overlay title("Cuenta Financiera, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cf if pais==2 | pais==4 | pais==9 | pais==10, overlay title("Cuenta Financiera, 2000-2020") subtitle("Miles de Millones de Dólares")

* 4. Cuenta Financiera Por País y Componentes

xtline cf id ic df ar oi if pais== 1, title("Cuenta Financiera de Canadá, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cf id ic df ar oi if pais== 2, title("Cuenta Financiera de Chile, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cf id ic df ar oi if pais== 3, title("Cuenta Financiera de China, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cf id ic df ar oi if pais== 4, title("Cuenta Financiera de Colombia, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cf id ic df ar oi if pais== 5, title("Cuenta Financiera de Corea del Sur, 2000-2020") subtitle("Miles de Millones de Dólares") 

xtline cf id ic df ar oi if pais== 6, title("Cuenta Financiera de Estados Unidos, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cf id ic df ar oi if pais== 7, title("Cuenta Financiera de Japón, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cf id ic df ar oi if pais== 8, title("Cuenta Financiera de México, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cf id ic df ar oi if pais== 9, title("Cuenta Financiera de Panamá, 2000-2020") subtitle("Miles de Millones de Dólares")

xtline cf id ic df ar oi if pais== 10, title("Cuenta Financiera de Perú, 2000-2020") subtitle("Miles de Millones de Dólares")


xtline cc, overlay plegend(on)

*
 ssc install freduse
*

xtline bc bs rf tc  id ic df ar oi if pais==1

tabulate pais, summarize(bc)


twoway line cc year if pais==6, sort   yvarl("EE.UU.")  lc(cranberry) ///
legend(label(1 "EE.UU."))


ysize(4) xsize(8) ytitle(BCC) xlabel(2000(2)2020) xtick(2000(1)2020) ///
ti("Balanza en Cuenta Corriente, 2000-2020") sub("Miles de Millones de Dólares") ///
caption("Fuente: {it:FMI}, 2021", pos(5))



