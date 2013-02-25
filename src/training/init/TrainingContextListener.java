package training.init;

import com.consisint.acsele.Acsele;
import com.consisint.acsele.util.AcseleConf;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;

/**
 * Created with IntelliJ IDEA.
 * User: Rafael Alvarez
 * Date: 2/19/13
 * Time: 12:49 PM
 * To change this template use File | Settings | File Templates.
 */
public class TrainingContextListener  implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext context = servletContextEvent.getServletContext();
        String prefix = context.getRealPath(File.separator);

        //Inicializa Acsel-e, asumiendo la instancia CONSIS
        new Acsele("CONSIS",prefix);
        AcseleConf.setFixedPaths("C:/test/");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
