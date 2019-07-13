package controller;

import database.Conectar;
import entidades.Familia;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FamiliaProductoController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idFamilia;
    List familias;
    private static final String SQL_READ_ALL = "SELECT * FROM FAMILIA_PRODUCTO ORDER BY ID_FAMILIAPROD";
    private static final String SQL_INSERT = "INSERT INTO FAMILIA_PRODUCTO (id_familiaprod,familia_producto) VALUES (FAMILIA_PRODUCTO_SEQ.nextval,?)";
    
    @RequestMapping("familias.html")
    public ModelAndView listarFamilias(){
        familias = this.jdbc.queryForList(SQL_READ_ALL);
        mv.addObject("listaFamilias", familias);
        mv.setViewName("familias");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarFamilia.html", method = RequestMethod.GET)
    public ModelAndView agregarFamilia(){
        mv.addObject(new Familia());
        mv.setViewName("agregarFamilia");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarFamilia.html", method = RequestMethod.POST)
    public ModelAndView agregarFamilia(Familia f){
        this.jdbc.update(SQL_INSERT, f.getFamiliaProducto());
        
        return new ModelAndView("redirect:/familias.html");
    }
    
    @RequestMapping("borrarFamilia.html")
    public ModelAndView borrarFamilia(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM FAMILIA_PRODUCTO WHERE ID_FAMILIAPROD=" + id;
        this.jdbc.update(sql);
        
        return new ModelAndView("redirect:/familias.html");
    }
    
    @RequestMapping(value = "editarFamilia.html", method = RequestMethod.GET)
    public ModelAndView editarFamilia(HttpServletRequest request){
        idFamilia = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM FAMILIA_PRODUCTO WHERE ID_FAMILIAPROD =" + idFamilia;
        familias = this.jdbc.queryForList(sql);
        mv.addObject("familia", familias);
        mv.setViewName("editarFamilia");
        
        return mv;
    }
    
    @RequestMapping(value = "editarFamilia.html", method = RequestMethod.POST)
    public ModelAndView editarFamilia(Familia f){
        String sql = "UPDATE familia_producto SET "
                + "familia_producto=?"
                + " WHERE ID_FAMILIAPROD="+idFamilia;
        
        this.jdbc.update(sql, f.getFamiliaProducto());        
        return new ModelAndView("redirect:/familias.html");
    }
}