<%@ page import="com.entities.NoteTaker" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
</head>
<body>


    <%

        int note_id = Integer.parseInt(request.getParameter("note_id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        try {
            Session s = FactoryProvider.getFactory().openSession();

            Transaction tx = s.beginTransaction();

            NoteTaker note = s.get(NoteTaker.class,note_id);

            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());

            tx.commit();

            s.close();

            response.sendRedirect("ShowNotes.jsp");

        } catch (Exception e) {

        e.printStackTrace();
        }

    %>

</body>
</html>
