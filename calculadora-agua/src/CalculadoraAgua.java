import java.util.Scanner;

public class CalculadoraAgua {

    private static final double IVA = 0.15;

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.println("==== FACTURA DE AGUA - EMPRESA PÚBLICA DE QUITO ====\n");

        int estrato = leerEstrato(entrada);
        double consumo = leerConsumo(entrada);

        double fijo = cargoFijo(estrato);
        double valorM3 = tarifaPorMetro(estrato);
        double cargoExtra = valorBasura(estrato);

        double costoAgua = consumo * valorM3;
        double subtotal = fijo + costoAgua + cargoExtra;
        double valorIVA = subtotal * IVA;
        double total = subtotal + valorIVA;

        imprimirFactura(estrato, consumo, fijo, valorM3, costoAgua, cargoExtra, subtotal, valorIVA, total);
    }

    private static int leerEstrato(Scanner sc) {
        int valor;
        while (true) {
            System.out.print("Ingrese el estrato (1 a 6): ");
            if (sc.hasNextInt()) {
                valor = sc.nextInt();
                if (valor >= 1 && valor <= 6) break;
                else System.out.println("Estrato fuera de rango.");
            } else {
                System.out.println("Debe ingresar un número entero.");
                sc.next();
            }
        }
        return valor;
    }

    private static double leerConsumo(Scanner sc) {
        double cantidad;
        while (true) {
            System.out.print("Metros cúbicos consumidos: ");
            if (sc.hasNextDouble()) {
                cantidad = sc.nextDouble();
                if (cantidad >= 0) break;
                else System.out.println("El consumo no puede ser negativo.");
            } else {
                System.out.println("Ingrese un número válido.");
                sc.next();
            }
        }
        return cantidad;
    }

    private static double cargoFijo(int estrato) {
        return switch (estrato) {
            case 1 -> 5;
            case 2 -> 10;
            case 3 -> 12;
            case 4 -> 15;
            case 5 -> 20;
            case 6 -> 25;
            default -> 0;
        };
    }

    private static double tarifaPorMetro(int estrato) {
        return switch (estrato) {
            case 1 -> 1.2;
            case 2 -> 1.3;
            case 3 -> 1.4;
            case 4 -> 1.5;
            case 5 -> 1.6;
            case 6 -> 1.7;
            default -> 0;
        };
    }

    private static double valorBasura(int estrato) {
        return switch (estrato) {
            case 1 -> 3;
            case 2 -> 4;
            case 3 -> 5;
            case 4 -> 6;
            case 5 -> 7;
            case 6 -> 8;
            default -> 0;
        };
    }

    private static void imprimirFactura(int estrato, double consumo, double fijo, double precioM3, double agua, double basura, double sub, double iva, double total) {
        System.out.println("\n----------- Detalle de Factura -----------");
        System.out.printf("Estrato: %d%n", estrato);
        System.out.printf("Consumo: %.2f m³%n", consumo);
        System.out.printf("Cargo fijo: $%.2f%n", fijo);
        System.out.printf("Agua potable (%.2f x $%.2f): $%.2f%n", consumo, precioM3, agua);
        System.out.printf("Recolección basura y alcantarillado: $%.2f%n", basura);
        System.out.printf("Subtotal: $%.2f%n", sub);
        System.out.printf("IVA (15%%): $%.2f%n", iva);
        System.out.printf("Total a pagar: $%.2f%n", total);
        System.out.println("------------------------------------------");
    }
}
