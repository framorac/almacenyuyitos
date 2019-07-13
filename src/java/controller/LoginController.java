package controller;

import database.Conectar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    
    @RequestMapping("index.html")
    public ModelAndView index() {
        mv.setViewName("index");

        return mv;
    }
    
    @RequestMapping("home.html")
    public ModelAndView home() {
        mv.setViewName("home");

        return mv;
    }
    
    @RequestMapping("salir.html")
    public ModelAndView salir(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session != null){
            session.invalidate();
        }
        
        return new ModelAndView("redirect:/index.html");
    }
    
    @RequestMapping(value = "validarLogin.html", method = RequestMethod.POST)
    public ModelAndView borrarAbono(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int perfil = Integer.parseInt(request.getParameter("idPerfil"));
        
        String sql = "SELECT * FROM USUARIO WHERE USERNAME='" + username + "' AND PASSWORD='"+ password +"' AND ID_PERFIL=" + perfil;
        List usuario = this.jdbc.queryForList(sql);
        
        if (usuario.isEmpty()) {
            return new ModelAndView("redirect:/index.html");
        } else {
            HttpSession sesionUsuario = request.getSession(true);
            mv.addObject("usuario", usuario);
            sesionUsuario.setAttribute("usuario", usuario);
            sesionUsuario.setAttribute("perfil", perfil);
            mv.setViewName("home");
            return new ModelAndView("redirect:/home.html");
        } 
    }
    
    
}
