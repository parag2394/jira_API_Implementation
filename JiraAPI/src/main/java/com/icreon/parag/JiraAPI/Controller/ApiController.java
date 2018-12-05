package com.icreon.parag.JiraAPI.Controller;

import com.icreon.parag.JiraAPI.Model.IssueDetails;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/issue")
public class ApiController {

    @Value("${icreonJira.username:}")
    String username;
    @Value("${icreonJira.password:}")
    String password;
    @Value("${icreonJira.url:}")
    String url;
    @Value("${static.issue:}")
    String issue;
    @Value("${icreonJira.issue:}")
    String issueNo;

    @Autowired
    IssueDetails issueDetails;

    @GetMapping("/getDetails")
    public IssueDetails getDetails() throws Throwable {

        final String uri = url+issue+issueNo;

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
        String apiOutput = restTemplate.getForObject(uri, String.class);

        System.out.println(apiOutput);

        JSONObject myResponse = new JSONObject(apiOutput.toString());

        JSONObject jsonFields= myResponse.getJSONObject("fields");

        if(jsonFields.get("reporter").equals(null)) {
            issueDetails.setReporterName(null);
        }
        else{
            issueDetails.setReporterName(jsonFields.getJSONObject("reporter").getString("displayName"));
        }
        if(jsonFields.get("assignee").equals(null)){
            issueDetails.setAssigneeName(null);
        }
        else{
            issueDetails.setReporterName(jsonFields.getJSONObject("assignee").getString("displayName"));
        }

        issueDetails.setProjectName(jsonFields.getJSONObject("project").getString("name"));
        issueDetails.setTimeSpent(jsonFields.getJSONObject("timetracking").getString("timeSpent"));
        issueDetails.setVotes(jsonFields.getJSONObject("votes").getInt("votes"));
        issueDetails.setWatches(jsonFields.getJSONObject("watches").getInt("watchCount"));
        issueDetails.setUpdated(jsonFields.getString("updated"));

     /*   System.out.println(issueDetails.getReporterName());
        System.out.println(issueDetails.getProjectName());
        System.out.println(issueDetails.getTimeSpent());
        System.out.println(issueDetails.getVotes());
        System.out.println(issueDetails.getWatches());
        System.out.println(issueDetails.getUpdated());*/

        return issueDetails;
    }

}
