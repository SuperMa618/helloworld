package com.service.Impl;

import com.bean.Bill;
import com.bean.Provider;
import com.bean.Role;
import com.bean.User;
import com.dao.IDao;
import com.dao.Impl.DaoImpl;
import com.service.IService;

import java.util.List;

public class ServiceImpl implements IService {
    private IDao dao=new DaoImpl();
    @Override
    public User Login(User user) {
        return dao.Login(user);
    }

    @Override
    public boolean AddUser(User user) {
        return dao.AddUser(user);
    }

    @Override
    public boolean DelUser(int id) {
        return dao.DelUser(id);
    }

    @Override
    public boolean UpdateUser(User u) {
        return dao.UpdateUser(u);
    }

    @Override
    public List<User> SelectUser(String keyword,int pageIndex, int pageSize) {
        return dao.SelectUser(keyword,pageIndex,pageSize);
    }

    @Override
    public boolean AddProvider(Provider provider) {
        return dao.AddProvider(provider);
    }

    @Override
    public boolean DelProvider(int id) {
        return dao.DelProvider(id);
    }

    @Override
    public boolean UpdateProvider(Provider provider) {
        return dao.UpdateProvider(provider);
    }

    @Override
    public List<Provider> SelectProvider(String keyword,int pageIndex, int pageSize) {
        return dao.SelectProvider(keyword,pageIndex,pageSize);
    }

    @Override
    public boolean AddBill(Bill bill) {
        return dao.AddBill(bill);
    }

    @Override
    public boolean DelBill(int id) {
        return dao.DelBill(id);
    }

    @Override
    public boolean UpdateBill(Bill bill) {
        return dao.UpdateBill(bill);
    }

    @Override
    public List<Bill> SelectBill(String proName,int supplier,int fukuan,int pageIndex, int pageSize) {
        return dao.SelectBill(proName,supplier,fukuan,pageIndex,pageSize);
    }

    @Override
    public List<Role> SelectRole(String keyword) {
        return dao.SelectRole(keyword);
    }

    @Override
    public boolean SelectUserName(String userCode) {
        return dao.SelectUserName(userCode);
    }

    @Override
    public boolean CPassword(String oldPassword, String newPassword) {
        return dao.CPassword(oldPassword,newPassword);
    }

    @Override
    public int SelectPId(String supplier) {
        return dao.SelectPId(supplier);
    }

    @Override
    public int SelectRId(String userlev) {
        return dao.SelectRId(userlev);
    }

    @Override
    public int CountUser(String keyword) {
        return dao.CountUser(keyword)%5>0?dao.CountUser(keyword)/5+1:dao.CountUser(keyword)/5;
        //count(keyword)%5>0?userDao.count(keyword)/5+1:userDao.count(keyword)/5
    }

    @Override
    public int CountProvider(String keyword) {
        return dao.CountProvider(keyword)%5>0?dao.CountProvider(keyword)/5+1:dao.CountProvider(keyword)/5;
    }

    @Override
    public int CountBill(String proName,int supplier,int fukuan) {
        return dao.CountBill(proName,supplier,fukuan)%5>0?dao.CountBill(proName,supplier,fukuan)/5+1:dao.CountBill(proName,supplier,fukuan)/5;
    }

    @Override
    public boolean SelectPwd(String password) {
        return dao.SelectPwd(password);
    }
}
