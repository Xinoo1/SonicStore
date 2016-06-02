<%@page import="java.sql.*"%>
<%@page import="cl.app.base.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     
      
        try{  
        Connection conn = ConexionBD.getConexion();
        ResultSet rs=null;
        String rut    = request.getParameter("rutUsuario");
        String sql   ="select rut from inacap.registro where rut=?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1,rut);
        rs=st.executeQuery();
        if(rs.next()==true)
        {
            // Recuperar los datos de registro.
 
    String nom    = request.getParameter("nombreUsuario");
    String apePat = request.getParameter("apePatUsuario");
    String apeMat = request.getParameter("apeMatUsuario");
    String fechaNac = request.getParameter("fechNacUsuario");
    String sexo = request.getParameter("sexoUsuario");
    String direccion = request.getParameter("direccionUsuario");
    String ciudad = request.getParameter("ciudadUsuario");
    String pais = request.getParameter("paisUsuario");
    String telefono = request.getParameter("telefonoUsuario");
    String correo = request.getParameter("correoUsuario");
    String estadoCivil = request.getParameter("estadoCivil");
    String rol= request.getParameter("rolUsuario");
   
   
// Validaciones de datos.
   
    //Validar rut
    if(rut.trim().length()==0)
    {
        out.println("Error: el rut es obligatorio!");
        return;
    }
    
    //Validar nombre
    else if(nom.trim().length()==0)
    {
        out.println("Error: el nombre es obligatorio!");
        return;
    }
    //Validar apellido paterno
    else if(apePat.trim().length()==0)
    {
        out.println("Error: El apellido paterno es obligatoria!");
        return;
    }    
   //Validar apellido materno
    else if(apeMat.trim().length()==0)
    {
        out.println("Error: El apellido materno es obligatoria!");
        return;
    }
   //Validar fecha nacimiento
    else if(fechaNac.trim().length()==0)
    {
        out.println("Error: La fecha de nacimiento es obligatoria!");
        return;
    }
   //Validar sexo
    else if(sexo.trim().length()==0)
    {
        out.println("Error: El sexo es obligatoria!");
        return;
    }
   //Validar direccion
    else if(direccion.trim().length()==0)
    {
        out.println("Error: La dirección es obligatoria!");
        return;
    }
   //Validar ciudad
    else if(ciudad.trim().length()==0)
    {
        out.println("Error: la ciudad es obligatoria!");
        return;
    }
   //Validar Pais
    else if(pais.trim().length()==0)
    {
        out.println("Error: El pais es obligatoria!");
        return;
    }
   //Validar Telefono
    else if(telefono.trim().length()==0)
    {
        out.println("Error: El telefono es obligatoria!");
        return;
    }
   //Validar Correo
    else if(correo.trim().length()==0)
    {
        out.println("Error: El Correo es obligatoria!");
        return;
    }
    else 
    {
          String sql2 ="update registro set nombre=?,apellido_pat=?,apellido_mat=?,sexo=?,direccion=?,ciudad=?,pais=?,telefono=?,correo=?,estado_civil=?,fecha_nacimiento=? where rut=?";  
        
        sql   = "update registro set nombre=?,apellido_pat=?,apellido_mat=?,sexo=?,direccion=?,ciudad=?,pais=?,telefono=?,correo=?,estado_civil=?,fecha_nacimiento=? where rut=?";
        st = conn.prepareStatement(sql);
        st.setString(1, nom);
        st.setString(2, apePat);
        st.setString(3, apeMat);
        st.setString(4, sexo);
        st.setString(5, direccion);
        st.setString(6, ciudad);
        st.setString(7, pais);
        st.setString(8, telefono);
        st.setString(9, correo);
        st.setString(10, estadoCivil);
        st.setString(11, fechaNac);
        st.setString(12, rut);
        st.execute();
       
        
            out.println("Usuario Modificado Correctamente\n ");
            out.print("<br/>Has click <a href='../../index.jsp'>aqui</a> para volver al inicio.");
            
                      
        
       
    }          
        }
        else{
            out.print("El usuario no esta registrado");
   
        }
    }
    catch(SQLException e)
    {

                out.println("Error: No se pudo modificar el usuario");
                out.println("<br /><br />");
                out.println("<a href='FormRegistrarCliente.jsp'>Volver al registro</a>");
                out.println("Error: " +e);
    } 
    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
  


      
    </body>
</html>