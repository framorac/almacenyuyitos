package entidades;

public class Abono {
    private int idPagoFiado;
    private int idCliente;
    private int montoAbono;
    private String fechaAbono;

    public Abono() {
    }

    public Abono(int idPagoFiado, int idCliente, int montoAbono, String fechaAbono) {
        this.idPagoFiado = idPagoFiado;
        this.idCliente = idCliente;
        this.montoAbono = montoAbono;
        this.fechaAbono = fechaAbono;
    }

    public int getIdPagoFiado() {
        return idPagoFiado;
    }

    public void setIdPagoFiado(int idPagoFiado) {
        this.idPagoFiado = idPagoFiado;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getMontoAbono() {
        return montoAbono;
    }

    public void setMontoAbono(int montoAbono) {
        this.montoAbono = montoAbono;
    }

    public String getFechaAbono() {
        return fechaAbono;
    }

    public void setFechaAbono(String fechaAbono) {
        this.fechaAbono = fechaAbono;
    }
}