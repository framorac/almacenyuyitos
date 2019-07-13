package controller;

import database.Conectar;
import entidades.Producto;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductoController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idProducto;
    List productos;
    private static final String SQL_READ_ALL = "SELECT producto.id_producto,descripcion,proveedor.razon_social,sub_familia.sub_familia,producto.precio_compra,producto.precio_venta,producto.stock,producto.stock_critico,producto.marca,producto.codigo_prod\n" +
                                                "FROM producto\n" +
                                                "INNER JOIN proveedor ON producto.id_proveedor = proveedor.id_proveedor\n" +
                                                "INNER JOIN sub_familia ON producto.id_subfamilia = sub_familia.id_subfamilia ORDER BY producto.id_producto";
    private static final String SQL_FAMILIA = "SELECT * FROM FAMILIA_PRODUCTO ORDER BY ID_FAMILIAPROD";
    private static final String SQL_SUB_FAMILIA = "SELECT * FROM SUB_FAMILIA ORDER BY ID_SUBFAMILIA";
    private static final String SQL_PROVEEDORES = "SELECT * FROM PROVEEDOR ORDER BY ID_PROVEEDOR";
    private static final String SQL_INSERT = "INSERT INTO PRODUCTO (id_producto,id_subfamilia,id_proveedor,descripcion"
            + ",precio_compra,precio_venta,stock,stock_critico,codigo_prod,fecha_vencimiento,marca) VALUES ("
            + "PRODUCTO_SEQ.nextval,?,?,?,?,?,?,?,?,?,?)";
    
    @RequestMapping("productos.html")
    public ModelAndView listarProductos(){
        productos = this.jdbc.queryForList(SQL_READ_ALL);
        mv.addObject("listaProductos", productos);
        mv.setViewName("productos");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarProducto.html", method = RequestMethod.GET)
    public ModelAndView agregarProducto(){
        mv.addObject(new Producto());
        List familias = this.jdbc.queryForList(SQL_FAMILIA);
        List subFamilias = this.jdbc.queryForList(SQL_SUB_FAMILIA);
        List proveedores = this.jdbc.queryForList(SQL_PROVEEDORES);
        mv.addObject("listaFamilias", familias);
        mv.addObject("listaSubfamilias", subFamilias);
        mv.addObject("listaProveedores", proveedores);
        mv.setViewName("agregarProducto");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarProducto.html", method = RequestMethod.POST)
    public ModelAndView agregarProducto(Producto p){
        this.jdbc.update(SQL_INSERT, 
                p.getIdSubFamilia(),
                p.getIdProveedor(),
                p.getDescripcion(),
                p.getPrecioCompra(),
                p.getPrecioVenta(),
                p.getStock(),
                p.getStockCritico(),
                p.getCodigoProd(),
                p.getFechaVencimiento(),
                p.getMarca());
        
        return new ModelAndView("redirect:/productos.html");
    }
    
    @RequestMapping("borrarProducto.html")
    public ModelAndView borrarProducto(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM PRODUCTO WHERE ID_PRODUCTO=" + id;
        this.jdbc.update(sql);
        
        return new ModelAndView("redirect:/productos.html");
    }
    
    @RequestMapping(value = "editarProducto.html", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request){
        idProducto = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM PRODUCTO WHERE ID_PRODUCTO =" + idProducto;
        List producto = this.jdbc.queryForList(sql);
        List familias = this.jdbc.queryForList(SQL_FAMILIA);
        List subFamilias = this.jdbc.queryForList(SQL_SUB_FAMILIA);
        List proveedores = this.jdbc.queryForList(SQL_PROVEEDORES);
        mv.addObject("producto", producto);
        mv.addObject("listaFamilias", familias);
        mv.addObject("listaSubfamilias", subFamilias);
        mv.addObject("listaProveedores", proveedores);
        mv.setViewName("editarProducto");
        
        return mv;
    }
    
    @RequestMapping(value = "editarProducto.html", method = RequestMethod.POST)
    public ModelAndView editar(Producto p){
        String sql = "UPDATE producto SET "
                + "id_subfamilia=?,"
                + "id_proveedor=?,"
                + "descripcion=?,"
                + "precio_compra=?,"
                + "precio_venta=?,"
                + "stock=?,"
                + "stock_critico=?,"
                + "codigo_prod=?,"
                + "fecha_vencimiento=?,"
                + "marca=?"
                + " WHERE ID_PRODUCTO="+idProducto;
        
        this.jdbc.update(sql, 
                p.getIdSubFamilia(),
                p.getIdProveedor(),
                p.getDescripcion(),
                p.getPrecioCompra(),
                p.getPrecioVenta(),
                p.getStock(),
                p.getStockCritico(),
                p.getCodigoProd(),
                p.getFechaVencimiento(),
                p.getMarca()); 
        
        return new ModelAndView("redirect:/productos.html");
    }
}