package com.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@CrossOrigin(origins = "*")
@Controller
@RequestMapping("test")
public class testController {
    @RequestMapping("show")

    public Object show(@RequestParam String username,@RequestParam String password) throws Exception{

        System.out.println("username:" + username);
        System.out.println("password:" + password);

        return true;
    }
}
