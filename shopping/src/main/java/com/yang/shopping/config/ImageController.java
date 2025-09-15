package com.yang.shopping.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * 파일서버에서 img로 파일뿌려주는 서블릿
 */
@Controller
public class ImageController {

    @GetMapping("/image")
    public void getImage(@RequestParam String filename, HttpServletResponse response) throws IOException {
        File file = new File("D:/upload/img/" + filename);
        if (file.exists()) {
            String mimeType = Files.probeContentType(file.toPath());
            response.setContentType(mimeType != null ? mimeType : "application/octet-stream");
            Files.copy(file.toPath(), response.getOutputStream());
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}

