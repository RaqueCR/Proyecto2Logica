Algoritmo Proyecto2
	
	// Raquel Maria Fernandez Fernandez - 208300391
	// Proyecto 2 - Logica para computacion 03071
	
	// NOTA: SE ADJUNTA DOCUMENTO PDF CON CAPTURA DE PANTALLA DEL USO DEL PERFIL INDICADO EN EL CAMPUS VIRTUAL
	
    Definir pasajeros, dias, tipo_camarote, camarote_costo, totalCamarote Como Entero;
    Definir Paquete_bebidas, tipoBebida, diasBebida Como Entero;
    Definir premiumIncluido Como Logico;
    Definir totalBebidas, totalTours, tipoTour, personasTour Como Real;
    Definir costoTransporte, montoBase, impuestos, descuento, totalPagar, montosFijos Como Real;
    Definir continuar, usaTransporte Como Caracter;
    Definir cantidadReservas Como Entero;
    Definir montoTotalReservas Como Real;
    Definir i, isla, t Como Entero;
    
    totalCamarote <- 0;
    totalBebidas <- 0;
    totalTours <- 0;
    costoTransporte <- 0;
    premiumIncluido <- Falso;
    continuar <- "S";
    cantidadReservas <- 0;
    montoTotalReservas <- 0;
	montosFijos <- 84 + 50 + 7 + 84;
	
    Repetir
        Escribir "===================================================";
        Escribir "       Reserva inicial del viaje por crucero       ";
        Escribir "===================================================";
		
        Repetir
            Escribir "Indique la cantidad de pasajeros, máximo 3 pasajeros.";
            Leer pasajeros;
        Hasta Que pasajeros >= 1 Y pasajeros <= 3;
		
        Escribir "===================================================";
        Escribir "                 Cantidad de días                  ";
        Escribir "===================================================";
        Repetir
            Escribir "Indique la cantidad de días del crucero (de 4 a 7):";
            Leer dias;
        Hasta Que dias >= 4 Y dias <= 7;
		
        Escribir "===================================================";
        Escribir "               Tipos de camarote                   ";
        Escribir "===================================================";
        Repetir
            Escribir "1. Suite     ------> $1890";
            Escribir "2. Balcón    ------> $780";
            Escribir "3. Interior  ------> $530";
            Escribir "Seleccione una opción (1, 2 o 3).";
            Leer tipo_camarote;
        Hasta Que tipo_camarote >= 1 Y tipo_camarote <= 3;
		
        Segun tipo_camarote Hacer
            1: camarote_costo <- 1890;
            2: camarote_costo <- 780;
            3: camarote_costo <- 530;
        FinSegun;
		
        totalCamarote <- pasajeros * camarote_costo;
		
        Escribir "===================================================";
        Escribir "                Paquetes de bebidas                ";
        Escribir "===================================================";
		
        Repetir
            Escribir "¿Cuántas personas desean paquete de bebidas? (Máximo ", pasajeros, ")";
            Leer Paquete_bebidas;
        Hasta Que Paquete_bebidas >= 0 Y Paquete_bebidas <= pasajeros;
		
        Para i <- 1 Hasta Paquete_bebidas Hacer
            Escribir "Tipos de bebidas: 1. Básica $45, 2. Especial $55, 3. Premium $65";
            Escribir "Indique el tipo de bebida para la persona No. ", i;
            Repetir
                Leer tipoBebida;
            Hasta Que tipoBebida >= 1 Y tipoBebida <= 3;
			
            Escribir "Indique la cantidad de días con bebidas para la persona No. ", i;
            Repetir
                Leer diasBebida;
            Hasta Que diasBebida >= 1 Y diasBebida <= dias;
			
            Segun tipoBebida Hacer
                1: totalBebidas <- totalBebidas + (45 * diasBebida);
                2: totalBebidas <- totalBebidas + (55 * diasBebida);
                3: 
                    totalBebidas <- totalBebidas + (65 * diasBebida);
                    premiumIncluido <- Verdadero;
            FinSegun;
        FinPara;
		
		Escribir "=======================================================";
		Escribir "El costo total por concepto de bebidas es: ", totalBebidas;
		
        Escribir "=======================================================";
        Escribir "                 *** Islas a visitar ***               ";
        Escribir "=======================================================";
		
        Para isla <- 1 Hasta 2 Hacer
            Escribir "===================================================";
            Escribir "                   Isla No. ", isla;
            Escribir "===================================================";
			
            Para t <- 1 Hasta 2 Hacer
                Si t = 1 Entonces
                    Escribir " * Tour No. 1: Lo mejor de ... ($50 por persona)";
                SiNo
                    Escribir " * Tour No. 2: Playa y snorkel ($80 por persona)";
                FinSi;
				
                Escribir "¿Cuántos miembros desean realizar el tour? (Máximo ", pasajeros, "):";
                Repetir
                    Leer personasTour;
                Hasta Que personasTour >= 0 Y personasTour <= pasajeros;
				
                Si t = 1 Entonces
                    totalTours <- totalTours + (50 * personasTour);
                SiNo
                    totalTours <- totalTours + (80 * personasTour);
                FinSi;
            FinPara;
        FinPara;
		
		Escribir "===================================================";
		Escribir "El costo total por concepto de tours es: ", totalTours;
		
		Escribir "===================================================";
		Escribir "                     Transporte                     ";
		Escribir "===================================================";
		Escribir "¿Para iniciar su crucero necesitará transporte para llegar al muelle? (S/N)";
		Leer usaTransporte;
		
		Si usaTransporte = "S" O usaTransporte = "s" Entonces
			costoTransporte <- 60;
		SiNo
			costoTransporte <- 0;
		FinSi;

        montoBase <- totalCamarote + totalBebidas + totalTours + costoTransporte + montosFijos;
        impuestos <- montoBase * 0.09;
        descuento <- 0;
        Si premiumIncluido Entonces
            descuento <- montoBase * 0.1;
        FinSi;
		
        totalPagar <- montoBase + impuestos - descuento;
        cantidadReservas <- cantidadReservas + 1;
        montoTotalReservas <- montoTotalReservas + totalPagar;
		
        Escribir "===================================================";
        Escribir "                     Reserva                        ";
        Escribir "===================================================";
        Escribir "Cantidad de pasajeros: ", pasajeros;
        Escribir "Cantidad de días: ", dias;
        Escribir "Precio base del camarote: ", camarote_costo;
        Escribir "Precio total del camarote: ", totalCamarote;
        Escribir "Costo total en bebidas: ", totalBebidas;
        Escribir "Costo total de los tours: ", totalTours;
		Escribir "Monto base de la reserva: ", montoBase, " = (", totalCamarote, " + ", totalBebidas, " + ", totalTours, " + ", costoTransporte, " + ", montosFijos, ")";
        Escribir "Monto impuestos: ", impuestos;
        Escribir "Monto descuento: ", descuento;
        Escribir "Total a pagar: $", totalPagar;
		
        Escribir "===================================================";
        Escribir "¿Desea procesar otra reserva? (S/N)";
        Leer continuar;
		
    Hasta Que continuar = "N" O continuar = "n";  
	
    Escribir "===================================================";
    Escribir "                  Reporte Final                    ";
    Escribir "===================================================";
    Escribir "Cantidad total de reservas realizadas: ", cantidadReservas;
    Escribir "Monto total de las reservaciones (con impuestos y descuentos): $", montoTotalReservas;
FinAlgoritmo