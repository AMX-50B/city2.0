package net.hncu.city.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Created by LY on 2017/4/27.
 */
public class BaseServlet extends HttpServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        //获得请求参数
        String method = req.getParameter("m");
        HttpServletRequest request =(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse) res;
        try {
            Method m = this.getClass().getDeclaredMethod(method,HttpServletRequest.class,HttpServletResponse.class);
            m.invoke(this,request,response);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }
}
