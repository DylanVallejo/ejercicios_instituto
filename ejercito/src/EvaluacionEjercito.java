import java.util.Scanner;

public class EvaluacionEjercito {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.println("=== EVALUACIÓN DE INGRESO AL EJÉRCITO ===\n");

        char genero = pedirGenero(entrada);
        double estatura = pedirEstatura(entrada);
        int edad = pedirEdad(entrada);
        boolean soltero = verificarSolteria(entrada);

        boolean cumple = false;

        if (soltero) {
            if (genero == 'M' && estatura > 1.60 && edad >= 20 && edad <= 25) {
                cumple = true;
            } else if (genero == 'H' && estatura > 1.65 && edad >= 18 && edad <= 24) {
                cumple = true;
            }
        }

        System.out.println();
        if (cumple) {
            System.out.println("El aspirante cumple con los requisitos. Puede ingresar al ejército.");
        } else if (soltero) {
            System.out.println("El aspirante no cumple con los criterios de edad o estatura.");
        } else {
            System.out.println("El aspirante no es soltero. No cumple con los requisitos.");
        }
    }

    private static char pedirGenero(Scanner sc) {
        while (true) {
            System.out.print("Género del aspirante (M para mujer, H para hombre): ");
            String input = sc.next().trim().toUpperCase();
            if (input.equals("M") || input.equals("H")) {
                return input.charAt(0);
            } else {
                System.out.println("Entrada no válida. Intente nuevamente.");
            }
        }
    }

    private static double pedirEstatura(Scanner sc) {
        while (true) {
            System.out.print("Estatura (en metros, ej. 1.70): ");
            if (sc.hasNextDouble()) {
                double valor = sc.nextDouble();
                if (valor > 0 && valor < 3) {
                    return valor;
                } else {
                    System.out.println("Ingrese una estatura razonable.");
                }
            } else {
                System.out.println("Formato incorrecto. Intente de nuevo.");
                sc.next();
            }
        }
    }

    private static int pedirEdad(Scanner sc) {
        while (true) {
            System.out.print("Edad del aspirante: ");
            if (sc.hasNextInt()) {
                int edad = sc.nextInt();
                if (edad > 0 && edad < 100) {
                    return edad;
                } else {
                    System.out.println("Edad no válida.");
                }
            } else {
                System.out.println("Ingrese un número entero.");
                sc.next();
            }
        }
    }

    private static boolean verificarSolteria(Scanner sc) {
        while (true) {
            System.out.print("¿Es soltero? (S/N): ");
            String entrada = sc.next().trim().toUpperCase();
            if (entrada.equals("S")) return true;
            if (entrada.equals("N")) return false;
            System.out.println("Respuesta no válida. Use 'S' o 'N'.");
        }
    }
}
