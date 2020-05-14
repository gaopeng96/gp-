package com.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/test")
public class testController {
    @RequestMapping("/show")

    public Object show(@RequestParam Map obj) throws Exception{
        String username = obj.get("username").toString();
        String password = obj.get("password").toString();

        System.out.println("username:" + username);
        System.out.println("password:" + password);

        return true;
    }

}
