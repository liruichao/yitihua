package com.extjs.service;

import com.extjs.model.Role;
import com.extjs.model.RoleDTO;
import com.extjs.model.User;
import com.extjs.model.UserDTO;
import com.extjs.util.SysException;

import java.util.List;


public interface UserService {
    List<User> queryUserList();
    List<RoleDTO> queryRoleList();
    void addUser(UserDTO userDTO)throws SysException;
    List<UserDTO> getUser(String userName)throws SysException;
}
