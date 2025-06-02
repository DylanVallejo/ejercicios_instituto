import java.util.Scanner;

public class Biblioteca {

    enum TipoUsuario {
        ESTUDIANTE, PROFESOR, ADMINISTRATIVO;

        public static TipoUsuario desdeNumero(int numero) {
            return switch (numero) {
                case 1 -> ESTUDIANTE;
                case 2 -> PROFESOR;
                case 3 -> ADMINISTRATIVO;
                default -> null;
            };
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            TipoUsuario tipoUsuario = solicitarTipoUsuario(scanner);
            int dia = solicitarDia(scanner);
            String accion = solicitarAccion(scanner);

            procesarSolicitud(tipoUsuario, dia, accion);

            System.out.print("\n¿Desea realizar otra operación? (s/n): ");
            String continuar = scanner.nextLine().trim().toLowerCase();
            if (!continuar.equals("s")) {
                System.out.println("Gracias por usar el sistema de biblioteca.");
                break;
            }
            System.out.println();
        }

        scanner.close();
    }

    private static TipoUsuario solicitarTipoUsuario(Scanner scanner) {
        while (true) {
            System.out.print("""
                Seleccione el tipo de usuario:
                1. Estudiante
                2. Profesor
                3. Administrativo
                Ingrese el número correspondiente (1-3):""");

            if (scanner.hasNextInt()) {
                int opcion = scanner.nextInt();
                scanner.nextLine();
                TipoUsuario tipo = TipoUsuario.desdeNumero(opcion);
                if (tipo != null) return tipo;
            } else {
                scanner.next();
            }

            System.out.println("Opción inválida. Intente nuevamente.\n");
        }
    }

    private static int solicitarDia(Scanner scanner) {
        while (true) {
            System.out.print("Ingrese el día de la semana (1 = L, 2 = M, 3 = Mi, 4 = J, 5 = V, 6 = S, 7 = D): ");
            if (scanner.hasNextInt()) {
                int dia = scanner.nextInt();
                scanner.nextLine();
                if (dia >= 1 && dia <= 7) return dia;
            } else {
                scanner.next();
            }
            System.out.println("Día inválido. Intente nuevamente.");
        }
    }

    private static String solicitarAccion(Scanner scanner) {
        while (true) {
            System.out.print("Ingrese la acción a realizar (Prestamo o Renovacion): ");
            String accion = scanner.nextLine().trim().toLowerCase();
            if (accion.equals("prestamo") || accion.equals("renovacion")) return accion;
            System.out.println("Acción inválida. Intente con 'Prestamo' o 'Renovacion'.");
        }
    }

    private static String mostrarUsuario(String usuario) {
        return "Tipo de usuario: " + usuario;
    }

    private static void procesarSolicitud(TipoUsuario tipoUsuario, int dia, String accion) {
        boolean esPrestamo = accion.equals("prestamo");
        boolean esFinDeSemana = dia == 6 || dia == 7;

        switch (tipoUsuario) {
            case ESTUDIANTE -> {
                System.out.println(mostrarUsuario(tipoUsuario.name()));
                if (esPrestamo) {
                    if (dia == 1 || dia == 3 || dia == 5) {
                        System.out.println("Préstamo máximo de 3 libros.");
                    } else {
                        System.out.println("Préstamo no permitido para estudiantes en este día.");
                    }
                } else {
                    if (esFinDeSemana) {
                        System.out.println("Renovación no permitida los fines de semana para estudiantes.");
                    } else {
                        System.out.println("Renovación permitida.");
                    }
                }
            }

            case PROFESOR -> {
                System.out.println(mostrarUsuario(tipoUsuario.name()));
                if (esPrestamo) {
                    System.out.println("Préstamo permitido. Máximo 5 libros.");
                } else {
                    System.out.println("Renovación permitida. Recuerde que debe devolver los libros en un plazo máximo de 30 días.");
                }
            }

            case ADMINISTRATIVO -> {
                System.out.println(mostrarUsuario(tipoUsuario.name()));
                if (esPrestamo) {
                    if (dia == 2 || dia == 4) {
                        System.out.println("Préstamo permitido. Máximo 2 libros.");
                    } else {
                        System.out.println("Préstamo no permitido para administrativos en este día.");
                    }
                } else {
                    System.out.println("Renovación no permitida para administrativos.");
                }
            }
        }
    }
}
