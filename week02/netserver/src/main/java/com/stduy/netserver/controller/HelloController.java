package com.stduy.netserver.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @RequestMapping("/helloword")
    public String helloword(){
        return "helloword";
    }
}
