<%@ page import="com.entities.NoteTaker" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <%@include file="All_js_css.jsp"%>
</head>
<body>

<div class="container">

    <%@ include file="Navbar.jsp"%>

    <br>

    <%
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        NoteTaker note = new NoteTaker(title, content, new Date());

        try{

            Session session1 = FactoryProvider.getFactory().openSession();

            Transaction transaction = session1.beginTransaction();

            session1.save(note);

            transaction.commit();

            session1.close();
        }catch (Exception e) {

            e.printStackTrace();
        }

    %>

    <h2>Note Added Successfully!</h2>
    <p>Title:  <%= title %> </p>
    <p>Content:  <%= content %> </p>

    </div>
</body>
</html>
