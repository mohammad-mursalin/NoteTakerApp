
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Note</title>
    <%@include file="All_js_css.jsp"%>
</head>
<body>

    <div class="container">

        <%@ include file="Navbar.jsp"%>

        <br>
        <h1>Please fill your note details</h1>

        <form action = "SaveNote.jsp" method="post" >
            <div class="form-group">
                <label for="title">Note Title</label>
                <input name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter title here" required>
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
