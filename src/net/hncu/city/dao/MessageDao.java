package net.hncu.city.dao;

import net.hncu.city.domian.Message;
import net.hncu.city.utils.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.fileupload.MultipartStream;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * Created by LY on 2017/4/27.
 */

public class MessageDao {
    /**
     * add message
     * @param message
     * @throws SQLException
     */
    public void addMessage(Message message) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql;
        if(message.getImgUrl()!=null){
            sql="INSERT INTO tb_message(id, title, description, category, context, imgUrl, contacts, phone,user_id)" +
                    " VALUES (?,?,?,?,?,?,?,?,?)";
            qr.update(sql,message.getId(),message.getTitle(),message.getDescription(), message.getCategory(),
                    message.getContext(),message.getImgUrl(),message.getContacts(),message.getPhone(), message.getUser_id());
        }else{
            sql ="INSERT INTO tb_message(id, title, description, category, context, contacts, phone,user_id)" +
                    " VALUES (?,?,?,?,?,?,?,?)";
            qr.update(sql,message.getId(),message.getTitle(),message.getDescription(), message.getCategory(),
                    message.getContext(),message.getContacts(),message.getPhone(), message.getUser_id());
        }
    }

    /**
     * get all message(list)
     * @return list-message
     * @throws SQLException
     */
    public List<Message> getMessageAll() throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql="SELECT t.id,t.title,t.description,b.category,t.context,t.imgUrl,t.contacts,t.phone,t.user_id,t.state,t.date,t.type " +
                "FROM tb_message t,tb_category b WHERE t.state=2 and t.category=b.type";
        return qr.query(sql,new BeanListHandler<Message>(Message.class));
    }

    /**
     * get message(list) by id,type
     * @param id
     * @param type
     * @return list-message
     * @throws SQLException
     */
    public List getMessageListByType(String id,  int type) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "SELECT  t.id,t.title,t.description,b.category,t.context,t.imgUrl,t.contacts,t.phone,t.user_id,t.state,t.date,t.type " +
                "FROM tb_message t,tb_category b WHERE t.state=2 and t.category=b.type AND t.type=? AND t.user_id = ?";
        return qr.query(sql,new BeanListHandler<Message>(Message.class),type,id);
    }

    /**
     * get message by id
     * @param id
     * @return message
     * @throws SQLException
     */
    public Message getMessageById(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        return qr.query("select * from tb_message where id = ?",new BeanHandler<Message>(Message.class),id);
    }

    /**
     * update message
     * @param m(message)
     * @throws SQLException
     */
    public void updateMessage(Message m) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "UPDATE tb_message SET title=?,description=?,category=?,context=?,imgUrl=?,contacts=?,phone=? WHERE id=?";
        qr.update(sql,m.getTitle(),m.getDescription(),m.getCategory(),m.getContext(),m.getImgUrl(),m.getContacts(),m.getPhone(),m.getId());
    }

    /**
     * update message state by id,state
     * @param id
     * @param i
     * @throws SQLException
     */
    public void updateMessageStateById(String id, int i) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "update tb_message set state = ? where  id = ?";
        qr.update(sql,i,id);
    }

    /**
     * update message type by id,type
     * @param id
     * @param i
     * @throws SQLException
     */
    public void updateMessageTypeById(String id, int i) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "update tb_message set type = ?  where  id = ?";
        qr.update(sql, i, id);
    }

    /**
     * get message(list) by user_id,state
     * @param id
     * @param i
     * @return
     * @throws SQLException
     */
    public List<Message> getMessageListByState(String id, int i) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "SELECT t.id,t.title,t.description,b.category,t.context,t.imgUrl,t.contacts,t.phone,t.user_id,t.state,t.date,t.type " +
                "FROM tb_message t,tb_category b WHERE t.category=b.type and t.state=? and t.user_id=?";
        return qr.query(sql,new BeanListHandler<Message>(Message.class),i,id);
    }

    public List<Message> getMessageListByTypeForAdmin(int type) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String v;
        if(type==2){
            v="!=?";
            type = type - 1;
        } else
            v="=?";
        String sql = "SELECT t.id,t.title,t.description,b.category,t.context,t.imgUrl,t.contacts,t.phone,t.user_id,t.state,t.date,t.type " +
                "FROM tb_message t,tb_category b WHERE t.state=2 and t.category=b.type and t.type"+v;
        return  qr.query(sql,new BeanListHandler<Message>(Message.class),type);
    }

    public List<Message> getDeletedListForAdmin() throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "SELECT t.id,t.title,t.description,b.category,t.context,t.imgUrl,t.contacts,t.phone,t.user_id,t.state,t.date,t.type " +
                "FROM tb_message t,tb_category b WHERE t.state<2 and t.category=b.type";
        return qr.query(sql,new BeanListHandler<Message>(Message.class));
    }

    public void deleteMessageClearById(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        qr.update("delete from tb_message where id = ?",id);
    }

    public List<Message> getPutMessage() throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        return  qr.query("select * from tb_message where type = 3",new BeanListHandler<Message>(Message.class));
    }
}
