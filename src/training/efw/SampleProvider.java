package training.efw;

import com.consisint.acsele.reports.ParameterBean;
import com.consisint.acsele.reports.providers.ReportProvider;

import java.util.Arrays;
import java.util.Vector;

/**
 * Created with IntelliJ IDEA.
 * User: Rafael Alvarez
 * Date: 1/10/13
 * Time: 2:32 PM
 * To change this template use File | Settings | File Templates.
 */
public class SampleProvider extends ReportProvider {
    ParameterBean parameterBean;

    @Override
    public void setParameters(Object parametersProviders) {
        this.parameterBean = (ParameterBean) parametersProviders;
    }

    public String getStartDate(String[] id) {
        return (String) this.parameterBean.getInitialDate();
    }

    public String getFinishDate(String[] id) {
        return (String) this.parameterBean.getFinalDate();
    }

    public String getEmptyValue(String[] id) {
        return "";
    }

    public String echo(String[] ids, String first, String second) {
        return first + " - " + second;
    }

    public String showIds(String[] ids) {
        StringBuilder builder=new StringBuilder();
        for (String id : ids) {
            builder.append(id).append(" - ");
        }
        return builder.toString();
    }

    public double getId(String[] ids) {
        return Double.parseDouble(ids[0]);
    }

    public Vector loadSomeIds(String[] ids) {
        return new Vector(Arrays.asList("1","2","3","4"));
    }


    @Override
    public void removePolicySession() {
    }
}
