package com.servlet;

import com.bean.Bill;
import com.bean.Provider;
import com.bean.Role;
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

@WebServlet("/SelectAllServlet")
public class SelectAllServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int mark = Integer.parseInt(request.getParameter("mark"));
        IService service = new ServiceImpl();
        List<Provider> Bproviders=service.SelectProvider(null,0,30);
        request.getSession().setAttribute("Bproviders", Bproviders);
        //mark 1.user 2.provider other.
        if (mark == 1) {
            String keyword = request.getParameter("username");
            request.getSession().setAttribute("username",keyword);
            //设置默认为第一页
            int PageIndex=1;
            //获取当前页数
            String index = request.getParameter("index");
            //判断传过来的index是否为空
            if(index!=null)
                PageIndex = Integer.parseInt(index);
            //获取当前页数的数据
            int countUser = service.CountUser(keyword);
            //存入session
            List<User> users=service.SelectUser(keyword,(PageIndex-1)*5,5);
            List<Role> roles=service.SelectRole(keyword);
            request.getSession().setAttribute("roles", roles);
            request.getSession().setAttribute("pageindexUser",PageIndex);
            request.getSession().setAttribute("countUser",countUser);
            request.getSession().setAttribute("users", users);
            response.sendRedirect("userList.jsp");
        }
        else if (mark == 2) {
            String keyword = request.getParameter("proname");
            request.getSession().setAttribute("proname",keyword);
            //设置默认为第一页
            int PageIndex=1;
            //获取当前页数
            String index = request.getParameter("index");
            //判断传过来的index是否为空
            if(index!=null)
                PageIndex = Integer.parseInt(index);
            //获取当前页数的数据
            int countProvider = service.CountProvider(keyword);
            //存入session
            request.getSession().setAttribute("pageindexProvider",PageIndex);
            List<Provider> providers=service.SelectProvider(keyword,(PageIndex-1)*5,5);
            List<Role> roles=service.SelectRole(keyword);
            request.getSession().setAttribute("roles", roles);
            request.getSession().setAttribute("countProvider",countProvider);
            request.getSession().setAttribute("providers", providers);
            response.sendRedirect("providerList.jsp");
        }else {


            String productName = request.getParameter("productName");
            String provider=request.getParameter("supplier");
            String Pay=request.getParameter("fukuan");
            int supplier=0;
            int fukuan=0;
            if (provider != "" && provider != null) {
                supplier = Integer.parseInt(provider);
            }
            if(Pay != ""&&Pay!=null){
                fukuan = Integer.parseInt(Pay);
            }
            //设置默认为第一页
            int PageIndex=1;
            //获取当前页数
            String index = request.getParameter("index");
            //判断传过来的index是否为空
            if(index!=null)
                PageIndex = Integer.parseInt(index);
            //获取当前页数的数据
            int countBill = service.CountBill(productName,supplier,fukuan);
            //存入session
            request.getSession().setAttribute("pageindexBill",PageIndex);
            List<Bill> bills=service.SelectBill(productName,supplier,fukuan,(PageIndex-1)*5,5);
            List<Role> roles=service.SelectRole(productName);
            request.getSession().setAttribute("productName",productName);
            request.getSession().setAttribute("supplier",supplier);
            request.getSession().setAttribute("Pay",Pay);
            request.getSession().setAttribute("roles", roles);
            request.getSession().setAttribute("countBill",countBill);
            request.getSession().setAttribute("bills", bills);
            response.sendRedirect("billList.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
