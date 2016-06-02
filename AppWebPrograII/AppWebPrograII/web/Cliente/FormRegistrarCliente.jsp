<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilosRegistro.css"/>
        <title>Registro</title>
    </head>
    <body>
        
        <div id="Princ">
            
        <div id="Cabe"></div>
        
        <div id="Registro">
        <form action="RegistrarCliente.jsp" method="post">
            <table>
                <tr>
                    <td>Rut:</td> <td><input type="text" name="rutUsuario"></td>
                </tr>
                <tr>
                    <td>Nombre:</td> <td>  <input type="text" name="nombreUsuario"></td>
                </tr>
                <tr>
                    <td>Apellido Paterno: </td> <td>  <input type="text" name="apePatUsuario"></td>
                </tr>
                <tr>
                    <td>Apellido Materno:</td> <td><input type="text" name="apeMatUsuario"></td>
                </tr>
                <tr>
                    <td>Contraseña:</td> <td><input type="password" name="claveUsuario"></td>
                </tr>
                <tr>
                    <td>Repita contraseña:</td> <td><input type="password" name="clave2Usuario"></td>
                </tr>
                <tr>
                    <td>fecha Nacimiento:</td> <td><input type="date" name="fechNacUsuario"></td>
                </tr>
                <tr>
                    <td>Sexo:</td> 
                    <td>
                    Masculino<input type="radio" name="sexoUsuario" value="M" />
                    Femenino<input type="radio" name="sexoUsuario" value="F" /></td>
                </tr>
                <tr>
                    <td>direccion:</td> <td><input type="text" name="direccionUsuario"></td>
                </tr>
                <tr>
                    <td>Ciudad:</td> <td><input type="text" name="ciudadUsuario"></td>
                </tr>
                <tr>
                    <td>Pais:</td> <td><input type="text" name="paisUsuario"></td>
                </tr>
                <tr>
                    <td>Telefono:</td> <td><input type="text" name="telefonoUsuario"></td>
                </tr>
                <tr>
                    <td>Correo:</td> <td><input type="text" name="correoUsuario"></td>
                </tr>
                <tr>
                    <td>Estado Civil:</td> <td><input type="text" name="estadoCivil"></td>
                </tr>
                <tr>
                    <td id="bot" colspan="2"><input type="submit" value="Registrarse"></td>
                </tr>
            </table>
            <br/><br/>
            
        </form>
        </div>
        
        <div class="clear3"></div>
        
        <div id="PiePag">
            <a href="../Editor/FormRegistrarEditor.jsp">Registrar Editor</a>
            <a href="../Vendedor/FormRegistrarVendedor.jsp">Registrar Vendedor</a>
            
        </div>
            
        </div>
    </body>
</html>
