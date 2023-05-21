<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8" %>

<%!
  Connection connection;
  Statement statement;
  ResultSet resultSet;

  String driver = "org.mariadb.jdbc.Driver";
  String url = "jdbc:mariadb://localhost:3306/test";
  String uid = "root";
  String upw = "1234";
  String query = "select * from ttest";

%>

<html>
<head>
    <title>Title</title>
</head>
<body>

  <%
    try {
      Class.forName(driver);
      connection = DriverManager.getConnection(url, uid, upw);
      statement = connection.createStatement();
      resultSet = statement.executeQuery(query);

      while (resultSet.next()) {
        String id = resultSet.getString("id");
        String pw = resultSet.getString("pw");
        String name = resultSet.getString("name");
        String phone = resultSet.getString("phone");

        out.print("아이디: " + id + ", 비밀번호:" + pw + ",이름:" + name + ",전화번호:" + phone + "<br />");
      }
    }catch(Exception e){
     e.printStackTrace();
    }finally {
      try {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();

      } catch (Exception eX) {
        eX.printStackTrace();
      }
    }
  %>

</body>
</html>