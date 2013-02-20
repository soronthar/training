<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="com.consisint.acsele.template.api.TipoPresentador" %>
<%@ page import="com.consisint.acsele.util.AcseleConf" %>
<%@ page import="com.consisint.acsele.openapi.product.Product" %>
<%@ page import="com.consisint.acsele.openapi.product.ProductRole" %>
<%@ page import="java.util.*" %>
<%@ page import="com.consisint.acsele.openapi.policy.*" %>
<%@ page import="com.consisint.acsele.openapi.thirdParty.ThirdParty" %>


<form method="post">
    Numero de Poliza: <input type="text" name="policyNumber"> <input type="submit" name="Cargar"> <br>

    Algunos numeros de poliza validos:
    <ul>

        <li>00548050000200</li>
        <li>00288100000200</li>
        <li>1069337</li>
        <li>1069328</li>
        <li>00537200003700</li>
    </ul>

</form>

<%
    String numeroPoliza = request.getParameter("policyNumber");
    if (numeroPoliza != null) {
        Policy policy = Policy.loadByPolicyNumber(numeroPoliza);
        Product product = policy.getProduct();
        DynamicData dynamicData = policy.getDynamicData();
        DynamicMetaData dynamicMetaData = dynamicData.getMetaData();

        String tipoVigencia = dynamicData.getInput(AcseleConf.getProperty("TipVigencia"));
%>
<h1>Poliza <%=numeroPoliza%> (<%=product.getName()%>) </h1>

<b>Datos de la Poliza</b>

Vigencia <%=tipoVigencia%> desde <%=policy.getInitialDate()%>  hasta <%=policy.getEndDate()%>
<br>
Plantila: <%=product.getPolicyTemplate().getLabel()%>
<table border=1>
    <thead>
    <tr>
        <th>Propiedad</th>
        <th>Valor</th>
    </tr>
    </thead>
    <tbody>
    <%
        Set<Map.Entry<String, Data>> entries = dynamicMetaData.getData().entrySet();
        for (Map.Entry<String, Data> entry : entries) {
            String propertyName = entry.getKey();
            Data data = entry.getValue();
            if (!data.getTipoPresentador().equals(TipoPresentador.TAB) &&
                    !data.getTipoPresentador().equals(TipoPresentador.LABEL)) {
    %>
    <tr>
        <th style="text-align: left"><%=data.getEtiqueta()%>
        </th>
        <td style="text-align: left"><%=dynamicData.getInput(propertyName)%>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

<b>Participaciones de la Poliza</b>
<%
    List<ProductRole> policyRoles = product.getPolicyRoles();

    for (ProductRole role : policyRoles) {
        Collection<Participation> participationsByRole = policy.getParticipationsByRole(Arrays.asList(role.getDesc()));
%>

Rol: <%=role.getDesc()%>
<ul>
    <%
        for (Participation participation : participationsByRole) {
            ThirdParty thirdParty = participation.getThirdParty();
    %>
    <li><%=thirdParty.getName()%>
    </li>
    <%
        }
    %>
</ul>
<%
    }
%>

<%
    RiskUnitList riskUnits = policy.listRU();
    for (RiskUnit ru : riskUnits) {
%>
<h2>Unidad de Riesgo <%=ru.getId()%>
</h2>
<b>Datos de la Unidad de Riesgo</b>
Vigencia desde <%=ru.getInitialDate()%> hasta <%=ru.getEndDate()%>
<br>
<b>Tareas:</b>
<ul>
    <li>Mostrar los datos de la unidad de riesgo. es una tabla analoga a la de la poliza</li>
</ul>
<br>

<h3>Objetos Asegurados</h3>
<br>
<b>Tareas:</b>
<ul>
    <li>Listar los objetos asegurados de la unidad de riesgo, mostrando la descripcion y el plan
    <li>Mostrar los datos de cada objeto asegurado.
    <li>Mostrar las participaciones de cada objeto asegurado.
    <li>Mostrar las coberturas del objeto asegurado (solo la descripcion.
</ul>

<h4>Coberturas</h4>
<ul>
    <li>Cobertura A</li>
    <li>Cobertura B</li>
    <li>Cobertura C</li>
</ul>
<%
    }
%>


<%
    }
%>
