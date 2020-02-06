package com.controller;

import com.pojo.Department;
import com.service.DepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller("depController")
@RequestMapping("/dep")
public class DepController {
    @Autowired
    private DepService depService;

    @RequestMapping("/searchDep")
    public String selectAllDep(Model model)
    {
        List<Department> list = depService.selectAllDep();
        model.addAttribute("departmentList",list);
        return "add";
    }
}
