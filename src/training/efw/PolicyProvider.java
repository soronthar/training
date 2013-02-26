package training.efw;

import com.consisint.acsele.openapi.policy.Policy;
import com.consisint.acsele.openapi.policy.RiskUnit;
import com.consisint.acsele.openapi.policy.RiskUnitList;
import com.consisint.acsele.reports.providers.ReportProvider;

import java.util.Arrays;
import java.util.Vector;

public class PolicyProvider extends ReportProvider {
    public static final int RU_DATA_LEVEL = 4;
    public static final int RU_ID_LEVEL = 2;
    public static final int POLICY_ID_LEVEL = 0;
    Policy policy;

    public Vector loadPolicyIds(String ids[]) {
        return new Vector(Arrays.asList("00548050000200","00288100000200"));
    }

    public String getPolicyNumber(String ids[]) {
        String policyNumber=ids[POLICY_ID_LEVEL];
        ensurePolicyLoaded(policyNumber);
        return policyNumber;
    }

    private void ensurePolicyLoaded(String policyNumber) {
        if (this.policy==null || !policy.getPolicyNumber().equals(policyNumber)) {
            this.policy= Policy.loadByPolicyNumber(policyNumber);
        }
    }

    public Vector loadPolicyProperties(String ids[]) {
        return new Vector(policy.getDynamicData().getMetaData().getData().keySet());
    }

    public String getPolicyPropertyName(String ids[],String levelParam) {
        int level=Integer.valueOf(levelParam);
        return ids[level] ;
    }

    public String getPolicyPropertyValue(String ids[]) {
        return policy.getDynamicData().getInput(ids[RU_ID_LEVEL]);
    }

    public Vector loadRUProperties(String ids[]) {
        RiskUnit riskUnit = this.policy.getRiskUnit(ids[RU_ID_LEVEL]);
        return new Vector(riskUnit.getDynamicData().getMetaData().getData().keySet());
    }

    public String getRUPropertyName(String ids[]) {
        return ids[Integer.valueOf(RU_DATA_LEVEL)] ;
    }

    public String getRUPropertyValue(String ids[]) {
        RiskUnit riskUnit = this.policy.getRiskUnit(ids[RU_ID_LEVEL]);
        return riskUnit.getDynamicData().getInput(ids[RU_DATA_LEVEL]);
    }


    public Vector<String> loadRUIds(String ids[]) {
        ensurePolicyLoaded(ids[POLICY_ID_LEVEL]);
        Vector<String> result=new Vector<String>();

        RiskUnitList riskUnits = policy.listRU();
        for (RiskUnit riskUnit : riskUnits) {
            result.add(Long.toString(riskUnit.getId()));
        }
        return result;
    }

    @Override
    public void removePolicySession() {
    }
}
