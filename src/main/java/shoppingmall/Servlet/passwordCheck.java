package shoppingmall.Servlet;

import org.json.JSONObject;
import shoppingmall.Member.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class passwordCheck extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String userPassword1 = request.getParameter("userPassword1");
        String userPassword2 = request.getParameter("userPassword2");
        response.getWriter().write(getJSON(userPassword1, userPassword2).toString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public JSONObject getJSON(String pass1, String pass2){
        JSONObject jsonObject = new JSONObject();
        if(pass1.equals(pass2)){
            jsonObject.put("result", true);
        }
        else{
            jsonObject.put("result",false);
        }

        return jsonObject;
    }
}
