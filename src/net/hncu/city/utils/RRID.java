package net.hncu.city.utils;

import java.util.Date;
import java.util.Random;



/**
 * Created by LY on 2017/5/6.
 */

public class RRID {
    public static  String rrid(){
        long date = new Date().getTime()*100;
        Random random = new Random();
        int r = 10+random.nextInt(89);
        date=date+r;
        String rid =Long.toString(date,32);
        return rid+r;
    }
}
