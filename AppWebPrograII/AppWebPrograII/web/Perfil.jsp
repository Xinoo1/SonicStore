<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="cl.app.base.ConexionBD"%>
<%
    HttpSession hs= request.getSession(false);  //Recuperar la sesion ya abierta para el usuario
    if(hs==null||hs.getAttribute("rol")==null)
    {
        out.println("Error: ud. no tiene los permisos para ingresar a esta pagina");
        out.println("<a href='index.jsp'>Volver al Ingreso</a>");
        return;
    }
    String rut= request.getParameter("rut");
    ResultSet rs= null;
    try
    {   //     
        Connection conn = ConexionBD.getConexion();
       
            String sql   = "select * from inacap.registro where rut=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, rut);
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
        <link href="css/estilosPerfil.css" rel="stylesheet" type="text/css"/>
        <title>Perfil</title>
    </head>
    <body>
        <div id="Margen">
            
            <div id="Foto"></div>
            
            <div id="Información">
               <% while(rs.next()){ %>
                Rut:<%=rs.getString("rut")%>
                <br/>
                Nombre Completo:<%=rs.getString("nombre")+" "+rs.getString("apellido_pat")+" "+rs.getString("apellido_mat")%>
                <br/>
                Rol:<%=rs.getString("rol")%>
                <br/>
                Fecha Registro:<%=rs.getString("fecha_registro")%>
                <br/>
                Fecha ultimo Ingreso:<%=rs.getString("fecha_ultimo_ingreso")%>
                <br/>
                Fecha Nacimiento:<%=rs.getString("fecha_nacimiento")%>
                <br/>
                Sexo:<%=rs.getString("sexo")%>
                <br/>
                Dirección:<%=rs.getString("direccion")%>
                <br/>
                Ciudad:<%=rs.getString("ciudad")%>
                <br/>
                Pais:<%=rs.getString("pais")%>
                <br/>
                Telefono:<%=rs.getString("telefono")%>
                <br/>
                Correo:<%=rs.getString("correo")%>
                <br/>
                Estado Civil:<%=rs.getString("estado_civil")%>
                
            </div>
            
            <div id="Operaciones">
                <a href="Admin/Funciones/EliminarCuenta.jsp?rut=<%=rs.getString("rut")%>" class="opP">Eliminar Usuario</a>
                <br/><br/>
                <a href="Admin/Funciones/FormModificarCuenta.jsp?rut=<%=rs.getString("rut")%>" class="opP">Modificar Usuario</a>
                <br/><br/>
                <a href="ModificarImagen.jsp" class="opP">Cambiar Imagen</a>
            </div>
            <%}%>
        </div>
    </body>
</html>
