<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");

    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/student_bdd", "root", "");

    pst = con.prepareStatement("DELETE FROM record WHERE id = ?");
    pst.setString(1, id);
    pst.executeUpdate();
%>
