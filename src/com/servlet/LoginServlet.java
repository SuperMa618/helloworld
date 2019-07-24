package com.servlet;

import com.bean.User;
import com.service.IService;
import com.service.Impl.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String password=request.getParameter("password");
        User user = new User();
        IService service = new ServiceImpl();
        int Hour=new Date().getHours();
        if (Hour > 13) {
            request.getSession().setAttribute("Time", "下午好");
        } else if(Hour>10&&Hour<=13){
            request.getSession().setAttribute("Time","中午好");
        }else {
            request.getSession().setAttribute("Time","上午好");
        }
        user.setUserCode(name);
        user.setUserPassword(password);
        user = service.Login(user);
        if (user!=null) {
            request.getSession().setAttribute("user",user);
            response.sendRedirect("index.jsp");
        }else{
            response.getWriter().print("<html><body><script type='text/javascript'>alert('登入失败');location.href='../login.jsp'</script></body></html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
