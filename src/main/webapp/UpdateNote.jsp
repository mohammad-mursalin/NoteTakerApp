<%@ page import="com.entities.NoteTaker" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %><%--
  Created by IntelliJ IDEA.
  User: mursalin
  Date: 6/9/24
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Note</title>
  <%@include file="All_js_css.jsp"%>
</head>
<body>

<%

  int note_id = Integer.parseInt(request.getParameter("note_id").trim());

  try{

    Session s = FactoryProvider.getFactory().openSession();

    Transaction tx = s.beginTransaction();

    NoteTaker note = s.get(NoteTaker.class,note_id);

    s.delete(note);

    tx.commit();

    s.close();

    response.sendRedirect("ShowNotes.jsp");
  }
  catch (Exception e) {

    e.printStackTrace();
  }
%>

<div class="container">

  <%@ include file="Navbar.jsp"%>

  <br>
  <h1>Please fill your note details</h1>

  <form action = "" method="post" >
    <div class="form-group">
      <label for="title">Note Title</label>
      <input name="title" value="<%=%>" type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter title here" required>
    </div>
    <div class="form-group">
      <label for="content">Note Content</label>
      <textarea name="content" class="form-control" id="content" placeholder="Enter note content here" required style="height: 300px"></textarea>
    </div>

    <div class="container text-center"><button type="submit" class="btn btn-primary">Add</button></div>
  </form>
</div>
</body>
</html>
