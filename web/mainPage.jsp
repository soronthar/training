<%@ page import="training.util.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String contentToInclude = (String) request.getParameter("content");


    User user = (User) session.getAttribute("user");
    if (request.getParameter("errorCode") != null) {
        contentToInclude = "error.jsp";
    }

    if (contentToInclude==null) {
        contentToInclude="content.jsp";
    }
%>

<h1>Ejemplos de OpenAPI</h1>
<table border="1" width="90%">
    <tr>
        <td width="20%" style="vertical-align: text-top">
            <ul>
                <li><a href="?content=/content/listarPlantillas.jsp">Listado de Plantillas</a></li>
                <li><a href="?content=/content/listarProductos.jsp">Listado de Productos</a></li>
                <li><a href="?content=/content/consultarPoliza.jsp">Listado de Polizas</a></li>
            </ul>
        </td>
        <td width="70%">
            <jsp:include page="<%=contentToInclude%>"/>
        </td>
    </tr>
</table>
</body>
</html>
