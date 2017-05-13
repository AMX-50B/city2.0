package net.hncu.city.exception;

/**
 * Created by LY on 2017/5/6.
 */

public class TransactionExcetion extends Exception {
    public TransactionExcetion() {
    }

    public TransactionExcetion(String message) {
        super(message);
    }

    public TransactionExcetion(String message, Throwable cause) {
        super(message, cause);
    }

    public TransactionExcetion(Throwable cause) {
        super(cause);
    }

    public TransactionExcetion(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
