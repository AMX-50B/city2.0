package net.hncu.city.web.filter;

import net.hncu.city.domian.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LY on 2017/5/12.
 */
@WebFilter("/admin/*")
public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //处理业务
        //从session中把用户对象得到
        User user = (User) request.getSession().getAttribute("user");
        //判断当前用户权限
        if(user!=null){
            if(user.getUserState()<3){
                response.getWriter().print("Insufficient authority!");
                response.setHeader("refresh", "2;url="+request.getContextPath()+"/index.jsp");
                return;
            }
            //放行
            chain.doFilter(request, response);
            return;
        }
        response.getWriter().write("用户还未登录，请先登录！");
        response.sendRedirect(request.getContextPath()+"/login.jsp");

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
