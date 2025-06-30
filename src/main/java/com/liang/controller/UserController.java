    package com.liang.controller;

    import com.liang.pojo.*;
    import com.liang.service.UserService;
    import com.liang.utils.JwtUtil;
    import com.liang.utils.Md5Util;
    import com.liang.utils.ThreadLocalUtil;
    import jakarta.validation.constraints.Pattern;
    import org.hibernate.validator.constraints.URL;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.util.StringUtils;
    import org.springframework.validation.annotation.Validated;
    import org.springframework.web.bind.annotation.*;
    import org.springframework.web.multipart.MultipartFile;

    import java.io.IOException;
    import java.nio.file.Files;
    import java.nio.file.Path;
    import java.nio.file.Paths;
    import java.util.HashMap;
    import java.util.List;
    import java.util.Map;

    @RestController
    @RequestMapping("/user")
    @Validated
    public class UserController {

        private static final String UPLOAD_DIR = "src/main/resources/static/assets/avatar/";

        @Autowired
        private UserService userService;

//        @PostMapping("/register")
//        public Result register(@Pattern(regexp = "^\\S{5,16}$") String username, @Pattern(regexp = "^\\S{5,16}$") String password, String status){
//            if (status.equals("管理员")||status.equals("超级管理员")){
//                return Result.error("你没有权限！");
//            }
//            User user=userService.findByUsername(username);
//            if (user==null){
//                userService.register(username,password,status);
//                return Result.success();
//            }
//            else {
//                return Result.error("已被占用");
//            }
//        }

        @PostMapping("/register")
        public Result register(@Pattern(regexp = "^\\S{5,16}$") String username, @Pattern(regexp = "^\\S{5,16}$") String password, String status){
            if (status.equals("管理员")||status.equals("超级管理员")){
                return Result.error("你没有权限！");
            }
            User user=userService.findByUsername(username);
            if (user==null){
                Integer userId = userService.register(username,password,status);
                if(status.equals("普通用户")){
                    userService.initBalance(userId);
                }
                return Result.success();
            }
            else {
                return Result.error("已被占用");
            }
        }
        @PostMapping("/createadmin")
        public Result createadmin(@Pattern(regexp = "^\\S{5,16}$") String username, @Pattern(regexp = "^\\S{5,16}$") String password){
            if (username==null || password == null){
                return Result.error("不能空缺");
            }
            Map <String,Object> map= ThreadLocalUtil.get();
            String status=(String) map.get("status");
            if (!status.equals("超级管理员")){
                return Result.error("你没有权限！");
            }
            User user=userService.findByUsername(username);
            if (user==null){
                userService.createadmin(username,password);
                return Result.success();
            }
            else {
                return Result.error("username已被占用");
            }
        }


        @PostMapping("/login")
        public Result<String> login(@Pattern(regexp = "^\\S{5,16}$") String username,@Pattern(regexp = "^\\S{5,16}$") String password,String status){
            System.out.println("post:"+username+" "+password+" "+status);
            User loginUser = userService.findByUsername(username);
//            System.out.println("have:"+loginUser.getUsername()+" "+loginUser.getPassword()+" "+loginUser.getStatus());
            if (loginUser == null){
                return Result.error("此用户不存在");
            }
            String userstatus=loginUser.getStatus();
            String userisclose=loginUser.getIsclose();
            if (loginUser.getStatus().equals("超级管理员")){
                if (Md5Util.getMD5String(password).equals(loginUser.getPassword())){
                    Map<String,Object> claims=new HashMap<>();
                    claims.put("id",loginUser.getId());
                    claims.put("username",loginUser.getUsername());
                    claims.put("status",loginUser.getStatus());
                    claims.put("user",loginUser.getUserPic());
                    String token=JwtUtil.genToken(claims);
                    return Result.success(token);
                }
                else {
                    return Result.error("密码错误");
                }
            }
           else if (!userstatus.equals(status)){
                return Result.error("用户角色不匹配");
            }
            else if (userisclose == null) {
                if (Md5Util.getMD5String(password).equals(loginUser.getPassword())){
                    Map<String,Object> claims=new HashMap<>();
                    claims.put("id",loginUser.getId());
                    claims.put("username",loginUser.getUsername());
                    claims.put("status",loginUser.getStatus());
                    claims.put("user",loginUser.getUserPic());
                    String token=JwtUtil.genToken(claims);
                    return Result.success(token);
                }
                else {
                    return Result.error("密码错误");
                }
            }
            else{
                return Result.error("该账号已经被封禁");
            }
        }

        @GetMapping("/userinfo")
        public Result<User> userInfo(/*@RequestHeader(name = "Authorization") String token*/){

            Map<String,Object> map = ThreadLocalUtil.get();
            String username = (String) map.get("username");
            User user = userService.findByUsername(username);
            return Result.success(user);
        }

        @PutMapping("/update")
        public Result update(@RequestBody @Validated User user){
            userService.update(user);
            return Result.success();
        }

        @PatchMapping("/updateAvatar")
        public Result updateAvatar(@RequestParam  String avatarUrl){
            userService.updateAvatar(avatarUrl);
            return Result.success();
        }

        @PostMapping("/updatePwd")
        public Result updatePwd(@RequestBody Map<String,String> params){
            String oldPwd = params.get("old_pwd");
            String newPwd = params.get("new_pwd");
            String rePwd = params.get("re_pwd");

            if (!StringUtils.hasLength(oldPwd) || !StringUtils.hasLength(newPwd) || !StringUtils.hasLength(rePwd)) {
                return Result.error("缺少必要的参数");
            }

            Map<String,Object> map = ThreadLocalUtil.get();
            String username = (String) map.get("username");
            User loginUser = userService.findByUsername(username);
            if (!loginUser.getPassword().equals(Md5Util.getMD5String(oldPwd))){
                return Result.error("原密码填写不正确");
            }

            //newPwd和rePwd是否一样
            if (!rePwd.equals(newPwd)){
                return Result.error("两次填写的新密码不一样");
            }
            userService.updatePwd(newPwd);
            return Result.success();
        }

        @GetMapping("/all")
        public Result<PageBean<User>> all (
                Integer pageNum,
                Integer pageSize,
                @RequestParam(required = false) String status
        ){
            PageBean<User> pb =  userService.all(pageNum,pageSize,status);
            return Result.success(pb);
        }

        @GetMapping("/justall")
        public Result<List<User>> justall(){
            return Result.success(userService.justall());
        }

        @GetMapping("/close")
        public Result close(Integer id){
            Map <String,Object> map= ThreadLocalUtil.get();
            System.out.println(map);
            String status=(String) map.get("status");
            System.out.println(status);
            if (status.equals("管理员")||status.equals("超级管理员")){
                userService.close(id);
                return Result.success();
            }
            else {
                return Result.error("你没有权限执行此操作！");
            }
        }

        @GetMapping("/unclose")
        public Result unclose(Integer id){
            userService.unclose(id);
            return Result.success();
        }

        @GetMapping("/userbrowse")
        public Result<List<UserBrowse>> getuserbrowse(){
            return Result.success(userService.getuserbrowse());
        }

        @GetMapping("/usercount")
        public Result<List<UserBrowse>> getusercount(){
            return Result.success(userService.getusercount());
        }

        @GetMapping("/userfollow")
        public Result<List<UserBrowse>> getuserfollow(){
            return Result.success(userService.getuserfollow());
        }

        @GetMapping("/getalladmin")
        public Result<List<User>> getalladmin(){
            Map <String,Object> map= ThreadLocalUtil.get();
            String status=(String) map.get("status");
            if (!status.equals("超级管理员")){
                return Result.error("你没有权限！");
            }
            return Result.success(userService.getalladmin());
        }

    }
