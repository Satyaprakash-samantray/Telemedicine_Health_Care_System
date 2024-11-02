import java.sql.*;

public class Test {
    public static void main(String[] args) {
        Connection con = null;
        Statement smt = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            smt = con.createStatement();
            int rowsAffected = smt.executeUpdate("insert into student values('dibyaa','Dibya123','dibya03','dib02')");
            System.out.println(rowsAffected + " row(s) inserted.");
            System.out.println("Connected to Oracle database.");
        } catch (ClassNotFoundException e) {
            System.out.println("Oracle JDBC driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (smt != null) {
                    smt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
