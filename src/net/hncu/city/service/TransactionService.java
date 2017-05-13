package net.hncu.city.service;

import net.hncu.city.dao.TransactionDao;
import net.hncu.city.domian.Transaction;
import net.hncu.city.exception.TransactionExcetion;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

/**
 * Created by LY on 2017/5/8.
 */

public class TransactionService {
    TransactionDao td = new TransactionDao();

    public String addTransaction(String id, int i,String j) throws TransactionExcetion {
        Transaction t = new Transaction();
        t.setId(UUID.randomUUID().toString());
        t.setType(j);
        t.setIntegral(i+"");
        t.setUser_id(id);
        t.setMoney((i*0.1)+"");
        try {
            td.addTransaction(t);
            return t.getId();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new TransactionExcetion("Failed to add transaction!");
        }
    }

    public void changeState(String id,int i) throws TransactionExcetion {
        try {
            td.updateTransactionStateById(id,i);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new TransactionExcetion("Failed to update state!");
        }

    }

    public Transaction findTransactionById(String id) throws TransactionExcetion {
        try {
            return td.getTransactionById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new TransactionExcetion("Failed to get transaction!");
        }
    }

    public List<Transaction> findTransactionByUserId(String id) throws TransactionExcetion {
        try {
            return td.getTransactionByUserId(id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new TransactionExcetion("Failed to get transaction!");

        }
    }

    public List<Transaction> findAllTransaction() throws TransactionExcetion {
        try {
            return  td.getTransactionAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new TransactionExcetion("Failed to get transaction list!");
        }
    }
}
