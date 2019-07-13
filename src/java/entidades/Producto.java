
package entidades;

public class Producto {
    private int idProducto;
    private int idProveedor;
    private int idSubFamilia;
    private String descripcion;
    private int precioCompra;
    private int precioVenta;
    private int stock;
    private int stockCritico;
    private String codigoProd;
    private String fechaVencimiento;
    private String marca;

    public Producto() {
    }

    public Producto(int idProducto, int idProveedor, int idSubFamilia, String descripcion, int precioCompra, int precioVenta, int stock, int stockCritico, String codigoProd, String fechaVencimiento, String marca) {
        this.idProducto = idProducto;
        this.idProveedor = idProveedor;
        this.idSubFamilia = idSubFamilia;
        this.descripcion = descripcion;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
        this.stock = stock;
        this.stockCritico = stockCritico;
        this.codigoProd = codigoProd;
        this.fechaVencimiento = fechaVencimiento;
        this.marca = marca;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public int getIdSubFamilia() {
        return idSubFamilia;
    }

    public void setIdSubFamilia(int idSubFamilia) {
        this.idSubFamilia = idSubFamilia;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(int precioCompra) {
        this.precioCompra = precioCompra;
    }

    public int getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(int precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStockCritico() {
        return stockCritico;
    }

    public void setStockCritico(int stockCritico) {
        this.stockCritico = stockCritico;
    }

    public String getCodigoProd() {
        return codigoProd;
    }

    public void setCodigoProd(String codigoProd) {
        this.codigoProd = codigoProd;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(String fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }
}