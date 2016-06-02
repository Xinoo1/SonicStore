
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cl.app.base.ConexionBD"%>
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
    ResultSet rs = null;
    try
    {      
        Connection conn = ConexionBD.getConexion();
        String sql   = "select * from inacap.registro where rut=?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, ""+hs.getAttribute("usuario"));
        rs = st.executeQuery();
    }
    catch(SQLException e)
    {
        out.println("Excepción de SQL: " + e);
    }  
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/estiloAdmin.css" rel="stylesheet" type="text/css"/>
        <title>Administrador</title>
    </head>
    <body>         
            <div id="Ejecutador">
                <%while(rs.next()){ %>
                <h1> Bienvenido, <%= rs.getString("nombre") %></h1>
                <% } %>
                <p>En la seccion de la derecha estan todas las funciones que puedes hacer.</p>
            </div>
                <div class="clear1" ></div>
    </body>
</html>
