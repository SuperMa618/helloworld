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

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int mark = Integer.parseInt(request.getParameter("mark"));
        IService service=new ServiceImpl();
        Date date=new Date();
        User user = (User) request.getSession().getAttribute("user");
        if (mark == 1) {
            //添加bill
            String billId= request.getParameter("billId");
            String billName= request.getParameter("billName");
            String billCom= request.getParameter("billCom");
            int billNum= Integer.parseInt(request.getParameter("billNum"));
            int money= Integer.parseInt(request.getParameter("money"));
            String supplier= request.getParameter("supplier");
            int pay= Integer.parseInt(request.getParameter("pay"));
            //获得供应商的id
            int providerId=service.SelectPId(supplier);
            Bill bill=new Bill(billId,billName,billCom,billNum,money,pay,user.getId(),date,1,providerId);
            boolean is= service.AddBill(bill);
            if (is) {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('添加成功');location.href='/SelectAllServlet?mark=3'</script></body></html>");
            }else {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('添加失败，请输入正确');location.href='../billAdd.jsp'</script></body></html>");
            }
        } else if (mark == 2) {
            //添加provider
            String providerId= request.getParameter("providerId");
            String providerName= request.getParameter("providerName");
            String people= request.getParameter("people");
            String phone= request.getParameter("phone");
            String address= request.getParameter("address");
            String fax= request.getParameter("fax");
            String describe= request.getParameter("describe");
            Provider provider = new Provider(providerId, providerName, describe, people, phone, address, fax, user.getId(), date,1);
            boolean is = service.AddProvider(provider);
            if (is) {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('添加成功');location.href='/SelectAllServlet?mark=2'</script></body></html>");
            }else {
                response.getWriter().print("<html><body><script type='text/javascript'>alert('添加失败，请输入正确');location.href='../providerAdd.jsp'</script></body></html>");
            }
        } else if (mark == 3) {
            //添加user
            try {
                String userId= request.getParameter("userId");
                String userName= request.getParameter("userName");
                String userpassword= request.getParameter("userpassword");
                //String sex= request.getParameter("sex");
                int sex=request.getParameter("sex").equals("男")?1:2;
                String dateStr= request.getParameter("date");
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date date1;
                date1 = df.parse(dateStr);
                String userphone= request.getParameter("userphone");
                String userAddress= request.getParameter("userAddress");
                String userlev= request.getParameter("userlev");
                //获得管理员等级的id
                int lev = service.SelectRId(userlev);
                User user1 = new User(userId, userName, userpassword, sex, date1, userphone, userAddress, lev,user.getId(),date,1);
                boolean is = service.AddUser(user1);
                if (is) {
                    response.getWriter().print("<html><body><script type='text/javascript'>alert('添加成功');location.href='/SelectAllServlet?mark=1'</script></body></html>");
                }else {
                    response.getWriter().print("<html><body><script type='text/javascript'>alert('添加失败，请输入正确');location.href='../userAdd.jsp'</script></body></html>");
                }

            } catch (ParseException e) {
            e.printStackTrace();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
