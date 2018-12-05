package com.icreon.parag.JiraAPI.Controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/tempo/worklog")
public class WorklogController {

    @Value("${icreonJira.username:}")
    String username;
    @Value("${icreonJira.password:}")
    String password;
    @Value("${tempo.url:}")
    String url;
    @Value("${static.worklogs:}")
    String worklogs;
    @Value("${static.project:}")
    String project;
    @Value("${static.issue:}")
    String issue;
    @Value("${icreonJira.project:}")
    String projectNo;
    @Value("${icreonJira.issue:}")
    String issueNo;

    @GetMapping("/getProjectDetails")
    public Object getProjectDetails() throws Throwable{
        final String uri = url+worklogs+"/"+project+projectNo;

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer GPWhDgspyrqceOYWRbhij3ER6nNqoV");

        HttpEntity entity = new HttpEntity(headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);

     /*   restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
        String output=restTemplate.getForObject(projectUri,String.class);*/

        JSONObject myResponse = new JSONObject(response.getBody());

        int worklogsCount = myResponse.getJSONObject("metadata").getInt("count");
        JSONArray jsonResults = myResponse.getJSONArray("results");

        String issueNo = jsonResults.getJSONObject(0).getJSONObject("issue").getString("key");
        String startDate = jsonResults.getJSONObject(0).getString("startDate");
        String description = jsonResults.getJSONObject(0).getString("description");
        String author = jsonResults.getJSONObject(0).getJSONObject("author").getString("displayName");

        return "Worklogs Count: "+worklogsCount+"\nIssue No: "+issueNo+"\nDescription: "+description+"\nAuthor: "+author+"\nstartDate: "+startDate;

    }

    @GetMapping("/getIssueDetails")
    public Object getIssueDetails() throws Throwable{
        final String uri = url+worklogs+"/"+issue+issueNo;

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer GPWhDgspyrqceOYWRbhij3ER6nNqoV");

        HttpEntity entity = new HttpEntity(headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);

     /*   restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
        String output=restTemplate.getForObject(projectUri,String.class);*/

        JSONObject myResponse = new JSONObject(response.getBody());

        JSONArray jsonResults = myResponse.getJSONArray("results");

        for(int i=0; i < jsonResults.length();i++){
            System.out.println(jsonResults.getJSONObject(i).getInt("tempoWorklogId"));
            System.out.println(jsonResults.getJSONObject(i).getJSONObject("issue").getString("key"));
            System.out.println(jsonResults.getJSONObject(i).getString("startDate"));
            System.out.println(jsonResults.getJSONObject(i).getString("description"));
            System.out.println(jsonResults.getJSONObject(i).getJSONObject("author").getString("displayName"));
            System.out.println(jsonResults.getJSONObject(i).getInt("timeSpentSeconds"));
        }


        int worklogsCount = myResponse.getJSONObject("metadata").getInt("count");
        int worklogId = jsonResults.getJSONObject(0).getInt("tempoWorklogId");
        String issueNo = jsonResults.getJSONObject(0).getJSONObject("issue").getString("key");
        String startDate = jsonResults.getJSONObject(0).getString("startDate");
        String description = jsonResults.getJSONObject(0).getString("description");
        String author = jsonResults.getJSONObject(0).getJSONObject("author").getString("displayName");
        int timeSpentSeconds = jsonResults.getJSONObject(0).getInt("timeSpentSeconds");

        return "Total Worklogs Count: "+worklogsCount+"\nWorklog Id: "+worklogId+"\nIssue No: "+issueNo+"\nAuthor: "+author+"\nstartDate: "+startDate+"\ntimeSpentSeconds: "+timeSpentSeconds+"\nDescription: "+description;

    }

}
