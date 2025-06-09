import java.util.InputMismatchException;
import java.util.Scanner;

public class ContadorNumeros {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int cantidad = solicitarCantidad(scanner);

        int positivos = 0;
        int negativos = 0;
        int ceros = 0;

        for (int i = 1; i <= cantidad; i++) {
            double numero = solicitarNumero(scanner, i);

            if (numero > 0) {
                positivos++;
            } else if (numero < 0) {
                negativos++;
            } else {
                ceros++;
            }
        }

        mostrarResultados(positivos, negativos, ceros);
        scanner.close();
    }

    private static int solicitarCantidad(Scanner scanner) {
        int cantidad = 0;
        while (true) {
            try {
                System.out.print("Ingrese la cantidad de números a ingresar: ");
                cantidad = scanner.nextInt();
                if (cantidad <= 0) {
                    System.out.println("Debe ingresar un número entero positivo.");
                    continue;
                }
                break;
            } catch (InputMismatchException e) {
                System.out.println("Entrada inválida. Intente nuevamente.");
                scanner.next();
            }
        }
        return cantidad;
    }

    private static double solicitarNumero(Scanner scanner, int indice) {
        double numero = 0;
        while (true) {
            try {
                System.out.print("Ingrese el número " + indice + ": ");
                numero = scanner.nextDouble();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Valor no válido. Ingrese un número.");
                scanner.next();
            }
        }
        return numero;
    }

    private static void mostrarResultados(int positivos, int negativos, int ceros) {
        System.out.println("\n--- Detalle del análisis ---");
        System.out.printf("Cantidad de números mayores a 0: %d%n", positivos);
        System.out.printf("Cantidad de números menores a 0: %d%n", negativos);
        System.out.printf("Cantidad de números iguales a 0: %d%n", ceros);
    }
}
