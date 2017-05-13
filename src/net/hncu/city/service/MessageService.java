package net.hncu.city.service;

import net.hncu.city.dao.MessageDao;
import net.hncu.city.domian.Message;
import net.hncu.city.exception.MessageException;
import org.apache.catalina.User;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by LY on 2017/4/27.
 */

public class MessageService {
    //加载处理message的dao
    MessageDao md = new MessageDao();

    //添加信息
    public void addMessage(Message message) throws MessageException {
        try {
            md.addMessage(message);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to add message!");
        }
    }

    public List<Message> findMessageAllList() throws MessageException {
        try {
            return md.getMessageAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to get message list!");
        }
    }

    public List findMessageByType(String type, String id) throws MessageException {
        int types = Integer.parseInt(type);
        List<Message> list = new ArrayList<Message>();
        try {
            return list= md.getMessageListByType(id,types);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to get message list!");
        }
    }

    public Message findMessageById(String id) throws MessageException {
        try {
            return md.getMessageById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to get message");
        }
    }

    public void changeMessage(Message message) throws MessageException {
        try {
            md.updateMessage(message);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to update message!");
        }
    }

    public void changeMessageStateById(String id, int i) throws MessageException {
        try {
            md.updateMessageStateById(id,i);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to update state!");
        }
    }

    public void changeMessageTypeById(String id, int i) throws  MessageException {
        try {
            md.updateMessageTypeById(id,i);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to update type!");
        }
    }

    public List<Message> findDeleteMessageList(String id) throws MessageException {
        try {
            return  md.getMessageListByState(id,1);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to get deleted message");
        }
    }

    public List<Message> findMessageByTypeForAdmin(String type) throws MessageException {
        int types = Integer.parseInt(type);
        try {
            return md.getMessageListByTypeForAdmin(types);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to get message list");

        }
    }

    public List<Message> findDeletedMessageListForAdmin() throws MessageException {
        try {
            return md.getDeletedListForAdmin();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to get message list");

        }
    }

    public void deleteMessageClearById(String id) throws MessageException {
        try {
            Message message = md.getMessageById(id);
            String url = message.getImgUrl();
             if(url.indexOf("background.jpg")!=1){
                File file = new File(url);
                if(file.exists())
                    file.delete();
            }
            md.deleteMessageClearById(id);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to delete message!");
        }
    }

    public List<Message> findPutMessage() throws MessageException {
        try {
            return md.getPutMessage();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new MessageException("Failed to delete message!");
        }
    }
}
