<%@page import="java.sql.*" %>
<%@page import="cl.app.base.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    //recuperar la sesion del usuario actual
    HttpSession hs= request.getSession(false);  //Recuperar la sesion ya abierta para el usuario
    if(hs==null||hs.getAttribute("rol")==null||
            ! hs.getAttribute("rol").equals("admin"))
    {
        out.println("Error: ud. no tiene los permisos para ingresar a esta pagina");
        out.println("<a href='../../index.jsp'>Volver al Ingreso</a>");
        return;
    }
    ResultSet rs= null;
    String rut=request.getParameter("rut");
    try
    {      
        Connection conn = ConexionBD.getConexion();
        String sql ="select * from registro where rut=?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, rut);
        rs=st.executeQuery();
        //Verificar que la cuenta a desactivar no sea de administrador.
        if(rs.next()==true&& !rs.getString("rol").equalsIgnoreCase("admin"))
        {
        String sql2   = "update registro set activo='N' where rut=?";
        PreparedStatement st2 = conn.prepareStatement(sql2);
        st2.setString(1, rut);
        st2.execute();
        response.sendRedirect("GestionCuentas.jsp");
        }
        else  //Si es administrador no modifica y lo devuelve a la pagina gestion  
        {
            response.sendRedirect("GestionCuentas.jsp");
        }
    }
    catch(SQLException e)
    {
        out.println("Excepción de SQL: " + e);
    }  
%>
