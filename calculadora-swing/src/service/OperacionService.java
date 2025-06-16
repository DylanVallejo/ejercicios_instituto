package service;

public class OperacionService {
    public static double operar(Operacion operacion, double a, double b) {
        return operacion.calcular(a, b);
    }
}