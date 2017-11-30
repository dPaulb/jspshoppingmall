package shoppingmall.Servlet.cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class deleteCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        ArrayList priceList = (ArrayList) request.getSession().getAttribute("priceList");
        ArrayList numList = (ArrayList) request.getSession().getAttribute("numList");
        ArrayList nameList = (ArrayList)request.getSession().getAttribute("nameList");
        ArrayList thumbnailList = (ArrayList)request.getSession().getAttribute("thumbnailList");

        String cartNum = request.getParameter("cartNum");

        priceList.remove(Integer.parseInt(cartNum));
        numList.remove(Integer.parseInt(cartNum));
        nameList.remove(Integer.parseInt(cartNum));
        thumbnailList.remove(Integer.parseInt(cartNum));

        response.getWriter().write("<script>alert('삭제 되었습니다.');location.href='/shopItem/cart'</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
