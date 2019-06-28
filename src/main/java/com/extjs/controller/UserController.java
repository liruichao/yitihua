package com.extjs.controller;

import com.extjs.model.Role;
import com.extjs.model.RoleDTO;
import com.extjs.model.User;
import com.extjs.model.UserDTO;
import com.extjs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/toViewUserList")
    public String toViewUserList(){
        return "jsp/viewUserList";
    }

    @RequestMapping("/viewUserList")
    @ResponseBody
    public Map queryUserList(){
        Map<String,Object> resultMap=new HashMap<String, Object>();
        List<User> users = userService.queryUserList();
        resultMap.put("data",users);
        resultMap.put("total",users.size());
        return  resultMap;
    }

    @RequestMapping("/toViewRoleList")
    public String toViewRoleList(){
        return "jsp/viewRoleList";
    }

    @RequestMapping("/viewRoleList")
    @ResponseBody
    public Map queryRoleList(){
        Map<String,Object> resultMap=new HashMap<String, Object>();
        List<RoleDTO> roleDTOs = userService.queryRoleList();
        resultMap.put("data",roleDTOs);
        resultMap.put("total",roleDTOs.size());
        return  resultMap;
    }

    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> userAdd(UserDTO userDTO){
        System.out.println("userRoleIds:"+userDTO.getUserRoleIds());

        Map<String,Object> resultMap=new HashMap<String, Object>();
        try {
            userService.addUser(userDTO);
            resultMap.put("success",true);
            resultMap.put("msg","添加成功!");
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("success",false);
            resultMap.put("msg","添加失败!"+e.getMessage());
        }
        return  resultMap;
    }

    @RequestMapping(value = "/getUserRealName",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getUserRealName(HttpServletRequest request){
        Map<String,Object> resultMap=new HashMap<String, Object>();
        UserDTO userDTO = (UserDTO) request.getSession().getAttribute("userDTO");
        if (userDTO.getUserRealName()!=null&&!"".equals(userDTO.getUserRealName())){
            resultMap.put("success",true);
            resultMap.put("data",userDTO.getUserRealName());
        }else {
            resultMap.put("success",false);
            resultMap.put("data",userDTO.getUserRealName());
        }
        return resultMap;
    }
}
