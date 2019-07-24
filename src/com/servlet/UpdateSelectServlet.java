package com.servlet;

import com.bean.Bill;
import com.bean.Provider;
import com.bean.User;
import com.service.IService;
import com.service.Impl.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateSelectServlet")
public class UpdateSelectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int mark = Integer.parseInt(request.getParameter("mark"));
        int view = Integer.parseInt(request.getParameter("view"));
        IService service = new ServiceImpl();
        if (mark == 1) {
            List<User> user;
            String userCode = request.getParameter("userCode");
            user = service.SelectUser(userCode, 0, 5);
            request.getSession().setAttribute("u", user.get(0));
            if (view == 1) {
                response.sendRedirect("userView.jsp");
            } else {
                response.sendRedirect("userUpdate.jsp");
            }

        } else if (mark == 2) {
            List<Provider> provider;
            String proName = request.getParameter("proName");
            provider = service.SelectProvider(proName, 0, 5);
            request.getSession().setAttribute("p", provider.get(0));
            if (view == 1) {
                response.sendRedirect("providerView.jsp");
            } else {
                response.sendRedirect("providerUpdate.jsp");
            }
        } else if(mark==3){
            List<Bill> bill;
            String productName = request.getParameter("productName");
            bill = service.SelectBill(productName,0,0, 0, 5);
            request.getSession().setAttribute("b", bill.get(0));
            if (view == 1) {
                response.sendRedirect("billView.jsp");
            } else {
                response.sendRedirect("billUpdate.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
