package shoppingmall.Servlet;

import org.json.JSONObject;
import shoppingmall.Member.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class idCheck extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String userID = request.getParameter("userID");
        response.getWriter().write(getJSON(userID).toString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public JSONObject getJSON(String userID) {
        JSONObject jsonObject = new JSONObject();
        MemberDAO memberDAO = new MemberDAO();
        if (userID == null) {
            userID = "";
            jsonObject.put("result", false);
        }
        else if(memberDAO.idCheck(userID) == 0){
            jsonObject.put("result", true);
        }
        else if (memberDAO.idCheck(userID) == 1) {
            jsonObject.put("result", false);
            jsonObject.put("errorReason", 1); // ID Already Exists.
        } else {
            jsonObject.put("result", false);
            jsonObject.put("errorReason", -1); // DB Error.

        }

        return jsonObject;

    }
}
