package entidades;

public class Pedido {
    private int idUsuario;
    private int idProveedor;
    private String fechaPedido;
    private String detalle;

    public Pedido() {
    }

    public Pedido(int idUsuario, int idProveedor, String fechaPedido, String detalle) {
        this.idUsuario = idUsuario;
        this.idProveedor = idProveedor;
        this.fechaPedido = fechaPedido;
        this.detalle = detalle;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(String fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }
    
    
}