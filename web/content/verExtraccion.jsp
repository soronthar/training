<%@ page import="com.consisint.acsele.reports.api.ReportManager" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page import="java.io.File" %>
<%@ page import="com.consisint.acsele.util.HtmlUtil" %>
<%
    ReportManager manager=new ReportManager();

    Map<ReportManager.Param,Object> params=new HashMap<ReportManager.Param, Object>();
    params.put(ReportManager.Param.INITIAL_DATE,"2012-11-01");
    params.put(ReportManager.Param.FINAL_DATE,"2012-11-30");
    params.put(ReportManager.Param.DIR_OUTPUT,"c:/test/");

    String extraccion = manager.generatedReport("PolicyExtraction", params, ReportManager.Format.XML);
    String name=extraccion.substring(extraccion.indexOf("PolicyExtraction"));
    String contenido = FileUtils.readFileToString(new File("c:/test/",name));

%>


<pre>
<%=contenido.replaceAll("<","&lt;").replaceAll(">","&gt;")%>
</pre>
