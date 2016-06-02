
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cl.app.base.ConexionBD"%>
<!DOCTYPE html>
<%
    
//recuperar la sesion del usuario actual
    HttpSession hs= request.getSession(false);  //Recuperar la sesion ya abierta para el usuario
    if(hs==null||hs.getAttribute("rol")==null||
            ! hs.getAttribute("rol").equals("admin"))
    {
        out.println("Error: ud. no tiene los permisos para ingresar a esta pagina");
        out.println("<a href='../index.jsp'>Volver al Ingreso</a>");
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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloAdmin.css" rel="stylesheet" type="text/css"/>
        <title>Administrador</title>
    </head>
    <body>
        <div id="Principal">
            <div id="Encabezado">
                 <%while(rs.next()){ %>
                Bienvenido, <%= rs.getString("nombre") %>
                
                <a href="../CerrarSesion.jsp" class="Sesion">Cerrar Sesion</a>
            </div>
            
            <a href="../index.jsp"><div id="Cabezera"></div></a>
            
            <div id="Menu">
                <li><a href="GestorAdmin.jsp" class="op" >Inicio</a></li>
                <li><a href='../Perfil.jsp?rut=<%= rs.getString("rut") %>'>Perfil</a></li>
                <li><a href="Catalogo.jsp" class="op" >Catalogo Productos</a></li>
                <li><a href="Foro.jsp" class="op" >Foro</a></li>
                <li><a href="Mensajes.jsp" class="op" >Centro de Mensajes</a></li>
            </div>
            
            <div id="Menu2">
                <br/>
                <ol>
                    <li class="opM2" ><a href="GestorAdmin.jsp?accion=1"> Gestionar Usuarios</a></li>
                    <li class="opM2" ><a href="GestorAdmin.jsp?accion=2"> Ver usuarios Eliminados</a></li>
                    <li class="opM2" ><a href="GestorAdmin.jsp?accion=3"> Ver Todos los usuarios</a></li>
                </ol>
            </div>
            
            <div id="Ejecutador1">
               
              <%String acc= request.getParameter("accion");
    if(acc!=null)
    {
        if(acc.equals("1")) //Mostrar GestionCuentas.jsp con usuarios en el sistema -- por defecto
        {
            out.print("<iframe width='590' height='315' src='Funciones/GestionCuentas.jsp' frameborder='0' allowfullscreen></iframe> ");
        }
        if(acc.equals("2")) //Mostrar GestionCuentas.jsp solo usuarios eliminados
        {
            out.print("<iframe width='590' height='315' src='Funciones/GestionCuentas.jsp?accion=1' frameborder='0' allowfullscreen></iframe> ");
        }
        if(acc.equals("3")) //Mostrar GestionCuentas.jsp solo Todos los usuarios eliminados y no 
        {
            out.print("<iframe width='590' height='315' src='Funciones/GestionCuentas.jsp?accion=2' frameborder='0' allowfullscreen></iframe> ");
        }
        
           
    }
    else
    {   
        out.print("<iframe width='590' height='315' src='Funciones/PresentacionAdmin.jsp' frameborder='0' allowfullscreen></iframe> ");

    }    %>
             
            
            </div>
                
            <div class="clear1" ></div>
            
            <div id="PiePagina">
               
            </div>
            <% } %>
        </div>
    </body>
</html>
