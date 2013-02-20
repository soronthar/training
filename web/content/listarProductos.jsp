<%@ page import="com.consisint.acsele.openapi.product.ProductList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.consisint.acsele.openapi.product.Product" %>
<%@ page import="com.consisint.acsele.openapi.policy.Event" %>
<%@ page import="java.util.List" %>
<form method="POST">
    <select name="productId">
        <%
            ProductList productsActives = ProductList.Impl.getProductsActives();
            for (Product product : productsActives) {
        %>
        <option value="<%=product.getId()%>"><%=product.getName()%>

                <%
    }
%>
    </select>
    <input type="submit" name="Cargar">
</form>

<%
    String productId = request.getParameter("productId");
    if (productId != null) {
        Product product = Product.Impl.getProduct(Integer.parseInt(productId));

%>
<h2><%=product.getName()%>
</h2>
<table width="100%" border="1">
    <tr>
        <th>Poliza:</th>
        <td><%= product.getPolicyTemplate().getName()  %> (<%= product.getPolicyTemplate().getLabel()  %>)
        </td>
    </tr>
    <tr>
        <th>Ciclo de Vida:</th>
        <td>
            <ul>
                <%

                    List<Event> allEvents = product.getAllEvents();
                    for (Event event : allEvents) {
                %>
                <li><%=event.getName()%> (<%=event.getCategory().name()%>)
                </li>
                <%
                    }
                %>
            </ul>
        </td>
    </tr>

</table>


<%
    }
%>
