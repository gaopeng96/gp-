package com.service;

import com.dao.DepartmentDao;
import com.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepServiceImpl implements DepService {
    @Autowired
    private DepartmentDao departmentDao;
    @Override
    public List<Department> selectAllDep() {

          return departmentDao.selectAllDep();
    }
}
