package com.service;

import com.pojo.Employee;
import org.springframework.ui.Model;

import java.util.List;

public interface EmpService {
    List<Employee> selectAllEmp(Employee employee);

    String selectEmployeeByID(Integer id, Model model);
    int insertEmp(Employee employee);
    int deleteEmp(Integer id);
    int updateEmp(Employee employee);
}
