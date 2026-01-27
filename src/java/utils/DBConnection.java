package utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    //private static final String JDBC_DRIVER = "jdbc:postgresql://192.168.1.101:5432/tdbrd";
    private static final String JDBC_DRIVER = "jdbc:postgresql://localhost:5432/tdbrd";
    private static final String USER = "postgres";
    private static final String USER_PWD = "postgres"; //prod

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (Exception e) {
            System.out.println("*****Cant load the database driver***********");
        }
        return DriverManager.getConnection(JDBC_DRIVER, USER, USER_PWD);
    }
}

