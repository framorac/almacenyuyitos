
package entidades;

public class SubFamilia {
    private int idSubFamilia;
    private int idFamiliaProd;
    private String subFamilia;

    public SubFamilia() {
    }

    public SubFamilia(int idSubFamilia, int idFamiliaProd, String subFamilia) {
        this.idSubFamilia = idSubFamilia;
        this.idFamiliaProd = idFamiliaProd;
        this.subFamilia = subFamilia;
    }

    public int getIdSubFamilia() {
        return idSubFamilia;
    }

    public void setIdSubFamilia(int idSubFamilia) {
        this.idSubFamilia = idSubFamilia;
    }

    public int getIdFamiliaProd() {
        return idFamiliaProd;
    }

    public void setIdFamiliaProd(int idFamiliaProd) {
        this.idFamiliaProd = idFamiliaProd;
    }

    public String getSubFamilia() {
        return subFamilia;
    }

    public void setSubFamilia(String subFamilia) {
        this.subFamilia = subFamilia;
    }
}