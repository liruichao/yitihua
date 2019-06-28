package com.extjs.dao;

import com.extjs.model.RoleMenuKey;

import java.util.List;


public interface RoleMenuKeyDao {
    void addRoleMenuKey(RoleMenuKey roleMenuKey);
    List<RoleMenuKey> getRoleMenuKeys(String[] roleIds);
    void deleteRoleMenuKey(String menuId);
}
