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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int mark = Integer.parseInt(request.getParameter("mark"));
        int id = Integer.parseInt(request.getParameter("id"));
        Date date = new Date();
        User userA = (User) request.getSession().getAttribute("user");
        IService service = new ServiceImpl();
        if (mark == 1) {
            try {
                String userName = request.getParameter("userName");
                int gender = Integer.parseInt(request.getParameter("gender"));
                String birthday = request.getParameter("birthday");
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date date1;
                date1 = df.parse(birthday);
                String userphone = request.getParameter("userphone");
                String userAddress = request.getParameter("userAddress");
                int userlei = Integer.parseInt(request.getParameter("userlei"));
                User user=new User(id,userName,gender,date1,userphone,userAddress,userlei,userA.getId(),date);
                boolean is = service.UpdateUser(user);
                if (is) {
                    response.getWriter().print("<html><body><script type='text/javascript'>alert('修改成功');location.href='/SelectAllServlet?mark=1'</script></body></html>");
                }else {
                    response.getWriter().print("<html><body><script type='text/javascript'>alert('修改失败，请输入正确');location.href='../userUpdate.jsp'</script></body></html>");
                }
            } catch (ParseException e) {
            e.printStackTrace();
        }
        } else if (mark == 2) {
            String providerId = request.getParameter("providerId");
            String providerName = request.getParameter("providerName");
            String people = request.getParameter("people");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String fax = request.getParameter("fax");
            String describe = request.getParameter("describe");
            Provider provider=new Provider(id,providerId,providerName,describe,people,phone,address,fax,userA.getId(),date);
            boolean is = service.UpdateProvider(provider);
            if (is) {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('修改成功');location.href='/SelectAllServlet?mark=2'</script></body></html>");
            }else {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('修改失败，请输入正确');location.href='../providerUpdate.jsp'</script></body></html>");
            }
        } else if (mark == 3) {
            String billCode = request.getParameter("billCode");
            String proname = request.getParameter("proname");
            String unit = request.getParameter("unit");
            int count = Integer.parseInt(request.getParameter("count"));
            int money = Integer.parseInt(request.getParameter("money"));
            int providerId = Integer.parseInt(request.getParameter("provider"));
            int zhifu = Integer.parseInt(request.getParameter("zhifu"));
            Bill bill=new Bill(id,billCode,proname,unit,count,money,zhifu,userA.getId(),date,providerId);
            boolean is = service.UpdateBill(bill);
            if (is) {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('修改成功');location.href='/SelectAllServlet?mark=3'</script></body></html>");
            }else {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('修改失败，请输入正确');location.href='../billUpdate.jsp'</script></body></html>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
