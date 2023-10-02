package com.simple.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.concurrent.atomic.AtomicInteger;

@RestController
@RequestMapping("/api")
public class HomeController {

//    int a = 1;
    AtomicInteger a = new AtomicInteger();

    @GetMapping("/time")
    public String getTime() throws InterruptedException {
        Thread.sleep(2000);

        return "---"+a.incrementAndGet()+"---------------Application_Started----------------------"+ LocalDateTime.now() + "-------------------------------------";
    }

}
