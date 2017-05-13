package net.hncu.city.web.servlet;

import net.hncu.city.exception.MessageException;
import net.hncu.city.exception.UserException;
import net.hncu.city.service.MessageService;
import net.hncu.city.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LY on 2017/5/10.
 */
@WebServlet("/super")
public class SuperServlet extends BaseServlet {

    /**
     * Upgrade or revoke the upgrade user
     * URL:${pageContext.request.contextPath}/super?m=changeUserStateById
     * post: id,status
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void changeUserStateById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        Integer userState = Integer.parseInt(request.getParameter("status"));
        UserService us = new UserService();
        try {
            us.changeUser_userStateById(id,userState);
            System.out.print(request.getContextPath());
            response.getWriter().print(true);
            response.getWriter().close();
        } catch (UserException e) {
            e.printStackTrace();
            response.getWriter().print(false);
            response.getWriter().close();
        }
    }

    /**
     * Admin completely delete user information
     * URL:${pageContext.request.contextPath}/super?m=deleteUserClearById
     * post: id
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteUserClearById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        UserService us = new UserService();
        try {
            us.deleteUserClearById(id);
            response.getWriter().print(true);
            response.getWriter().close();
        } catch (UserException e) {
            e.printStackTrace();
            response.getWriter().print(false);
            response.getWriter().close();
        }
    }

    /**
     * Admin completely delete message information
     *  URL:${pageContext.request.contextPath}/super?m=deleteMessageClearById
     * post: id
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteMessageClearById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        MessageService ms = new MessageService();
        try {
            ms.deleteMessageClearById(id);
            response.getWriter().print(true);
            response.getWriter().close();
        } catch (MessageException e) {
            e.printStackTrace();
            response.getWriter().print(false);
            response.getWriter().close();
        }
    }

}
