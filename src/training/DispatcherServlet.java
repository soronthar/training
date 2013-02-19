package training;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DispatcherServlet extends HttpServlet {

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        super.init(servletConfig);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dispatch(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dispatch(request, response);
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
//        try {
//            if (pathInfo.equals("/ws/login")) {
//                new Login(getServletConfig().getInitParameter("url")).dispatch(request, response);
//            } else if (pathInfo.equals("/ws/listaPolizaCliente")) {
//                new ListaPolizaCliente(getServletConfig().getInitParameter("url")).dispatch(request, response);
//            } else {
//                throw new ServletException("Unknown path:" + pathInfo);
//            }
//        } catch (Exception e) {
//            throw new ServletException(e);
//        }

    }

}
