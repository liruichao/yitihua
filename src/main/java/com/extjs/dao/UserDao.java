package com.extjs.dao;

import com.extjs.model.Role;
import com.extjs.model.RoleDTO;
import com.extjs.model.User;
import com.extjs.model.UserDTO;
import com.extjs.util.SysException;

import java.util.List;


public interface UserDao {
    List<User> queryUserList();
    List<Role> queryRoleList();
    String addUser(UserDTO userDTO);
    List<User> getUserList(String userName);
}
