package net.hncu.city.dao;

import net.hncu.city.domian.Transaction;
import net.hncu.city.utils.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by LY on 2017/5/6.
 */

public class TransactionDao {


    public void addTransaction(Transaction t) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "INSERT INTO tb_transaction(id,type,integral,user_id,money) values(?,?,?,?,?)";
        qr.update(sql,t.getId(),t.getType(),t.getIntegral(),t.getUser_id(),t.getMoney());
    }

    public Transaction getTransactionById(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "select * from tb_transaction where id = ?";
        return qr.query(sql,new BeanHandler<Transaction>(Transaction.class),id);
    }

    public void updateTransactionStateById(String id, int i) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "update tb_transaction set state = ? where id = ?";
        qr.update(sql,i,id);
    }

    public List<Transaction> getTransactionByUserId(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "select * from tb_transaction where user_id = ?";
        return qr.query(sql,new BeanListHandler<Transaction>(Transaction.class),id);
    }

    public List<Transaction> getTransactionAll() throws SQLException {
        QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
        String sql = "select * from tb_transaction";
        return qr.query(sql,new BeanListHandler<Transaction>(Transaction.class));
    }
}
