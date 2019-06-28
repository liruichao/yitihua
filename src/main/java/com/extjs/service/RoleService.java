package com.extjs.service;

import com.extjs.model.RoleDTO;
import com.extjs.util.SysException;

public interface RoleService {
    void addRole(RoleDTO roleDTO)throws SysException;
}
