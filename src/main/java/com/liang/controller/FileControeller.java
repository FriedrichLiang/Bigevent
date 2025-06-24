package com.liang.controller;

import com.liang.pojo.Result;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@RestController
public class FileControeller {
    @PostMapping("/upload")
    public Result<String> upload(MultipartFile file) throws Exception {

        String originalFilename = file.getOriginalFilename();

        String filename = UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));
        file.transferTo(new File("D:\\Project\\avatar\\"+filename));
        System.out.println("D:\\Project\\avatar"+filename);
        return Result.success("http://localhost:8080/avatar/"+filename);
    }
}
