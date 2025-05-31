package utils;

public enum Envios {
    LOCAL(1, 0),
    NACIONAL(2, 0.20),
    INTERNACIONAL(3, 0.50);

    private final int tipoEnvio;
    private final double incremento;

    Envios(int tipoEnvio, double incremento) {
        this.tipoEnvio = tipoEnvio;
        this.incremento = incremento;
    }

    public int getTipoEnvio() {
        return tipoEnvio;
    }

    public double getIncremento() {
        return incremento;
    }
}
