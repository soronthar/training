package training.init;

import com.consisint.acsele.UserInfo;
import com.consisint.acsele.management.maintainer.User;
import com.consisint.acsele.security.api.Authenticator;
import com.consisint.acsele.util.HibernateUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

public class TrainingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        setUserInfo();
        net.sf.hibernate.Session hibernateSession = null;
        try {
            hibernateSession = HibernateUtil.getSession();
            chain.doFilter(request, response);
        } finally {
            HibernateUtil.closeSession(hibernateSession/*,this*/);
        }


    }

    private void setUserInfo() {
        Locale locale = new Locale("es", "PE");
        String login="mcerra";
        String password="mcerra";

        if (Authenticator.authenticateUser(login, password)) {
            UserInfo.setCountry("VE");
            UserInfo.setUser(login);
            UserInfo.setUserID("2623");
            UserInfo.setLocale(locale);
            UserInfo.setLanguage(locale.getLanguage());
        } else {
            throw new RuntimeException("Unkown User");
        }

    }

    @Override
    public void destroy() {
    }
}
