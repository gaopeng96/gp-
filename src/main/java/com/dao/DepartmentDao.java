package com.dao;

import com.pojo.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentDao {
    //查询所有部门
    List<Department> selectAllDep();
}
