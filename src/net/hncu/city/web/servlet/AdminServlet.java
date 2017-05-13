package net.hncu.city.web.servlet;

import net.hncu.city.domian.Message;
import net.hncu.city.domian.Transaction;
import net.hncu.city.domian.User;
import net.hncu.city.exception.MessageException;
import net.hncu.city.exception.TransactionExcetion;
import net.hncu.city.exception.UserException;
import net.hncu.city.service.MessageService;
import net.hncu.city.service.TransactionService;
import net.hncu.city.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by LY on 2017/4/27.
 */
@WebServlet("/admin")
public class AdminServlet extends BaseServlet {
    /**
     * show user list for admin
     * url:${pageContext.request.contextPath}/admin?m=showUserList
     * post:state
     * session:user
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void showUserList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer state = Integer.parseInt(request.getParameter("type"));
        User user = (User)request.getSession().getAttribute("user");
        UserService us = new UserService();
        List<User> list = new ArrayList<User>();
        try {
            list = us.findAllUser(state,user.getUserState());
            request.setAttribute("list",list);
            request.getRequestDispatcher("/admin/usermessage.jsp").forward(request,response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }

    /**
     * get all transaction list for admin
     * url:${pageContext.request.contextPath}/admin?m=showTransactionList
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void showTransactionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        TransactionService transactionService = new TransactionService();
        List<Transaction> list = new ArrayList<Transaction>();
        try {
            list = transactionService.findAllTransaction();
            request.setAttribute("list",list);
            request.getRequestDispatcher("/admin/userintegral.jsp").forward(request,response);
        } catch (TransactionExcetion transactionExcetion) {
            transactionExcetion.printStackTrace();
        }
    }

    /**
     * show message for admin list by type
     * url:${pageContext.request.contextPath}/admin?m=showMessageListByType
     * post:t~type
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void showMessageListByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String type = request.getParameter("t");
        List<Message> list = new ArrayList<Message>();
        MessageService ms = new MessageService();
        try {
            list = ms.findMessageByTypeForAdmin(type);
            request.setAttribute("list",list);
            request.getRequestDispatcher("/admin/message.jsp").forward(request,response);
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }

    /**
     *show deleted message for admin
     * url:${pageContext.request.contextPath}/admin?m=showDeletedMessage
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void showDeletedMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Message> list = new ArrayList<Message>();
        MessageService ms = new MessageService();
        try {
            list = ms.findDeletedMessageListForAdmin();
            request.setAttribute("list",list);
            request.getRequestDispatcher("/admin/message.jsp").forward(request,response);
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }

    /**
     * delete/undo delere user by admin
     * Url:${pageContext.request.contextPath}/admin?m=deleteUserById
     * post:id,status
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteUserById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Integer state = Integer.parseInt(request.getParameter("status"));
        UserService us = new UserService();
        try {
            us.changeUserStateById(id,state);
            //request.getRequestDispatcher("/admin?m=showUserList").forward(request,response);
            response.getWriter().println(true);
            response.getWriter().close();
        } catch (UserException e) {
            response.getWriter().println(false);
            response.getWriter().close();
            e.printStackTrace();
        }
    }

    /**
     * delete/undo delete message by admin
     * Url:${pageContext.request.contextPath}/admin?m=deleteMessageById
     * post:id,status
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteMessageById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        Integer status = Integer.parseInt(request.getParameter("status"));
        MessageService ms = new MessageService();
        try {
            ms.changeMessageStateById(id,status);
            response.getWriter().println(true);
            response.getWriter().close();
        } catch (MessageException e) {
            e.printStackTrace();
            response.getWriter().println(false);
            response.getWriter().close();
        }
    }

    /**
     * check/undo check message by admin
     * Url:${pageContext.request.contextPath}/admin?m=checkMessageById
     * post:id,status
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void checkMessageById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        Integer status = Integer.parseInt(request.getParameter("status"));
        MessageService ms = new MessageService();
        try {
            ms.changeMessageTypeById(id,status);
            request.getRequestDispatcher("/admin/home.jsp").forward(request,response);
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }

    /**
     * show message info for admin
     * Url:${pageContext.request.contextPath}/admin?m=showMessageById
     * get:id
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void showMessageById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        MessageService ms = new MessageService();
        Message message = new Message();
        try {
            message = ms.findMessageById(id);
            request.setAttribute("m",message);
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }

    /**
     * show message info for admin
     * Url:${pageContext.request.contextPath}/admin?m=userInfo
     * get:id
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void userInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        UserService us = new UserService();
        User user = new User();
        try {
            user = us.findUserById(id);
            request.setAttribute("u",user);
            request.getRequestDispatcher("/admin/userinfo.jsp").forward(request,response);
        } catch (UserException e) {
            e.printStackTrace();
        }
    }
    public void next(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }
}
