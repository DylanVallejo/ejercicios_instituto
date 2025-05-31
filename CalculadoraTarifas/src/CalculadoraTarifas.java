import utils.Envios;

import java.util.Scanner;

public class CalculadoraTarifas {
    public static void main(String[] args) {

        double pesoPaquete;
        double tarifaInicial = 0.0;
        boolean esPremium = false;

        Scanner sc = new Scanner(System.in);

        // Solicitar peso en kg

        while (true) {
            System.out.print("Ingresar peso de paquete en KG: ");
            try {
                pesoPaquete = sc.nextDouble();
                sc.nextLine();
                if (pesoPaquete > 0) break;
                else System.out.println("Error: El peso debe ser mayor a 0.");
            } catch (Exception e) {
                System.out.println("Error: Entrada inválida para el peso.");
                sc.nextLine(); // Limpiar el buffer
            }
        }

        // asignar tarifa en base a peso
        if (pesoPaquete <= 1.0) {
            tarifaInicial = 5.0;
        } else if ( pesoPaquete >= 1.1 && pesoPaquete <= 5.0) {
            tarifaInicial = 10.0;
        } else if ( pesoPaquete >= 5.1 && pesoPaquete <= 10.0) {
            tarifaInicial = 15.0;
        } else if (pesoPaquete > 10){
            tarifaInicial = 25.0;
        }

        // forma de envio
        Envios tipoEnvio = null;
        while (tipoEnvio == null) {
            System.out.println("Ingrese el tipo de envío: (1: Local, 2: Nacional, 3: Internacional)");
            try {
                int tipoEnvioId = sc.nextInt();
                sc.nextLine();
                for (Envios envio : Envios.values()) {
                    if (envio.getTipoEnvio() == tipoEnvioId) {
                        tipoEnvio = envio;
                        break;
                    }
                }
                if (tipoEnvio == null) {
                    System.out.println("Error: Tipo de envío no válido.");
                }
            } catch (Exception e) {
                System.out.println("Error: Entrada inválida para el tipo de envío.");
                sc.nextLine(); // Limpiar el buffer
            }
        }

        // Aplicar incremento por tipo de envío
        tarifaInicial += tarifaInicial * tipoEnvio.getIncremento();
        System.out.printf("El tipo de envío es %s, se aplicará un incremento del %.0f%%\n",
                tipoEnvio.name(), tipoEnvio.getIncremento() * 100);

        // elegir la membresia
        while (true) {
            System.out.print("¿Es un cliente premium? (S: Sí / N: No): ");
            String premiumInput = sc.nextLine();
            if (premiumInput.equalsIgnoreCase("S")) {
                esPremium = true;
                System.out.println("El cliente es premium, se aplicará el descuento del 15%");
                break;
            } else if (premiumInput.equalsIgnoreCase("N")) {
                System.out.println("El cliente no es premium");
                break;
            } else {
                System.out.println("Error: Opción no válida.");
            }
        }

        if (esPremium) {
            tarifaInicial -= tarifaInicial * 0.15;
        }

        System.out.printf("El costo final del envío es: $%.2f\n" ,tarifaInicial);
        sc.close();


    }
}