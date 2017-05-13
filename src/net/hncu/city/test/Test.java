package net.hncu.city.test;

import net.hncu.city.dao.MessageDao;
import net.hncu.city.domian.Message;
import net.hncu.city.exception.MessageException;
import net.hncu.city.exception.UserException;
import net.hncu.city.service.MessageService;
import net.hncu.city.service.UserService;
import net.sf.json.JSONArray;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by LY on 2017/5/7.
 */

public class Test {
    public static  void  main(String args[]) throws SQLException, UserException, MessageException {
        MessageService ms = new MessageService();
        List<Message> list = new ArrayList<Message>();
        try {
            list = ms.findPutMessage();
            JSONArray ss= JSONArray.fromObject(list);
            String s = ss.toString();
            System.out.println(s);
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }
}
