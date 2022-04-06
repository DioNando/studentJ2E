<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student_bdd", "root", "");
        
        pst = con.prepareStatement("INSERT INTO record(name, course, fee) VALUES (?,?,?)");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();

%>
<script>
    alert("Record add");
</script>
<%            }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student App</title>
        <link rel="icon" href="favicon.png">
        <link href="assets/style/css/custom-bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/bootstrap/bootstrap.bundle.min.js" type="text/javascript"></script>
    </head>
    <body>
        <header class="container-fluid text-center text-primary bg-light p-3">
            <h1>Student Registration System CRUD using JSP</h1>
        </header>
        <main class="container-fluid">
            <div class="row">
                <section class="col-12 col-lg-4 p-4 pe-lg-3">
                    <form class="bg-light p-4 rounded" method="post" action="#">
                        <h2 class="text-primary">Form</h2>
                        <div class="d-flex flex-column">
                            <label class="my-2 form-label" for="name">Student Name</label>
                            <input class="my-2 form-label" type="text" name="name" id="name" placeholder="Fullname" required>
                        </div>
                        <div class="d-flex flex-column">
                            <label class="my-2 form-label" for="course">Course</label>
                            <input class="my-2 form-label" type="text" name="course" id="course" placeholder="ex : Java, VueJS, PHP, ..." required>
                        </div>
                        <div class="d-flex flex-column">
                            <label class="my-2 form-label" for="fee">Fee</label>
                            <input class="my-2 form-label" type="number" name="fee" id="fee" required>
                        </div>
                        <div class="d-flex justify-content-evenly mt-3 mb-1">
                            <input type="reset" id="reset" value="Reset" name="reset" class="flex-fill btn btn-outline-secondary me-2">
                            <input type="submit" id="submit" value="Submit" name="submit" class="flex-fill btn btn-primary ms-2">
                        </div>
                    </form>
                </section>
                <section class="col-12 col-lg-8 p-4 ps-lg-3">
                    <table class="table table-responsive table-hover table-striped w-100" id="tbl-student">
                        <thead>
                        <th>ID</th>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th class="text-end">Fee</th>
                        <th class="text-center">Edit</th>
                        <th class="text-center">Delete</th>
                        </thead>
                        <tbody>

                            <%
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/student_bdd", "root", "");
                                String query = "SELECT * FROM record";
                                Statement st = con.createStatement();
                                rs = st.executeQuery(query);

                                while (rs.next()) {
                                    String id = rs.getString("id");

                            %>
                            <tr>                                   
                                <td><%= rs.getString("id")%></td>
                                <td><%= rs.getString("name")%></td>
                                <td><%= rs.getString("course")%></td>
                                <td class="text-end"><%= rs.getString("fee")%></td>
                                <td class="text-primary text-center"><a href="update.jsp?id=<%= id %>">Edit</a></td>
                                <td class="text-primary text-center"><a href="delete.jsp?id=<%= id %>">Delete</a></td>
                            </tr>
                            <%                                    }
                            %>
                        </tbody>
                    </table>
                </section>
            </div>
        </main>
    </body>
</html>
