<%@ page import="com.consisint.acsele.template.api.TipoPresentador" %>
<%@ page import="com.consisint.acsele.util.AcseleConf" %>
<%@ page import="com.consisint.acsele.openapi.product.Product" %>
<%@ page import="com.consisint.acsele.openapi.product.ProductRole" %>
<%@ page import="java.util.*" %>
<%@ page import="com.consisint.acsele.openapi.policy.*" %>
<%@ page import="com.consisint.acsele.openapi.thirdParty.ThirdParty" %>


<form method="POST">
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
        DynamicData polDynamicData = policy.getDynamicData();
        DynamicMetaData polDynamicMetaData = polDynamicData.getMetaData();

        String tipoVigencia = polDynamicData.getInput(AcseleConf.getProperty("TipVigencia"));
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
        Set<Map.Entry<String, Data>> entries = polDynamicMetaData.getData().entrySet();
        for (Map.Entry<String, Data> entry : entries) {
            String propertyName = entry.getKey();
            Data data = entry.getValue();
            if (!data.getTipoPresentador().equals(TipoPresentador.TAB) &&
                    !data.getTipoPresentador().equals(TipoPresentador.LABEL)) {
    %>
    <tr>
        <th style="text-align: left"><%=data.getEtiqueta()%>
        </th>
        <td style="text-align: left"><%=polDynamicData.getInput(propertyName)%>
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

//            thirdParty.findAllAddresses()
//            thirdParty.listPaymentModes()
//            thirdParty.getListRoles()

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
        DynamicData ruDynamicData = ru.getDynamicData();
        DynamicMetaData ruDynamicMetaData = ruDynamicData.getMetaData();
%>
<h2>Unidad de Riesgo <%=ru.getId()%>
</h2>
<b>Datos de la Unidad de Riesgo</b>
Vigencia desde <%=ru.getInitialDate()%> hasta <%=ru.getEndDate()%>
<br>
Plantila: <%=product.getRiskUnit()%>
<table border=1>
    <thead>
    <tr>
        <th>Propiedad</th>
        <th>Valor</th>
    </tr>
    </thead>
    <tbody>
    <%
        Set<Map.Entry<String, Data>> ruEntries = ruDynamicMetaData.getData().entrySet();
        for (Map.Entry<String, Data> entry : ruEntries) {
            String propertyName = entry.getKey();
            Data data = entry.getValue();
            if (!data.getTipoPresentador().equals(TipoPresentador.TAB) &&
                    !data.getTipoPresentador().equals(TipoPresentador.LABEL)) {
    %>
    <tr>
        <th style="text-align: left"><%=data.getEtiqueta()%>
        </th>
        <td style="text-align: left"><%=ruDynamicData.getInput(propertyName)%>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

<%
    InsuranceObjectList ioList = ru.listIO();

    for (InsuranceObject io : ioList) {
        DynamicData ioDynamicData = io.getDynamicData();
        DynamicMetaData ioDynamicMetaData = ioDynamicData.getMetaData();
%>
<h3><%=io.getDesc()%>
</h3>
<b>Datos del Objeto Asegurado</b>
Vigencia desde <%=io.getInitialDate()%> hasta <%=io.getEndDate()%>
<br>
Plantila: <%=ioDynamicMetaData.getTemplate().getLabel()%>
<table border=1>
    <thead>
    <tr>
        <th>Propiedad</th>
        <th>Valor</th>
    </tr>
    </thead>
    <tbody>
    <%
        Set<Map.Entry<String, Data>> ioEntries = ioDynamicMetaData.getData().entrySet();
        for (Map.Entry<String, Data> entry : ioEntries) {
            String propertyName = entry.getKey();
            Data data = entry.getValue();
            if (!data.getTipoPresentador().equals(TipoPresentador.TAB) &&
                    !data.getTipoPresentador().equals(TipoPresentador.LABEL)) {
    %>
    <tr>
        <th style="text-align: left"><%=data.getEtiqueta()%>
        </th>
        <td style="text-align: left"><%=ioDynamicData.getInput(propertyName)%>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
<b>Participaciones</b>
<ul>
    <%
        List<Participation> ioParticipations = io.listParticipations();
        for (Participation participation : ioParticipations) {
            ThirdParty thirdParty = participation.getThirdParty();
    %>
    <li><%=thirdParty.getName()%>
    </li>
    <%

        }
    %>
</ul>
<h4>Coberturas</h4>

<ul>
    <%
        List<Coverage> coverages = io.listCoverages();
        for (Coverage cov : coverages) {
    %>
    <li><%=cov.getDesc()%>
    </li>

    <%
        }
    %>
</ul>

<%
    }
%>


<%
    }
%>


<%
    }
%>
