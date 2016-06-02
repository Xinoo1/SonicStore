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
        <link href="../../css/estilosModificar.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Cuenta</title>
    </head>
    <body>
        <div id="Margen">
            
            <div id="Foto"></div>
            
            <div id="Información">
                <%while(rs.next()){%>
                <form action="ModificarCuenta.jsp">
                    <input type="hidden" name="rutUsuario" value="<%=rs.getString("rut")%>"/>
                <table>
                <tr>
                    <td>Nombre:</td> <td><input type="text" name="nombreUsuario" value="<%=rs.getString("nombre")%>"></td>
                </tr>
                <tr>
                    <td>Apellido Paterno: </td> <td><input type="text" name="apePatUsuario" value="<%=rs.getString("apellido_pat")%>"></td>
                </tr>
                <tr>
                    <td>Apellido Materno:</td> <td><input type="text" name="apeMatUsuario" value="<%=rs.getString("apellido_mat")%>"></td>
                </tr>
                <tr>
                    <td>fecha Nacimiento:</td> <td><input type="date" name="fechNacUsuario" value="<%=rs.getDate("fecha_nacimiento")%>"></td>
                </tr>
                <tr>
                    <td>Sexo:</td> 
                    <td>
                    Masculino<input type="radio" name="sexoUsuario" value="M" />
                    Femenino<input type="radio" name="sexoUsuario" value="F" /></td>
                </tr>
                <tr>
                    <td>direccion:</td> <td><input type="text" name="direccionUsuario" value="<%=rs.getString("direccion")%>"></td>
                </tr>
                <tr>
                    <td>Ciudad:</td> <td><input type="text" name="ciudadUsuario" value="<%=rs.getString("ciudad")%>"></td>
                </tr>
                <tr>
                    <td>Pais:</td> <td><input type="text" name="paisUsuario" value="<%=rs.getString("pais")%>"></td>
                </tr>
                <tr>
                    <td>Telefono:</td> <td><input type="text" name="telefonoUsuario" value="<%=rs.getString("telefono")%>"></td>
                </tr>
                <tr>
                    <td>Correo:</td> <td><input type="text" name="correoUsuario" value="<%=rs.getString("correo")%>"></td>
                </tr>
                <tr>
                    <td>Estado Civil:</td> <td><input type="text" name="estadoCivil" value="<%=rs.getString("estado_civil")%>"></td>
                </tr>
                
                   
            </table>
                    <input type="submit" value="Modificar"/>
                    </form>
            </div>
            
            
            <%}%>
        </div>
    </body>
</html>
