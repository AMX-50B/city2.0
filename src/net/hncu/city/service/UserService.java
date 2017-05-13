package net.hncu.city.service;

import jdk.nashorn.internal.ir.RuntimeNode;
import net.hncu.city.dao.TransactionDao;
import net.hncu.city.dao.UserDao;
import net.hncu.city.domian.Transaction;
import net.hncu.city.domian.User;
import net.hncu.city.exception.TransactionExcetion;
import net.hncu.city.exception.UserException;


import java.io.File;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by LY on 2017/5/3.
 */

public class UserService {
    UserDao ud = new UserDao();
    TransactionDao td = new TransactionDao();
    /**
     *
     * @param name
     * @return
     * @throws UserException
     */
    public User findUserByName(String name) throws UserException {
        try {
            User user=ud.getUserName(name);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("fiald to get data of User!");
        }
    }

    public void setUser(User user) throws UserException {
        try {
            ud.putUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("failed to register! ");
        }
    }

    public User checkUser(String userName, String userPassword) throws UserException {
        User user = null;
        try {
            user = ud.getUserByNameAndPassword(userName,userPassword);
            if(user==null)
                throw new UserException("ERROR Incorrect username or password!");
            else
                return user;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("failed to login!");
        }
    }

    public void modifyUser(User user) throws UserException {
        try {
            ud.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("failed to update user!");
        }
    }

    public User changeUserIntegralById(String id,int integral) throws UserException {
        try {
            ud.updateUsrIntegralById(id,integral);
            return ud.getUserById(id,1);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("Failed to change user!");
        }
    }

    public List<User> findAllUser(int state,int userState) throws UserException {
        try {
            return ud.getAllUserByType(state,userState);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("Failed to get user list!");

        }
    }

    public void changeUserStateById(String id, int i) throws UserException {
        try {
            ud.updateUserStateById(id,i);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("Failed to update user state!");

        }
    }

    public void changeUser_userStateById(String id, int i) throws UserException {
        try {
            ud.updateUser_userStateById(id,i);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("Failed to update user userState!");

        }
    }

    public void deleteUserClearById(String id) throws UserException {
        try {
            User user = new User();
            user = ud.getUserById(id,0);
            String url = user.getUserUrl();
            if(url.indexOf("/image/background.jpg")!=1){
                File file = new File(url);
                if (file.exists())
                    file.delete();
            }
            ud.deleteUserClearById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("Failde to delete user!");
        }
    }

    public User findUserById(String id) throws UserException {
        try {
            return ud.getUserByIdAdmin(id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("Failed to get user!");
        }
    }
}
