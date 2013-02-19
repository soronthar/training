package training.commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: Rafael Alvarez
 * Date: 2/18/13
 * Time: 2:18 PM
 * To change this template use File | Settings | File Templates.
 */
public interface Command {
    void dispatch(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
