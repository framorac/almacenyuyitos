package entidades;

public class Familia {
    private int idFamiliaProd;
    private String familiaProducto;

    public Familia() {
    }

    public Familia(int idFamiliaProd, String familiaProducto) {
        this.idFamiliaProd = idFamiliaProd;
        this.familiaProducto = familiaProducto;
    }

    public int getIdFamiliaProd() {
        return idFamiliaProd;
    }

    public void setIdFamiliaProd(int idFamiliaProd) {
        this.idFamiliaProd = idFamiliaProd;
    }

    public String getFamiliaProducto() {
        return familiaProducto;
    }

    public void setFamiliaProducto(String familiaProducto) {
        this.familiaProducto = familiaProducto;
    }
}