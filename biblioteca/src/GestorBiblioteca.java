import java.util.Scanner;

public class GestorBiblioteca {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int tipoUsuario = 0;
        int dia = 0;
        String accion = "";

        // elegir ususario
        while (true) {
            System.out.println("Seleccione el tipo de usuario:");
            System.out.println("1. Estudiante");
            System.out.println("2. Profesor");
            System.out.println("3. Administrativo");
            System.out.print("Ingrese el número correspondiente (1-3): ");

            if (scanner.hasNextInt()) {
                tipoUsuario = scanner.nextInt();
                scanner.nextLine();
                if (tipoUsuario >= 1 && tipoUsuario <= 3) {
                    break;
                } else {
                    System.out.println("Número inválido. Ingrese 1, 2 o 3.");
                }
            } else {
                System.out.println("Entrada no válida. Debe ser un número.");
                scanner.next();
            }
        }

        // elegir dia
        while (true) {
            System.out.print("Ingrese el día de la semana (1=Lunes, ..., 7=Domingo): ");
            if (scanner.hasNextInt()) {
                dia = scanner.nextInt();
                scanner.nextLine();
                if (dia >= 1 && dia <= 7) {
                    break;
                } else {
                    System.out.println("Día fuera de rango. Ingrese un número del 1 al 7.");
                }
            } else {
                System.out.println("Entrada no válida. Debe ser un número.");
                scanner.next();
            }
        }

        // elegir accion
        while (true) {
            System.out.print("Ingrese la acción (Prestamo o Renovacion): ");
            accion = scanner.nextLine().trim().toLowerCase();
            if (accion.equals("prestamo") || accion.equals("renovacion")) {
                break;
            } else {
                System.out.println("Acción inválida. Intente con 'Prestamo' o 'Renovacion'.");
            }
        }

        procesarSolicitud(tipoUsuario, dia, accion);
    }

    public static void procesarSolicitud(int tipoUsuario, int dia, String accion) {
        boolean esPrestamo = accion.equals("prestamo");
        boolean esRenovacion = accion.equals("renovacion");

        switch (tipoUsuario) {
            case 1: // Estudiante
                if (esPrestamo) {
                    if (dia == 1 || dia == 3 || dia == 5) {
                        System.out.println("Préstamo permitido. Máximo 3 libros.");
                    } else {
                        System.out.println("Préstamo no permitido para estudiantes en este día.");
                    }
                } else {
                    if (dia == 6 || dia == 7) {
                        System.out.println("Renovación no permitida los fines de semana para estudiantes.");
                    } else {
                        System.out.println("Renovación permitida.");
                    }
                }
                break;

            case 2: // Profesor
                if (esPrestamo) {
                    System.out.println("Préstamo permitido. Máximo 5 libros.");
                } else {
                    System.out.println("Renovación permitida. Recuerde que debe devolver los libros en un plazo máximo de 30 días.");
                }
                break;

            case 3: // Administrativo
                if (esPrestamo) {
                    if (dia == 2 || dia == 4) {
                        System.out.println("Préstamo permitido. Máximo 2 libros.");
                    } else {
                        System.out.println("Préstamo no permitido para administrativos en este día.");
                    }
                } else {
                    System.out.println("Renovación no permitida para administrativos.");
                }
                break;

            default:
                System.out.println("Tipo de usuario no reconocido.");
        }
    }
}
