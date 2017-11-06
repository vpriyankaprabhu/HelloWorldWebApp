<html>
<head>
    <title>Hello World Application JSP Page</title>
</head>
<body bgcolor=white>
<table border="0">
    <tr>
        <td>
            <h1>Hello World Application JSP Page</h1>
            <p> This is the output from JSP page that is part of the Hello World application.
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <p><%= new java.lang.String("Hello, World from JSP Page!!") %></p>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <p>Today's Date : <%= new java.util.Date() %></p>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <a href="index.html"> Back to Welcome Page.</a>
        </td>
    </tr>
</table>
</body>
</html>
