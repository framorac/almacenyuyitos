package controller;

import database.Conectar;
import entidades.SubFamilia;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SubFamiliaProductoController {
    Conectar conn = new Conectar();
    JdbcTemplate jdbc = new JdbcTemplate(conn.conectar());
    ModelAndView mv = new ModelAndView();
    int idSubFamilia;
    List subFamilia;
    private static final String SQL_READ_ALL = "SELECT sub_familia.id_subfamilia,sub_familia.sub_familia,familia_producto.familia_producto\n" +
                                                "FROM sub_familia\n" +
                                                "INNER JOIN familia_producto ON sub_familia.id_familiaprod = familia_producto.id_familiaprod\n" +
                                                "ORDER BY sub_familia.id_subfamilia";
    private static final String SQL_READ_ALL_FAMILIAS = "SELECT * FROM FAMILIA_PRODUCTO ORDER BY ID_FAMILIAPROD";
    private static final String SQL_INSERT = "INSERT INTO SUB_FAMILIA (id_subfamilia,sub_familia,id_familiaprod) VALUES (SUB_FAMILIA_SEQ.nextval,?,?)";
    
    @RequestMapping("subfamilias.html")
    public ModelAndView listarSubFamilias(){
        subFamilia = this.jdbc.queryForList(SQL_READ_ALL);
        List familias = this.jdbc.queryForList(SQL_READ_ALL_FAMILIAS);
        mv.addObject("listaFamilia", familias);
        mv.addObject("listaSubFamilia", subFamilia);
        mv.setViewName("subfamilias");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarSubFamilia.html", method = RequestMethod.GET)
    public ModelAndView agregarSubFamilia(){
        mv.addObject(new SubFamilia());
        mv.setViewName("agregarSubFamilia");
        
        return mv;
    }
    
    @RequestMapping(value = "agregarSubFamilia.html", method = RequestMethod.POST)
    public ModelAndView agregarSubFamilia(SubFamilia s){
        this.jdbc.update(SQL_INSERT, s.getSubFamilia(), s.getIdFamiliaProd());
        
        return new ModelAndView("redirect:/subfamilias.html");
    }
    
    @RequestMapping("borrarSubFamilia.html")
    public ModelAndView borrarSubFamilia(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM SUB_FAMILIA WHERE ID_SUBFAMILIA=" + id;
        this.jdbc.update(sql);
        
        return new ModelAndView("redirect:/subfamilias.html");
    }
    
    @RequestMapping(value = "editarSubFamilia.html", method = RequestMethod.GET)
    public ModelAndView editarSubFamilia(HttpServletRequest request){
        idSubFamilia = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM SUB_FAMILIA WHERE ID_SUBFAMILIA =" + idSubFamilia;
        List familias = this.jdbc.queryForList(SQL_READ_ALL_FAMILIAS);
        mv.addObject("listaFamilia", familias);
        subFamilia = this.jdbc.queryForList(sql);
        mv.addObject("subfamilia", subFamilia);
        mv.setViewName("editarSubFamilia");
        
        return mv;
    }
    
    @RequestMapping(value = "editarSubFamilia.html", method = RequestMethod.POST)
    public ModelAndView editarSubFamilia(SubFamilia s){
        String sql = "UPDATE sub_familia SET "
                + "sub_familia=?,"
                + "id_familiaprod=?"
                + " WHERE ID_SUBFAMILIA="+idSubFamilia;
        
        this.jdbc.update(sql, s.getSubFamilia(),s.getIdFamiliaProd());        
        return new ModelAndView("redirect:/subfamilias.html");
    }
}