<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ia_generativa?useSSL=false&serverTimezone=UTC", "root", "");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error de conexión: " + e.getMessage() + "</p>");
    }
%>