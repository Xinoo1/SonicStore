
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
    String acc= request.getParameter("accion");
    
    ResultSet rs = null;
    try
    {   //     
        Connection conn = ConexionBD.getConexion();
       if(acc!=null)
        {
            if(acc.equalsIgnoreCase("1"))
            {
                //Mostrar Usuarios Eliminados
            String sql   = "select * from inacap.registro where eliminado=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "S");
            rs = st.executeQuery();
            }
            if(acc.equalsIgnoreCase("2"))
            {
            //Mostrar todos los usuarios
            String sql   = "select * from inacap.registro";
            PreparedStatement st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            }
        }
        else
        {
            //Mostrar Usuarios No eliminados
            String sql   = "select * from inacap.registro where eliminado=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "N");
            rs = st.executeQuery();
        }
        
        
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
                <table border="2" width="558">
            <tr>
                <td>Rut</td>
                <td>Nombre</td>
                <td>Apellido Paterno</td>
                <td>Activo</td>
                <td>Rol</td>
                <td>Fecha Registro</td>
                <td>Fecha Ultimo Ingreso</td>
                <td>Operaciones</td>
            </tr>
            <%while (rs.next() ){ %>
            <tr>
                <td><%=rs.getString("rut")%></td>
                <td><%=rs.getString("nombre")%></td>
                <td><%=rs.getString("apellido_pat")%></td>
                <td><% if ( rs.getString("activo").equalsIgnoreCase("S") ) { %>
                    <a href="DesactivarCuenta.jsp?rut=<%=rs.getString("rut") %>">
                        <img src="../../img/circuloverde.png">
                    </a>
                    <% } %>
                    <% if ( rs.getString("activo").equalsIgnoreCase("N") ) { %>
                    <a href="ActivarCuenta.jsp?rut=<%=rs.getString("rut")%>">
                        <img src="../../img/circulorojo.png">
                    </a>
                    <% } %>
                </td>
                <td><%=rs.getString("rol")%></td>
                <td><%=rs.getTimestamp("fecha_registro")%></td>
                <td><%=rs.getTimestamp("fecha_ultimo_ingreso")%></td>
                
                <td>
                    <a href="EliminarCuenta.jsp?rut=<%=rs.getString("rut")%>">
                        <img src="../../img/eliminar.png"/>
                    </a>
                    <a href="FormModificarCuenta.jsp?rut=<%=rs.getString("rut")%>">
                        <img src="../../img/modificar.png"/>
                    </a>
                    <a href="../../Perfil.jsp?rut=<%=rs.getString("rut")%>">
                        <img src="../../img/perfil.png"/>
                    </a>
                    
                </td>
                
            </tr>
            <%}%>
        </table>
    </div>
                <div class="clear1" ></div>
    </body>
</html>
