package com.dao;

import com.bean.Bill;
import com.bean.Provider;
import com.bean.Role;
import com.bean.User;

import java.util.List;

public interface IDao {
    User Login(User user);
    //User 增删改查
    boolean AddUser(User user);

    boolean DelUser(int id);

    boolean UpdateUser(User u);

    List<User> SelectUser(String keyword,int pageIndex, int pageSize);

    //Provider 增删改查
    boolean AddProvider(Provider provider);

    boolean DelProvider(int id);

    boolean UpdateProvider(Provider provider);

    List<Provider> SelectProvider(String keyword,int pageIndex, int pageSize);

    //Bill 增删改查
    boolean AddBill(Bill bill);

    boolean DelBill(int id);

    boolean UpdateBill(Bill bill);

    List<Bill> SelectBill(String proName,int supplier,int fukuan,int pageIndex, int pageSize);

    boolean SelectUserName(String userCode);

    List<Role> SelectRole(String keyword);

    boolean CPassword(String oldPassword, String newPassword);

    int SelectPId(String supplier);

    int SelectRId(String userlev);

    int CountBill(String proName,int supplier,int fukuan);

    int CountProvider(String keyword);

    int CountUser(String keyword);

    boolean SelectPwd(String password);
}
