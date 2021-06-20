<%-- 
    Document   : error
    Created on : May 25, 2021, 11:56:24 PM
    Author     : anime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        ${requestScope.ERROR}
        ${requestScope.url}
    </body>
</html>
