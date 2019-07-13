package controller;

import database.Conectar;
import entidades.Cliente;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClienteController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idCliente;
    List clientes;
    private static final String SQL_READ_ALL = "SELECT cliente.id_cliente,cliente.rut,cliente.nombre,cliente.apellido,cliente.direccion,comuna.comuna_nombre,cliente.telefono,cliente.email,cliente.dia_pago\n" +
                                                "FROM cliente\n" +
                                                "INNER JOIN comuna ON cliente.id_comuna = comuna.comuna_id\n" +
                                                "ORDER BY cliente.id_cliente";
    private static final String SQL_INSERT = "INSERT INTO CLIENTE (id_cliente,nombre,apellido,rut,direccion,id_comuna,telefono,email,dia_pago,fecha_creacion) VALUES (CLIENTE_SEQ.nextval,?,?,?,?,?,?,?,?,?)";
    private static final String SQL_REGION = "SELECT * FROM REGION ORDER BY REGION_ID";
    private static final String SQL_PROVINCIA = "SELECT * FROM PROVINCIA ORDER BY PROVINCIA_ID";
    private static final String SQL_COMUNA = "SELECT * FROM COMUNA ORDER BY COMUNA_ID";
    
    @RequestMapping("clientes.html")
    public ModelAndView listarClientes(){
        clientes = this.jdbc.queryForList(SQL_READ_ALL);
        List regiones = this.jdbc.queryForList(SQL_REGION);
        List provincias = this.jdbc.queryForList(SQL_PROVINCIA);
        List comunas = this.jdbc.queryForList(SQL_COMUNA);
        mv.addObject("listaClientes", clientes);
        mv.addObject("regiones", regiones);
        mv.addObject("provincias", provincias);
        mv.addObject("comunas", comunas);
        mv.setViewName("clientes");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarCliente.html", method = RequestMethod.GET)
    public ModelAndView agregarCliente(){
        mv.addObject(new Cliente());
        mv.setViewName("agregarCliente");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarCliente.html", method = RequestMethod.POST)
    public ModelAndView agregarCliente(Cliente c){
        this.jdbc.update(SQL_INSERT, 
                c.getNombre(),
                c.getApellido(),
                c.getRut(),
                c.getDireccion(),
                c.getIdComuna(),
                c.getTelefono(),
                c.getEmail(),
                c.getDiaPago(),
                c.getFechaCreacion());
        
        return new ModelAndView("redirect:/clientes.html");
    }
    
    @RequestMapping("borrarCliente.html")
    public ModelAndView borrarCliente(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM CLIENTE WHERE ID_CLIENTE=" + id;
        this.jdbc.update(sql);
        
        return new ModelAndView("redirect:/clientes.html");
    }
    
    @RequestMapping(value = "editarCliente.html", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request){
        idCliente = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM CLIENTE WHERE ID_CLIENTE =" + idCliente;
        clientes = this.jdbc.queryForList(sql);
        List regiones = this.jdbc.queryForList(SQL_REGION);
        List provincias = this.jdbc.queryForList(SQL_PROVINCIA);
        List comunas = this.jdbc.queryForList(SQL_COMUNA);
        mv.addObject("cliente", clientes);
        mv.addObject("regiones", regiones);
        mv.addObject("provincias", provincias);
        mv.addObject("comunas", comunas);
        mv.setViewName("editarCliente");
        
        return mv;
    }
    
    @RequestMapping(value = "editarCliente.html", method = RequestMethod.POST)
    public ModelAndView editar(Cliente c){
        String sql = "UPDATE cliente SET "
                + "nombre=?,"
                + "apellido=?,"
                + "rut=?,"
                + "direccion=?,"
                + "id_comuna=?,"
                + "telefono=?,"
                + "email=?,"
                + "dia_pago=?,"
                + "fecha_creacion=?"
                + " WHERE ID_CLIENTE="+idCliente;
        
        this.jdbc.update(sql, 
                c.getNombre(),
                c.getApellido(),
                c.getRut(),
                c.getDireccion(),
                c.getIdComuna(),
                c.getTelefono(),
                c.getEmail(),
                c.getDiaPago(),
                c.getFechaCreacion());        
        return new ModelAndView("redirect:/clientes.html");
    }
}