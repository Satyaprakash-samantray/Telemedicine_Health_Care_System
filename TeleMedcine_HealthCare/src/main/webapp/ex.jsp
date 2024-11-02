<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Database Connection Test</title>
</head>
<body>
    <h1>Database Connection Test</h1>
    <%
        // JDBC URL, username, and password of MySQL server
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // Update with your DB URL
        String jdbcUser = "system"; // Update with your DB user
        String jdbcPassword = "system"; // Update with your DB password

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Load Oracle JDBC Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish the connection
            connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

            // Create a statement object
            statement = connection.createStatement();

            // Execute a query
            String sql = "SELECT * FROM record"; // Update with a valid table name
            resultSet = statement.executeQuery(sql);

            // Process the result set
            out.println("<table border='1'>");
            out.println("<tr><th>Username</th><th>Password</th></tr>");
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                out.println("<tr><td>" + username + "</td><td>" + password + "</td></tr>");
            }
            out.println("</table>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close the resources
            try { if (resultSet != null) resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (statement != null) statement.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (connection != null) connection.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>