package shoppingmall.Servlet;

import shoppingmall.Member.MemberDAO;
import shoppingmall.Member.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class joinAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String userID = request.getParameter("userID");
        String userPassword = "";
        String userPassword1 = request.getParameter("userPassword1");
        String userPassword2 = request.getParameter("userPassword2");
        if (!userPassword1.equals(userPassword2)) {
            response.getWriter().write("<script>alert('두 패스워드가 일치하지 않습니다.');history.back();</script>");
        } else {
            userPassword = userPassword1;
        }
        String userName = request.getParameter("userName");
        String userYear = request.getParameter("userYear");
        String userMonth = request.getParameter("userMonth");
        String userDay = request.getParameter("userDay");
        String userGender = request.getParameter("userGender");
        String userEmail = request.getParameter("userEmail");
        String userAddress = request.getParameter("userAddress");
        String userPostCode = request.getParameter("userPostCode");
        String userDetailAddress = request.getParameter("userDetailAddress");
        String userPhoneNumber = request.getParameter("userPhoneNumber");

        if (userID.equals("") || userID == null || userPassword.equals("") || userPassword == null ||
                userName.equals("") || userName == null ||
                userYear.equals("") || userYear == null ||
                userMonth.equals("") || userMonth == null ||
                userDay.equals("") || userDay == null ||
                userGender.equals("") || userGender == null ||
                userEmail.equals("") || userEmail == null ||
                userAddress.equals("") || userAddress == null ||
                userPostCode.equals("") || userPostCode == null ||
                userDetailAddress.equals("") || userDetailAddress == null ||
                userPhoneNumber.equals("") || userPhoneNumber == null
                ) {
            response.getWriter().write("<script>alert('빈 항목이 있습니다.');history.back();</script>");
        } else {
            MemberDTO memberDTO = new MemberDTO();
            memberDTO.setUserID(userID);
            memberDTO.setUserPassword(userPassword);
            memberDTO.setUserName(userName);
            memberDTO.setUserYear(Integer.parseInt(userYear));
            memberDTO.setUserMonth(Integer.parseInt(userMonth));
            memberDTO.setUserDay(Integer.parseInt(userDay));
            memberDTO.setUserGender(userGender);
            memberDTO.setUserEmail(userEmail);
            memberDTO.setUserAddress(userAddress);
            memberDTO.setUserPostCode(Integer.parseInt(userPostCode));
            memberDTO.setUserDetailAddress(userDetailAddress);
            memberDTO.setUserPhoneNumber(Integer.parseInt(userPhoneNumber));

            MemberDAO memberDAO = new MemberDAO();
            int joinResult = memberDAO.join(memberDTO);
            if (joinResult > 0) {
                response.getWriter().write("<script>alert('회원 가입 성공.');location.href='/home';</script>");

            }
            else{
                response.getWriter().write("<script>alert('회원 가입 실패. 다시 시도해주세요.');history.back();</script>");

            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
