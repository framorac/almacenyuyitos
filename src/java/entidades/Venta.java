package entidades;

public class Venta {
    private int idVenta;
    private int idUsuario;
    private int idCliente;
    private int idTipoVenta;
    private int idProducto;
    private String fechaVenta;
    private String descripcion;
    private int cantidad;
    private int total;

    public Venta() {
    }

    public Venta(int idVenta, int idUsuario, int idCliente, int idTipoVenta, int idProducto, String fechaVenta, String descripcion, int cantidad, int total) {
        this.idVenta = idVenta;
        this.idUsuario = idUsuario;
        this.idCliente = idCliente;
        this.idTipoVenta = idTipoVenta;
        this.idProducto = idProducto;
        this.fechaVenta = fechaVenta;
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.total = total;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdTipoVenta() {
        return idTipoVenta;
    }

    public void setIdTipoVenta(int idTipoVenta) {
        this.idTipoVenta = idTipoVenta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(String fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}