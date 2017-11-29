package shoppingmall.Servlet.login;

import shoppingmall.Admin.AdminDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class adminLoginAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession adminSession = request.getSession();
        String adminID = request.getParameter("adminID");
        String adminPassword = request.getParameter("adminPassword");
        if(adminID.equals("") || adminPassword.equals("")){
            response.getWriter().write("<script>alert('아이디나 비밀번호가 비어있습니다.');location.reload();</script>");
        }
        AdminDAO adminDAO = new AdminDAO();
        int result = adminDAO.adminLogin(adminID, adminPassword);
        if(result == 1){
            adminSession.setAttribute("adminLoginSession", adminID);
            response.getWriter().write("<script>alert('관리자님 환영합니다.');location.href='/admin/adminPage';</script>");

        }
        else if(result == 0){
            response.getWriter().write("<script>alert('비밀번호가 일치하지 않습니다.');history.back();</script>");
        }
        else if(result == -1){
            response.getWriter().write("<script>alert('없는 아이디 입니다.');history.back();</script>");
        }
        else{
            response.getWriter().write("<script>alert('알수없는 에러입니다. 다시시도해주세요.');history.back();</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
