package com.servlet;

import com.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "Filter")
public class Filter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse) resp;
        //设置所有servlet编码格式
        response.setHeader("Content-type", "text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //获取用户的请求参数
        String uri=request.getRequestURI();
        //获得session对象
        HttpSession session=request.getSession();
        User userBean = (User) session.getAttribute("user");
        if (userBean != null||uri.contains("login.jsp")||uri.endsWith(".png")||uri.endsWith(".jpg")||uri.endsWith(".js")||uri.endsWith(".css")||uri.contains("LoginServlet")||uri.contains("UserNameServlet")) {
            chain.doFilter(req, resp);
        }else {
            response.sendRedirect("login.jsp");

        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
