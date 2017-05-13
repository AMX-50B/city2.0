package net.hncu.city.dao;

import net.hncu.city.domian.Transaction;
import net.hncu.city.domian.User;
import net.hncu.city.utils.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by LY on 2017/5/3.
 */

public class UserDao {
    public User getUserName(String name) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        return qr.query("select * from tb_user where state = 1 and  userName = ? ",new BeanHandler<User>(User.class),name);
    }

    public void putUser(User user) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "INSERT INTO tb_user(id,userName,userPassword,sex,userEmail)VALUES (?,?,?,?,?)";
        qr.update(sql,user.getId(),user.getUserName(),user.getUserPassword(),user.getSex(),user.getUserEmail());
    }

    public User getUserByNameAndPassword(String userName, String userPassword) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        return qr.query("select * from tb_user where state = 1 and userName = ? and userPassword = ?",new BeanHandler<User>(User.class),userName,userPassword);
    }


    public void updateUser(User user) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "update tb_user set userName= ?,userPassword= ?,sex= ?,userEmail=?,userUrl=? where id = ?";
        qr.update(sql,user.getUserName(),user.getUserPassword(),user.getSex(),user.getUserEmail(),user.getUserUrl(),user.getId());
    }

    public void updateUsrIntegralById(String id,int integral) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "update tb_user set userIntegral=? where  id = ?";
        qr.update(sql,integral,id);
    }

    public User getUserById(String id,int state) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        User user =  qr.query("select * from tb_user where state = ? and id = ? ",new BeanHandler<User>(User.class),state,id);
        return user;
    }

    public List<User> getAllUserByType(int state,int userState) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql="select * from tb_user where state = ? and userState<? ";
        return qr.query(sql,new BeanListHandler<User>(User.class),state,userState);
    }


    public void updateUserStateById(String id, int i) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "update tb_user set state = ? where id = ?";
        qr.update(sql,i,id);
    }

    public void updateUser_userStateById(String id, int i) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "update tb_user set userState = ? where id = ?";
        qr.update(sql,i,id);
    }

    public void deleteUserClearById(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        qr.update("delete from tb_user where id = ?",id);
    }

    public User getUserByIdAdmin(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        return qr.query("select *from tb_user where id = ?",new BeanHandler<User>(User.class),id);
    }
}
