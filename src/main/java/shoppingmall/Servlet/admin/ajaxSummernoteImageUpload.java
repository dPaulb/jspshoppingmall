package shoppingmall.Servlet.admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

public class ajaxSummernoteImageUpload extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
        System.out.println(uploadPath);
        int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하

        String fileName = ""; // 파일명

        try {
            // 파일업로드 및 업로드 후 파일명 가져옴
            MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
            Enumeration files = multi.getFileNames();
            String file = (String) files.nextElement();
            fileName = multi.getFilesystemName(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
        uploadPath = "../upload/jessicaJones/" + fileName;
        // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
        JSONObject jobj = new JSONObject();
        jobj.put("url", "/upload/" + fileName);
        out.print("http://127.0.0.1:8080/upload/" + fileName);
//        System.out.println(application.getRealPath("/") + fileName);
        System.out.println(jobj.toJSONString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
