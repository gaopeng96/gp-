package com.service;

import com.dao.DepartmentDao;
import com.dao.EmployeeDao;
import com.pojo.Department;
import com.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service

public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private DepartmentDao departmentDao;


    @Override
    public List<Employee> selectAllEmp(Employee employee) {

        return employeeDao.selectAllEmp(employee);
    }

    @Override
        public String selectEmployeeByID(Integer id,Model model) {
        Employee employee=employeeDao.selectEmployeeByID(id);
        List<Department> departmentList=departmentDao.selectAllDep();
        model.addAttribute("employee",employee);
        model.addAttribute("departmentList",departmentList);
        return "update";
    }


    @Override
    public int insertEmp(Employee employee) {
        return employeeDao.insertEmp(employee);
    }


    @Override
    public int deleteEmp(Integer id) {
        return employeeDao.deleteEmp(id);
    }

    @Override
    public int updateEmp(Employee employee) {
        return employeeDao.updateEmp(employee);
    }

}
