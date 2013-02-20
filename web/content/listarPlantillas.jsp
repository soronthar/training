<%@ page import="com.consisint.acsele.template.server.CotType" %>
<%@ page import="com.consisint.acsele.template.api.Template" %>
<%@ page import="com.consisint.acsele.template.api.TemplateList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.consisint.acsele.template.api.Property" %>
<%@ page import="java.util.List" %>
<form method="POST">
    <select name="cottype">
        <%
            for (CotType cotType : CotType.values()) {
                if (cotType.getDescription() != null &&
                        !cotType.getDescription().trim().equals("")) {
        %>
        <option value="<%=cotType.getType()%>"><%=cotType.getDescription()%>
        </option>
        <%
                }
            }
        %>
    </select>
    <input type="submit" name="Cargar"/>
</form>
<%
    String cot = request.getParameter("cottype");
    if (cot != null) {
%>
<ul>
    <%
        CotType type = CotType.getCotType(Integer.parseInt(cot));
        TemplateList list = TemplateList.Impl.getByCategory(type);
        for (Template template : list) {
    %>
    <li><%=template.getLabel()%> (<%=template.getName()%>)
    <ul>
<%
    List<Property> properties = template.properties();
    for (Property property : properties) {
%>
    <li><%=property.getDescription()%>
        <ul>
            <li>Etiqueta: <%=property.getEtiqueta()%></li>
            <li>Formula: <%=property.getFormula()%></li>
            <li>Tipo Presentacion: <%=property.getTipoPresentador().getTipo()%></li>
        </ul>
    </li>
<%
    }
%>
    </ul>
    </li>
    <%
        }
    %>
</ul>
<% }
%>
