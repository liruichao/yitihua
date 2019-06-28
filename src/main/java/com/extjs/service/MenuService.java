package com.extjs.service;

import com.extjs.model.MenuDTO;
import com.extjs.util.JSONTreeNode;
import com.extjs.util.SysException;

import java.util.List;

public interface MenuService {
    List<JSONTreeNode> getMenuJSONTreeNode();
    List<JSONTreeNode> getNextMenuJSONTreeNode(String menuId,String[] menuIds);
    void addMenu(MenuDTO menuDTO)throws SysException;
    void delMenu(String menuId) throws SysException;
    List<JSONTreeNode> getMenuByUserRole(String[]roleIds);
}
