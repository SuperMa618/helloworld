package com.servlet;

import com.service.IService;
import com.service.Impl.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CPasswordServlet")
public class CPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        IService service=new ServiceImpl();
        boolean is=service.CPassword(oldPassword,newPassword);
        if (is) {
            response.getWriter().print("<html><body><script type='text/javascript'>alert('修改成功');location.href='login.jsp'</script></body></html>");
        }else {
            response.getWriter().print("<html><body><script type='text/javascript'>alert('修改失败');location.href='password.jsp'</script></body></html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
