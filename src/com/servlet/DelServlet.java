package com.servlet;

import com.service.IService;
import com.service.Impl.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DelServlet")
public class DelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        int mark= Integer.parseInt(request.getParameter("mark"));
        IService service = new ServiceImpl();
        if (mark == 1) {
            boolean is = service.DelUser(id);
            if (is) {
                response.sendRedirect("/SelectAllServlet?mark=1");
            } else {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('删除失败');location.href='../login.jsp'</script></body></html>");
            }

        } else if (mark == 2) {
            boolean is = service.DelProvider(id);
            if (is) {
                response.sendRedirect("/SelectAllServlet?mark=2");
            } else {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('删除失败');location.href='../login.jsp'</script></body></html>");
            }
        }else {
            boolean is = service.DelBill(id);
            if (is) {
                response.sendRedirect("/SelectAllServlet?mark=3");
            } else {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('删除失败');location.href='../login.jsp'</script></body></html>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
