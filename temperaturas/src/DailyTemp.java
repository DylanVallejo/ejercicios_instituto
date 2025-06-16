import java.util.Scanner;

public class DailyTemp {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Ingrese las temperaturas diarias por una semana: ");

        do {
            double promedio = ingresarYCalcularPromedio(scanner);
            mostrarPromedio(promedio);
        } while (deseaRepetir(scanner));

        System.out.println("Programa finalizado. ¡Gracias por utilizar el sistema!");
        scanner.close();
    }

    public static double ingresarYCalcularPromedio(Scanner scanner) {
        double suma = 0;
        int dias = 7;

        for (int i = 1; i <= dias; i++) {
            double temperatura = 0;
            boolean entradaValida = false;

            while (!entradaValida) {
                try {
                    System.out.print("Ingrese la temperatura del día " + i + ": ");
                    temperatura = Double.parseDouble(scanner.nextLine());
                    entradaValida = true;
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida. Por favor ingrese un número decimal válido.");
                }
            }

            suma += temperatura;
        }

        return suma / dias;
    }

    public static void mostrarPromedio(double promedio) {
        System.out.printf("El promedio de las temperaturas es: %.2f°C%n", promedio);
    }

    public static boolean deseaRepetir(Scanner scanner) {
        while (true) {
            System.out.print("¿Desea calcular otro promedio? (S/N): ");
            String respuesta = scanner.nextLine().trim().toUpperCase();
            if (respuesta.equals("S")) {
                return true;
            } else if (respuesta.equals("N")) {
                return false;
            } else {
                System.out.println("Respuesta inválida. Por favor ingrese 'S' para sí o 'N' para no.");
            }
        }
    }


}
