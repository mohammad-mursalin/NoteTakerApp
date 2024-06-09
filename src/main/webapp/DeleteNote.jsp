<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.entities.NoteTaker" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Notes</title>
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
</body>
</html>
