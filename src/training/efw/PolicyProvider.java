package training.efw;

import com.consisint.acsele.openapi.policy.Policy;
import com.consisint.acsele.reports.providers.ReportProvider;

import java.util.Arrays;
import java.util.Vector;

public class PolicyProvider extends ReportProvider {
    Policy policy;

    public Vector loadPolicyIds(String ids[]) {
        return new Vector(Arrays.asList("00548050000200","00288100000200"));
    }

    public String getPolicyNumber(String ids[]) {
        String policyNumber=ids[0];
        this.policy=Policy.loadByPolicyNumber(policyNumber);
        return policyNumber;
    }

    public Vector loadPolicyProperties(String ids[]) {
        return new Vector(policy.getDynamicData().getMetaData().getData().keySet());
    }

    public String getPolicyPropertyName(String ids[]) {
        return ids[2] ;
    }

    public String getPolicyPropertyValue(String ids[]) {
        return policy.getDynamicData().getInput(ids[2]);
    }

    @Override
    public void removePolicySession() {
    }
}
