package com.extjs.dao;

import com.extjs.model.Menu;
import com.extjs.model.MenuDTO;
import com.extjs.util.SysException;

import java.util.List;


public interface MenuDao {
    List<Menu> selectChildrenMenu(String menuId,String[] menuIds);
    void addMenu(MenuDTO menuDTO);
    void delMenu(String menuId);
    List<Menu> selectMenus(String[]menuIds);

}
