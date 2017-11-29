package shoppingmall.Servlet.login;

import org.apache.catalina.Session;
import org.json.JSONObject;
import shoppingmall.Member.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class loginAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");


        String userID = request.getParameter("userID");
        String userPassword = request.getParameter("userPassword");
        if(userID.equals("") || userPassword.equals("")){
            response.getWriter().write("<script>alert('아이디나 비밀번호가 비어있습니다.');history.back();</script>");
            return;
        }
        MemberDAO memberDAO = new MemberDAO();
        int result = memberDAO.login(userID, userPassword);
        if(result == 1){
            HttpSession loginSession = request.getSession();
            loginSession.setAttribute("loginSessionID", userID);
            response.getWriter().write("<script>alert('로그인 성공.');location.href='/home';</script>");
        }
        else if(result == 0){
            response.getWriter().write("<script>alert('비밀번호가 다릅니다.');history.reload();</script>");
        }
        else if(result == -1){
            response.getWriter().write("<script>alert('존재하지 않는 아이디입니다.');history.reload();</script>");
        }
        else if(result == -2){
            response.getWriter().write("<script>alert('알수 없는 에러. 다시시도해주세요.');history.reload();</script>");
        }
//        response.getWriter().write(getJSON(userID, userPassword).toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

//    public JSONObject getJSON(String userID, String userPassword){
//        JSONObject jsonObject = new JSONObject();
//        if(userID == null || userPassword == null){
//            jsonObject.put("result", false);
//            jsonObject.put("errorReason", 0); // Null Value
//        }
//        else{
//            MemberDAO memberDAO = new MemberDAO();
//            int result = memberDAO.login(userID, userPassword);
//            if(result == 1){
//                jsonObject.put("result", true);
////                loginSession.setAttribute("loginSessionID", userID);
//
//            }
//            else if(result == 0){
//                jsonObject.put("result", false);
//                jsonObject.put("errorReason", 1);  // ID exists, incorrect password
//            }
//            else if(result == -1){
//                jsonObject.put("result", false);
//                jsonObject.put("errorReason", 2); //ID not exists;
//            }
//            else if(result == -2){
//                jsonObject.put("result", false);
//                jsonObject.put("errorReason", 3); //DB error
//            }
//        }
//
//        return jsonObject;
//    }
}
