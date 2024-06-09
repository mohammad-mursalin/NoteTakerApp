<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.entities.NoteTaker" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mursalin
  Date: 6/9/24
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Notes</title>
  <%@include file="All_js_css.jsp"%>
</head>
<body>

    <div class="container">

      <%@ include file="Navbar.jsp"%>

      <br>

      <h1>ALL NOTES : </h1><br>

      <%

        Session s = FactoryProvider.getFactory().openSession();

        Query q = s.createQuery("from NoteTaker ");

        List<NoteTaker> allNotes = q.list();

        s.close();

        for(NoteTaker note : allNotes) {

      %>

      <div class="card mt-3" >
        <img class="card-img-top m-4" src="img/notebook.png" alt="Card image cap" style="max-width: 90px">
        <div class="card-body px-5">
          <h5 class="card-title"><%= note.getTitle() %></h5>
          <p class="card-text"><%= note.getContent() %></p>

          <div class="container text-center mt-2">

            <a href="DeleteNote.jsp?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
            <a href="#" class="btn btn-primary">Update</a>

          </div>
        </div>
      </div>

      <%
        }
      %>

    </div>

</body>
</html>
