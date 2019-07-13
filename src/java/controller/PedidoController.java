package controller;

import database.Conectar;
import entidades.Pedido;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class PedidoController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idPedido;
    List pedidos;
    private static final String SQL_READ_ALL = "SELECT pedido.id_pedido, usuario.nombre, usuario.apellido, proveedor.razon_social, pedido.fecha_pedido, pedido.detalle\n" +
                                                "FROM pedido\n" +
                                                "INNER JOIN usuario ON pedido.id_usuario = usuario.id_usuario\n" +
                                                "INNER JOIN proveedor ON pedido.id_proveedor = proveedor.id_proveedor ORDER BY pedido.id_pedido";
    private static final String SQL_READ_ALL_USUARIOS_ADMIN = "SELECT * FROM USUARIO WHERE ID_PERFIL = 1 ORDER BY ID_USUARIO";
    private static final String SQL_READ_ALL_PROVEEDORES = "SELECT * FROM PROVEEDOR ORDER BY ID_PROVEEDOR";
    private static final String SQL_INSERT = "INSERT INTO PEDIDO (id_pedido,id_usuario,id_proveedor,fecha_pedido,detalle) VALUES (PEDIDO_SEQ.nextval,?,?,?,?)";
    
    @RequestMapping("pedidos.html")
    public ModelAndView listarPedidos(){
        pedidos = this.jdbc.queryForList(SQL_READ_ALL);
        mv.addObject("listaPedidos", pedidos);
        mv.setViewName("pedidos");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarPedido.html", method = RequestMethod.GET)
    public ModelAndView agregarPedido(){
        mv.addObject(new Pedido());
        List usuarios = this.jdbc.queryForList(SQL_READ_ALL_USUARIOS_ADMIN);
        List proveedores = this.jdbc.queryForList(SQL_READ_ALL_PROVEEDORES);
        mv.addObject("usuarios", usuarios);
        mv.addObject("proveedores", proveedores);
        mv.setViewName("agregarPedido");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarPedido.html", method = RequestMethod.POST)
    public ModelAndView agregarPedido(Pedido p){
        this.jdbc.update(SQL_INSERT,
                p.getIdUsuario(),
                p.getIdProveedor(),
                p.getFechaPedido(),
                p.getDetalle());
        
        return new ModelAndView("redirect:/pedidos.html");
    }
    
    @RequestMapping("borrarPedido.html")
    public ModelAndView borrarPedido(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM PEDIDO WHERE ID_PEDIDO=" + id;
        this.jdbc.update(sql);
        
        return new ModelAndView("redirect:/pedidos.html");
    }
    
    @RequestMapping(value = "editarPedido.html", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request){
        idPedido = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM PEDIDO WHERE ID_PEDIDO =" + idPedido;
        pedidos = this.jdbc.queryForList(sql);
        mv.addObject("pedido", pedidos);
        
        List usuarios = this.jdbc.queryForList(SQL_READ_ALL_USUARIOS_ADMIN);
        List proveedores = this.jdbc.queryForList(SQL_READ_ALL_PROVEEDORES);
        mv.addObject("usuarios", usuarios);
        mv.addObject("proveedores", proveedores);
        mv.setViewName("editarPedido");
        
        return mv;
    }
    
    @RequestMapping(value = "editarPedido.html", method = RequestMethod.POST)
    public ModelAndView editar(Pedido p){
        String sql = "UPDATE pedido SET "
                + "id_usuario=?,"
                + "id_proveedor=?,"
                + "fecha_pedido=?,"
                + "detalle=?"
                + " WHERE ID_PEDIDO="+idPedido;
        
        this.jdbc.update(sql,
                p.getIdUsuario(),
                p.getIdProveedor(),
                p.getFechaPedido(),
                p.getDetalle()); 
        
        return new ModelAndView("redirect:/pedidos.html");
    }
}
