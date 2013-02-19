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
        //Listar todas las plantillas de una categori
    %>
    <li> <%-- Mostrar el nombre de la plantilla y su etiqueta --%>
        <ul>
            <%
                //Listar las propiedades de la plantilla
            %>
            <li> <%-- Mostrar el nombre de la propiedad --%>
                <ul>
                    <li>Etiqueta:</li>
                    <li>Formula:</li>
                    <li>Tipo Presentacion:</li>
                </ul>
            </li>
        </ul>
    </li>
</ul>
<%
    }
%>
