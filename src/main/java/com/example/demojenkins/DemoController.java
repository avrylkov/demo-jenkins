package com.example.demojenkins;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

@RestController
public class DemoController {

    @RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<String> getInfos() {
        return Arrays.asList(System.getProperty("user.name"));
    }

}
