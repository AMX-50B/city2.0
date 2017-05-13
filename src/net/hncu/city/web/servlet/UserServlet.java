package net.hncu.city.web.servlet;

import net.hncu.city.domian.Message;
import net.hncu.city.domian.Transaction;
import net.hncu.city.domian.User;
import net.hncu.city.exception.MessageException;
import net.hncu.city.exception.TransactionExcetion;
import net.hncu.city.exception.UserException;
import net.hncu.city.service.MessageService;
import net.hncu.city.service.TransactionService;
import net.hncu.city.service.UserService;
import net.hncu.city.utils.PaymentUtil;
import org.apache.catalina.Session;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/**
 * Created by LY on 2017/4/27.
 */
@WebServlet("/user")
public class UserServlet extends BaseServlet {

    /**
     * publish a message
     *url:${pageContext.request.contextPath}/user?m=Publish
     * post:Message(form)
     */
    public void Publish(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //创建一个DiskFileItemFactory工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建一个ServletFileUpload对象
        ServletFileUpload sfu = new ServletFileUpload(factory);
        sfu.setHeaderEncoding("UTF-8");//解决上传文件的乱码
        //解析request对象，返回所有表单项
        List<FileItem> fileItems = new ArrayList<FileItem>(0);
        //用于封装普通表单项的数据
        Map<String, String[]> map = new HashMap<String, String[]>();
        try {
            fileItems = sfu.parseRequest(request);
            //迭代fileItems表单项
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    //普通表单项
                    String name = fileItem.getFieldName();//得到字段的名
                    String value = fileItem.getString("utf-8");//得到字段值
                    map.put(name, new String[]{value});//向map中赋值

                } else {
                    //文件表单项
                    InputStream inputStream = fileItem.getInputStream();
                    String filename = fileItem.getName();//得到上传的文件名
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }
                    String extension = FilenameUtils.getExtension(filename);
                    if (!("jsp".equals(extension) || "exe".equals(extension))) {//上传的文件不能是jsp、exe
                        //创建目录
                        File storeDirectory = new File(this.getServletContext().getRealPath("/upload"));
                        if (!storeDirectory.exists()) {
                            storeDirectory.mkdirs();//如何目录不存在，就创建
                        }
                        //处理文件名
                        if (filename != null) {
                            filename = FilenameUtils.getName(filename);
                        }
                        // 目录打散
                        String childDirectory = makeChildDirectory(storeDirectory, filename); // a/b

                        filename = childDirectory + File.separator + filename;
                        //文件上传
                        fileItem.write(new File(storeDirectory, filename));
                        fileItem.delete();    //删除临时文件

                    }
                    map.put(fileItem.getFieldName(), new String[]{"upload" + File.separator + filename});//将图片表单项的name和value保存到map中
                }
            }
            Message message = new Message();
            BeanUtils.populate(message, map);
            message.setId(UUID.randomUUID().toString());//设置消息编号
            User user = (User) request.getSession().getAttribute("user");
            message.setUser_id(user.getId());
            //调用业务逻辑
            MessageService bs = new MessageService();
            bs.addMessage(message);

            //分发转向
            //不写/代表相对路径，相对于本类的路径
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } catch (MessageException e) {
            e.printStackTrace();
        }
        //request.getRequestDispatcher("bookListServlet").forward(request, response);
    }

    /**
     * get a directory for message's image(tool for save image)
     * @param storeDirectory
     * @param filename
     * @return childDirectory
     */
    private String makeChildDirectory(File storeDirectory, String filename) {
        int hashcode = filename.hashCode();// 返回字符转换的32位hashcode码
        String code = Integer.toHexString(hashcode); // 把hashcode转换为16进制的字符
        // abdsaf2131safsd
        String childDirectory = code.charAt(0) + File.separator + code.charAt(1); // a/b
        // 创建指定目录
        File file = new File(storeDirectory, childDirectory);
        if (!file.exists()) {
            file.mkdirs();
        }
        return childDirectory;
    }

    /**
     * modify user
     *url:${pageContext.request.contextPath}/user?m=modifyUser
     * post:User(form)
     */
    public void modifyUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getId() + "";
        //创建一个DiskFileItemFactory工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建一个ServletFileUpload对象
        ServletFileUpload sfu = new ServletFileUpload(factory);
        sfu.setHeaderEncoding("UTF-8");//解决上传文件的乱码
        //解析request对象，返回所有表单项
        List<FileItem> fileItems = new ArrayList<FileItem>(0);
        //用于封装普通表单项的数据
        Map<String, String[]> map = new HashMap<String, String[]>();
        String category = "";
        try {
            fileItems = sfu.parseRequest(request);
            //迭代fileItems表单项
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    //普通表单项
                    String name = fileItem.getFieldName();//得到字段的名
                    String value = fileItem.getString("utf-8");//得到字段值
                    map.put(name, new String[]{value});//向map中赋值

                } else {
                    //文件表单项
                    InputStream inputStream = fileItem.getInputStream();
                    String filename = fileItem.getName();//得到上传的文件名
                    String extension = FilenameUtils.getExtension(filename);
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }
                    if (!("jsp".equals(extension) || "exe".equals(extension))) {//上传的文件不能是jsp、exe
                        //创建目录
                        File storeDirectory = new File(this.getServletContext().getRealPath("/userImage"));
                        if (!storeDirectory.exists()) {
                            storeDirectory.mkdirs();//如何目录不存在，就创建
                        }
                        //处理文件名
                        filename = username + "." + extension;

                        //文件上传
                        fileItem.write(new File(storeDirectory, filename));
                        fileItem.delete();    //删除临时文件

                    }
                    map.put(fileItem.getFieldName(), new String[]{File.separator + "userImage" + File.separator + filename});//将图片表单项的name和value保存到map中
                }
            }

            User upUser = new User();
            BeanUtils.populate(upUser, map);
            if (upUser.getUserUrl() == null) {
                upUser.setUserUrl(user.getUserUrl());
            }
            //调用业务逻辑
            UserService us = new UserService();
            us.modifyUser(upUser);
            session.invalidate();
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //分发转向
            //不写/代表相对路径，相对于本类的路径
            //request.getRequestDispatcher("showBookListForAdmin").forward(request, response);
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

        }
        //request.getRequestDispatcher("bookListServlet").forward(request, response);
    }

    /**
     * online order
     *url:${pageContext.request.contextPath}/user?m=transaction
     * post:Transaction(form)
     */
    public void transaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Transaction trans = new Transaction();
        try {
            BeanUtils.populate(trans, request.getParameterMap());

            int integral = Integer.parseInt(trans.getIntegral());

            TransactionService ts = new TransactionService();
            String id =ts.addTransaction(trans.getUser_id(),integral,"1");
            trans = ts.findTransactionById(id);

            request.setAttribute("trans", trans);
            request.getRequestDispatcher("/user/pay.jsp").forward(request, response);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (TransactionExcetion transactionExcetion) {
            transactionExcetion.printStackTrace();
        }
    }

    /**
     * pay online
     * url:${pageContext.request.contextPath}/user?m=payOnlineServlet
     *post:id,money,integral,yh
     */
    public void payOnlineServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String money = request.getParameter("money");
        String inte = request.getParameter("integral");
        String yh = request.getParameter("yh");

        String p0_Cmd = "Buy";
        String p1_MerId = "10001126856";
        String p2_Order = id;
        String p3_Amt = money;
        String p4_Cur = "CNY";
        String p5_Pid = "Purchase points:" + inte;
        String p6_Pcat = "unknow";
        String p7_Pdesc = "unknow";
        String p8_Url = "http://localhost/book/callBackServlet";
        String p9_SAF = "1";
        String pa_MP = "nuknow";
        String pd_FrpId = yh;
        String pr_NeedResponse = "1";
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId,
                p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat,
                p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId,
                pr_NeedResponse, keyValue);
        request.setAttribute("pd_FrpId", pd_FrpId);
        request.setAttribute("p0_Cmd", p0_Cmd);
        request.setAttribute("p1_MerId", p1_MerId);
        request.setAttribute("p2_Order", p2_Order);
        request.setAttribute("p3_Amt", p3_Amt);
        request.setAttribute("p4_Cur", p4_Cur);
        request.setAttribute("p5_Pid", p5_Pid);
        request.setAttribute("p6_Pcat", p6_Pcat);
        request.setAttribute("p7_Pdesc", p7_Pdesc);
        request.setAttribute("p8_Url", p8_Url);
        request.setAttribute("p9_SAF", p9_SAF);
        request.setAttribute("pa_MP", pa_MP);
        request.setAttribute("pr_NeedResponse", pr_NeedResponse);
        request.setAttribute("hmac", hmac);
        request.getRequestDispatcher("/user/confirm.jsp").forward(request, response);
    }

    /**
     * show message list by user
     *url:${pageContext.request.contextPath}/user?m=showMessageByType
     * get:t~type
     * session:user
     */
    public void showMessageByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("t");
        User user = (User) request.getSession().getAttribute("user");

        MessageService ms = new MessageService();
        List<Message> list = new ArrayList<Message>();
        try {
            list = ms.findMessageByType(type, user.getId());
            request.setAttribute("list", list);
            request.getRequestDispatcher("/user/showmessage.jsp").forward(request, response);
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }

    /**
     * show message by user
     *url:${pageContext.request.contextPath}/user?m=showMessageById
     * get:id
     */
    public void showMessageById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        MessageService ms = new MessageService();
        Message message = new Message();
        try {
            message = ms.findMessageById(id);
            request.setAttribute("message", message);
            request.getRequestDispatcher("/user/modifymessage.jsp").forward(request, response);
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }

    /**
     * modify message by user
     *url:${pageContext.request.contextPath}/user?m=modifyMessage
     * post:message(form)
     */
    public void modifyMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //创建一个DiskFileItemFactory工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建一个ServletFileUpload对象
        ServletFileUpload sfu = new ServletFileUpload(factory);
        sfu.setHeaderEncoding("UTF-8");//解决上传文件的乱码
        //解析request对象，返回所有表单项
        List<FileItem> fileItems = new ArrayList<FileItem>(0);
        //用于封装普通表单项的数据
        Map<String, String[]> map = new HashMap<String, String[]>();
        try {
            fileItems = sfu.parseRequest(request);
            //迭代fileItems表单项
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    //普通表单项
                    String name = fileItem.getFieldName();//得到字段的名
                    String value = fileItem.getString("utf-8");//得到字段值
                    map.put(name, new String[]{value});//向map中赋值

                } else {
                    //文件表单项
                    InputStream inputStream = fileItem.getInputStream();
                    String filename = fileItem.getName();//得到上传的文件名
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }
                    String extension = FilenameUtils.getExtension(filename);
                    if (!("jsp".equals(extension) || "exe".equals(extension))) {//上传的文件不能是jsp、exe
                        //创建目录
                        File storeDirectory = new File(this.getServletContext().getRealPath("/upload"));
                        if (!storeDirectory.exists()) {
                            storeDirectory.mkdirs();//如何目录不存在，就创建
                        }
                        //处理文件名
                        filename = FilenameUtils.getName(filename);
                        // 目录打散
                        String childDirectory = makeChildDirectory(storeDirectory, filename); // a/b

                        filename = childDirectory + File.separator + filename;
                        //文件上传
                        fileItem.write(new File(storeDirectory, filename));
                        fileItem.delete();    //删除临时文件

                    }
                    map.put(fileItem.getFieldName(), new String[]{"upload" + File.separator + filename});//将图片表单项的name和value保存到map中
                }
            }
            //调用业务逻辑
            Message message = new Message();
            BeanUtils.populate(message, map);
            MessageService ms = new MessageService();
            Message m = ms.findMessageById(message.getId());
            String url = m.getImgUrl();
            if (null == message.getImgUrl()) {
                message.setImgUrl(url);
            } else if (url != message.getImgUrl() && url != "/image/background.jpg") {
                File file = new File(request.getContextPath() + url);
                if (file.exists()) {
                    file.delete();
                }
            }
            ms.changeMessage(message);
            //分发转向
            //不写/代表相对路径，相对于本类的路径
            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }

    /**
     * delete/undo delete message by user
     *url:${pageContext.request.contextPath}/user?m=deleteMessageById
     * post:id,state
     */
    public void deleteMessageById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Integer state = Integer.parseInt(request.getParameter("status"));
        MessageService ms = new MessageService();
        try {
            ms.changeMessageStateById(id,state);
            response.getWriter().print(true);
            response.getWriter().close();
        } catch (MessageException e) {
            e.printStackTrace();
            response.getWriter().print(false);
            response.getWriter().close();
        }
    }

    /**
     * send message by user
     * url:${pageContext.request.contextPath}/user?m=sendMessageById
     * post:id
     */
    public void sendMessageById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int integral = user.getUserIntegral();

        if(integral>=10){
            integral=integral-10;
            MessageService ms = new MessageService();
            UserService us = new UserService();
            TransactionService ts = new TransactionService();
            try {
                //创建交易记录
                String tid =ts.addTransaction(user.getId(),10,"0");
                //修改message为推送
                ms.changeMessageTypeById(id,3);
                //修改Session
                user =us.changeUserIntegralById(user.getId(),integral);
                ts.changeState(tid,1);
                session.removeAttribute("user");
                session.setAttribute("user",user);
                response.getWriter().print(1);
                response.getWriter().close();
            } catch (MessageException e) {
                e.printStackTrace();
                response.getWriter().print(0);
                response.getWriter().close();
            } catch (TransactionExcetion transactionExcetion) {
                transactionExcetion.printStackTrace();
                response.getWriter().print(0);
                response.getWriter().close();
            } catch (UserException e) {
                e.printStackTrace();
                response.getWriter().print(0);
                response.getWriter().close();
            }
        }else{
            response.getWriter().write(2);
            response.getWriter().close();
        }
    }

    /**
     * show deleted message list for user
     * url:${pageContext.request.contextPath}/user?m=showDeleteMessage
     * session:user
     */
    public void showDeleteMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("user");
        MessageService ms = new MessageService();
        List<Message> list = new ArrayList<Message>();
        try {
            list = ms.findDeleteMessageList(user.getId());
            request.setAttribute("list",list);
            request.getRequestDispatcher("/user/showmessage.jsp").forward(request,response);
        } catch (MessageException e) {
            e.printStackTrace();
        }
    }

    /**
     * get integral list for user
     * url:${pageContext.request.contextPath}/user?m=showIntegral
     * session:user
     */
    public void showIntegral(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        User user = (User)request.getSession().getAttribute("user");
        String id = user.getId();
        TransactionService ts = new TransactionService();
        List<Transaction> list = new ArrayList<Transaction>();
        try {
            list = ts.findTransactionByUserId(id);
            request.setAttribute("list",list);
            request.getRequestDispatcher("/user/userintegral.jsp").forward(request,response);
        } catch (TransactionExcetion transactionExcetion) {
            transactionExcetion.printStackTrace();
        }
    }

    /**
     *change message type by user
     * url:${pageContext.request.contextPath}/user?m=changeType
     * post:id,status
     */
    public void changeType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        Integer type = Integer.parseInt(request.getParameter("status"));
        MessageService ms = new MessageService();
        try {
            ms.changeMessageTypeById(id,type);
            response.getWriter().print(true);
            response.getWriter().close();
        } catch (MessageException e) {
            e.printStackTrace();
            response.getWriter().print(false);
            response.getWriter().close();
        }
    }
}