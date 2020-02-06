package com.dao;

import com.pojo.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface EmployeeDao {

     //查询所有员工
     List<Employee> selectAllEmp(Employee employee);
    //增加员工
    int insertEmp(Employee employee);
   //根据iD查用户
     Employee selectEmployeeByID(Integer id);
    //删除员工
    int deleteEmp(Integer id);
    //修改员工
    int updateEmp(Employee employee);

}