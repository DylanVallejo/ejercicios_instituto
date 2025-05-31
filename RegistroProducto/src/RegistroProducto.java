import java.util.Scanner;

public class RegistroProducto {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String nombre;
        int codigo;
        double precio;
        boolean enStock;
        short cantidadStock;
        float calificacion;
        char categoria;

        System.out.print("Nombre del producto: ");
        nombre = scanner.nextLine();

        while (true) {
            System.out.print("Código del producto: ");
            try {
                codigo = Integer.parseInt(scanner.nextLine());
                break;
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida. Ingresa un número entero.");
            }
        }

        while (true) {
            System.out.print("Precio unitario: ");
            try {
                precio = Double.parseDouble(scanner.nextLine());
                break;
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida. Ingresa un número decimal.");
            }
        }

        while (true) {
            System.out.print("¿Está disponible en stock? (true/false): ");
            String input = scanner.nextLine().toLowerCase();
            if (input.equals("true") || input.equals("false")) {
                enStock = Boolean.parseBoolean(input);
                break;
            } else {
                System.out.println("Entrada inválida. Ingresa 'true' o 'false'.");
            }
        }


        while (true) {
            System.out.print("Cantidad en stock: ");
            try {
                cantidadStock = Short.parseShort(scanner.nextLine());
                break;
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida. Ingresa un número válido para short.");
            }
        }

        while (true) {
            System.out.print("Calificación promedio del producto: ");
            try {
                calificacion = Float.parseFloat(scanner.nextLine());
                break;
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida. Ingresa un número decimal válido.");
            }
        }

        while (true) {
            System.out.print("Categoría del producto ( A = alimento, E = electronica H =  Herramientas): ");
            String input = scanner.nextLine();
            if (input.length() == 1 && Character.isLetter(input.charAt(0))) {
                categoria = Character.toUpperCase(input.charAt(0));
                break;
            } else {
                System.out.println("Entrada inválida. Ingresa solo una letra.");
            }
        }

        System.out.println("\n--- RESUMEN DEL PRODUCTO ---");
        System.out.println("Nombre: " + nombre);
        System.out.println("Código: " + codigo);
        System.out.printf("Precio: $%.2f\n", precio);
        System.out.println("¿Disponible?: " + (enStock ? "Sí" : "No"));
        System.out.println("Cantidad en stock: " + cantidadStock);
        System.out.printf("Calificación promedio: %.1f\n", calificacion);
        System.out.println("Categoría: " + categoria);
    }
}