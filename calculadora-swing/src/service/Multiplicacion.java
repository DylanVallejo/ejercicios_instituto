package service;

public class Multiplicacion implements Operacion {
    @Override
    public double calcular(double a, double b) {
        return a * b;
    }
}