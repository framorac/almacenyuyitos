
package database;
        
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class Conectar {
    public DriverManagerDataSource conectar() {
        DriverManagerDataSource dts = new DriverManagerDataSource();
        dts.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        dts.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
        dts.setUsername("C##DUOC");
        dts.setPassword("adminbd");
        
        return dts;
    }
}