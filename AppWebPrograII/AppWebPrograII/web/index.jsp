
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cl.app.base.ConexionBD"%>
<%
    
//recuperar la sesion del usuario actual
    HttpSession hs= request.getSession(false);  //Recuperar la sesion ya abierta para el usuario
    
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
        <title>Tienda online</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>   
        <script language="JavaScript" type="text/javascript">
        </script>
        <div id="Principal">
            <div id="Encabezado"><%while(rs.next()){ %>
                Bienvenido, <%= rs.getString("nombre") %>
                <% } if(hs.getAttribute("rol")!=null){%>
                <a href="../CerrarSesion.jsp" class="Sesion">Cerrar Sesion</a>
            <%}%>
            </div>
                
                <a href="index.jsp"><div id="Cabezera"></div></a>
        
            <div id="Sesion">
                
                <form action="ValidarUsuario.jsp" method="post">
                    <br/>
                    Iniciar Sesion
                    <br/><br/>
                    Rut:    <input type="text" name="rutUsuario"><br/><br/>
                    Clave:<input type="password" name="claveUsuario"><br/><br/>
                    <input type="submit" value="Iniciar Sesion"><br/><br/>
                </form>
                <a href="Cliente/FormRegistrarCliente.jsp" class="o1">
                    Registrarse
                </a>
                <br/><br/>
            </div>
            
            <div id="Filtro1">
                Filtro de Busqueda:
                <br/><br/>
                Categorias:
                <br/>
                <input type="radio" value="SI" name="seleccion"> Acción 
                <br/>
                <input type="radio" value="SI" name="seleccion"> Aventura 
                <br/>
                <input type="radio" value="SI" name="seleccion"> Carrera
                <br/>
                <input type="radio" value="SI" name="seleccion"> Disparos 
                <br/>
                <input type="radio" value="SI" name="seleccion"> Estrategia
                <br/>
                <input type="radio" value="SI" name="seleccion"> Educación
                <br/>
                <input type="radio" value="SI" name="seleccion"> Simulador
                <br/>
                <input type="radio" value="SI" name="seleccion"> etc...
            </div>
            
            <div id="Filtro2">
                Filtro por Nombre:
                <br/><br/>
                Ingrese Nombre del Juego
                <input type="text" />
                <br/><br/>
            </div>
            
            <div id="Filtro4">
            
            </div>
            
            <div id="Filtro3">
                Filtro de Compras:
                <br/><br/>
                Destacados de la Semana:
                <br/>
                Tu mamá me mima. Lego hellokity.
                Pepito clavo un clavito. La vida me odia.
                Ahora no por favor. Quiero un 7,0 :c.
                Me eche el ramo.
                <br/><br/>
            </div>
            
            <div class="c2"></div>
            
            <div id="Izq">
                Columna Izquierda
                Columna Izquierda
                Columna Izquierda
                Columna Izquierda
                Columna Izquierda
                Columna Izquierda
            </div>
            
            <div id="Der">
                Columna Derecha Columna Derecha Columna Derecha
                Columna Derecha Columna Derecha Columna Derecha
                Columna Derecha Columna Derecha Columna Derecha
                Columna Derecha Columna Derecha Columna Derecha
                Columna Derecha Columna Derecha Columna Derecha
                Columna Derecha Columna Derecha Columna Derecha
                Columna Derecha Columna Derecha
            </div>
            
            <div class="clear"></div>
            
            <div id="pie"></div>
            </div>
    </body>
</html>
