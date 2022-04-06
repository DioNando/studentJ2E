<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if (request.getParameter("submit") != null) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student_bdd", "root", "");

        pst = con.prepareStatement("UPDATE record SET name = ?, course = ?, fee = ? WHERE id = ?");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();

%>
<script>
    alert("Update success");
</script>
<%            }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student App Update</title>
        <link rel="icon" href="favicon.png">
        <link href="assets/style/css/custom-bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/bootstrap/bootstrap.bundle.min.js" type="text/javascript"></script>
    </head>
    <body>
        <header class="container-fluid text-center text-primary bg-light p-3">
            <h1>Student Registration System CRUD using JSP</h1>
        </header>
        <main>
            <div class="d-flex justify-content-center">
                <section class="w-50 p-4">
                    <h1 class="mb-4">Update student's informations</h1>
                    <form class="bg-light p-4 rounded" method="post" action="#">
                        <h2 class="text-primary">Form</h2>

                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/student_bdd", "root", "");

                            String id = request.getParameter("id");

                            pst = con.prepareStatement("SELECT * FROM record WHERE id = ?");
                            pst.setString(1, id);
                            rs = pst.executeQuery();

                            while (rs.next()) {


                        %>
                        <div class="d-flex flex-column">
                            <label class="my-2 form-label" for="idSt">ID</label>
                            <input class="my-2 form-label" type="text" name="id" id="idSt" value="<%= rs.getString("id")%>" disabled>
                        </div>
                        <div class="d-flex flex-column">
                            <label class="my-2 form-label" for="name">Student Name</label>
                            <input class="my-2 form-label" type="text" name="name" id="name" value="<%= rs.getString("name")%>" required>
                        </div>
                        <div class="d-flex flex-column">
                            <label class="my-2 form-label" for="course">Course</label>
                            <input class="my-2 form-label" type="text" name="course" id="course" value="<%= rs.getString("course")%>" required>
                        </div>
                        <div class="d-flex flex-column">
                            <label class="my-2 form-label" for="fee">Fee</label>
                            <input class="my-2 form-label" type="number" name="fee" id="fee" value="<%= rs.getString("fee")%>" required>
                        </div>

                        <% }%>
                        <div class="d-flex justify-content-evenly mt-3 mb-1">
                            <input type="reset" id="reset" value="Reset" name="reset" class="flex-fill btn btn-outline-secondary me-2">
                            <input type="submit" id="submit" value="Update" name="submit" class="flex-fill btn btn-primary ms-2">
                        </div>
                    </form>
                    <div class="text-end fs-4 m-4">
                        <a href="index.jsp">Back to the list</a>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
