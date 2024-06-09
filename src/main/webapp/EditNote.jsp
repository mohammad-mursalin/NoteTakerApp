<%@ page import="com.entities.NoteTaker" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Note</title>
  <%@include file="All_js_css.jsp"%>
</head>
<body>

    <%

      int note_id = Integer.parseInt(request.getParameter("note_id").trim());

      NoteTaker note = null;
      try {

        Session s = FactoryProvider.getFactory().openSession();

        note = s.get(NoteTaker.class, note_id);

        s.close();

      } catch (Exception e) {

        e.printStackTrace();
      }

    %>

<div class="container">

  <%@ include file="Navbar.jsp"%>

  <br>
  <h1>Please fill your note details</h1><br>

  <form action = "UpdateNote.jsp?note_id=<%=note_id%>" method="post" >
    <div class="form-group">
      <label for="title">Note Title</label>
      <input name="title" value="<%=note.getTitle()%>" type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter title here" required>
    </div>
    <div class="form-group">
      <label for="content">Note Content</label>
      <textarea name="content" class="form-control" id="content" placeholder="Enter note content here" required style="height: 300px"><%=note.getContent()%></textarea>
    </div>

    <div class="container text-center"><button type="submit" class="btn btn-success">Save Note</button></div>
  </form>

</div>


</body>
</html>
