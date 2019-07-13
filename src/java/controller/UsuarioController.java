
package controller;

import database.Conectar;
import entidades.Usuario;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Tinet
 */
@Controller
public class UsuarioController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idUsuario;
    List usuarios;
    private static final String SQL_READ_ALL = "SELECT * FROM USUARIO ORDER BY ID_USUARIO";
    private static final String SQL_READ_ALL_PERFILES = "SELECT * FROM PERFIL ORDER BY ID_PERFIL";
    private static final String SQL_INSERT = "INSERT INTO USUARIO (id_usuario,id_perfil,nombre,apellido,username,password,email) VALUES (USUARIO_SEQ.nextval,?,?,?,?,?,?)";
    
    @RequestMapping("usuarios.html")
    public ModelAndView listarClientes(){
        usuarios = this.jdbc.queryForList(SQL_READ_ALL);
        mv.addObject("listaUsuarios", usuarios);
        mv.setViewName("usuarios");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarUsuario.html", method = RequestMethod.GET)
    public ModelAndView agregarUsuario(){
        mv.addObject(new Usuario());
        mv.setViewName("agregarUsuario");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarUsuario.html", method = RequestMethod.POST)
    public ModelAndView agregarUsuario(Usuario u){
        this.jdbc.update(SQL_INSERT, 
                u.getIdPerfil(),
                u.getNombre(),
                u.getApellido(),
                u.getUsername(),
                u.getPassword(),
                u.getEmail());
        
        return new ModelAndView("redirect:/usuarios.html");
    }
    
    @RequestMapping("borrarUsuario.html")
    public ModelAndView borrarUsuario(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM USUARIO WHERE ID_USUARIO=" + id;
        this.jdbc.update(sql);
        
        return new ModelAndView("redirect:/usuarios.html");
    }
    
    @RequestMapping(value = "editarUsuario.html", method = RequestMethod.GET)
    public ModelAndView editarUsuario(HttpServletRequest request){
        idUsuario = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM USUARIO WHERE ID_USUARIO =" + idUsuario;
        usuarios = this.jdbc.queryForList(sql);
        mv.addObject("usuario", usuarios);
        mv.setViewName("editarUsuario");
        
        return mv;
    }
    
    @RequestMapping(value = "editarUsuario.html", method = RequestMethod.POST)
    public ModelAndView editarUsuario(Usuario u){
        String sql = "UPDATE usuario SET "
                + "id_perfil=?,"
                + "nombre=?,"
                + "apellido=?,"
                + "username=?,"
                + "password=?,"
                + "email=?"
                + " WHERE ID_USUARIO="+idUsuario;
        
        this.jdbc.update(sql, 
                u.getIdPerfil(),
                u.getNombre(),
                u.getApellido(),
                u.getUsername(),
                u.getPassword(),
                u.getEmail());        
        return new ModelAndView("redirect:/usuarios.html");
    }
}
