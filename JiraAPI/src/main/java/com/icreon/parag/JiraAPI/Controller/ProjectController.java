package com.icreon.parag.JiraAPI.Controller;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/project")
public class ProjectController {

    @Value("${icreonJira.username:}")
    String username;
    @Value("${icreonJira.password:}")
    String password;
    @Value("${icreonJira.url:}")
    String url;
    @Value("${static.project:}")
    String project;


    @GetMapping("/getDetails")
    public Object getProjectDetails() throws Throwable{
        final String projectUri = url+project;

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
        String output=restTemplate.getForObject(projectUri,String.class);

        JSONArray array = new JSONArray(output);
        Object project1= array.getJSONObject(0).get("name");
        Object project2= array.getJSONObject(1).get("name");
        Object project3= array.getJSONObject(2).get("name");

        for(int i=0; i < array.length();i++){
            System.out.println(array.getJSONObject(i).get("name"));
        }

        return "Project1: "+project1+"\nProject2: "+project2+"\nProject3: "+project3;
    }




}
