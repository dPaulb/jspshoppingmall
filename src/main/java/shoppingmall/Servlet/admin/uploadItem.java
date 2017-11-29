package shoppingmall.Servlet.admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import shoppingmall.Item.ItemDAO;
import shoppingmall.Item.ItemDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

public class uploadItem extends HttpServlet {
    private String itemCategory;
    private String itemName;
    private String itemPrice;
    private String itemDescription;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");




        String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
        System.out.println(uploadPath);
        int size = 100 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하

        String fileName = ""; // 파일명

        try {
            // 파일업로드 및 업로드 후 파일명 가져옴
            MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
            itemCategory = multi.getParameter("itemCategory");
             itemName = multi.getParameter("itemName");
             itemPrice = multi.getParameter("itemPrice");
             itemDescription = multi.getParameter("itemDescription");

            Enumeration files = multi.getFileNames();
            String file = (String) files.nextElement();
            fileName = multi.getFilesystemName(file);

        } catch (Exception e) {
            e.printStackTrace();
        }

        String itemThumbnail = "/upload/" + fileName;
        SimpleDateFormat uploadDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");








        ItemDTO itemDTO = new ItemDTO();
        itemDTO.setItemCategory(itemCategory);
        itemDTO.setItemName(itemName);
        itemDTO.setItemPrice(itemPrice);
        itemDTO.setItemDescription(itemDescription);
        itemDTO.setUploadDate(uploadDate.format(new Date()));
        itemDTO.setItemThumbnail(itemThumbnail);

        ItemDAO itemDAO = new ItemDAO();
        int result = itemDAO.itemUpload(itemDTO);
        if (result > 0) {
            response.getWriter().write("<script>alert('제품이 등록되었습니다.');location.href='/admin/adminPage';</script>");
        } else {
            response.getWriter().write("<script>alert('오류발생.');history.back();</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
