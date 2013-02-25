package training.efw;

import com.consisint.acsele.reports.ParameterBean;
import com.consisint.acsele.reports.providers.ReportProvider;

import java.util.Arrays;
import java.util.Vector;

/**
 * Created with IntelliJ IDEA.
 * User: Rafael Alvarez
 * Date: 1/10/13
 * Time: 3:37 PM
 * To change this template use File | Settings | File Templates.
 */
public class AnotherSampleProvider extends ReportProvider {
    ParameterBean parameterBean;

    @Override
    public void setParameters(Object parametersProviders) {
        this.parameterBean = (ParameterBean) parametersProviders;
    }

    public String getStartDate(String[] ids) {
        return "Another Date";
    }

    public Vector loadSomeIds(String[] ids) {
        return new Vector(Arrays.asList("5", "6", "7", "8"));
    }

    @Override
    public void removePolicySession() {
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
