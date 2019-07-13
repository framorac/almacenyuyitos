package controller;

import database.Conectar;
import entidades.Abono;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AbonoController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idAbono;
    List listaAbonos;
    private static final String SQL_READ_ALL_ABONOS = "SELECT pago_fiado.id_pagofiado,cliente.nombre,cliente.apellido,pago_fiado.monto_abono,pago_fiado.fecha_abono\n"
            + "FROM pago_fiado\n"
            + "INNER JOIN cliente ON pago_fiado.id_cliente = cliente.id_cliente ORDER BY pago_fiado.id_pagofiado";
    private static final String SQL_INSERT = "INSERT INTO PAGO_FIADO VALUES (PAGO_FIADO_SEQ.nextval,?,?,?)";
    private static final String SQL_READ_ALL_CLIENTES = "SELECT * FROM CLIENTE ORDER BY ID_CLIENTE";

    @RequestMapping("abonos.html")
    public ModelAndView listarAbonos() {
        listaAbonos = this.jdbc.queryForList(SQL_READ_ALL_ABONOS);
        mv.addObject("abonos", listaAbonos);
        mv.setViewName("abonos");

        return mv;
    }

    @RequestMapping("borrarAbono.html")
    public ModelAndView borrarAbono(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM PAGO_FIADO WHERE ID_PAGOFIADO=" + id;
        this.jdbc.update(sql);

        return new ModelAndView("redirect:/abonos.html");
    }

    @RequestMapping(value = "agregarAbono.html", method = RequestMethod.GET)
    public ModelAndView agregarAbono() {
        mv.addObject(new Abono());
        List clientes = this.jdbc.queryForList(SQL_READ_ALL_CLIENTES);
        mv.addObject("listaClientes", clientes);
        mv.setViewName("agregarAbono");

        return mv;
    }

    @RequestMapping(value = "agregarAbono.html", method = RequestMethod.POST)
    public ModelAndView agregarAbono(Abono a) {
        this.jdbc.update(SQL_INSERT,
                a.getIdCliente(),
                a.getMontoAbono(),
                a.getFechaAbono());

        return new ModelAndView("redirect:/abonos.html");
    }

    @RequestMapping(value = "editarAbono.html", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request) {
        idAbono = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM PAGO_FIADO WHERE ID_PAGOFIADO =" + idAbono;
        listaAbonos = this.jdbc.queryForList(sql);
        List clientes = this.jdbc.queryForList(SQL_READ_ALL_CLIENTES);
        mv.addObject("listaClientes", clientes);
        mv.addObject("abono", listaAbonos);
        mv.setViewName("editarAbono");

        return mv;
    }

    @RequestMapping(value = "editarAbono.html", method = RequestMethod.POST)
    public ModelAndView editar(Abono a) {
        String sql = "UPDATE pago_fiado SET "
                + "id_cliente=?,"
                + "monto_abono=?,"
                + "fecha_abono=?"
                + " WHERE ID_PAGOFIADO=" + idAbono;

        this.jdbc.update(sql,
                a.getIdCliente(),
                a.getMontoAbono(),
                a.getFechaAbono());

        return new ModelAndView("redirect:/abonos.html");
    }

    @RequestMapping(value = "crearExcelAbono.html", method = RequestMethod.POST)
    public void crearExcelAbono(HttpServletRequest request) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connect = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe",
                "C##DUOC",
                "adminbd"
        );

        Statement statement = connect.createStatement();
        ResultSet resultSet = statement.executeQuery(SQL_READ_ALL_ABONOS);

        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet spreadsheet = workbook.createSheet("Detalle_Abonos");
        XSSFRow row = spreadsheet.createRow(1);
        XSSFCell cell;

        cell = row.createCell(1);
        cell.setCellValue("ID_ABONO");
        cell = row.createCell(2);
        cell.setCellValue("CLIENTE");
        cell = row.createCell(3);
        cell.setCellValue("MONTO_ABONO");
        cell = row.createCell(4);
        cell.setCellValue("FECHA_ABONO");
        int i = 2;

        while (resultSet.next()) {
            row = spreadsheet.createRow(i);
            cell = row.createCell(1);
            cell.setCellValue(resultSet.getInt("ID_PAGOFIADO"));
            cell = row.createCell(2);
            cell.setCellValue(resultSet.getInt("ID_CLIENTE"));
            cell = row.createCell(3);
            cell.setCellValue(resultSet.getInt("MONTO_ABONO"));
            cell = row.createCell(4);
            cell.setCellValue(resultSet.getString("FECHA_ABONO"));
            i++;
        }

        try (FileOutputStream out = new FileOutputStream(new File("detalle_abonos.xlsx"))) {
            workbook.write(out);
        }
        System.out.println("detalle_abonos.xlsx written successfully");
    }
}
