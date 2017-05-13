package net.hncu.city.web.servlet;

import net.hncu.city.domian.Message;
import net.hncu.city.domian.User;
import net.hncu.city.exception.MessageException;
import net.hncu.city.exception.UserException;
import net.hncu.city.service.MessageService;
import net.hncu.city.service.UserService;
import net.hncu.city.utils.RRID;
import net.sf.json.JSONArray;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * tourist opreation
 * Created by LY on 2017/5/2.
 */
@WebServlet("/index")
public class IndexServlet extends BaseServlet {

    /**
     * UserName check
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void userNameCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        System.out.print(name);
        String sta = "0";
        UserService us = new UserService();
        try {
            User user = us.findUserByName(name);
            if (user==null)
                sta = "1";
            response.getWriter().write(sta);
        } catch (UserException e) {
            e.printStackTrace();
            response.getWriter().write(sta);
        }
    }

    /**
     * image code check
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void imageCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("imcode");
        String ckcode = (String) request.getSession().getAttribute("checkcode_session");
        //System.out.print(code);
       // System.out.print(ckcode);
        if (ckcode.equals(code)) {
            response.getWriter().write("1");
        } else {
            response.getWriter().write("0");
        }
    }

    /**
     * register
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
            user.setId(RRID.rrid());
            UserService us = new UserService();
            us.setUser(user);
            request.setAttribute("mes","register success!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (UserException e) {
            e.printStackTrace();
            request.setAttribute("mes",e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }

    /**
     * login
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");

        HttpSession session = request.getSession();
        User user = new User();
        user=(User)session.getAttribute("user");
        if(user==null){
            UserService us = new UserService();
            String path = "/user/account.jsp";
            try {
                user = us.checkUser(userName,userPassword);
                session.setAttribute("user",user);
                //System.out.print(user.getDate());
                if(user.getUserState()>2)
                    path="/admin/home.jsp";
                request.getRequestDispatcher(path).forward(request,response);
            } catch (UserException e) {
                e.printStackTrace();
                request.setAttribute("mes","用户名或密码错误！");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
        }else {
            request.setAttribute("mes","您已经登录，切换帐号请先注销！");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }

    }
    public void recommendMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        MessageService ms = new MessageService();
        List<Message> list = new ArrayList<Message>();
        try {
            list = ms.findPutMessage();
            JSONArray ss= JSONArray.fromObject(list);
            String s = ss.toString();

        } catch (MessageException e) {
            e.printStackTrace();
        }
    }
}

