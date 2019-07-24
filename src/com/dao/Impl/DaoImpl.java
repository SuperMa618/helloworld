package com.dao.Impl;

import com.bean.Bill;
import com.bean.Provider;
import com.bean.Role;
import com.bean.User;
import com.dao.IDao;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class DaoImpl implements IDao {
    JdbcTemplate jt = new JdbcTemplate(new ComboPooledDataSource());
    @Override
    public User Login(User user) {
        String sql = "select * from smbms_user where userCode=? and userPassword=?";
        List<User> users = jt.query(sql, new BeanPropertyRowMapper<User>(User.class), user.getUserCode(), user.getUserPassword());
        if (!users.isEmpty()) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public boolean AddUser(User user) {
        String sql = "insert into smbms_user(userCode,userName,userPassword,gender,birthday,phone,address,userRole,createdBy,creationDate,modifyBy) values(?,?,?,?,?,?,?,?,?,?,?)";
        int p = jt.update(sql, user.getUserCode(), user.getUserName(), user.getUserPassword(), user.getGender(), user.getBirthday(), user.getPhone(), user.getAddress(), user.getUserRole(), user.getCreateBy(), user.getCreationDate(), user.getModifyBy());
        if (p>0) {
            return  true;
        }
        return false;
    }

    @Override
    public boolean DelUser(int id) {
        String sql = "delete from smbms_user where id=?";
        int a=jt.update(sql,new Object[] {id});
        if (a>0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean UpdateUser(User u) {
        String sql = "update smbms_user set userName=?,gender=?,birthday=?,phone=?,address=?,userRole=?,modifyBy=?,modifyDate=? where id=?";
        int user = jt.update(sql, u.getUserName(), u.getGender(), u.getBirthday(), u.getPhone(), u.getAddress(), u.getUserRole(), u.getModifyBy(), u.getModifyDate(), u.getId());
        if (user > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<User> SelectUser(String keyword,int pageIndex, int pageSize) {
        String sql = "select * from smbms_user where userCode like ? limit ?,?";
        if (keyword == null) {
            keyword = "%" + "" + "%";
        } else {
            keyword="%"+keyword+"%";
        }
        List<User> users = jt.query(sql, new BeanPropertyRowMapper<User>(User.class),keyword,pageIndex,pageSize);
        if (!users.isEmpty()) {
            return users;
        }
        return null;
    }

    @Override
    public boolean AddProvider(Provider provider) {
        String sql = "insert into smbms_provider(proCode,proName,proDesc,proContact,proPhone,proAddress,proFax,createdBy,creationDate,modifyBy) values(?,?,?,?,?,?,?,?,?,?)";
        int p = jt.update(sql, provider.getProCode(), provider.getProName(), provider.getProDesc(), provider.getProContact(), provider.getProPhone(), provider.getProAddress(), provider.getProFax(), provider.getCreateBy(), provider.getCreationDate(), provider.getModifyBy());
        if (p>0) {
            return  true;
        }
        return false;
    }

    @Override
    public boolean DelProvider(int id) {
        String sql = "delete from smbms_provider where id=?";
        int a=jt.update(sql,new Object[] {id});
        if (a>0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean UpdateProvider(Provider provider) {
        String sql="update smbms_provider set proCode=?,proName=?,proDesc=?,proContact=?,proPhone=?,proAddress=?,proFax=?,modifyBy=?,modifyDate=? where id=?";
        //jdbcTemplate.update("UPDATE USER SET name = ? WHERE user_id = ?", new Object[] {name, id});
        int a=jt.update(sql,new Object[]{provider.getProCode(),provider.getProName(), provider.getProDesc(), provider.getProContact(), provider.getProPhone(), provider.getProAddress(),provider.getProFax(), provider.getModifyBy(), provider.getModifyDate(), provider.getId()});
        if (a > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<Provider> SelectProvider(String keyword,int pageIndex, int pageSize) {
        String sql = "select * from smbms_provider where proName like ? limit ?,?";
        if (keyword == null) {
            keyword = "%" + "" + "%";
        } else {
            keyword="%"+keyword+"%";
        }
        List<Provider> providers = jt.query(sql, new BeanPropertyRowMapper<Provider>(Provider.class),keyword,pageIndex,pageSize);
        if (!providers.isEmpty()) {
            return providers;
        }
        return null;
    }

    @Override
    public boolean AddBill(Bill bill) {
        String sql = "insert into smbms_bill(billCode,productName,productUnit,productCount,totalPrice,isPayment,createdBy,creationDate,modifyBy,providerId) values(?,?,?,?,?,?,?,?,?,?)";
        int bills = jt.update(sql, bill.getBillCode(), bill.getProductName(), bill.getProductUnit(), bill.getProductCount(), bill.getTotalPrice(), bill.getIsPayment(), bill.getCreateBy(), bill.getCreationDate(), bill.getModifyBy(),bill.getProviderId());
        if (bills>0) {
            return  true;
        }
        return false;
    }

    @Override
    public boolean DelBill(int id) {
        String sql = "delete from smbms_bill where id=?";
        int a=jt.update(sql,new Object[] {id});
        if (a>0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean UpdateBill(Bill bill) {
        String sql="update smbms_bill set billCode=?,productName=?,productUnit=?,productCount=?,totalPrice=?,isPayment=?,modifyBy=?,modifyDate=?,providerId=? where id=?";
        //jdbcTemplate.update("UPDATE USER SET name = ? WHERE user_id = ?", new Object[] {name, id});
        int a=jt.update(sql,new Object[]{bill.getBillCode(),bill.getProductName(), bill.getProductUnit(), bill.getProductCount(), bill.getTotalPrice(), bill.getIsPayment(), bill.getModifyBy(), bill.getModifyDate(), bill.getProviderId(),bill.getId()});
        if (a > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<Bill> SelectBill(String proName,int supplier,int fukuan,int pageIndex, int pageSize) {
        StringBuffer sql1 = new StringBuffer();
        sql1.append("select * from smbms_bill where 1=1 ");
        //String sql = "select * from smbms_bill where productName like ? ? ? limit ?,?";
//        if (proName == null || proName=="") {
//            proName = "%" + "" + "%";
//        } else {
//            proName="%"+proName+"%";
//        }
        if (proName != null && proName!=""){
            sql1.append(" and productName like '%" + proName+"%'");
        }
        if (supplier != 0) {
            sql1.append(" and providerId= "+supplier);
        }
        if (fukuan != 0) {
            sql1.append(" and isPayment= "+fukuan);
        }
        sql1.append(" limit " + pageIndex + "," + pageSize);
        String sql=sql1.toString();
        List<Bill> bills = jt.query(sql, new BeanPropertyRowMapper<Bill>(Bill.class));
        // .query(sql1, new BeanPropertyRowMapper<Bill>(Bill.class));
        if (!bills.isEmpty()) {
            return bills;
        }
        return null;
    }

    @Override
    public List<Role> SelectRole(String keyword) {
        String sql = "select * from smbms_role";
        List<Role> roles = jt.query(sql, new BeanPropertyRowMapper<Role>(Role.class));
        if (!roles.isEmpty()) {
            return roles;
        }
        return null;
    }

    @Override
    public boolean SelectUserName(String userCode) {
        String sql = "select * from smbms_user where userCode=?";
        List<User> users = jt.query(sql, new BeanPropertyRowMapper<User>(User.class), userCode);
        if (!users.isEmpty()) {
            return true;
        }
        return false;
    }

    @Override
    public boolean CPassword(String oldPassword, String newPassword) {
        String sql = "update smbms_user set userPassword=? where userPassword=?";
        int a=jt.update(sql,new Object[]{newPassword,oldPassword});
        if (a > 0) {
            return true;
        }
        return false;
    }

    @Override
    public int SelectPId(String supplier) {
        String sql = "select * from smbms_provider where proName=?";
        List<Provider> providers = jt.query(sql, new BeanPropertyRowMapper<Provider>(Provider.class), supplier);
        if (!providers.isEmpty()) {
            return providers.get(0).getId();
        }
        return 0;
    }

    @Override
    public int SelectRId(String userlev) {
        String sql = "select * from smbms_role where roleName=?";
        List<Role> roles = jt.query(sql, new BeanPropertyRowMapper<Role>(Role.class), userlev);
        if (!roles.isEmpty()) {
            return roles.get(0).getId();
        }
        return 1;
    }

    @Override
    public int CountBill(String proName,int supplier,int fukuan) {
        String sql="select count(*) from smbms_bill where productName like ?";
        if (proName == null) {
            proName = "%" + "" + "%";
        } else {
            proName="%"+proName+"%";
        }
        return jt.queryForObject(sql, int.class,proName);
    }

    @Override
    public int CountProvider(String keyword) {
        String sql="select count(*) from smbms_provider where proName like ?";
        if (keyword == null) {
            keyword = "%" + "" + "%";
        } else {
            keyword="%"+keyword+"%";
        }
        return jt.queryForObject(sql, int.class,keyword);
    }

    @Override
    public int CountUser(String keyword) {
        String sql="select count(*) from smbms_user where userName like ?";
        if (keyword == null) {
            keyword = "%" + "" + "%";
        } else {
            keyword="%"+keyword+"%";
        }
        return jt.queryForObject(sql, int.class,keyword);
    }

    @Override
    public boolean SelectPwd(String password) {
        String sql = "select * from smbms_user where userPassword=?";
        List<User> users = jt.query(sql, new BeanPropertyRowMapper<User>(User.class), password);
        if (!users.isEmpty()) {
            return true;
        }
        return false;
    }
}
