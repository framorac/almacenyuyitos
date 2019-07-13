package controller;

import database.Conectar;
import entidades.Venta;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VentaController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idVenta;
    List ventas;
    private static final String SQL_READ_ALL ="SELECT venta.id_venta,usuario.nombre AS usuario_nombre,usuario.apellido AS usuario_apellido,tipo_venta.tipo_venta,cliente.nombre AS cliente_nombre,cliente.apellido AS cliente_apellido,venta.fecha_venta,venta.descripcion,producto.descripcion AS producto,producto.precio_venta,venta.cantidad,venta.total\n" +
                                                "FROM venta\n" +
                                                "INNER JOIN usuario ON venta.id_usuario = usuario.id_usuario\n" +
                                                "INNER JOIN cliente ON venta.id_cliente = cliente.id_cliente\n" +
                                                "INNER JOIN tipo_venta ON venta.id_tipoventa = tipo_venta.id_tipoventa\n" +
                                                "INNER JOIN producto ON venta.id_producto = producto.id_producto ORDER BY venta.id_venta";
    private static final String SQL_READ_ALL_VENDEDORES = "SELECT * FROM USUARIO WHERE ID_PERFIL = 2 ORDER BY ID_USUARIO";
    private static final String SQL_READ_ALL_TIPO_VENTAS = "SELECT * FROM TIPO_VENTA ORDER BY ID_TIPOVENTA";
    private static final String SQL_READ_ALL_CLIENTES = "SELECT * FROM CLIENTE ORDER BY ID_CLIENTE";
    private static final String SQL_READ_ALL_PRODUCTOS = "SELECT * FROM PRODUCTO ORDER BY ID_PRODUCTO";
    private static final String SQL_INSERT = "INSERT INTO VENTA VALUES (VENTA_SEQ.nextval,?,?,?,?,?,?,?,?)";
    
    @RequestMapping("ventas.html")
    public ModelAndView listarVentas() {
        ventas = this.jdbc.queryForList(SQL_READ_ALL);
        mv.addObject("ventas", ventas);
        mv.setViewName("ventas");

        return mv;
    }
    
    @RequestMapping("borrarVenta.html")
    public ModelAndView borrarVenta(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM VENTA WHERE ID_VENTA=" + id;
        this.jdbc.update(sql);

        return new ModelAndView("redirect:/ventas.html");
    }
    
    @RequestMapping(value = "agregarVenta.html", method = RequestMethod.GET)
    public ModelAndView agregarVenta(){
        mv.addObject(new Venta());
        List vendedores = this.jdbc.queryForList(SQL_READ_ALL_VENDEDORES);
        List tipoVentas = this.jdbc.queryForList(SQL_READ_ALL_TIPO_VENTAS);
        List clientes = this.jdbc.queryForList(SQL_READ_ALL_CLIENTES);
        List productos = this.jdbc.queryForList(SQL_READ_ALL_PRODUCTOS);
        mv.addObject("vendedores", vendedores);
        mv.addObject("tipoVentas", tipoVentas);
        mv.addObject("clientes", clientes);
        mv.addObject("productos", productos);
        mv.setViewName("agregarVenta");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarVenta.html", method = RequestMethod.POST)
    public ModelAndView agregarVenta(Venta v) {
        this.jdbc.update(SQL_INSERT,
                v.getIdUsuario(),
                v.getIdTipoVenta(),
                v.getIdCliente(),
                v.getFechaVenta(),
                v.getDescripcion(),
                v.getIdProducto(),
                v.getCantidad(),
                v.getTotal());

        return new ModelAndView("redirect:/ventas.html");
    }
    
    @RequestMapping(value = "editarVenta.html", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request) {
        idVenta = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM VENTA WHERE ID_VENTA =" + idVenta;
        ventas = this.jdbc.queryForList(sql);
        List vendedores = this.jdbc.queryForList(SQL_READ_ALL_VENDEDORES);
        List tipoVentas = this.jdbc.queryForList(SQL_READ_ALL_TIPO_VENTAS);
        List clientes = this.jdbc.queryForList(SQL_READ_ALL_CLIENTES);
        List productos = this.jdbc.queryForList(SQL_READ_ALL_PRODUCTOS);
        mv.addObject("vendedores", vendedores);
        mv.addObject("tipoVentas", tipoVentas);
        mv.addObject("clientes", clientes);
        mv.addObject("productos", productos);
        mv.addObject("venta", ventas);
        mv.setViewName("editarVenta");

        return mv;
    }
    
    @RequestMapping(value = "editarVenta.html", method = RequestMethod.POST)
    public ModelAndView editar(Venta v) {
        String sql = "UPDATE venta SET "
                + "id_usuario=?,"
                + "id_tipoventa=?,"
                + "id_cliente=?,"
                + "fecha_venta=?,"
                + "descripcion=?,"
                + "id_producto=?,"
                + "cantidad=?,"
                + "total=?"
                + " WHERE ID_VENTA=" + idVenta;

        this.jdbc.update(sql,
                v.getIdUsuario(),
                v.getIdTipoVenta(),
                v.getIdCliente(),
                v.getFechaVenta(),
                v.getDescripcion(),
                v.getIdProducto(),
                v.getCantidad(),
                v.getTotal());

        return new ModelAndView("redirect:/ventas.html");
    }
}