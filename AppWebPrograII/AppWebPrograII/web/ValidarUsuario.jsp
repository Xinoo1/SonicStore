<%@page import="cl.app.base.ConexionBD"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*,cl.app.base.ConexionBD.*" %>
<%
    //Recuperar los datos del login
    String rut= request.getParameter("rutUsuario").trim();
    String clave = request.getParameter("claveUsuario");
    ResultSet rs= null;
    try
    {      
        /*Formato sin centralizar   
        Class.forName("org.apache.derby.jdbc.ClientDriver");    
        
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/DBProyectoWeb", "inacap", "inacap"); 
        */
        //Formato centralizado
        Connection conn = ConexionBD.getConexion();
               
        //consulta de usuario y clave
        String sql   = "select * from inacap.registro where rut=? and clave=?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, rut);
        st.setString(2, clave);
        rs = st.executeQuery();
        //update de ingreso(actualizar la fecha_ultimo_ingreso)
        String sql2 ="update registro set fecha_ultimo_ingreso=current_timestamp where rut=?";
        PreparedStatement st2 = conn.prepareStatement(sql2);
        st2.setString(1, rut);
        if(rs.next()==true && rs.getString("activo").equalsIgnoreCase("s")&&rs.getString("eliminado").equalsIgnoreCase("N"))
        {
            //Ejecutar update
            st2.execute();
            //Iniciar sesion
            HttpSession hs=request.getSession(true);       
            hs.setAttribute("usuario", rut);
            hs.setAttribute("rol", rs.getString("rol"));
            
            //Asignar pagina a redireccionar por rol
            if(rs.getString("rol").equals("admin"))
                response.sendRedirect("Admin/GestorAdmin.jsp");
            else if(rs.getString("rol").equals("editor"))
                response.sendRedirect("Editor/InicioEditor.jsp");
            else if(rs.getString("rol").equals("cliente"))
                response.sendRedirect("Cliente/InicioCliente.jsp");
            else if(rs.getString("rol").equals("vendedor"))
                response.sendRedirect("Vendedor/InicioVendedor.jsp");
        } else
        {
                out.println("Error: Usuario o clave erróneos.");
                out.println("<br /><br />");
                out.println("<a href='index.jsp'>Volver al Ingreso</a>");
        }
       
    }
    catch(SQLException e)
    {
        out.println("Excepción de SQL: " + e);
    }     
 

    


%>