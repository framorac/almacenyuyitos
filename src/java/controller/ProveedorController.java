package controller;

import database.Conectar;
import entidades.Proveedor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProveedorController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idProveedor;
    List proveedores;
    private static final String SQL_READ_ALL = "SELECT proveedor.id_proveedor,proveedor.rut,proveedor.razon_social,proveedor.direccion,comuna.comuna_nombre,proveedor.telefono,proveedor.email\n" +
                                                "FROM proveedor\n" +
                                                "INNER JOIN comuna ON proveedor.id_comuna = comuna.comuna_id ORDER BY proveedor.id_proveedor";
    private static final String SQL_REGION = "SELECT * FROM REGION ORDER BY REGION_ID";
    private static final String SQL_PROVINCIA = "SELECT * FROM PROVINCIA ORDER BY PROVINCIA_ID";
    private static final String SQL_COMUNA = "SELECT * FROM COMUNA ORDER BY COMUNA_ID";
    private static final String SQL_INSERT = "INSERT INTO PROVEEDOR (id_proveedor,razon_social,rut,direccion,id_comuna,telefono,email,fecha_creacion) VALUES (PROVEEDOR_SEQ.nextval,?,?,?,?,?,?,?)";
    
    @RequestMapping("proveedores.html")
    public ModelAndView listarProveedores(){
        proveedores = this.jdbc.queryForList(SQL_READ_ALL);
        List regiones = this.jdbc.queryForList(SQL_REGION);
        List provincias = this.jdbc.queryForList(SQL_PROVINCIA);
        List comunas = this.jdbc.queryForList(SQL_COMUNA);
        mv.addObject("listaProveedores", proveedores);
        mv.addObject("regiones", regiones);
        mv.addObject("provincias", provincias);
        mv.addObject("comunas", comunas);
        mv.setViewName("proveedores");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarProveedor.html", method = RequestMethod.GET)
    public ModelAndView agregarProveedor(){
        mv.addObject(new Proveedor());
        mv.setViewName("agregarProveedor");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarProveedor.html", method = RequestMethod.POST)
    public ModelAndView agregarCliente(Proveedor p){
        this.jdbc.update(SQL_INSERT, 
                p.getRazonSocial(),
                p.getRut(),
                p.getDireccion(),
                p.getIdComuna(),
                p.getTelefono(),
                p.getEmail(),
                p.getFechaCreacion());
        
        return new ModelAndView("redirect:/proveedores.html");
    }
    
    @RequestMapping("borrarProveedor.html")
    public ModelAndView borrarProveedor(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM PROVEEDOR WHERE ID_PROVEEDOR=" + id;
        this.jdbc.update(sql);
        
        return new ModelAndView("redirect:/proveedores.html");
    }
    
    @RequestMapping(value = "editarProveedor.html", method = RequestMethod.GET)
    public ModelAndView editarProveedor(HttpServletRequest request){
        idProveedor = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM PROVEEDOR WHERE ID_PROVEEDOR =" + idProveedor;
        proveedores = this.jdbc.queryForList(sql);
        List regiones = this.jdbc.queryForList(SQL_REGION);
        List provincias = this.jdbc.queryForList(SQL_PROVINCIA);
        List comunas = this.jdbc.queryForList(SQL_COMUNA);
        mv.addObject("proveedor", proveedores);
        mv.addObject("regiones", regiones);
        mv.addObject("provincias", provincias);
        mv.addObject("comunas", comunas);
        mv.setViewName("editarProveedor");
        
        return mv;
    }
    
    @RequestMapping(value = "editarProveedor.html", method = RequestMethod.POST)
    public ModelAndView editarProveedor(Proveedor p){
        String sql = "UPDATE proveedor SET "
                + "razon_social=?,"
                + "rut=?,"
                + "direccion=?,"
                + "id_comuna=?,"
                + "telefono=?,"
                + "email=?,"
                + "fecha_creacion=?"
                + " WHERE ID_PROVEEDOR="+idProveedor;
        
        this.jdbc.update(sql, 
                p.getRazonSocial(),
                p.getRut(),
                p.getDireccion(),
                p.getIdComuna(),
                p.getTelefono(),
                p.getEmail(),
                p.getFechaCreacion());        
        return new ModelAndView("redirect:/proveedores.html");
    }
}