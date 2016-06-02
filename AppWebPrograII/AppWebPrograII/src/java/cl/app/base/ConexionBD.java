package cl.app.base;
import java.sql.*;

public class ConexionBD 
{
    private static String url = "jdbc:derby://localhost:1527/DBProyectoWeb";
    private static String user= "inacap";
    private static String pass= "inacap";
    private static Connection conn = null;
    
    public static Connection getConexion()
    {
        try
        {
            if(conn==null)
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                conn = DriverManager.getConnection(url,user,pass);
            }

            return conn;
        }
        catch(Exception e)
        {
            System.err.println("Excepción de Conexión de SQL: " + e);
            return null;
        }
    }
}
